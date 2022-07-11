Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BF357065E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 16:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbiGKO61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 10:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiGKO60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 10:58:26 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4790B72ECB
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:58:25 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id b11so9262326eju.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JK/h8I3TwzYyU8YTkNwIUL4+D9uJ1XU+DQgA/bhS4DQ=;
        b=X4wjMIEABz8noT1eAHb/RNu6qhp+hTqzGdaPiYYKviKYRh30CyC85AQZdVus+ckBr3
         XislwfMrvQ7Q3cEq6Ovn79KBtWs/U5wn6/d1XIJUxXnq0G3p1rp4j+Y1/twzmIQWXY8m
         v4Q8KmF9dFlq0dtRRxacW0DfVcf/S0JAjxyn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JK/h8I3TwzYyU8YTkNwIUL4+D9uJ1XU+DQgA/bhS4DQ=;
        b=nWaN8xK16rQWgOhkxyKtBi97OTl04R0jQFMs7ZCQ547Ugi31yPh0I+Saw0urpI6SU3
         ENf9X5J2xEdoa/OmEy23gQHWV6m5Ls0pLICul8V5//1y66PPuU4goPr8vhcF2bEA8ZJR
         otAoZwVo8u9hDrlJbL+7I/hlQz/0XjPqWlN2dlCZ636AgjqbQhw2TGJ2QmgHhQgfT25e
         Q5Xl4/rQjPWr+8jNH0kJCdM0iumguuaLLYrH0JiVDsF+ZFMq0Qbj9xpxZfe7fhV+SHQC
         t+2pKzC6soD+MX7WVUya6dPiIkF0ATMMszXG+n+AV5e3n91x8j6YhkAc0La4dMcFdxWA
         JUAg==
X-Gm-Message-State: AJIora87ER2NwKFAGedqNecSfTvzDAvpGJBa2yvdkPs327LuMffSPKyc
        hcsOsIgrlcfxdv8JxiFO9ACe4pJnP/zjIOKD
X-Google-Smtp-Source: AGRyM1u4uKteyYUwStMifKwC7nSdRFPkO6444+kJatkGNf1mNPLCJEQLmJcEE0QhA5Uq6RlWWqAbFQ==
X-Received: by 2002:a17:907:7781:b0:6fe:4398:47b3 with SMTP id ky1-20020a170907778100b006fe439847b3mr19095691ejc.513.1657551503685;
        Mon, 11 Jul 2022 07:58:23 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id d4-20020a1709063ec400b0072b56098fc6sm1114368ejj.127.2022.07.11.07.58.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 07:58:22 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id r10so1213744wrv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:58:21 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr17662599wrr.617.1657551501186; Mon, 11
 Jul 2022 07:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220711082709.39102-1-krzysztof.kozlowski@linaro.org> <20220711082709.39102-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711082709.39102-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 07:58:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uvc+d8v4UCMLhcEydt-RVf+94NTUWrMgORv8bw0kDNUQ@mail.gmail.com>
Message-ID: <CAD=FV=Uvc+d8v4UCMLhcEydt-RVf+94NTUWrMgORv8bw0kDNUQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8998: add MSM8998 SDCC specific compatible
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 1:27 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add a MSM8998-specific SDCC compatible, because using only a generic
> qcom,sdhci-msm-v4 fallback is deprecated.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

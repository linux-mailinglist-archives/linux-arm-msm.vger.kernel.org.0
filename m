Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78661623E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 10:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiKJJMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 04:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiKJJMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 04:12:33 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0086324084
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:12:31 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 131so1633080ybl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ0zoYzFDslrILFuWLllOLpBV7AGCbxKTB4yqbkqbTU=;
        b=tWIDsNsPLPVHZEUozYnvLCa4EWhx/j6ljw3pP3nqoGByY+EaOfGp7EoZdND0d8M7M/
         9PAV7GXHe8oYHkowL8cFpBAazx+t2vwrFAPeRDlPzUJIB4nrYogvIxSrYPueSfuTXCmI
         Y4UHd8Un3UcEW7awvppHlmmGY7bu4y+hpBIh2STn7wKoK+6CPblfqlR7+RvWUyNuo5IT
         ZjEXwNI3z03e8LGKrfHOnQBRr7osVT/7R1h1RsLwlNpH+kNitVT0XyDUthSbMLLRJeAQ
         BAk0MsCR1qh3Cz5rHauXJfYmuNYIRhi0QX53mruVuXWKXKyE0rIAbg0ixr12RyaPTVD0
         jyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQ0zoYzFDslrILFuWLllOLpBV7AGCbxKTB4yqbkqbTU=;
        b=oxl3xxGB5uJlrdmyGqUmbbSrCCH2IGHyxf72ONp/RGXvu+rf6/RU0YzC35FyZDi1nt
         VLXzi0Rum0vzPCwovwWf0HMsFkdYDRLJwGaDdO3ifH1n6gXPpuHtW5s0TkA+EXs8FkpH
         w7vte+eXNWDjHB4qUxOlIPiLNjlixXkuhz5mzKhIzye01i4S4LRxGkETHFSILqDGv2WQ
         dKKgmWzy0jfhbED5R4oakRvEQRLAY6Gm1Cz+Zq60V3dZNwM2RAZzku3qgHwetP3IIt/S
         pyyMnXjXLetB21eYe6iDqFnpDbKEhxSzrjPOISzW+kbWA3N4+GYJphmkcV+nLQmNORDb
         D6ww==
X-Gm-Message-State: ACrzQf3ivu3jP5/UcgT2CJTxAWqj3l1jDhWPW4rW+s5+nRiPKqqba/xv
        h7MOjpN3z0OHLqX5t7r+nxqXNwlaDPPKlRWGXySN4jACxzk=
X-Google-Smtp-Source: AMsMyM7nhmyQ8LtPmvjO9u+KJIVYQkWp4KWCkKOaEBMIJ0/1qUWLH5LMFNwWkp/Q+6XpbcqRvPc1/EfNcwjtdSpjP7g=
X-Received: by 2002:a25:8a0f:0:b0:6c2:4ea4:69e5 with SMTP id
 g15-20020a258a0f000000b006c24ea469e5mr62811315ybl.153.1668071550711; Thu, 10
 Nov 2022 01:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20221109111236.46003-1-konrad.dybcio@linaro.org> <20221109111236.46003-4-konrad.dybcio@linaro.org>
In-Reply-To: <20221109111236.46003-4-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Nov 2022 12:12:19 +0300
Message-ID: <CAA8EJprNszfyyN9HLYoRK2Y-yUU-NuGd0QacqJ3UhkDjpvokdg@mail.gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: qcom: Add a device tree for PMK8350 on SID6
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Nov 2022 at 14:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> PMK8350 is shipped on SID6 with some SoCs, for example with SM6375.
> Add a DT with the SID changed to allow it to work.
>
> Unfortunately, the entire DT needs to be copied even if the diff is
> very little, as the node names are not unique. Including pm6125 and
> pmk8350 together for example, would make pmk8350 overwrite the pm6125
> node, as both are defined as 'pmic@0'.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8350_sid6.dtsi | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350_sid6.dtsi

Just to throw my 2c. If I was doing this myself, I'd allow pmk8350 to
receive external SID using the cpp #define (And to default to 0 if one
didn't use it).




-- 
With best wishes
Dmitry

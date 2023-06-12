Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0482E72D478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 00:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbjFLWeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 18:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235728AbjFLWeQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 18:34:16 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C10A184
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 15:34:15 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b1c5a6129eso57891291fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686609253; x=1689201253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4Xwe4WxbAGQn4xEyiGg/g3LPEJV7gNpnJJuVD6A+0c=;
        b=DRVYs/g2UZUWnA1DrW9aBSmS1eDRmfZn+mCFenQzNSFtAHaeG4EHwxeIUVDBftQ454
         bMWihmJNRrCEXMgRSSjbzQqaCA6DefDK3TxJnuOUG++3BL5YturQPJl2OArY+Jn3cPeF
         iZu9rHdNORH4HflraMBoafaXwYMReKs0fhqUA4Zzdc2l9OlX47c8GTHInWkp2KEQPYza
         dC8bgav3JmAeHQQG+vvKEmlo+mf20xEkiqUnhlFuiJHO063SBGH2YSVcisJO/saZSCSE
         GGf9ArXj4HPYfu3ZmATU1IZcNIj28iL/dPN//NyF8STn/m0g8MnsRAl0dKE8T+0cZUbp
         2PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686609253; x=1689201253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Xwe4WxbAGQn4xEyiGg/g3LPEJV7gNpnJJuVD6A+0c=;
        b=CSELSDX8owSnA3IjDN1QphYcFPjG/GnXPhk/Vv+9oSz8yLYTBB9DUOrNGsU+xfdKxO
         9t8+/k6JKfvhOisMSX3Vis0D/I66qbI3gSbO4T+r+HRMN7RW7cWYzEohmH2F5D3WSLsW
         uNDjpmbd5EB2+2DGqcRK4WNTvFtDHVPxNI7pvnLS4g/39AXwDUjbknzZdKULsqpLKUyc
         IFb66PuLvi80SXtgNm8bi6KikpH7P0slP/L4wIMDE+233+nwSrnZskZpNxqf9lsDgC1M
         HoawkymGIn3OMrKRWcMP3qJ43eDkpnoixh1OfIKcq5ErhVibJuy0V5OeE8LYf4UW4xJa
         WGng==
X-Gm-Message-State: AC+VfDwnojMXYqFv69LQ4kPEINPnkb7uMHkWC/WFnuM81CNCryvVdCH9
        uUBqWaXvJ6343NBzpJCm1onH3w==
X-Google-Smtp-Source: ACHHUZ6tyvqHScaDyATfvo4uH8DS4TvxO9mbGbUcSUFnn+ZC3asSLnIl30nK0hdxi864tRsuXH9c2w==
X-Received: by 2002:a2e:88d9:0:b0:2b1:c023:8b88 with SMTP id a25-20020a2e88d9000000b002b1c0238b88mr3757956ljk.41.1686609253716;
        Mon, 12 Jun 2023 15:34:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020a2e83d0000000b002b1a3ceb703sm1948189ljh.6.2023.06.12.15.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 15:34:12 -0700 (PDT)
Message-ID: <302756c2-03da-e090-137c-d056e49f58ed@linaro.org>
Date:   Tue, 13 Jun 2023 01:34:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Fix adreno smmu compatible
Content-Language: en-GB
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612220532.1884860-1-quic_bjorande@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612220532.1884860-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2023 01:05, Bjorn Andersson wrote:
> The adreno smmu should be compatible with qcom,adreno-smmu as well for
> per-process page tables to work.
> 
> Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8180x.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


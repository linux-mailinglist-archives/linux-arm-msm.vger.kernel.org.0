Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEDF158B72B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 18:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbiHFQ6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 12:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbiHFQ6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 12:58:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B733ADEFB
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 09:58:21 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id x2-20020a17090ab00200b001f4da5cdc9cso10941487pjq.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NzKRGCeBw0HtZvKt86J1N8xa2Nei5fwynFuykQCdLQY=;
        b=DHTC+sGNoi7LqLQozrWuyyfRQqoSg03P1aHoLXkI8tWwYUaCyUgW5/k2EI6xCutxYy
         nhk42CqaJrjb5fkFSkoU7ogO7gVIbrHwWSHidtTBi6Vq7M5OUi41obYCAslWtPEaUrSB
         vExCW5o+a24cPgRwh2uoTfP0h7HaxHDpJLj17B8YERKDyNxwQrJvCqnPBiTozyrioFgU
         cIgQIxqXLFpvlcE0M31nPVAZnXTrZabYtaDZOrBnT6OumxZUfDpd29ithvLQuAh5FJST
         4mm4OouSP2LN3+xKhebKwkVLvlKyJay1shHXzMhZdKD/s852mGtaiSs80pkWCfp8tkr1
         VNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NzKRGCeBw0HtZvKt86J1N8xa2Nei5fwynFuykQCdLQY=;
        b=ifsQr54GW9s7RA2Id6GIXdiFAAWY91UB9/HPr7CMze//q1VOUAz97zHv93jB/MIQ3L
         6X7FDwQLbOXcgnwl6g3fKQlWkHQVtrVwUHYSQH7GbU9U64ClzLEWS2GM+yOqUeCy9VKZ
         pPY1vlVxPQtDkH+LWQcYXKjHBUEo0x20frNytIoNC27KiSGwmV2wAtFmFmS3wde5PBhM
         li6Zr2qX/EVzE6zcRvUsflPzNid6LFDNg0oKfMUi38ZTLFry21k4LgJD2XBNIQQXotKm
         6el1KRJCRHE5zibhfSpnAt8V+MIKwPBd7VPzZDAm684Kag/Zz6mzKvreSbrKaYLVet0T
         l8Sg==
X-Gm-Message-State: ACgBeo2C3SaS4K+zeugCEWpnLpnkDva26ld1EFL3kwO4JReR5+PyBRue
        PMXx1r055TKaCxPYUPYZaFAn
X-Google-Smtp-Source: AA6agR6O44L9sEXXxNs0RX4ePvxszqiwayW4yVSDY2VVIsklhuLkNbxXEeRTDxElsUym3WXDsmfZSg==
X-Received: by 2002:a17:902:d509:b0:16f:1e1:2063 with SMTP id b9-20020a170902d50900b0016f01e12063mr11576561plg.131.1659805101181;
        Sat, 06 Aug 2022 09:58:21 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902f38100b0016c1b178628sm5093820ple.269.2022.08.06.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 09:58:20 -0700 (PDT)
Date:   Sat, 6 Aug 2022 22:28:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s:
 mark HID wakeup sources
Message-ID: <20220806165815.GS14384@thinkpad>
References: <20220805092317.4985-1-johan+linaro@kernel.org>
 <20220805092317.4985-7-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805092317.4985-7-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 11:23:16AM +0200, Johan Hovold wrote:
> The touchpad and keyboard can wake the system from suspend so declare
> them as wakeup sources.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 76ba2d5fa17e..1ca72f6ba55a 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -221,6 +221,8 @@ touchpad@2c {
>  
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&tpad_default>;
> +
> +		wakeup-source;
>  	};
>  
>  	keyboard@68 {
> @@ -233,6 +235,8 @@ keyboard@68 {
>  
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&kybd_default>;
> +
> +		wakeup-source;
>  	};
>  };
>  
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்

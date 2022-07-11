Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A51570772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 17:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbiGKPql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiGKPqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 11:46:37 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C33461702
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 08:46:36 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n185so3270864wmn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sbzF/b0TDWbG3eHmCMMeu/Cf2bVsa3up5HsHBkyPahg=;
        b=JKt1Js73fSE2mEEnm62h4ZuVpWB9ez0OKK9OY988kpU/mqOlmS4Y2Swxbk31n3zywt
         HDbkR21XFyHdn+HKzGMKhvf5l7+QtyADbuBCuCVSchO1COFEQDmBS5YqPH5WuW4EMbLZ
         OjYdqJDNI2SXyR42uhUdYGHt8m24u8D6ZH1lX53TQpudFe3fMs2AdTtzLQ3kL7b8aVGm
         4Euo/Xje7PPCLSmJWAgu9qcWahm5uhjX9qn4pxHsPfqWMPsQhongYlRqcCE5ic3OWQ2x
         yGVNi5GPHo1sO3q7LpxpjxAIJz356jR1V49CbL8mXNyNu+jRu0DfWinGqvAD9PLe9CWy
         /jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sbzF/b0TDWbG3eHmCMMeu/Cf2bVsa3up5HsHBkyPahg=;
        b=kOEscR+kiJ6aWsNMC6HFYDaZ5M/3ZDjTXDF26hD9SnjRZVBKyTmITHGbrRUBnNrs0x
         vhPrw3QXHtnLYVy48EYu+zzpg1sAdU91Hn+kH2kwdQKQhdcg6GW9WIRUVAQdBIwiBBkU
         aVWubSzBGZbWUBAf6571JP/g+bQcBl9NPW5d73s1/vHYneKexOcx/OpuMSSdRSu1Krqg
         cMtXw2/cJouqFxDu3pxSMb6gBTIf7odzL3nOMyUrLzRjxhUkTzjMw/S0ORNbYVAeJUL7
         A+xae78KJyAX4msk81pEh6eUYbZMiHVPTgr1+6uz2UHdRaS8xC0iw0UeFEQDMXJ9m/wh
         V+OA==
X-Gm-Message-State: AJIora92ySwp36eDnbBMoANHhO/FtNxPFEQFCMVNQIbLZoE8RhUx8dWN
        /6+UnhlofQ4Y5f62noGHJbBJ5g==
X-Google-Smtp-Source: AGRyM1v0DSEOMSCDxlaD0e8gidqc0PXuN/Tdf7/KtQbq0laY3RF86fRbM76GY7rPObtdin9YovDrZw==
X-Received: by 2002:a1c:7405:0:b0:3a2:de4f:5f07 with SMTP id p5-20020a1c7405000000b003a2de4f5f07mr17129497wmc.117.1657554394609;
        Mon, 11 Jul 2022 08:46:34 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id i14-20020adffc0e000000b0021d6ef34b2asm6080071wrr.51.2022.07.11.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:46:34 -0700 (PDT)
Date:   Mon, 11 Jul 2022 16:46:32 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        andrey.konovalov@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs
 assignment
Message-ID: <20220711154632.w5qtmroc22qc7yqq@maple.lan>
References: <20220711083038.1518529-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711083038.1518529-1-sumit.garg@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 11, 2022 at 02:00:38PM +0530, Sumit Garg wrote:
> Currently the DT for QCS404 SoC has setup for 2 USB2 PHYs with one each
> assigned to USB3 controller and USB2 controller. This assignment is
> incorrect which only works by luck: as when each USB HCI comes up it
> configures the *other* controllers PHY which is enough to make them
> happy. If, for any reason, we were to disable one of the controllers then
> both would stop working.
>
> This was a difficult inconsistency to be caught which was found while
> trying to enable USB support in u-boot. So with all the required drivers
> ported to u-boot, I couldn't get the same USB storage device enumerated
> in u-boot which was being enumerated fine by the kernel.
>
> The root cause of the problem came out to be that I wasn't enabling USB2
> PHY: "usb2_phy_prim" in u-boot. Then I realised that via simply disabling
> the same USB2 PHY currently assigned to USB2 host controller in the
> kernel disabled enumeration for USB3 host controller as well.
>
> So fix this inconsistency by correctly assigning USB2 PHYs.
>
> Fixes: 9375e7d719b3 ("arm64: dts: qcom: qcs404: Add USB devices and PHYs")
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

I've not got one of these board (nor any documentation for them) but the
description and change look OK. Thus FWIW:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>
> Changes in v2:
> - Update commit message description.
>
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 513bf7343b2c..50edc11a5bb5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -557,7 +557,7 @@ usb3_dwc3: usb@7580000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x07580000 0xcd00>;
>  				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&usb2_phy_sec>, <&usb3_phy>;
> +				phys = <&usb2_phy_prim>, <&usb3_phy>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				snps,has-lpm-erratum;
>  				snps,hird-threshold = /bits/ 8 <0x10>;
> @@ -586,7 +586,7 @@ usb@78c0000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x078c0000 0xcc00>;
>  				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&usb2_phy_prim>;
> +				phys = <&usb2_phy_sec>;
>  				phy-names = "usb2-phy";
>  				snps,has-lpm-erratum;
>  				snps,hird-threshold = /bits/ 8 <0x10>;
> --
> 2.25.1
>

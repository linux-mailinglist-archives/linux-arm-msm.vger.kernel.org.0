Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65A02700CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 17:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgIRPUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 11:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRPUO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 11:20:14 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944B2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 08:20:14 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 185so7406069oie.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJCca1Gpz/qntKkkfuhUuqPAs19Va9nMUQHb7GNjxCg=;
        b=G0JQIiIhW4dKr073ygInqGVY5kUDcU8THtTlLrQPIHIrlwNpPWOojEhsaxVflOlROF
         op5FB8vXuuCwPRKf04D2j486HVcIKrDbw8hIHvi5bY9XQ7EdeGncm2txHPe7puzA+6BI
         e5Kzk6rZYBabdhTK6VTqSwzW93dXXdjwSBjgg4nMP5i/04aZ3UolON6FZVlCwfdYo7je
         nS8ZXdGOCcdWuYQOhTLx3Fzy7Kf/21SMXSGUmIzrnsKTDZXvydeXQugMbSZWDk3aOkuo
         cXf1w/3YUSVHVnAI+652d4V/vbz4rMEFnK1pqeNFrVtmRAj1kwXOWKOESAR3s+vqrEKM
         VQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nJCca1Gpz/qntKkkfuhUuqPAs19Va9nMUQHb7GNjxCg=;
        b=U9HhMxR5AhcfwEWiawm8nkaD9Do9DWwnXyaZmCUMW+GoiHuVXjE0TA2M0u6Z032jWf
         BkccOOsa4bBQ41GJPbng9eINSfnpz9pCpxOV+OCbsG08sLkNG1IG602Vqbo8HDf6JBDg
         Va0gHGHQa0m+UN/unL0qcAWi9+p7GnJnmC9iJ2bCoArxa+B2CWh7C5CurEIH3AXZK1AB
         COBsEyBi6I9Her9szOtoxge4a7cWNRX1ei08QRWThVWyULi4LAO2v+7E2bbwmtZn+NWd
         5m7hfqt7IDJQdyD9i1VU58xM1SBxGyXddgOi/O1HP+w3ITDc5mtpBv8D4aD6Ok/4+E/v
         mCyg==
X-Gm-Message-State: AOAM532tvkb9ZNuj715iYmg/J7v6/JYi7psPtH0xedmU5UfY2WHnDnzr
        u7n1eiOAkujh1FHF3bqPjY4GZg==
X-Google-Smtp-Source: ABdhPJwxwD0KlJLfqNq5E0fE74Vl81bSoHj+6hUtjJSAc48pb3MwGBc1WyGkrk3bQn9hMvBPv9EyCw==
X-Received: by 2002:aca:5903:: with SMTP id n3mr10026260oib.159.1600442412373;
        Fri, 18 Sep 2020 08:20:12 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:7cad:6eff:fec8:37e4])
        by smtp.gmail.com with ESMTPSA id l3sm3306211oom.18.2020.09.18.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:20:11 -0700 (PDT)
Date:   Fri, 18 Sep 2020 10:20:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S
 driver
Message-ID: <20200918152009.GQ1893@yoga>
References: <1600435026-1876-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600435026-1876-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Sep 08:17 CDT 2020, Srinivasa Rao Mandadapu wrote:

> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add the I2S controller node to sc7180 dtsi.
> Add pinmux for primary and secondary I2S.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Each s-o-b is a statement that this patch conforms to the license
requirements of the Linux project. As such it describes the history of
how this patch reached this point; starting with Ajit writing the patch,
Cheng-Yi handling it, then you and finally Sujith.

You sending the patch would indicate that you handled it last, so your
certification should be last (and if Sujith handled the patch inbetween
you should be listed twice).

Please read https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=certificate#sign-your-work-the-developer-s-certificate-of-origin

Regards,
Bjorn

> ---
> Changes since v1:
>    -- Updated I2S pin control nodes  with grouping common pin controls
>    -- Updated lpass_cpu node with proper control names
> Changes since v2:
>    -- The plement of lpass_cpu node is changed
>  
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6678f1e..59c39cf 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1742,6 +1742,45 @@
>  				};
>  			};
>  
> +			sec_mi2s_active: sec-mi2s-active {
> +				pinmux {
> +					pins = "gpio49", "gpio50", "gpio51";
> +					function = "mi2s_1";
> +				};
> +
> +				pinconf {
> +					pins = "gpio49", "gpio50", "gpio51";;
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			pri_mi2s_active: pri-mi2s-active {
> +				pinmux {
> +					pins = "gpio53", "gpio54", "gpio55", "gpio56";
> +					function = "mi2s_0";
> +				};
> +
> +				pinconf {
> +					pins = "gpio53", "gpio54", "gpio55", "gpio56";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			pri_mi2s_mclk_active: pri-mi2s-mclk-active {
> +				pinmux {
> +					pins = "gpio57";
> +					function = "lpass_ext";
> +				};
> +
> +				pinconf {
> +					pins = "gpio57";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
> +
>  			sdc1_on: sdc1-on {
>  				pinconf-clk {
>  					pins = "sdc1_clk";
> @@ -3389,6 +3428,36 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		lpass_cpu: lpass@62f00000 {
> +			compatible = "qcom,sc7180-lpass-cpu";
> +
> +			reg = <0 0x62f00000 0 0x29000>;
> +			reg-names = "lpass-lpaif";
> +
> +			iommus = <&apps_smmu 0x1020 0>;
> +
> +			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +
> +			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> +
> +			clock-names = "pcnoc-sway-clk", "audio-core",
> +					"mclk0", "pcnoc-mport-clk",
> +					"mi2s-bit-clk0", "mi2s-bit-clk1";
> +
> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "lpass-irq-lpaif";
> +		};
> +
>  		lpass_hm: clock-controller@63000000 {
>  			compatible = "qcom,sc7180-lpasshm";
>  			reg = <0 0x63000000 0 0x28>;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

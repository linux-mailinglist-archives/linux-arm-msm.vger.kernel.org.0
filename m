Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4C51B0128
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 07:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgDTFtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 01:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725994AbgDTFto (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 01:49:44 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C89EC061A10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 22:49:44 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w11so4511284pga.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 22:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pYaYny195U45WYKSgGkllyuC27MGqSxRNHzg9ROO/p8=;
        b=zqmxPhHr7jWaJjjeKvTwz45jn2F93wmZCn83dgMJ4Vi9rD6UD+4wgXsmaqKmBwmEOr
         3UaoQudmz+SuDKdR8EBN5HlztGq1Q6/AHEnIFVx78hbO/um7Ngw3+ROsyXLDeONU3tT0
         XyuW/DS369+gRto7xJ6QfTSev0zgTAmG9XgzVvGFScukbO3LEkQH/WcSOOvS8nP3OoZQ
         1/WH+289vtqQuBhc+6kwqaJtm9fQRQttX98ocFYCHBVeDwKRmZnR+vjreu0Yytp44a7s
         kSgoc0uZy83OA2Ws6oIy2c90evKRN+EuIZ40NCR6rwmA5aFuXhyV+8+zWyx0btv/wKlt
         XGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pYaYny195U45WYKSgGkllyuC27MGqSxRNHzg9ROO/p8=;
        b=cpsF2Ecazvj8DKdHsVbKBFJbojFSFvmoLzRFp7U+WYx8mcrX5Dn7yli0sklv0ajRPb
         iaLkm3HikXXs8NyNPvtGPf/5kcIpmi4bURTNFduM3FFpZU3dBow3/XeiNivA2FcpGQQU
         xreUmv7R/e1ZguxOHmTEp8NmWKSCfxmd51i8nUr6LmtZ8TYu+oGGbg9d9S70Xq0YrGCg
         iYsJEeCCdZJMrqHbz6PntOwO44pXbsdrOQspk9mkcSnt4m+6qJgAb4Uz9bZqXah2153k
         uHcYoaxnvo1yFVZQ8cLQP+aTb86Hp5Ye9QqY+XikmMDrkS4QsfcmB4dpsFit/7toqL7P
         hK9w==
X-Gm-Message-State: AGi0PuZndFPUvD5uh2zQFd/eZnokXM6tqTXfwzZJjdydhG15v/3q3yC7
        /uxsVoT+SdKtQ+Cdhh3SVmdjlA==
X-Google-Smtp-Source: APiQypJKOFu7hmKkPUSWtQOB+DSqkUO0qvT/vkMuGbUTO1BQxTAyqwqLClsRYtGr77iCkoj8rkrXPg==
X-Received: by 2002:a62:25c6:: with SMTP id l189mr15595958pfl.28.1587361782982;
        Sun, 19 Apr 2020 22:49:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m4sm547062pfm.26.2020.04.19.22.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 22:49:42 -0700 (PDT)
Date:   Sun, 19 Apr 2020 22:50:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc7180: Update Q6V5 MSS node
Message-ID: <20200420055005.GI1516868@builder.lan>
References: <20200417142605.28885-1-sibis@codeaurora.org>
 <20200417142605.28885-6-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417142605.28885-6-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Apr 07:26 PDT 2020, Sibi Sankar wrote:

> Add TCSR node and update MSS node to support MSA based Modem boot on
> SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> Depends on the following bindings:
> iommus: https://patchwork.kernel.org/patch/11443101/
> spare-regs: https://patchwork.kernel.org/patch/11491425/
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    |  5 +++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index e613d70cc0198..6f472872be1a3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -319,6 +319,48 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&remoteproc_mpss {
> +	compatible = "qcom,sc7180-mss-pil";
> +	reg = <0 0x04080000 0 0x410>, <0 0x04180000 0 0x48>;

I think we should overspecify the properties in the platform dtsi,
whenever possible - it shouldn't be a problem that the pas driver
doesn't use all the properties provided by the binding.

As such I think you should move the reg, clocks, resets, halt regs and
power-domains to the platform.

> +	reg-names = "qdsp6", "rmb";
> +
> +	clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +		 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +		 <&gcc GCC_MSS_NAV_AXI_CLK>,
> +		 <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +		 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
> +		 <&rpmhcc RPMH_CXO_CLK>;
> +	clock-names = "iface", "bus", "nav", "snoc_axi",
> +		      "mnoc_axi", "xo";
> +
> +	iommus = <&apps_smmu 0x460 0x1>, <&apps_smmu 0x444 0x2>;
> +
> +	resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> +		 <&pdc_reset PDC_MODEM_SYNC_RESET>;
> +	reset-names = "mss_restart", "pdc_reset";
> +
> +	qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> +	qcom,spare-regs = <&tcsr_regs 0xb3e4>;
> +
> +	power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
> +			<&rpmhpd SC7180_CX>,
> +			<&rpmhpd SC7180_MX>,
> +			<&rpmhpd SC7180_MSS>;
> +	power-domain-names = "load_state", "cx", "mx", "mss";
> +
> +	/delete-property/memory-region;
> +
> +	status = "okay";
> +
> +	mba {
> +		memory-region = <&mba_mem>;

When I wrote this I was under the impression that memory-region wasn't
allowed to take an array of regions, perhaps we can make the mss binding
and driver support a multi-cell memory-region in the of_node directly
and drop these sub children.

Then it would be a cleaner update of the pas' memory-region.

But I'm fine with us putting this part on the todo list for the time
being...

Regards,
Bjorn

> +	};
> +
> +	mpss {
> +		memory-region = <&mpss_mem>;
> +	};
> +};
> +
>  &uart3 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index e319762a0bffc..c49801ddb9d70 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -981,6 +981,11 @@ tcsr_mutex_regs: syscon@1f40000 {
>  			reg = <0 0x01f40000 0 0x40000>;
>  		};
>  
> +		tcsr_regs: syscon@1fc0000 {
> +			compatible = "syscon";
> +			reg = <0 0x01fc0000 0 0x40000>;
> +		};
> +
>  		tlmm: pinctrl@3500000 {
>  			compatible = "qcom,sc7180-pinctrl";
>  			reg = <0 0x03500000 0 0x300000>,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

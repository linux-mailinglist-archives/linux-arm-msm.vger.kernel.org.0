Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E121D8BAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 01:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgERXik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 19:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgERXij (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 19:38:39 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7C1C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 16:38:38 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s10so3296534pgm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F7d1y5ToSucIjdzXtTujrTnmegwlCmFucSJBd0QBPjU=;
        b=z5BVq1sGHv6ySHzBZ/SRmi+zSGXBvELRTb6AhonPJCiKlUOu64rbuyICViU3dVLaNI
         /N2nyq3E7eBYwTJG+/BgCz+5UTidcIXOs1dlzTcR/HQak01H0DJjlEi6uzJxtpD3q2+V
         frgrEnMYJurs0APUoF3hpj4rgbqX0mVY8kDiRz3FhoJqPxPRs9I8UlmEsfB1mKL2kZGb
         7rK5NLxD3KBBCwtX2ZRBzKeJ36zWI8I+MzFuKbi/Oe4XSJc+ojJIJnx3vwkqudKJkl7B
         VYqBSZonrV+zMSb2o2zYK8Pyzzs/IjTlzXf21Ex/+Zk13eH0LWGqwUJuW/ys8XPRVheG
         uTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F7d1y5ToSucIjdzXtTujrTnmegwlCmFucSJBd0QBPjU=;
        b=K/fHyldT1kf4I3tQnES2cgS73ien5Mfxcn775TByjsrsTL20ouielxjiXk8pTZrNbt
         kJ/qaoAwx7XTRh4K9I0kpfRK19OAsvt4fDuDx6yQhLNlE/nYo6RZ9BoEbP8iVaWei2yH
         Z8Hkdj5+aWz/a029P0nvckjuMrcAYOX8+ieYZYO0sCO4CR6XgkRErEb7n3QDmjQ61Dk+
         +K7p5YvEx0qVGIxjnFLXkliznYiD4UoRkVyBGUnBmxrBI28oGNnKLB4Bu5JVzERThs9f
         WPdV5wzKopqW900Zc/y5c1tDbKEtvKEC9DRTj/kmBUTVqdNEjhC+vqpFDg4VAevfiKUU
         wv1g==
X-Gm-Message-State: AOAM533L/NFI60dggk8R3q56HRIe4kpV4JduxRI9CDplYKYtuCFV7ACG
        SG80Q75U/pKXleoUYzKlsYEDbw==
X-Google-Smtp-Source: ABdhPJyg/L37OU7BLi0Gq3N8kwKVQUiQfF8uH6fniMYogUDFPThmLIwTN0A55ZsEJLNISnRsXxIpcA==
X-Received: by 2002:aa7:80d9:: with SMTP id a25mr20108929pfn.220.1589845117836;
        Mon, 18 May 2020 16:38:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q18sm2726792pgt.74.2020.05.18.16.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 16:38:37 -0700 (PDT)
Date:   Mon, 18 May 2020 16:37:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     agross@kernel.org, evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add IPA information
Message-ID: <20200518233715.GG279327@builder.lan>
References: <20200518214939.9730-1-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518214939.9730-1-elder@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 May 14:49 PDT 2020, Alex Elder wrote:

> Add IPA-related nodes and definitions to "sc7180.dtsi".
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

Applied

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 51 ++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f1280e00b064..9a3686ce73ea 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -461,6 +461,17 @@
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		ipa_smp2p_out: ipa-ap-to-modem {
> +			qcom,entry-name = "ipa";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		ipa_smp2p_in: ipa-modem-to-ap {
> +			qcom,entry-name = "ipa";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>  	};
>  
>  	psci {
> @@ -1007,6 +1018,46 @@
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		ipa: ipa@1e40000 {
> +			compatible = "qcom,sc7180-ipa";
> +
> +			iommus = <&apps_smmu 0x440 0x3>;
> +			reg = <0 0x1e40000 0 0x7000>,
> +			      <0 0x1e47000 0 0x2000>,
> +			      <0 0x1e04000 0 0x2c000>;
> +			reg-names = "ipa-reg",
> +				    "ipa-shared",
> +				    "gsi";
> +
> +			interrupts-extended = <&intc 0 311 IRQ_TYPE_EDGE_RISING>,
> +					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "ipa",
> +					  "gsi",
> +					  "ipa-clock-query",
> +					  "ipa-setup-ready";
> +
> +			clocks = <&rpmhcc RPMH_IPA_CLK>;
> +			clock-names = "core";
> +
> +			interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
> +				        <&aggre2_noc MASTER_IPA &system_noc SLAVE_IMEM>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
> +			interconnect-names = "memory",
> +					     "imem",
> +					     "config";
> +
> +			qcom,smem-states = <&ipa_smp2p_out 0>,
> +					   <&ipa_smp2p_out 1>;
> +			qcom,smem-state-names = "ipa-clock-enabled-valid",
> +						"ipa-clock-enabled";
> +
> +			modem-remoteproc = <&remoteproc_mpss>;
> +
> +			status = "disabled";
> +		};
> +
>  		tcsr_mutex_regs: syscon@1f40000 {
>  			compatible = "syscon";
>  			reg = <0 0x01f40000 0 0x40000>;
> -- 
> 2.20.1
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D384F1C52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Apr 2022 23:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352699AbiDDV01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 17:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380320AbiDDTbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 15:31:31 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F014D20F5C
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 12:29:34 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so293334pjk.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QQK0u/1t7bvu65SH9gfd8Qr6GQ/JS9W+uuml8zfn2a8=;
        b=IRWgirC5/1yGKC93yfne3OYdJ9pDqFar0lGl96/Rld12mFQXDom5GO2t3ivbkNXrhT
         D2ssZXTI29QCSnDpT3Pk0vtss/PaHY9XNbsi+5Za9AftTNY5MYiexE5fwjeNKtBhMlrw
         NQ/nd+Fo5EaGA64McZZ2M64G+/+J+4ViGHfCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QQK0u/1t7bvu65SH9gfd8Qr6GQ/JS9W+uuml8zfn2a8=;
        b=FrqTvEk0zUTslIf5wE+oK2HT8ukNz/eExhT05LDlbsm+8U+LKyzYnogDB9BecaG5O+
         9WNd7/lxzgfvEzaq3nt4HInDdOEj62TsASBQ83x5m1uRWixsBoe9bXneIVMQJonMLcph
         0QF9rQrumePpdMOD0ziwMdLWuJ72uuuGPjdW1PFIHKCgGbVuPuJVWxv/NNdMXCo2U6Za
         bZt3KdhhNRNropuJaK4oHjqPXakAAzglEnwteuc50dDt8qzz7e1sQVRbVtsrMuIshTgE
         tSemWbITLNBMvVKSodGRMRZr1mXxGyIpWDp7TV1+Vy1OMnq4wBQbYNGxNAoQJzKBewWJ
         5gAg==
X-Gm-Message-State: AOAM530c3JhhShVi5OoDOD0YH/B8rW5mn1ACIpWm4C7Tqo3snyPXGjKF
        jUGKZ+Wd1ixBzdPHnBJHo4bBcQ==
X-Google-Smtp-Source: ABdhPJx69pSWNGeNxYAX4SX/Q4krTcMRZC4c2fenVI8+/TCxfsHtHPUxT4/uYSVl3XeN8u4J+LX0/g==
X-Received: by 2002:a17:902:bf06:b0:156:af5b:e6c with SMTP id bi6-20020a170902bf0600b00156af5b0e6cmr1469346plb.147.1649100574399;
        Mon, 04 Apr 2022 12:29:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1ebc:cb71:2a38:38db])
        by smtp.gmail.com with UTF8SMTPSA id k18-20020a056a00135200b004fb18fc6c78sm13294266pfu.31.2022.04.04.12.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 12:29:34 -0700 (PDT)
Date:   Mon, 4 Apr 2022 12:29:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Message-ID: <YktHHOww7VkbIxfE@google.com>
References: <20220328071057.2454-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328071057.2454-1-quic_mpubbise@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 28, 2022 at 12:40:57PM +0530, Manikanta Pubbisetty wrote:
> Add DTS node for WCN6750 WiFi chipset.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
> Depends on:
> - https://patchwork.kernel.org/project/linux-arm-msm/patch/20220328070701.28551-1-quic_mpubbise@quicinc.com/
> - https://patchwork.kernel.org/project/linux-wireless/patch/20220328060937.16738-2-quic_mpubbise@quicinc.com/
> 
> Changes from V2:
> - Changes based on DT binding concerns
> - Rebased on ToT
> 
> Changes from V1:
> - Corrected the case for hex values
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  7 ++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 46 ++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 069ffbc37bc4..a82e9aa7bdc5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -551,3 +551,10 @@ &remoteproc_wpss {
>  	status = "okay";
>  };
>  
> +&wifi {
> +	status = "okay";
> +	wifi-firmware {
> +		iommus = <&apps_smmu 0x1c02 0x1>;
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b757e8ad1199..dfd9fa077903 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -85,6 +85,11 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		wlan_ce_mem: memory@4cd000 {
> +			no-map;
> +			reg = <0x0 0x4cd000 0x0 0x1000>;

Pad the address to 8 digits here (not in the node name).

> +		};
> +
>  		hyp_mem: memory@80000000 {
>  			reg = <0x0 0x80000000 0x0 0x600000>;
>  			no-map;
> @@ -1808,6 +1813,47 @@ mmss_noc: interconnect@1740000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		wifi: wifi@17a10040 {
> +			compatible = "qcom,wcn6750-wifi";
> +			reg = <0 0x17a10040 0 0x0>;
> +			iommus = <&apps_smmu 0x1c00 0x1>;
> +			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
> +			qcom,rproc = <&remoteproc_wpss>;
> +			memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;

Where is 'wlan_fw_mem' added?

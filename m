Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E2D22C794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 16:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgGXONX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 10:13:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46295 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgGXONW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 10:13:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595600001; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0OHJcEma3vAIw0ugAwhwdrW/69ogMk3CRZJI0yEnfRI=;
 b=B2IBMu34FMZa7dglQBgqjIWlZ/r+SDs9rmsdkpzaJuxbnNDOJwwGOkcp5MG/64wIaMhkxKSy
 /n8t5zWEh1ixctypeG1hn89hpQpOGUFBsotVQEI9cQyuJm7s6Ir+P9ZLdcuMUH5HXiKBxzHg
 T2azDaPjwRm7GLg2a2EKqSxbmVQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f1aec757186ea1ee120b5a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 14:13:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84479C43395; Fri, 24 Jul 2020 14:13:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A629C43391;
        Fri, 24 Jul 2020 14:13:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Jul 2020 19:43:07 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8150: add interconnect nodes
In-Reply-To: <20200713154121.22094-7-jonathan@marek.ca>
References: <20200713154121.22094-1-jonathan@marek.ca>
 <20200713154121.22094-7-jonathan@marek.ca>
Message-ID: <c0660973fc5235f402f7ce9cb404fd35@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Jonathan,

Thanks for the patch! Please use the
suggested register space definitions
instead.

On 2020-07-13 21:11, Jonathan Marek wrote:
> Add the interconnect dts nodes for sm8150.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 82 ++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 33ff99132f4f..fa9cd9d60093 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
> +#include <dt-bindings/interconnect/qcom,sm8150.h>
>  #include <dt-bindings/thermal/thermal.h>
> 
>  / {
> @@ -440,6 +441,69 @@ uart2: serial@a90000 {
>  			};
>  		};
> 
> +		dc_noc: interconnect@14e0000 {
> +			compatible = "qcom,sm8150-dc-noc";
> +			reg = <0 0x014e0000 0 0x1000>;

0x09160000 0x3200

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		config_noc: interconnect@1500000 {
> +			compatible = "qcom,sm8150-config-noc";
> +			reg = <0 0x01500000 0 0x1000>;

0x01500000 0x7400

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		camnoc_virt: interconnect@1620000 {
> +			compatible = "qcom,sm8150-camnoc-virt";
> +			reg = <0 0x01620000 0 0x1000>;

0x0ac00000 0x1000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		ipa_virt: interconnect-ipa@1620000 {
> +			compatible = "qcom,sm8150-ipa-virt";
> +			reg = <0 0x01620000 0 0x1000>;

0x01e00000 0x1000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		system_noc: interconnect@1629000 {
> +			compatible = "qcom,sm8150-system-noc";
> +			reg = <0 0x01500000 0 0x1000>;

0x01620000 0x19400

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre1_noc: interconnect@16e4000 {
> +			compatible = "qcom,sm8150-aggre1-noc";
> +			reg = <0 0x016e4000 0 0x1000>;

0x016e0000 0xd080

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre2_noc: interconnect@1706000 {
> +			compatible = "qcom,sm8150-aggre2-noc";
> +			reg = <0 0x01706000 0 0x1000>;

0x01700000 0x3b100

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		compute_noc: interconnect@1720000 {
> +			compatible = "qcom,sm8150-compute-noc";
> +			reg = <0 0x01720000 0 0x1000>;

0x01720000 0x7000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		mmss_noc: interconnect@1749000 {
> +			compatible = "qcom,sm8150-mmss-noc";
> +			reg = <0 0x01749000 0 0x1000>;

0x01740000 0x1c100

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> @@ -860,6 +924,20 @@ usb_2_ssphy: lane@88eb200 {
>  			};
>  		};
> 
> +		mc_virt: interconnect@9680000 {
> +			compatible = "qcom,sm8150-mc-virt";
> +			reg = <0 0x09680000 0 0x1000>;

0x0163a000 0x1000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		gem_noc: interconnect@96ab000 {
> +			compatible = "qcom,sm8150-gem-noc";
> +			reg = <0 0x096ab000 0 0x1000>;

0x09680000 0x3e200

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		usb_1: usb@a6f8800 {
>  			compatible = "qcom,sm8150-dwc3", "qcom,dwc3";
>  			reg = <0 0x0a6f8800 0 0x400>;
> @@ -1280,6 +1358,10 @@ rpmhpd_opp_turbo_l1: opp11 {
>  					};
>  				};
>  			};
> +
> +			apps_bcm_voter: bcm_voter {
> +				compatible = "qcom,bcm-voter";
> +			};
>  		};
> 
>  		cpufreq_hw: cpufreq@18323000 {

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

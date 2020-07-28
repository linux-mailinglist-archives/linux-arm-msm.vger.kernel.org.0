Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADB4230989
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgG1MDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:03:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17674 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgG1MDi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:03:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595937818; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vm/iIuV+94ECTCG0r3Bpt5nJ2J+WV4KcMzINPa/59UY=;
 b=buQMBhO9w5sVa3izzJY4mkxapO5yxNEYpbohk8/i3WqtJTAh6oenzTUIU7Nrsv07Ylav+AS9
 lKzRhSRH4ucBgpeJPw42Oy84R8/vhgu/9m2TFafKobf5iQd3EPmDm7C1cY3SbUMxTdtH4nvJ
 7eJatTXWsZjBcPbGTJOorIN92s8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f2013ef8db7256a950bee21 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 12:02:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACE55C433C9; Tue, 28 Jul 2020 12:02:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E6C2C433C6;
        Tue, 28 Jul 2020 12:02:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 17:32:54 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sm8250: add interconnect nodes
In-Reply-To: <20200728023811.5607-8-jonathan@marek.ca>
References: <20200728023811.5607-1-jonathan@marek.ca>
 <20200728023811.5607-8-jonathan@marek.ca>
Message-ID: <bbe96cb3a8f1c28310963db2d1b97990@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-28 08:08, Jonathan Marek wrote:
> Add the interconnect dts nodes for sm8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 82 ++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 636e2196138c..945bd4a9d640 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>  #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -978,6 +979,55 @@ spi13: spi@a94000 {
>  			};
>  		};
> 
> +		config_noc: interconnect@1500000 {
> +			compatible = "qcom,sm8250-config-noc";
> +			reg = <0 0x01500000 0 0xa580>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		system_noc: interconnect@1620000 {
> +			compatible = "qcom,sm8250-system-noc";
> +			reg = <0 0x01620000 0 0x1c200>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		mc_virt: interconnect@163d000 {
> +			compatible = "qcom,sm8250-mc-virt";
> +			reg = <0 0x0163d000 0 0x1000>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre1_noc: interconnect@16e0000 {
> +			compatible = "qcom,sm8250-aggre1-noc";
> +			reg = <0 0x016e0000 0 0x1f180>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre2_noc: interconnect@1700000 {
> +			compatible = "qcom,sm8250-aggre2-noc";
> +			reg = <0 0x01700000 0 0x33000>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		compute_noc: interconnect@1733000 {
> +			compatible = "qcom,sm8250-compute-noc";
> +			reg = <0 0x01733000 0 0xa180>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		mmss_noc: interconnect@1740000 {
> +			compatible = "qcom,sm8250-mmss-noc";
> +			reg = <0 0x01740000 0 0x1f080>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> @@ -1050,6 +1100,13 @@ ufs_mem_phy_lanes: lanes@1d87400 {
>  			};
>  		};
> 
> +		ipa_virt: interconnect@1e00000 {
> +			compatible = "qcom,sm8250-ipa-virt";
> +			reg = <0 0x01e00000 0 0x1000>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		tcsr_mutex_regs: syscon@1f40000 {
>  			compatible = "syscon";
>  			reg = <0x0 0x01f40000 0x0 0x40000>;
> @@ -1364,6 +1421,27 @@ usb_2_ssphy: lane@88eb200 {
>  			};
>  		};
> 
> +		dc_noc: interconnect@90c0000 {
> +			compatible = "qcom,sm8250-dc-noc";
> +			reg = <0 0x090c0000 0 0x4200>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		gem_noc: interconnect@9100000 {
> +			compatible = "qcom,sm8250-gem-noc";
> +			reg = <0 0x09100000 0 0xb4000>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		npu_noc: interconnect@9990000 {
> +			compatible = "qcom,sm8250-npu-noc";
> +			reg = <0 0x09990000 0 0x1600>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		usb_1: usb@a6f8800 {
>  			compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
>  			reg = <0 0x0a6f8800 0 0x400>;
> @@ -2359,6 +2437,10 @@ rpmhpd_opp_turbo_l1: opp10 {
>  					};
>  				};
>  			};
> +
> +			apps_bcm_voter: bcm_voter {
> +				compatible = "qcom,bcm-voter";
> +			};
>  		};
>  	};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

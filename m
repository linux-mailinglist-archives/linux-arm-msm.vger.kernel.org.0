Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF2222C791
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 16:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgGXONX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 10:13:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16711 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbgGXONW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 10:13:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595600001; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RwctQRbm9rUDdtg6nDhU8CUxDe/QiKiPo5F5WN++oyg=;
 b=SALQjvDiGWiX5YZveJAOnFf6ShrfFfFA1PG2094zWLJXiJwmHNg7/CAsGfzZXRqtiZ9mJsbQ
 NR/PmjqeNJ/+OEsf5PQDXWy1ccLtM/cxttBWr7+y8B33EPKOBKZ9JM451DA3KFajkGHIflIA
 m9hst1E4dTypdIBVNXr8mTSnQ00=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f1aec7e36e6de324e0aec69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 14:13:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28922C43391; Fri, 24 Jul 2020 14:13:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46FAEC433C6;
        Fri, 24 Jul 2020 14:13:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Jul 2020 19:43:17 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8250: add interconnect nodes
In-Reply-To: <20200713154121.22094-8-jonathan@marek.ca>
References: <20200713154121.22094-1-jonathan@marek.ca>
 <20200713154121.22094-8-jonathan@marek.ca>
Message-ID: <630319740d3f06cfb0435cae025e0ca1@codeaurora.org>
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
> Add the interconnect dts nodes for sm8250.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 82 ++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 636e2196138c..dfc1b7fa7d85 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/interconnect/qcom,sm8250.h>

please fix ^^ sort order

> 
>  / {
>  	interrupt-parent = <&intc>;
> @@ -978,6 +979,55 @@ spi13: spi@a94000 {
>  			};
>  		};
> 
> +		config_noc: interconnect@1500000 {
> +			compatible = "qcom,sm8250-config-noc";
> +			reg = <0 0x01500000 0 0x1000>;

0x01500000 0xa580

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		ipa_virt: interconnect@1620000 {
> +			compatible = "qcom,sm8250-ipa-virt";
> +			reg = <0 0x01620000 0 0x1000>;

0x01e00000 0x1000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		system_noc: interconnect@1632000 {
> +			compatible = "qcom,sm8250-system-noc";
> +			reg = <0 0x01632000 0 0x1000>;

0x01620000 0x1C200

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre1_noc: interconnect@16e2000 {
> +			compatible = "qcom,sm8250-aggre1-noc";
> +			reg = <0 0x016e2000 0 0x1000>;

0x016e0000 0x1f180

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre2_noc: interconnect@1703000 {
> +			compatible = "qcom,sm8250-aggre2-noc";
> +			reg = <0 0x01703000 0 0x1000>;

0x01700000 0x33000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		compute_noc: interconnect@1733000 {
> +			compatible = "qcom,sm8250-compute-noc";
> +			reg = <0 0x01733000 0 0x1000>;

0x01733000 0xd180

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		mmss_noc: interconnect@174a000 {
> +			compatible = "qcom,sm8250-mmss-noc";
> +			reg = <0 0x0174a000 0 0x1000>;

0x01740000 0x1f080

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
>  		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> @@ -1364,6 +1414,34 @@ usb_2_ssphy: lane@88eb200 {
>  			};
>  		};
> 
> +		dc_noc: interconnect@90c0000 {
> +			compatible = "qcom,sm8250-dc-noc";
> +			reg = <0 0x090c0000 0 0x1000>;

0x090c0000 0x4200

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		mc_virt: interconnect@9100000 {
> +			compatible = "qcom,sm8250-mc-virt";
> +			reg = <0 0x09100000 0 0x1000>;

0x0163d000 0x1000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		gem_noc: interconnect@9121000 {
> +			compatible = "qcom,sm8250-gem-noc";
> +			reg = <0 0x09121000 0 0x1000>;

0x09100000 0xb4000

> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		npu_noc: interconnect@9990000 {
> +			compatible = "qcom,sm8250-npu-noc";
> +			reg = <0 0x09990000 0 0x1000>;

0x09990000 0x1600

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

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA44B1228B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 11:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfLQKb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 05:31:29 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:46463 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbfLQKb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 05:31:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576578687; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8KuBApXzd0MD/XPYy5T+nfSH5RIRIiDCIVYgXYT/E2g=; b=sa6GbDosmcZHwhL+x8BroLKngrTmFxxA8O/i0MZ3JDtkS8uXDVy1ED9iGsij7ipB1zK2eXZY
 COLhjLrNfg+lznUQ+rEVFBXbcd80K56a93voC6xCypZyJHTLtoufvUwuo9mrCCweHGqJ4Mb4
 LmCLCPFmXfurTLEMIuKBR3xtSpY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8ae7e.7f42b0711f48-smtp-out-n01;
 Tue, 17 Dec 2019 10:31:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CE5FC433A2; Tue, 17 Dec 2019 10:31:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.117.127] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A065C447A6;
        Tue, 17 Dec 2019 10:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A065C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Convert rpmpd bindings to
 yaml
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
References: <20191216115531.17573-1-sibis@codeaurora.org>
 <20191216115531.17573-2-sibis@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <ca58310b-c4f3-2912-a496-2826ff3df16b@codeaurora.org>
Date:   Tue, 17 Dec 2019 16:01:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216115531.17573-2-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/16/2019 5:25 PM, Sibi Sankar wrote:
> Convert RPM/RPMH power-domain bindings to yaml.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   .../devicetree/bindings/power/qcom,rpmpd.txt  | 150 ----------------
>   .../devicetree/bindings/power/qcom,rpmpd.yaml | 170 ++++++++++++++++++
>   2 files changed, 170 insertions(+), 150 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>   create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> deleted file mode 100644
> index 6346d00b1b400..0000000000000
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -Qualcomm RPM/RPMh Power domains
> -
> -For RPM/RPMh Power domains, we communicate a performance state to RPM/RPMh
> -which then translates it into a corresponding voltage on a rail
> -
> -Required Properties:
> - - compatible: Should be one of the following
> -	* qcom,msm8976-rpmpd: RPM Power domain for the msm8976 family of SoC
> -	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
> -	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
> -	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
> -	* qcom,sc7180-rpmhpd: RPMh Power domain for the sc7180 family of SoC
> -	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
> -	* qcom,sm8150-rpmhpd: RPMh Power domain for the sm8150 family of SoC
> - - #power-domain-cells: number of cells in Power domain specifier
> -	must be 1.
> - - operating-points-v2: Phandle to the OPP table for the Power domain.
> -	Refer to Documentation/devicetree/bindings/power/power_domain.txt
> -	and Documentation/devicetree/bindings/opp/opp.txt for more details
> -
> -Refer to <dt-bindings/power/qcom-rpmpd.h> for the level values for
> -various OPPs for different platforms as well as Power domain indexes
> -
> -Example: rpmh power domain controller and OPP table
> -
> -#include <dt-bindings/power/qcom-rpmhpd.h>
> -
> -opp-level values specified in the OPP tables for RPMh power domains
> -should use the RPMH_REGULATOR_LEVEL_* constants from
> -<dt-bindings/power/qcom-rpmhpd.h>
> -
> -	rpmhpd: power-controller {
> -		compatible = "qcom,sdm845-rpmhpd";
> -		#power-domain-cells = <1>;
> -		operating-points-v2 = <&rpmhpd_opp_table>;
> -
> -		rpmhpd_opp_table: opp-table {
> -			compatible = "operating-points-v2";
> -
> -			rpmhpd_opp_ret: opp1 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> -			};
> -
> -			rpmhpd_opp_min_svs: opp2 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> -			};
> -
> -			rpmhpd_opp_low_svs: opp3 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -			};
> -
> -			rpmhpd_opp_svs: opp4 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> -			};
> -
> -			rpmhpd_opp_svs_l1: opp5 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> -			};
> -
> -			rpmhpd_opp_nom: opp6 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> -			};
> -
> -			rpmhpd_opp_nom_l1: opp7 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> -			};
> -
> -			rpmhpd_opp_nom_l2: opp8 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> -			};
> -
> -			rpmhpd_opp_turbo: opp9 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> -			};
> -
> -			rpmhpd_opp_turbo_l1: opp10 {
> -				opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> -			};
> -		};
> -	};
> -
> -Example: rpm power domain controller and OPP table
> -
> -	rpmpd: power-controller {
> -		compatible = "qcom,msm8996-rpmpd";
> -		#power-domain-cells = <1>;
> -		operating-points-v2 = <&rpmpd_opp_table>;
> -
> -		rpmpd_opp_table: opp-table {
> -			compatible = "operating-points-v2";
> -
> -			rpmpd_opp_low: opp1 {
> -				opp-level = <1>;
> -			};
> -
> -			rpmpd_opp_ret: opp2 {
> -				opp-level = <2>;
> -			};
> -
> -			rpmpd_opp_svs: opp3 {
> -				opp-level = <3>;
> -			};
> -
> -			rpmpd_opp_normal: opp4 {
> -				opp-level = <4>;
> -			};
> -
> -			rpmpd_opp_high: opp5 {
> -				opp-level = <5>;
> -			};
> -
> -			rpmpd_opp_turbo: opp6 {
> -				opp-level = <6>;
> -			};
> -		};
> -	};
> -
> -Example: Client/Consumer device using OPP table
> -
> -	leaky-device0@12350000 {
> -		compatible = "foo,i-leak-current";
> -		reg = <0x12350000 0x1000>;
> -		power-domains = <&rpmhpd SDM845_MX>;
> -		operating-points-v2 = <&leaky_opp_table>;
> -	};
> -
> -
> -	leaky_opp_table: opp-table {
> -		compatible = "operating-points-v2";
> -
> -		opp1 {
> -			opp-hz = /bits/ 64 <144000>;
> -			required-opps = <&rpmhpd_opp_low>;
> -		};
> -
> -		opp2 {
> -			opp-hz = /bits/ 64 <400000>;
> -			required-opps = <&rpmhpd_opp_ret>;
> -		};
> -
> -		opp3 {
> -			opp-hz = /bits/ 64 <20000000>;
> -			required-opps = <&rpmpd_opp_svs>;
> -		};
> -
> -		opp4 {
> -			opp-hz = /bits/ 64 <25000000>;
> -			required-opps = <&rpmpd_opp_normal>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> new file mode 100644
> index 0000000000000..4aebf024e4427
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/qcom,rpmpd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm RPM/RPMh Power domains
> +
> +maintainers:
> +  - Rajendra Nayak <rnayak@codeaurora.org>
> +
> +description:
> +  For RPM/RPMh Power domains, we communicate a performance state to RPM/RPMh
> +  which then translates it into a corresponding voltage on a rail
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8976-rpmpd
> +      - qcom,msm8996-rpmpd
> +      - qcom,msm8998-rpmpd
> +      - qcom,qcs404-rpmpd
> +      - qcom,sc7180-rpmhpd
> +      - qcom,sdm845-rpmhpd
> +      - qcom,sm8150-rpmhpd
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - '#power-domain-cells'
> +  - operating-points-v2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    // Example 1 (rpmh power domain controller and OPP table):
> +
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    rpmhpd: power-controller {
> +      compatible = "qcom,sdm845-rpmhpd";
> +      #power-domain-cells = <1>;
> +      operating-points-v2 = <&rpmhpd_opp_table>;
> +
> +      rpmhpd_opp_table: opp-table {
> +        compatible = "operating-points-v2";
> +
> +        rpmhpd_opp_ret: opp1 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +        };
> +
> +        rpmhpd_opp_min_svs: opp2 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +        };
> +
> +        rpmhpd_opp_low_svs: opp3 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +        };
> +
> +        rpmhpd_opp_svs: opp4 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +        };
> +
> +        rpmhpd_opp_svs_l1: opp5 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +        };
> +
> +        rpmhpd_opp_nom: opp6 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +        };
> +
> +        rpmhpd_opp_nom_l1: opp7 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +        };
> +
> +        rpmhpd_opp_nom_l2: opp8 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +        };
> +
> +        rpmhpd_opp_turbo: opp9 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +        };
> +
> +        rpmhpd_opp_turbo_l1: opp10 {
> +          opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +        };
> +      };
> +    };
> +
> +  - |
> +
> +    // Example 2 (rpm power domain controller and OPP table):
> +
> +    rpmpd: power-controller {
> +      compatible = "qcom,msm8996-rpmpd";
> +      #power-domain-cells = <1>;
> +      operating-points-v2 = <&rpmpd_opp_table>;
> +
> +      rpmpd_opp_table: opp-table {
> +        compatible = "operating-points-v2";
> +
> +        rpmpd_opp_low: opp1 {
> +          opp-level = <1>;
> +        };
> +
> +        rpmpd_opp_ret: opp2 {
> +          opp-level = <2>;
> +        };
> +
> +        rpmpd_opp_svs: opp3 {
> +          opp-level = <3>;
> +        };
> +
> +        rpmpd_opp_normal: opp4 {
> +          opp-level = <4>;
> +        };
> +
> +        rpmpd_opp_high: opp5 {
> +          opp-level = <5>;
> +        };
> +
> +        rpmpd_opp_turbo: opp6 {
> +          opp-level = <6>;
> +        };
> +      };
> +    };
> +
> +  - |
> +
> +    // Example 3 (Client/Consumer device using OPP table):
> +
> +    leaky-device0@12350000 {
> +      compatible = "foo,i-leak-current";
> +      reg = <0x12350000 0x1000>;
> +      power-domains = <&rpmhpd 0>;
> +      operating-points-v2 = <&leaky_opp_table>;
> +    };
> +
> +    leaky_opp_table: opp-table {
> +      compatible = "operating-points-v2";
> +      opp1 {
> +        opp-hz = /bits/ 64 <144000>;
> +        required-opps = <&rpmhpd_opp_low>;
> +      };
> +
> +      opp2 {
> +        opp-hz = /bits/ 64 <400000>;
> +        required-opps = <&rpmhpd_opp_ret>;
> +      };
> +
> +      opp3 {
> +        opp-hz = /bits/ 64 <20000000>;
> +        required-opps = <&rpmpd_opp_svs>;
> +      };
> +
> +      opp4 {
> +        opp-hz = /bits/ 64 <25000000>;
> +        required-opps = <&rpmpd_opp_normal>;
> +      };
> +    };
> +...
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

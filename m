Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D964510325C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 04:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfKTD51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 22:57:27 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:39184
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727415AbfKTD51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 22:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574222246;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=gDQrkxYdhaQrXtYZ+YfyZ0Ap5iE+tn8emqrpCUVKd/Q=;
        b=cdWj/x/sU23SZ76rwWqwN7G7m9WyB69HjYKagZ7v/+MpNDsGQtgB0CRTRY2VKVII
        B1S1YugMDfYL6GtvXJymgSYH2dFFpsVY1jcjZuLjuOfNhkQ6AaKtcS4rblTHBUpZ2AO
        vkhpGd6hWSQZRGCGapsoeXoabQGRCEchLlCImzgE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574222246;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=gDQrkxYdhaQrXtYZ+YfyZ0Ap5iE+tn8emqrpCUVKd/Q=;
        b=WZYmQL+Dvk9wKzOQCv7vD3GMF9ruIGT+uKgbQaCK+Ff59mk2fHeEwFtLLTfo9LY7
        7VC90ZqfVaoihpdKbVUjpfRrCLmnnLfnjAjssycVmdhg18gcB+vyWO5CAwL8VNmEBpT
        Eagha8AYh7zBzSOd4oM41zaxwyV4OILHH7GVCZc8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6A81C447A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/6] dt-bindings: power: Add rpmh power-domain bindings
 for SM8150
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99a91d-6632f420-b2f2-4b71-9c97-a3974fcb8fa9-000000@us-west-2.amazonses.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016e86f531d4-89c752f8-a9af-43fe-94b3-44121a1e057e-000000@us-west-2.amazonses.com>
Date:   Wed, 20 Nov 2019 03:57:26 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0101016e7f99a91d-6632f420-b2f2-4b71-9c97-a3974fcb8fa9-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.20-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/18/2019 11:10 PM, Sibi Sankar wrote:
> Add RPMH power-domain bindings for the SM8150 family of SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>   .../devicetree/bindings/power/qcom,rpmpd.txt       |  1 +
>   include/dt-bindings/power/qcom-rpmpd.h             | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> index bc75bf49cdaea..f3bbaa4aef297 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -10,6 +10,7 @@ Required Properties:
>   	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
>   	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
>   	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
> +	* qcom,sm8150-rpmhpd: RPMh Power domain for the sm8150 family of SoC
>    - #power-domain-cells: number of cells in Power domain specifier
>   	must be 1.
>    - operating-points-v2: Phandle to the OPP table for the Power domain.
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index f05f8b1808ec9..7d43bafc0026b 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -15,12 +15,26 @@
>   #define SDM845_GFX	7
>   #define SDM845_MSS	8
>   
> +/* SM8150 Power Domain Indexes */
> +#define SM8150_MSS	0
> +#define SM8150_EBI	1
> +#define SM8150_LMX	2
> +#define SM8150_LCX	3
> +#define SM8150_GFX	4
> +#define SM8150_MX	5
> +#define SM8150_MX_AO	6
> +#define SM8150_CX	7
> +#define SM8150_CX_AO	8
> +#define SM8150_MMCX	9
> +#define SM8150_MMCX_AO	10
> +
>   /* SDM845 Power Domain performance levels */

You could perhaps remove this comment, or remove the
SDM845 from it.

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   #define RPMH_REGULATOR_LEVEL_RETENTION	16
>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>   #define RPMH_REGULATOR_LEVEL_SVS	128
>   #define RPMH_REGULATOR_LEVEL_SVS_L1	192
> +#define RPMH_REGULATOR_LEVEL_SVS_L2	224
>   #define RPMH_REGULATOR_LEVEL_NOM	256
>   #define RPMH_REGULATOR_LEVEL_NOM_L1	320
>   #define RPMH_REGULATOR_LEVEL_NOM_L2	336
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

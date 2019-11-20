Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46BF103270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 05:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfKTEKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 23:10:20 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:45404
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727264AbfKTEKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 23:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574223019;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=1hBvSBPS247BMseE/4jYnIs2R+dBBvuuuU6qqBCAS1o=;
        b=fJH82JNjBT0dBxyhXfANm7YTcB6ISgfHy0jz7mfjZuyGgKCrNZ7dKUW3pYyu8jvj
        DBQEE/tIuULag9jW57azNJQSLLNjZTfFTg742BfzZaum7U3Gn3+9jNfC2c2g8feSmqb
        lLRDp3CbLSo6HuV+y8Sily+ILKQyN2yc4tXNiKJk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574223019;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=1hBvSBPS247BMseE/4jYnIs2R+dBBvuuuU6qqBCAS1o=;
        b=BZMBLxFwW7KLaz/S2oAt1K0MkhE4Z7l/gvylaEwlOAFH5VAzBlT927+UU1pSD2B2
        YVS9j+Miv1OnwEPjEAu7IZNJkiHEkxyXx32TQrEIZHrKxySolx3qX4kDOnMw5nHcgPC
        LNXv2ZhxKSJmnc1psQoKWku/6MQY9gFdt3QkCep8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5122C447A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 4/6] dt-bindings: power: Add rpmh power-domain bindings
 for sc7180
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <20191118173944.27043-5-sibis@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016e8700fbc6-26e71133-00a4-451c-ab3e-236f2431b3d2-000000@us-west-2.amazonses.com>
Date:   Wed, 20 Nov 2019 04:10:18 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118173944.27043-5-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.20-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/2019 11:09 PM, Sibi Sankar wrote:
> Add RPMH power-domain bindings for the SC7180 family of SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   Documentation/devicetree/bindings/power/qcom,rpmpd.txt |  1 +
>   include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> index f3bbaa4aef297..6346d00b1b400 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -9,6 +9,7 @@ Required Properties:
>   	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
>   	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
>   	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
> +	* qcom,sc7180-rpmhpd: RPMh Power domain for the sc7180 family of SoC
>   	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
>   	* qcom,sm8150-rpmhpd: RPMh Power domain for the sm8150 family of SoC
>    - #power-domain-cells: number of cells in Power domain specifier
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 7d43bafc0026b..3f74096d5a7ca 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -28,6 +28,16 @@
>   #define SM8150_MMCX	9
>   #define SM8150_MMCX_AO	10
>   
> +/* SC7180 Power Domain Indexes */
> +#define SC7180_CX	0
> +#define SC7180_CX_AO	1
> +#define SC7180_GFX	2
> +#define SC7180_MX	3
> +#define SC7180_MX_AO	4
> +#define SC7180_LMX	5
> +#define SC7180_LCX	6
> +#define SC7180_MSS	7
> +
>   /* SDM845 Power Domain performance levels */
>   #define RPMH_REGULATOR_LEVEL_RETENTION	16
>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

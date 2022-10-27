Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C9360EE52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 05:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbiJ0DJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 23:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbiJ0DJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 23:09:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497B014BB63;
        Wed, 26 Oct 2022 20:09:23 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R1ng35019694;
        Thu, 27 Oct 2022 03:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=29PekpXeIHVds/WgBHKIbRhXolGuh2m/Lg9bD7NsUNY=;
 b=lmxpWQoG3/iMfYrWe6EJep0OhOncSgdVDeV3gB2H0vnXe6KeFg7mEXBPS++1g6bwg0Rc
 N/7R6sEqVfiNI74JrxN7g8CpiHdEqLTNF5h9ej0ZG88J0y+2HnrBOs+U9MfAAX2AeuB7
 lzBU4erqJQ7nBzISNpAGldA4zUHx6cIDgg98YniGBT1fejpM+AZ3nRpvs6vt0JXIT2Yj
 3VkLhMNXULwbQI7gtsfi2BcAhPI4W4f+LQ9+gh5h7NsPL/zZvNXOLSI9vKIPFQRXm0Rg
 31aQsDrvcC+U21sHBKLt8U0B+l0rL+rGubEdP77F9KiKttpSih9SZ78CZrnikAv9w5bd Lg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfahb98n2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:08:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29R38wd7029670
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:08:58 GMT
Received: from [10.50.1.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 26 Oct
 2022 20:08:54 -0700
Message-ID: <86da0a31-a2d4-23c6-0f00-a0a281692f96@quicinc.com>
Date:   Thu, 27 Oct 2022 08:38:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 7/9] iommu/arm-smmu-qcom: Merge table from
 arm-smmu-qcom-debug into match data
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
CC:     Vinod Koul <vkoul@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-8-dmitry.baryshkov@linaro.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20221021165534.2334329-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yIM02Q2HUgAbvotpUoR705A5zMgvD-Vy
X-Proofpoint-ORIG-GUID: yIM02Q2HUgAbvotpUoR705A5zMgvD-Vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_10,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270016
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/21/2022 10:25 PM, Dmitry Baryshkov wrote:
> There is little point in having a separate match table in
> arm-smmu-qcom-debug.c. Merge it into the main match data table in
> arm-smmu-qcom.c
> 
> Note, this also enables debug support for sm6375 and ACPI-based sc8180x
> systems, since these SoCs are expected to support tlb_sync debug.
> 

Nice cleanup,

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 91 -------------------
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 46 +++++++---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    | 16 +++-
>   3 files changed, 43 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 6eed8e67a0ca..74e9ef2fd580 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -10,16 +10,6 @@
>   #include "arm-smmu.h"
>   #include "arm-smmu-qcom.h"
>   
> -enum qcom_smmu_impl_reg_offset {
> -	QCOM_SMMU_TBU_PWR_STATUS,
> -	QCOM_SMMU_STATS_SYNC_INV_TBU_ACK,
> -	QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
> -};
> -
> -struct qcom_smmu_config {
> -	const u32 *reg_offset;
> -};
> -
>   void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
>   {
>   	int ret;
> @@ -59,84 +49,3 @@ void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
>   			tbu_pwr_status, sync_inv_ack, sync_inv_progress);
>   	}
>   }
> -
> -/* Implementation Defined Register Space 0 register offsets */
> -static const u32 qcom_smmu_impl0_reg_offset[] = {
> -	[QCOM_SMMU_TBU_PWR_STATUS]		= 0x2204,
> -	[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK]	= 0x25dc,
> -	[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR]	= 0x2670,
> -};
> -
> -static const struct qcom_smmu_config qcm2290_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sc7180_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sc7280_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sc8180x_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sc8280xp_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sm6125_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sm6350_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sm8150_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sm8250_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sm8350_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct qcom_smmu_config sm8450_smmu_cfg = {
> -	.reg_offset = qcom_smmu_impl0_reg_offset,
> -};
> -
> -static const struct of_device_id __maybe_unused qcom_smmu_impl_debug_match[] = {
> -	{ .compatible = "qcom,msm8998-smmu-v2" },
> -	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcm2290_smmu_cfg },
> -	{ .compatible = "qcom,sc7180-smmu-500", .data = &sc7180_smmu_cfg },
> -	{ .compatible = "qcom,sc7280-smmu-500", .data = &sc7280_smmu_cfg},
> -	{ .compatible = "qcom,sc8180x-smmu-500", .data = &sc8180x_smmu_cfg },
> -	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &sc8280xp_smmu_cfg },
> -	{ .compatible = "qcom,sdm630-smmu-v2" },
> -	{ .compatible = "qcom,sdm845-smmu-500" },
> -	{ .compatible = "qcom,sm6125-smmu-500", .data = &sm6125_smmu_cfg},
> -	{ .compatible = "qcom,sm6350-smmu-500", .data = &sm6350_smmu_cfg},
> -	{ .compatible = "qcom,sm8150-smmu-500", .data = &sm8150_smmu_cfg },
> -	{ .compatible = "qcom,sm8250-smmu-500", .data = &sm8250_smmu_cfg },
> -	{ .compatible = "qcom,sm8350-smmu-500", .data = &sm8350_smmu_cfg },
> -	{ .compatible = "qcom,sm8450-smmu-500", .data = &sm8450_smmu_cfg },
> -	{ }
> -};
> -
> -const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu)
> -{
> -	const struct of_device_id *match;
> -	const struct device_node *np = smmu->dev->of_node;
> -
> -	match = of_match_node(qcom_smmu_impl_debug_match, np);
> -	if (!match)
> -		return NULL;
> -
> -	return match->data;
> -}
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 75bc770ccf8c..20cbb39cb670 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -430,11 +430,22 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>   		return ERR_PTR(-ENOMEM);
>   
>   	qsmmu->smmu.impl = impl;
> -	qsmmu->cfg = qcom_smmu_impl_data(smmu);
> +	qsmmu->cfg = data->cfg;
>   
>   	return &qsmmu->smmu;
>   }
>   
> +/* Implementation Defined Register Space 0 register offsets */
> +static const u32 qcom_smmu_impl0_reg_offset[] = {
> +	[QCOM_SMMU_TBU_PWR_STATUS]		= 0x2204,
> +	[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK]	= 0x25dc,
> +	[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR]	= 0x2670,
> +};
> +
> +static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
>   /*
>    * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
>    * there are not enough context banks.
> @@ -452,26 +463,33 @@ static const struct qcom_smmu_match_data qcom_smmu_data = {
>   static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>   	.impl = &sdm845_smmu_500_impl,
>   	/* No adreno impl, on sdm845 it is handled by separete sdm845-smmu-v2. */
> +	/* No debug configuration */
> +};
> +
> +static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
> +	.impl = &qcom_smmu_impl,
> +	.adreno_impl = &qcom_adreno_smmu_impl,
> +	.cfg = &qcom_smmu_impl0_cfg,
>   };
>   
>   static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>   	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
> -	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ }
>   };
>   
> @@ -492,7 +510,7 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (np == NULL) {
>   		/* Match platform for ACPI boot */
>   		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
> -			return qcom_smmu_create(smmu, &qcom_smmu_data);
> +			return qcom_smmu_create(smmu, &qcom_smmu_500_impl0_data);
>   	}
>   #endif
>   
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 424d8d342ce0..593910567b88 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -14,20 +14,26 @@ struct qcom_smmu {
>   	u32 stall_enabled;
>   };
>   
> +enum qcom_smmu_impl_reg_offset {
> +	QCOM_SMMU_TBU_PWR_STATUS,
> +	QCOM_SMMU_STATS_SYNC_INV_TBU_ACK,
> +	QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
> +};
> +
> +struct qcom_smmu_config {
> +	const u32 *reg_offset;
> +};
> +
>   struct qcom_smmu_match_data {
> +	const struct qcom_smmu_config *cfg;
>   	const struct arm_smmu_impl *impl;
>   	const struct arm_smmu_impl *adreno_impl;
>   };
>   
>   #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
>   void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
> -const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu);
>   #else
>   static inline void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu) { }
> -static inline const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu)
> -{
> -	return NULL;
> -}
>   #endif
>   
>   #endif /* _ARM_SMMU_QCOM_H */


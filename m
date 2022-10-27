Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FD460EE56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 05:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiJ0DKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 23:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ0DKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 23:10:51 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A549B8A1D3;
        Wed, 26 Oct 2022 20:10:49 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R1l3De023264;
        Thu, 27 Oct 2022 03:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ba7ZvFxHFhPF6dsG0WyS+0JVCGwrTLsw1fjHVZac+6M=;
 b=LdMiSqy5PprmaJeVv/yo48SRg3GbMzcJ7+sRuy4sjsRgV458QaftieL57pfyc397ESSC
 0iWKje3K1RsvQkymoS/oCdIgiL3yRBPg7e7X8b+gGxQcpv1teMLZ1y9bXzeH0NoWSAYz
 0Zu60VviQJKmfsuV1xDandf6hT8wnKKIK3AzPUmHG+4eHIjjM7WMetNSls4cuCl94yAf
 6dS5wDz5uZ5lEESWosB/Rjct2S+E1Jyp032lvpxRYP8Tzlmmxu7HIG0gwfId79cmcI0D
 xLPJ8RZvU5wwm3CAYFMmJCuQV2k67Epq7ToEhb6pWDeAewDeaPyRoXOfE+Syp05Kn27t hQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfah5s95x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:10:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29R3AVOB012837
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:10:31 GMT
Received: from [10.50.1.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 26 Oct
 2022 20:10:27 -0700
Message-ID: <73eee2ed-f8ee-f136-2853-34b27c099644@quicinc.com>
Date:   Thu, 27 Oct 2022 08:40:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 4/9] iommu/arm-smmu-qcom: Move implementation data
 into match data
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
 <20221021165534.2334329-5-dmitry.baryshkov@linaro.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20221021165534.2334329-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b4JtYU-YBzp3-5zBHMq90SQCIHRQmW_P
X-Proofpoint-GUID: b4JtYU-YBzp3-5zBHMq90SQCIHRQmW_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_10,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> In preparation to rework of the implementation and configuration
> details, make qcom_smmu_create() accept new qcom_smmu_match_data
> structure pointer. Make implementation a field in this struct.
> 

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 ++++++++++++++--------
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 ++
>   2 files changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index b2708de25ea3..bd228b7d6817 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -405,10 +405,18 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>   };
>   
>   static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
> -		const struct arm_smmu_impl *impl)
> +		const struct qcom_smmu_match_data *data)
>   {
> +	const struct arm_smmu_impl *impl;
>   	struct qcom_smmu *qsmmu;
>   
> +	if (!data)
> +		return ERR_PTR(-EINVAL);
> +
> +	impl = data->impl;
> +	if (!impl)
> +		return smmu;
> +
>   	/* Check to make sure qcom_scm has finished probing */
>   	if (!qcom_scm_is_available())
>   		return ERR_PTR(-EPROBE_DEFER);
> @@ -423,22 +431,30 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>   	return &qsmmu->smmu;
>   }
>   
> +static const struct qcom_smmu_match_data qcom_smmu_data = {
> +	.impl = &qcom_smmu_impl,
> +};
> +
> +static const struct qcom_smmu_match_data qcom_adreno_smmu_data = {
> +	.impl = &qcom_adreno_smmu_impl,
> +};
> +
>   static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> -	{ .compatible = "qcom,msm8998-smmu-v2" },
> -	{ .compatible = "qcom,qcm2290-smmu-500" },
> -	{ .compatible = "qcom,sc7180-smmu-500" },
> -	{ .compatible = "qcom,sc7280-smmu-500" },
> -	{ .compatible = "qcom,sc8180x-smmu-500" },
> -	{ .compatible = "qcom,sc8280xp-smmu-500" },
> -	{ .compatible = "qcom,sdm630-smmu-v2" },
> -	{ .compatible = "qcom,sdm845-smmu-500" },
> -	{ .compatible = "qcom,sm6125-smmu-500" },
> -	{ .compatible = "qcom,sm6350-smmu-500" },
> -	{ .compatible = "qcom,sm6375-smmu-500" },
> -	{ .compatible = "qcom,sm8150-smmu-500" },
> -	{ .compatible = "qcom,sm8250-smmu-500" },
> -	{ .compatible = "qcom,sm8350-smmu-500" },
> -	{ .compatible = "qcom,sm8450-smmu-500" },
> +	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
>   	{ }
>   };
>   
> @@ -453,12 +469,13 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
>   struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
>   	const struct device_node *np = smmu->dev->of_node;
> +	const struct of_device_id *match;
>   
>   #ifdef CONFIG_ACPI
>   	if (np == NULL) {
>   		/* Match platform for ACPI boot */
>   		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
> -			return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +			return qcom_smmu_create(smmu, &qcom_smmu_data);
>   	}
>   #endif
>   
> @@ -469,10 +486,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   	 * features if the order is changed.
>   	 */
>   	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
> -		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
> +		return qcom_smmu_create(smmu, &qcom_adreno_smmu_data);
>   
> -	if (of_match_node(qcom_smmu_impl_of_match, np))
> -		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +	match = of_match_node(qcom_smmu_impl_of_match, np);
> +	if (match)
> +		return qcom_smmu_create(smmu, match->data);
>   
>   	return smmu;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 99ec8f8629a0..2424f10b7110 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -14,6 +14,10 @@ struct qcom_smmu {
>   	u32 stall_enabled;
>   };
>   
> +struct qcom_smmu_match_data {
> +	const struct arm_smmu_impl *impl;
> +};
> +
>   #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
>   void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
>   const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu);


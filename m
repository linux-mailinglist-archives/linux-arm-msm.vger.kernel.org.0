Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF5060EE5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 05:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbiJ0DL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 23:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbiJ0DL1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 23:11:27 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12449CF184;
        Wed, 26 Oct 2022 20:11:26 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R1cfrT028640;
        Thu, 27 Oct 2022 03:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wf/HzY/6d5jxYO8V+1Nm8ZnvhLviV4/TDJYeCCdHqDo=;
 b=np2JJWjX2drHWT5MQwI5Ef2DlpW1R8Up4SFdS5nDP11WsPf/uF/vgDqs8h+dsxAx/Lha
 XjdxRD6mpMartoBMK5cqZijc54uLuB6cVQuVs3uDuQF+Yvp87jwsxHn9a1u6Jb+hK6B4
 8ZTxzmN804HwDrIj6VbVTfgWxaN+TMArepupbymqaJLIO5JKBwacwqle3XjMYAJsBDTp
 MhvvxFDZoph5kk+SyBvFV3FfCsrezYjGGuL+8oJL3OHnyL8VJzAYfA+Y44DP4e4ALXzK
 LM5Cc3X2U+/loEPjLIKv/1NMvaRCwwxY0tndA0HzoGPDshlSjrOdIUAyK1YVFd052qcf dQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfahb98sd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:11:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29R3B9LL013927
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:11:09 GMT
Received: from [10.50.1.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 26 Oct
 2022 20:11:05 -0700
Message-ID: <15dd5490-ce54-184c-bb5e-8bdb9be5138a@quicinc.com>
Date:   Thu, 27 Oct 2022 08:41:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 5/9] iommu/arm-smmu-qcom: Move the qcom,adreno-smmu
 check into qcom_smmu_create
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
 <20221021165534.2334329-6-dmitry.baryshkov@linaro.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20221021165534.2334329-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZNq4Y77Ljr9T9m4PoEP5zu2z_es9xHb7
X-Proofpoint-ORIG-GUID: ZNq4Y77Ljr9T9m4PoEP5zu2z_es9xHb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_10,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
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
> Move special handling of qcom,adreno-smmu into qcom_smmu_create()
> function. This allows us to further customize the Adreno SMMU
> implementation.
> 
> Note, this also adds two entries to the qcom_smmu_impl_of_match table.
> They were used with the qcom,adreno-smmu compat and were handled by the
> removed clause.
> 

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 32 ++++++++++++----------
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>   2 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index bd228b7d6817..c3bcd6eb2f42 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -407,13 +407,18 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>   static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>   		const struct qcom_smmu_match_data *data)
>   {
> +	const struct device_node *np = smmu->dev->of_node;
>   	const struct arm_smmu_impl *impl;
>   	struct qcom_smmu *qsmmu;
>   
>   	if (!data)
>   		return ERR_PTR(-EINVAL);
>   
> -	impl = data->impl;
> +	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
> +		impl = data->adreno_impl;
> +	else
> +		impl = data->impl;
> +
>   	if (!impl)
>   		return smmu;
>   
> @@ -431,15 +436,22 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>   	return &qsmmu->smmu;
>   }
>   
> -static const struct qcom_smmu_match_data qcom_smmu_data = {
> -	.impl = &qcom_smmu_impl,
> +/*
> + * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
> + * there are not enough context banks.
> + */
> +static const struct qcom_smmu_match_data msm8996_smmu_data = {
> +	.impl = NULL,
> +	.adreno_impl = &qcom_adreno_smmu_impl,
>   };
>   
> -static const struct qcom_smmu_match_data qcom_adreno_smmu_data = {
> -	.impl = &qcom_adreno_smmu_impl,
> +static const struct qcom_smmu_match_data qcom_smmu_data = {
> +	.impl = &qcom_smmu_impl,
> +	.adreno_impl = &qcom_adreno_smmu_impl,
>   };
>   
>   static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> +	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>   	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
> @@ -447,6 +459,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
> @@ -479,15 +492,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   	}
>   #endif
>   
> -	/*
> -	 * Do not change this order of implementation, i.e., first adreno
> -	 * smmu impl and then apss smmu since we can have both implementing
> -	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
> -	 * features if the order is changed.
> -	 */
> -	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
> -		return qcom_smmu_create(smmu, &qcom_adreno_smmu_data);
> -
>   	match = of_match_node(qcom_smmu_impl_of_match, np);
>   	if (match)
>   		return qcom_smmu_create(smmu, match->data);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 2424f10b7110..424d8d342ce0 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -16,6 +16,7 @@ struct qcom_smmu {
>   
>   struct qcom_smmu_match_data {
>   	const struct arm_smmu_impl *impl;
> +	const struct arm_smmu_impl *adreno_impl;
>   };
>   
>   #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG


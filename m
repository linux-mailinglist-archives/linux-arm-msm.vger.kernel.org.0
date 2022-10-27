Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB0960EE68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 05:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbiJ0DOC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 23:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbiJ0DOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 23:14:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA2E14BB79;
        Wed, 26 Oct 2022 20:13:58 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R1SC0L030742;
        Thu, 27 Oct 2022 03:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wUAGQKDtG9OgDD3VK7GRbroANLj1jQ2VAwesJFG/05U=;
 b=Jl/umH/XmxRHWZlJIVG/6LBB5Bs3DwUrmtitLFXXWBtzGsGGHltUxxD01/R4pshpq1BL
 yyGh6oQZRWOjKuuoR3U0Ige2uCRzLW+eLfVB2W/ER0lPxNOAjTAjtbanekb0TqKlXYa5
 44OpAY3mVooC94gER/kSVsM+6bYTvJGWim8awdg4RruTHFN4RBiMdG6hCs7zm+tzP8Wl
 dIefm9Q9RSLcs3cO7VOQKn91LF8bYDlxwi5JDGhFyOUdlA0MzATg2DPCUjGoUv6GD3ur
 sOUiMbRJieaGWxVuobPGTpQbDjGX2f7eifr8YKS369Kqrv/d/2Cq5Ts/maoQJ61fmKPZ Og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfahw8x94-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:13:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29R3DgBe017569
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:13:42 GMT
Received: from [10.50.1.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 26 Oct
 2022 20:13:37 -0700
Message-ID: <4d8c1b0e-4628-227c-ec32-ca059e00952d@quicinc.com>
Date:   Thu, 27 Oct 2022 08:43:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 8/9] iommu/arm-smmu-qcom: Stop using mmu500 reset for
 v2 MMUs
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
 <20221021165534.2334329-9-dmitry.baryshkov@linaro.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20221021165534.2334329-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V_eVUG5v8Sd8-23B1RD5Bf9Y2B7T6rMI
X-Proofpoint-ORIG-GUID: V_eVUG5v8Sd8-23B1RD5Bf9Y2B7T6rMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_10,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270016
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/21/2022 10:25 PM, Dmitry Baryshkov wrote:
> The arm_mmu500_reset() writes into registers specific for MMU500. For
> the generic ARM SMMU v2 these registers (sACR) are defined as
> 'implementation defined'. Downstream Qualcomm driver for SMMUv2 doesn't
> touch them.
> 

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 41 ++++++++++++++++------
>   1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 20cbb39cb670..9abc40c00f3e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -376,7 +376,15 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>   	return ret;
>   }
>   
> -static const struct arm_smmu_impl qcom_smmu_impl = {
> +static const struct arm_smmu_impl qcom_smmu_v2_impl = {
> +	.init_context = qcom_smmu_init_context,
> +	.cfg_probe = qcom_smmu_cfg_probe,
> +	.def_domain_type = qcom_smmu_def_domain_type,
> +	.write_s2cr = qcom_smmu_write_s2cr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
> +};
> +
> +static const struct arm_smmu_impl qcom_smmu_500_impl = {
>   	.init_context = qcom_smmu_init_context,
>   	.cfg_probe = qcom_smmu_cfg_probe,
>   	.def_domain_type = qcom_smmu_def_domain_type,
> @@ -394,7 +402,15 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
>   	.tlb_sync = qcom_smmu_tlb_sync,
>   };
>   
> -static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> +static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
> +	.init_context = qcom_adreno_smmu_init_context,
> +	.def_domain_type = qcom_smmu_def_domain_type,
> +	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> +	.write_sctlr = qcom_adreno_smmu_write_sctlr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
> +};
> +
> +static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>   	.init_context = qcom_adreno_smmu_init_context,
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = arm_mmu500_reset,
> @@ -452,12 +468,17 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
>    */
>   static const struct qcom_smmu_match_data msm8996_smmu_data = {
>   	.impl = NULL,
> -	.adreno_impl = &qcom_adreno_smmu_impl,
> +	.adreno_impl = &qcom_adreno_smmu_v2_impl,
> +};
> +
> +static const struct qcom_smmu_match_data qcom_smmu_v2_data = {
> +	.impl = &qcom_smmu_v2_impl,
> +	.adreno_impl = &qcom_adreno_smmu_v2_impl,
>   };
>   
>   static const struct qcom_smmu_match_data qcom_smmu_data = {
> -	.impl = &qcom_smmu_impl,
> -	.adreno_impl = &qcom_adreno_smmu_impl,
> +	.impl = &qcom_smmu_500_impl,
> +	.adreno_impl = &qcom_adreno_smmu_500_impl,
>   };
>   
>   static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
> @@ -467,21 +488,21 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>   };
>   
>   static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
> -	.impl = &qcom_smmu_impl,
> -	.adreno_impl = &qcom_adreno_smmu_impl,
> +	.impl = &qcom_smmu_500_impl,
> +	.adreno_impl = &qcom_adreno_smmu_500_impl,
>   	.cfg = &qcom_smmu_impl0_cfg,
>   };
>   
>   static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
> -	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
>   	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
> -	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
> +	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
>   	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>   	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
>   	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },


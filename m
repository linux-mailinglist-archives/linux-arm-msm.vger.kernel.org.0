Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920B160EE60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 05:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbiJ0DMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 23:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbiJ0DMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 23:12:34 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47A413C3C7;
        Wed, 26 Oct 2022 20:12:33 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R1o4Kt031246;
        Thu, 27 Oct 2022 03:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=772wC/n7cjjCPSMUAR9JBsBCZzYeVjcs/DkonX3QGCw=;
 b=NEvobjRxqg/T4r9B9SPJzUOMuWtgTZr/u6GBUV1j2uawP3lZshTbRWGZabQh+x5sq6Rk
 ZT9SbEthdpdKQB65vBzgdgBlf9HpT28N17u7OQ2DKA8zJrxbsCyqdOtfdqnd9DSjgByS
 ERTP22ruk2ZvXXSAckh6dkh5FRQpfq0xtJ4CWf6oyirG/5B7B/Qizb36EGKsNEfJ2z3t
 lMjt8RuZaGeCl/FNvLTMJqwaHq4yG8z3JKoFnkIX+7rB71XZnW+UKlbM+D8KZRAInxgY
 w3mkQ3z4anK/UYHMI3ZdgpjyAYmOtZbmg8PrIUYJDeKLS6oEgPHm71dCyHxuYsViXWfq 4w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfah5s99x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:12:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29R3CH6q016833
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 03:12:17 GMT
Received: from [10.50.1.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 26 Oct
 2022 20:12:12 -0700
Message-ID: <6953d342-c86f-afd4-fd77-3fb9589dd90d@quicinc.com>
Date:   Thu, 27 Oct 2022 08:42:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 6/9] iommu/arm-smmu-qcom: provide separate
 implementation for SDM845-smmu-500
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
 <20221021165534.2334329-7-dmitry.baryshkov@linaro.org>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20221021165534.2334329-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vCof3Z_u6xc4m7ayxk2nsSUVbaNVyXV6
X-Proofpoint-GUID: vCof3Z_u6xc4m7ayxk2nsSUVbaNVyXV6
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
> There is only one platform, which needs special care in the reset
> function, the SDM845. Add special handler for sdm845 and drop the
> qcom_smmu500_reset() function.
>

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 34 ++++++++++++----------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c3bcd6eb2f42..75bc770ccf8c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -361,6 +361,8 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>   {
>   	int ret;
>   
> +	arm_mmu500_reset(smmu);
> +
>   	/*
>   	 * To address performance degradation in non-real time clients,
>   	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
> @@ -374,23 +376,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>   	return ret;
>   }
>   
> -static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> -{
> -	const struct device_node *np = smmu->dev->of_node;
> -
> -	arm_mmu500_reset(smmu);
> -
> -	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
> -		return qcom_sdm845_smmu500_reset(smmu);
> -
> -	return 0;
> -}
> -
>   static const struct arm_smmu_impl qcom_smmu_impl = {
>   	.init_context = qcom_smmu_init_context,
>   	.cfg_probe = qcom_smmu_cfg_probe,
>   	.def_domain_type = qcom_smmu_def_domain_type,
> -	.reset = qcom_smmu500_reset,
> +	.reset = arm_mmu500_reset,
> +	.write_s2cr = qcom_smmu_write_s2cr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
> +};
> +
> +static const struct arm_smmu_impl sdm845_smmu_500_impl = {
> +	.init_context = qcom_smmu_init_context,
> +	.cfg_probe = qcom_smmu_cfg_probe,
> +	.def_domain_type = qcom_smmu_def_domain_type,
> +	.reset = qcom_sdm845_smmu500_reset,
>   	.write_s2cr = qcom_smmu_write_s2cr,
>   	.tlb_sync = qcom_smmu_tlb_sync,
>   };
> @@ -398,7 +397,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>   static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>   	.init_context = qcom_adreno_smmu_init_context,
>   	.def_domain_type = qcom_smmu_def_domain_type,
> -	.reset = qcom_smmu500_reset,
> +	.reset = arm_mmu500_reset,
>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>   	.tlb_sync = qcom_smmu_tlb_sync,
> @@ -450,6 +449,11 @@ static const struct qcom_smmu_match_data qcom_smmu_data = {
>   	.adreno_impl = &qcom_adreno_smmu_impl,
>   };
>   
> +static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
> +	.impl = &sdm845_smmu_500_impl,
> +	/* No adreno impl, on sdm845 it is handled by separete sdm845-smmu-v2. */

Typo

> +};
> +
>   static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>   	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
> @@ -460,7 +464,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
> -	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
> +	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>   	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
>   	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },


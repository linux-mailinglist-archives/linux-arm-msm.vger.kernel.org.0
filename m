Return-Path: <linux-arm-msm+bounces-1294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797677F25D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 07:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6891C20BE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 06:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2B279C2;
	Tue, 21 Nov 2023 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S3x9+wa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E59C8;
	Mon, 20 Nov 2023 22:38:38 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL6JMFp007993;
	Tue, 21 Nov 2023 06:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z+YCvibVm8plErXJG0HascOzJXLQFGebjM+tlOVqG8E=;
 b=S3x9+wa2EBt0NDCDmPYjglSL0f/zk4Q6I8WM+6vP/XpvshqXKz79NdaQdiFsErXWyPyR
 H6AY8NzDxz/kjZH3Ih6b5xz2tIoE39Wo4SsTUyIaCpZAS/UU8PJd/G6+Q8EBQdi+9KHS
 nsPhAgj/ShzET+5Bmj8OHdfD5ToJP6p9oc02jEYR+WbUT2U4AFgdTM1y6wTQhmwzFU2W
 qD57MB7CP9Q74D3eY4vW1K+nNCZzne46jX9tFtQYWcOFFIDxYDFzKfKeaAIIewBVIPwp
 mPDz++5xeYx7E78WHXErmqDhERGL382UTx/O83U6iIzmQXvtaxkzEhUIf9AIycu5FRPt lg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugcqs19t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 06:38:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL6cTmW009932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 06:38:29 GMT
Received: from [10.110.10.93] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 22:38:21 -0800
Message-ID: <9315c8f1-19b8-9b11-8eb4-32b498f91659@quicinc.com>
Date: Mon, 20 Nov 2023 22:38:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RESEND PATCH v5 03/12] firmware: qcom: scm: smc: switch to using
 the SCM allocator
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh
	<quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        "Maximilian
 Luz" <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        "Srini
 Kandagatla" <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@quicinc.com>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
References: <20231120132118.30473-1-brgl@bgdev.pl>
 <20231120132118.30473-4-brgl@bgdev.pl>
From: Prasad Sodagudi <quic_psodagud@quicinc.com>
In-Reply-To: <20231120132118.30473-4-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2PSceWSW3rNft2sfjKVAi1vvPxTyBoKh
X-Proofpoint-GUID: 2PSceWSW3rNft2sfjKVAi1vvPxTyBoKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_03,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210050


On 11/20/2023 5:21 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We need to allocate, map and pass a buffer to the trustzone if we have
> more than 4 arguments for a given SCM calls. Let's use the new TrustZone
> allocator for that memory and shrink the code in process.
>
> As this code lives in a different compilation unit than the rest of the
> SCM code, we need to provide a helper in the form of
> qcom_scm_get_tzmem_pool() that allows the SMC low-level routines to
> access the SCM memory pool.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
> ---
>   drivers/firmware/qcom/qcom_scm-smc.c | 30 ++++++++--------------------
>   drivers/firmware/qcom/qcom_scm.c     |  5 +++++
>   drivers/firmware/qcom/qcom_scm.h     |  3 +++
>   3 files changed, 16 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> index 16cf88acfa8e..dca5f3f1883b 100644
> --- a/drivers/firmware/qcom/qcom_scm-smc.c
> +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> @@ -2,6 +2,7 @@
>   /* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/io.h>
>   #include <linux/errno.h>
>   #include <linux/delay.h>
> @@ -9,6 +10,7 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_tzmem.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/dma-mapping.h>
>   
> @@ -150,11 +152,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   		   enum qcom_scm_convention qcom_convention,
>   		   struct qcom_scm_res *res, bool atomic)
>   {
> +	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
>   	int arglen = desc->arginfo & 0xf;
>   	int i, ret;
> -	dma_addr_t args_phys = 0;
> -	void *args_virt = NULL;
> -	size_t alloc_len;
> +	void *args_virt __free(qcom_tzmem) = NULL;
>   	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
>   	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
>   	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
> @@ -172,9 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
>   
>   	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> -		alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
> -		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
> -
> +		args_virt = qcom_tzmem_alloc(mempool,
> +					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
> +					     flag);

I remember seeing page alignment for this memory allocation in 
downstream code too.

I think, after moving to qcom_tzmem_alloc page alignment is not 
followed. Is this cross checked with firmware requirements?

>   		if (!args_virt)
>   			return -ENOMEM;
>   
> @@ -192,25 +193,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>   						      SCM_SMC_FIRST_EXT_IDX]);
>   		}
>   
> -		args_phys = dma_map_single(dev, args_virt, alloc_len,
> -					   DMA_TO_DEVICE);
> -
> -		if (dma_mapping_error(dev, args_phys)) {
> -			kfree(args_virt);
> -			return -ENOMEM;
> -		}
> -
> -		smc.args[SCM_SMC_LAST_REG_IDX] = args_phys;
> +		smc.args[SCM_SMC_LAST_REG_IDX] = qcom_tzmem_to_phys(args_virt);
>   	}
>   
> -	/* ret error check follows after args_virt cleanup*/
>   	ret = __scm_smc_do(dev, &smc, &smc_res, atomic);
> -
> -	if (args_virt) {
> -		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
> -		kfree(args_virt);
> -	}
> -
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 0d4c028be0c1..71e98b666391 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -201,6 +201,11 @@ static void qcom_scm_bw_disable(void)
>   enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
>   static DEFINE_SPINLOCK(scm_query_lock);
>   
> +struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
> +{
> +	return __scm->mempool;
> +}
> +
>   static enum qcom_scm_convention __get_convention(void)
>   {
>   	unsigned long flags;
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 4532907e8489..aa7d06939f8e 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -5,6 +5,7 @@
>   #define __QCOM_SCM_INT_H
>   
>   struct device;
> +struct qcom_tzmem_pool;
>   
>   enum qcom_scm_convention {
>   	SMC_CONVENTION_UNKNOWN,
> @@ -78,6 +79,8 @@ int scm_legacy_call_atomic(struct device *dev, const struct qcom_scm_desc *desc,
>   int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>   		    struct qcom_scm_res *res);
>   
> +struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
> +
>   #define QCOM_SCM_SVC_BOOT		0x01
>   #define QCOM_SCM_BOOT_SET_ADDR		0x01
>   #define QCOM_SCM_BOOT_TERMINATE_PC	0x02


Return-Path: <linux-arm-msm+bounces-70224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9DB302E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 21:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979CC1BC6B34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 19:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7326727280B;
	Thu, 21 Aug 2025 19:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+lfUFqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F51A9FAB;
	Thu, 21 Aug 2025 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804744; cv=none; b=h+xZ50T+wvGKEQTxLb4HNBkQ5m/X0XEAAMl8IJpCG63Jglp/1KDYw7tC7K7DkISTTAPA+LstLisxAyJlLMadN0qOBJN/622Ce67uBBaDaMRHHAT8cyw9FSMg1TpHxlLMHjTZFEmU5zPGmcZ8ROuy7YhxGqneE7rQ2Xu8RMmwy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804744; c=relaxed/simple;
	bh=0frOgS9WIcvtIG2b13AfgNHG9HYu1+yVQ2P6qgQCUbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHpJhAx4FsUdRmYuNALlcWNZ//jzs2o2NuJry1SUhJkbzEhXV38GRd9C541Gu/h+mCKChyySZsNffv5C/wFbuUb9fT2BfwofgNt8DItjCwB8dcr2LUQM015X1xdVF6l4p8yPLndMHquP692fLge6TyXzuge7NsKOE3v5iwoO7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+lfUFqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9sAu008967;
	Thu, 21 Aug 2025 19:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYpWCcbISjCNUzk4vHLgNXmnOMo66w5kv2nzcQwVeHo=; b=H+lfUFqKGGg8M2J5
	WVJlM29tMWt/LolQvFZmYxbpSdErl8a8vVIz9Mclp+gnf/aXul4Mo9R1/ybdW4YF
	XjgKac13UrX0/dcKgFKuFYdUccKG+/BmWBtQL7j/mchcstQ9XEJ6/i7mOMuE6kh/
	ySndJwnRf5VuaOXQC5BlWABS0khPtKx2LujBAmFAiygPUP6p1EGjxl6xqty2R5Bt
	Ro5OnJ1NF76v+27ZGkxKh1B1F8qTkP6BhNhyEduQdh7vTgpNk4UB1nIAp2kkz3ST
	gdO/7mIsOM0kevZ4Z6vJAthBbOVP3ndkk/uorhM8/925TYLU/enQd+7ct0B87MEW
	ckmQAQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cpmsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 19:31:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LJVtmK019161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 19:31:55 GMT
Received: from [10.216.47.227] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 12:31:51 -0700
Message-ID: <37563dd8-341f-4db4-8a4b-c7f96dbfebff@quicinc.com>
Date: Fri, 22 Aug 2025 01:01:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ufs: ufs-qcom: Fix ESI null pointer dereference
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <bvanassche@acm.org>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
        <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
References: <20250811073330.20230-1-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250811073330.20230-1-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kgP4i14-hbJhaFOxUebTEomm4VdDMgRK
X-Proofpoint-ORIG-GUID: kgP4i14-hbJhaFOxUebTEomm4VdDMgRK
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a7742b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=bLk-5xynAAAA:8 a=COk6AnOGAAAA:8 a=oc46TbI3oXTmutG3ynwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=zSyb8xVVt2t83sZkrLMb:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5k8QbofMx7l3
 gLXsxr8OzxCQR7tLyR7oFzuhNY07cqdZ/zg0xxMNPREyePvv8iSO0hB0i/YFrQun4RSB6Nj7w9e
 eOiVgGqe/Dz80UUtkop2qUbCWEn3UqoIezdBeelxgdJLwoVmymR/uwO9nj1cOmUDL1e79F4w0/z
 u0fu6XWGOfB1kgoSb2G40CMDnaxb5NOzbOEGKSaXCAd56Qc/7jZqLJNCOcERWoQtPUgW3mZrXkH
 BPaxr3TL7lTNBWbmRxQ8Jvz+Xmvrk6shGcJuC/L8AWS4nqTokR+Qnxhl4udXGkTGFO1zLEmRtxl
 XoGT5Gj5u7jcD53aX2529/kAKttZnnp6imv5a9Ogj7Oua1JmL+SU7B8ztY0C+lhL0JqgxdOs9af
 3GOAM+3GawpGXYaGLT/pcoPChWiUJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/11/2025 1:03 PM, Nitin Rawat wrote:
> ESI/MSI is a performance optimization feature that provides dedicated
> interrupts per MCQ hardware queue . This is optional feature and
> UFS MCQ should work with and without ESI feature.
> 
> Commit e46a28cea29a ("scsi: ufs: qcom: Remove the MSI descriptor abuse")
> brings a regression in ESI (Enhanced System Interrupt) configuration
> that causes a null pointer dereference when Platform MSI allocation
> fails.
> 
> The issue occurs in when platform_device_msi_init_and_alloc_irqs()
> in ufs_qcom_config_esi() fails (returns -EINVAL) but the current
> code uses __free() macro for automatic cleanup free MSI resources
> that were never successfully allocated.
> 
> Unable to handle kernel NULL pointer dereference at virtual
> address 0000000000000008
> 
>    Call trace:
>    mutex_lock+0xc/0x54 (P)
>    platform_device_msi_free_irqs_all+0x1c/0x40
>    ufs_qcom_config_esi+0x1d0/0x220 [ufs_qcom]
>    ufshcd_config_mcq+0x28/0x104
>    ufshcd_init+0xa3c/0xf40
>    ufshcd_pltfrm_init+0x504/0x7d4
>    ufs_qcom_probe+0x20/0x58 [ufs_qcom]
> 
> Fix by restructuring the ESI configuration to try MSI allocation
> first, before any other resource allocation and instead use
> explicit cleanup instead of __free() macro to avoid cleanup
> of unallocated resources.
> 
> Tested on SM8750 platform with MCQ enabled, both with and without
> Platform ESI support.
> 
> Fixes: e46a28cea29a ("scsi: ufs: qcom: Remove the MSI descriptor abuse")
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
> Changes from v1:
> 1. Added correct sha1 of change id which caused regression.
> 2. Address Markus comment to add fixes: and Cc: tags.
> ---
>   drivers/ufs/host/ufs-qcom.c | 39 ++++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 4bbe4de1679b..bef8dc12de20 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2078,17 +2078,6 @@ static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
> 
> -static void ufs_qcom_irq_free(struct ufs_qcom_irq *uqi)
> -{
> -	for (struct ufs_qcom_irq *q = uqi; q->irq; q++)
> -		devm_free_irq(q->hba->dev, q->irq, q->hba);
> -
> -	platform_device_msi_free_irqs_all(uqi->hba->dev);
> -	devm_kfree(uqi->hba->dev, uqi);
> -}
> -
> -DEFINE_FREE(ufs_qcom_irq, struct ufs_qcom_irq *, if (_T) ufs_qcom_irq_free(_T))
> -
>   static int ufs_qcom_config_esi(struct ufs_hba *hba)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -2103,18 +2092,18 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>   	 */
>   	nr_irqs = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
> 
> -	struct ufs_qcom_irq *qi __free(ufs_qcom_irq) =
> -		devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
> -	if (!qi)
> -		return -ENOMEM;
> -	/* Preset so __free() has a pointer to hba in all error paths */
> -	qi[0].hba = hba;
> -
>   	ret = platform_device_msi_init_and_alloc_irqs(hba->dev, nr_irqs,
>   						      ufs_qcom_write_msi_msg);
>   	if (ret) {
> -		dev_err(hba->dev, "Failed to request Platform MSI %d\n", ret);
> -		return ret;
> +		dev_warn(hba->dev, "Platform MSI not supported or failed, continuing without ESI\n");
> +		return ret; /* Continue without ESI */
> +	}
> +
> +	struct ufs_qcom_irq *qi = devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
> +
> +	if (!qi) {
> +		platform_device_msi_free_irqs_all(hba->dev);
> +		return -ENOMEM;
>   	}
> 
>   	for (int idx = 0; idx < nr_irqs; idx++) {
> @@ -2125,15 +2114,17 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>   		ret = devm_request_irq(hba->dev, qi[idx].irq, ufs_qcom_mcq_esi_handler,
>   				       IRQF_SHARED, "qcom-mcq-esi", qi + idx);
>   		if (ret) {
> -			dev_err(hba->dev, "%s: Fail to request IRQ for %d, err = %d\n",
> +			dev_err(hba->dev, "%s: Failed to request IRQ for %d, err = %d\n",
>   				__func__, qi[idx].irq, ret);
> -			qi[idx].irq = 0;
> +			/* Free previously allocated IRQs */
> +			for (int j = 0; j < idx; j++)
> +				devm_free_irq(hba->dev, qi[j].irq, qi + j);
> +			platform_device_msi_free_irqs_all(hba->dev);
> +			devm_kfree(hba->dev, qi);
>   			return ret;
>   		}
>   	}
> 
> -	retain_and_null_ptr(qi);
> -
>   	if (host->hw_ver.major >= 6) {
>   		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
>   			    REG_UFS_CFG3);
> --
> 2.48.1
> 

Gentle Reminder!!



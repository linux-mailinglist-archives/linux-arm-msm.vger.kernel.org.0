Return-Path: <linux-arm-msm+bounces-26582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6A935083
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1791A1F21FC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FCC57333;
	Thu, 18 Jul 2024 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H/TerMOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69E144D03
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721319468; cv=none; b=JqmAENX0Ikeoq3LhRvAGyql+GeIFFcK9Ml1kDNpHlY9etyZzDydX0kuTX1Miaz9IHH8CmmhlOrNiXgD74aiR2zAoWU3pgplXHfmf2022Wm/kVPyFCYgD1zdLCFOLFe3SN4b0zEdDvtXGdd73m393058LiUjgzr6x1ZysVHrowA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721319468; c=relaxed/simple;
	bh=DJlv9GYtw3dO5/omZT8vUE76vJd3diwQcl4rFBO8T4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dwJazGjTk6HmrczzBt4Vtj91a1NQKGzXQUR61Gb90nzT0UUTmub58EXmZyPCO/KC1KLgDt+4xPqe5zz+T2vULFYMMUAVhg96kRIKnIs4lGT5hbc4orXlVG4aRXjvKebf0GncHz2b17txegsxFFW5m4NB20Ab3q0N2FihaNv1x3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H/TerMOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IA3gDk012794;
	Thu, 18 Jul 2024 16:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhz7koJm9diMNdngB6xlOAO9Kmx1knG5rUrUAGurD4A=; b=H/TerMOc39HoOCRI
	MIGxqgJRVU0a4coA3HIpX2rcIi9NEbnpOlW3CQRWYhpePeWCrjRgAHS1bej1V8hX
	Pom0gQGsOMH0m7YuEmKisASZk+f4w9bK/hfzaLbuJJnQhWiSG8hcoLLAWG3i4a03
	/Ar+CqqVZrBBEc8Xq4Hmm8REUzrDibyNc+6hZY70ZyI4U9i7yPT4LG69Ds8s0JV+
	z/iA01Or72DyrpcqGDj7dlbX2kDeervwDlVtBXFAY52ql3KGbnRnjJ4hmMKOj3oO
	oeyH6EfXXrpCI/8UBpAAuJ0P/j9UHXrICnBukOIinTtU/OckOHa3zKpS7bQrNfRj
	Vg7KOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40es1wswk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:17:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IGHauL024490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:17:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 09:17:35 -0700
Message-ID: <5bf07c79-4dd2-57d8-91f1-4cd4970185d4@quicinc.com>
Date: Thu, 18 Jul 2024 10:17:34 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/6] drivers: bus: mhi: Added shared-dma-pool support for
 mhi_dev
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-2-quic_gokulsri@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240718061344.575653-2-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: csHo-hdBhCY9JNLv3CWtjfJQwxK2ldz1
X-Proofpoint-ORIG-GUID: csHo-hdBhCY9JNLv3CWtjfJQwxK2ldz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=923 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180105

$SUBJECT looks wrong

On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
> When using default memory for coherent memory allocation without
> reservation, memory gets fragmented after several mhi
> register/unregister cycles and no coherent reservation was possible.
> 
> Client driver registering MHI shall reserve a dedicated region as
> shared-dma-pool for mhi to help avoid this situation. On boards
> which doesn't reserve this memory, it will continue to allocate
> memory from default memory.
> 
> DMA pool is reserved for coherent allocations of size SZ_512K
> (mhi_cntrl->seg_len) to avoid fragmentation and always ensure
> allocations of SZ_512K succeeds. Allocations of lower order from the
> reserved memory would lead to fragmentation on multiple alloc/frees.
> So use dma_alloc_coherent from mhi_cntrl->cntrl_dev for allocations
> lower than mhi_cntrl->seg_len. If coherent pool is not reserved, all
> reservations go through mhi_cntrl->cntrl_dev.
> 
> Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>   drivers/bus/mhi/host/boot.c     | 19 ++++++------
>   drivers/bus/mhi/host/init.c     | 51 +++++++++++++++++++++++++++++++++
>   drivers/bus/mhi/host/internal.h | 26 +++++++++++++++++
>   include/linux/mhi.h             |  5 ++++
>   4 files changed, 91 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index dedd29ca8db3..ca842facf820 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -303,8 +303,8 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>   	struct mhi_buf *mhi_buf = image_info->mhi_buf;
>   
>   	for (i = 0; i < image_info->entries; i++, mhi_buf++)
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> -				  mhi_buf->buf, mhi_buf->dma_addr);
> +		mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
> +				     mhi_buf->buf, mhi_buf->dma_addr);
>   
>   	kfree(image_info->mhi_buf);
>   	kfree(image_info);
> @@ -340,9 +340,9 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>   			vec_size = sizeof(struct bhi_vec_entry) * i;
>   
>   		mhi_buf->len = vec_size;
> -		mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
> -						  vec_size, &mhi_buf->dma_addr,
> -						  GFP_KERNEL);
> +		mhi_buf->buf = mhi_fw_alloc_coherent(mhi_cntrl, vec_size,
> +						     &mhi_buf->dma_addr,
> +						     GFP_KERNEL);
>   		if (!mhi_buf->buf)
>   			goto error_alloc_segment;
>   	}
> @@ -355,8 +355,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>   
>   error_alloc_segment:
>   	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
> -		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> -				  mhi_buf->buf, mhi_buf->dma_addr);
> +		mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
> +				     mhi_buf->buf, mhi_buf->dma_addr);
>   
>   error_alloc_mhi_buf:
>   	kfree(img_info);
> @@ -452,8 +452,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	fw_sz = firmware->size;
>   
>   skip_req_fw:
> -	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
> -				 GFP_KERNEL);
> +	buf = mhi_fw_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
>   	if (!buf) {
>   		release_firmware(firmware);
>   		goto error_fw_load;
> @@ -462,7 +461,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	/* Download image using BHI */
>   	memcpy(buf, fw_data, size);
>   	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
> +	mhi_fw_free_coherent(mhi_cntrl, size, buf, dma_addr);
>   
>   	/* Error or in EDL mode, we're done */
>   	if (ret) {
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index ce7d2e62c2f1..c1e1412c43e2 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -8,9 +8,12 @@
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/dma-direction.h>
> +#include <linux/dma-map-ops.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/idr.h>
>   #include <linux/interrupt.h>
> +#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>

NACK.  Not all platforms that use MHI have devicetree.



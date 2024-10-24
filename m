Return-Path: <linux-arm-msm+bounces-35746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46B9AF4D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 23:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53EFF282E56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6548421731D;
	Thu, 24 Oct 2024 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AhWpkuQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770120CCF9;
	Thu, 24 Oct 2024 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729806498; cv=none; b=oIZ8b9JiLqs1SvCKzrSlVA0Cns0jWuJSYAxc6i6JwOQTC1sAXb4p8fwRi6m2rQfMBzLkKgIkfPhpDm2+w6O5UYI18SzWfXVXdD9VX/oxW+TkypJi/Gtb/C63ucsf9thxgvx1hdIPsqVtmqiNG+zTD1l14QOcgP+xy75BpUMTUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729806498; c=relaxed/simple;
	bh=fgcx398eUTFNxb+JbkDZmJNK2nxFgnkuZRyIa+AmT2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SU5vCRps1axD7o0m+GP1lehDTHFpX9qKxHJOaOxY+VofDOOAEN3LrjUpe2CJ+zrKmtEnL5Fu9UuZ+cRplQ7KjYcrOgWNj5iOTdr+hZ4hagymI2i6QF3ULbK48GKZTWTryO+R3mhJNehPg+CW9MnE2ufQ7jcgcXOwS/Pn5xLFSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AhWpkuQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAHiWS009114;
	Thu, 24 Oct 2024 21:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgzr2/M3/YcsAQFJGaNUhnxtlKg8e+5y4ZPF0xrl120=; b=AhWpkuQNmxQkorzq
	ZAFlIHDe/B9298TeJOA0GZdcpRCzwFuBgEAWmIOEQ4Ui/9SWeHqyow6Z+A42eymK
	ssg5u1hRSjGDCHcSCcdmGShSGqD9tfSR2NB7wMsQD7h/nfJZLQRBtZSWKpjNuRc0
	XQ+EBvLU8Qe6VyDbhwHtP9TVLYbSqpTIXyjAKCQuoqrBBsbdJrFgNt0CyICaRpjM
	MVKWEmvTswQNGQvqhZuIk4XYDxYgZNmRz7pO4buex1T04oh/IHJtgYv+YKh3Nnz7
	cNuLLPRTNLAIdOgzRL96bnkD9YHWah2/3+jR9HFnUmCFOhJiXuXmaBMaKxb5dZvw
	qH3gmg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43f0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 21:48:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OLmDab004017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 21:48:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 14:48:12 -0700
Message-ID: <4cb53edc-8030-54c9-0c26-09d188c2b4e2@quicinc.com>
Date: Thu, 24 Oct 2024 15:48:11 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Free mhi_buf vector inside
 mhi_alloc_bhie_table()
Content-Language: en-US
To: Youssef Samir <quic_yabdulra@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ccz3wRa2hCjG5-yk_XDsn9FB5Sf8Lera
X-Proofpoint-ORIG-GUID: Ccz3wRa2hCjG5-yk_XDsn9FB5Sf8Lera
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410240178

On 10/24/2024 3:47 PM, Youssef Samir wrote:
> mhi_alloc_bhie_table() starts by allocating a vector of struct mhi_buf
> then it allocates a DMA buffer for each element. If allocation fails,
> it will free the allocated DMA buffers, but it neglects freeing the
> mhi_buf vector.
> 
> Avoid memory leaks by freeing the mhi_buf vector on error.
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/bus/mhi/host/boot.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 21bf042db9be..2e9ef55a566a 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -415,6 +415,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>   	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
>   		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>   				  mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(img_info->mhi_buf);
>   
>   error_alloc_mhi_buf:
>   	kfree(img_info);


Better  :)


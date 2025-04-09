Return-Path: <linux-arm-msm+bounces-53628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65AA82334
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 13:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3979E4A5D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 11:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBF725DCE9;
	Wed,  9 Apr 2025 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IuRXUoRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170DA25C71D;
	Wed,  9 Apr 2025 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197142; cv=none; b=oujBtYU2rjmLD6oI7LAzg9LoYx/5V/B3VGOCmPbieXQCAUqne/i2aMRwJzafJvLS5UlNgrW19VeKXI+QMqpERG3UwebVSLqUKwQ5SLJUH3YutV/DWMBcGyfY8PKZMlS/twtcuF9scrupfF/OicpZ30t2RY9oCfYd/WXgwGKsLjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197142; c=relaxed/simple;
	bh=sxNzWeLknqUyzVMF6d4y49XHlMG3GHMlSEneyM5P2V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AsOOlFa0gwYNmezWBdKNSDe8yPRoNjLM6UmECXIkMLhxpSXgEfjyMIGuePUQacmaY5VeLnRsGBwaumhxvWGviVEhgltTuZBZkhPS7GMIgHPha4rymogM9j2aN3AQoxnEnwrjuQM5LizMdbVnZEEST91jxSdEcG5YozzvOkdwzV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IuRXUoRV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398TgeP032297;
	Wed, 9 Apr 2025 11:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNg6R2eh4WoQiKofBVHMx4Z8dMgsbFBHkzRO7DTyCM4=; b=IuRXUoRVqW0QUKry
	midT09z1E/R6uibsODQQwUGPS1MSfH4g0+RBojeHNirKi5AD4FybJNqG87LqbJbC
	BapvaQKXbzSrahdFGtUSM9+TRSotZOoBjvYzo0IBUd+ukZKm30FFVb/gYP34hhtw
	A6FtJFYDDbqNIgIb7CvmC/KqFt9791x3UbF+enXMPKQOw5D94oyD4kEoFs95q3iU
	y37WAelSY6c7kBsWQTit1dx9mGs3nPwJbphpddsVbW31mN1t6T3TmTaT0gfTvo3/
	dc80EP5K5j80EYTqnTLGmR1RkfpomIWH+I71vYuKGeFNdBXH9K62uTdzjCeOmq8c
	JTuLXA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeb5vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 11:12:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539BCFHc014671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 11:12:15 GMT
Received: from [10.216.8.212] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 04:12:11 -0700
Message-ID: <3c5a0470-7c60-c6f7-85b2-9dc5f90e44f0@quicinc.com>
Date: Wed, 9 Apr 2025 16:42:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
To: Sumit Kumar <quic_sumk@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alex Elder <elder@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_akhvin@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_vbadigan@quicinc.com>,
        <stable@vger.kernel.org>, Youssef Samir <quic_yabdulra@quicinc.com>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aL7EV4aHrtXG7PqdiEYUfHsAxwFQwll_
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f65610 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ljfrh_M9o-RCrfJy5NoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aL7EV4aHrtXG7PqdiEYUfHsAxwFQwll_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_04,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090065



On 4/9/2025 4:17 PM, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 
> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
> ---
>   drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> index aeb53b2c34a8cd859393529d0c8860462bc687ed..26357ee68dee984d70ae5bf39f8f09f2cbcafe30 100644
> --- a/drivers/bus/mhi/ep/ring.c
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -131,19 +131,23 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
>   	}
>   
>   	old_offset = ring->rd_offset;
> -	mhi_ep_ring_inc_index(ring);
>   
>   	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
> +	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> +	buf_info.dev_addr = el;
> +	buf_info.size = sizeof(*el);
> +
> +	ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	if (ret)
> +		return ret;
> +
> +	mhi_ep_ring_inc_index(ring);
>   
>   	/* Update rp in ring context */
>   	rp = cpu_to_le64(ring->rd_offset * sizeof(*el) + ring->rbase);
>   	memcpy_toio((void __iomem *) &ring->ring_ctx->generic.rp, &rp, sizeof(u64));
>   
> -	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> -	buf_info.dev_addr = el;
> -	buf_info.size = sizeof(*el);
> -
> -	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	return ret;
>   }
>   
>   void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250328-rp_fix-d7ebc18bc3be
> 
> Best regards,


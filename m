Return-Path: <linux-arm-msm+bounces-51212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9CA5EAA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACD23A4B56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 04:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D811531DB;
	Thu, 13 Mar 2025 04:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cxED1E9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D91A14900B;
	Thu, 13 Mar 2025 04:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741840582; cv=none; b=eYYaS+ne9fUf0u/67uOcXt1yUhPU+174zoqSHNX/sg+U1NXirNdqg1zcXEEUV0ycTIgeXjMhZklomYC3c+saGydohSsx3FEVQPEdw5+f/rcz4zrV7HRzt54hK0vzqpzQ8dRq8ztKigNMlxr+lDJ3meaMN4Y+etHdEbQwzbpF3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741840582; c=relaxed/simple;
	bh=xet0V+r+Aj8VTDEbeTR7zsWCTB5Lz8SoX9EX3nWHHD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L0l4o7PX9IE4j6HK8KCyu1nhG9gGksncS/yMxLFaQpAcwA3qsUfTkJfRp+cGZXPPtZcAlQNG0cYs0NXCQRQ6ckNQGDIh8lnEA8A4Y7Uw05eL1AkiwNMKw6F4o+cMsvIe27SPIk9loQ063FDUUg+yz3U7WGFyE0DjcH4oQ4hi534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cxED1E9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CEUg66020990;
	Thu, 13 Mar 2025 04:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvjqVgNUm0jKQX7GdfDaAQbIn4ughtKb9Am3wpaodiE=; b=cxED1E9L9VGWO1Ih
	U49+ufXbbTWC6Lp0MBJ1tC+4nDLECM8GKQEnfeOSyfYnfouliqmDYnZRfwPwNzak
	g4Ler1J/Kfddd/8bxJtK4MTYyrtjGJyuxZGdrc8M+CFyOASUHtDWJMFTb1zDO7Pi
	EE+jXYstYLjeqqnARwuK8xzi7oxvZP/+8rflGkbZiUbgeKxbhh2e8r4jmQlaHBmL
	3Ke+M6OLK2osenjTdt1cSBxUsWHnF2GSXoWwMDVmASx516i/wM+HqIzcB7n+qiEc
	3rVhZymSqrHqaIED6YRanatADtur2gzgSUKMOTLSKGpik6SbevQqHm9qUGWtYuBO
	uSxkxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pvh3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 04:36:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D4aIdc000437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 04:36:18 GMT
Received: from [10.216.49.184] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 21:36:15 -0700
Message-ID: <ba009fc7-851e-86bf-28ca-008ad258f54d@quicinc.com>
Date: Thu, 13 Mar 2025 10:06:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
References: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d260c2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LbIimEMjv8I_AjFlMG8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 15kOL97W57mau4SHzTKEvXQYb7UcQJ0N
X-Proofpoint-ORIG-GUID: 15kOL97W57mau4SHzTKEvXQYb7UcQJ0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=924 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130033



On 3/6/2025 10:59 PM, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> A client driver may use mhi_unprepare_from_transfer() to quiesce
> incoming data during the client driver's tear down. The client driver
> might also be processing data at the same time, resulting in a call to
> mhi_queue_buf() which will invoke mhi_gen_tre(). If mhi_gen_tre() runs
> after mhi_unprepare_from_transfer() has torn down the channel, a panic
> will occur due to an invalid dereference leading to a page fault.
> 
> This occurs because mhi_gen_tre() does not verify the channel state
> after locking it. Fix this by having mhi_gen_tre() confirm the channel
> state is valid, or return error to avoid accessing deinitialized data.
> 
> Fixes: b89b6a863dd5 ("bus: mhi: host: Add spinlock to protect WP access when queueing TREs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/main.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..aa8a0ef697c7 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1207,11 +1207,16 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>   	struct mhi_ring_element *mhi_tre;
>   	struct mhi_buf_info *buf_info;
>   	int eot, eob, chain, bei;
> -	int ret;
> +	int ret = 0;
>   
>   	/* Protect accesses for reading and incrementing WP */
>   	write_lock_bh(&mhi_chan->lock);
>   
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
>   	buf_ring = &mhi_chan->buf_ring;
>   	tre_ring = &mhi_chan->tre_ring;
>   
> @@ -1229,10 +1234,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>   
>   	if (!info->pre_mapped) {
>   		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
> -		if (ret) {
> -			write_unlock_bh(&mhi_chan->lock);
> -			return ret;
> -		}
> +		if (ret)
> +			goto out;
>   	}
>   
>   	eob = !!(flags & MHI_EOB);
> @@ -1250,9 +1253,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>   	mhi_add_ring_element(mhi_cntrl, tre_ring);
>   	mhi_add_ring_element(mhi_cntrl, buf_ring);
>   
> +out:
>   	write_unlock_bh(&mhi_chan->lock);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,


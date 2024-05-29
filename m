Return-Path: <linux-arm-msm+bounces-20930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 032958D35D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 13:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A8F1F24542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475231802CD;
	Wed, 29 May 2024 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QvAdy3Vk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C931BC57;
	Wed, 29 May 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983704; cv=none; b=ElPL/MbdLXQHnbRprbxCQ04mVpQ8Y0tgBPn1m/1cZgupbfS4dIAgej1g47+uUd5jx9dZtAtlIZfHq6CNIfg5FpPxsopmDV61Dy2ZF5Zv5tn82C7D5POm9SH/73KBidZ4UmeYtUWqTjL0fuTWEkt3fsK2KXncwDZ9PD7IRLa3oQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983704; c=relaxed/simple;
	bh=p7wQtzPc0gskeZlqdHZkaIR8z402TtfibTSQeobi72Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NRjPlttJQw+M8boY8Uf0wXr62AnVka4LCO+GNHDOeGX80JxflmawjXmmpp/RqcTYBiI8FqZNWKU3nJAA+A8LpKevYyZIgEjPjXGoPw/RHMRZy3tB5m6WSWc/crHg/dQEBNK8IINOIqxxmYsJ/SQA5rQ3BlEd29sLoGr3RCnlGBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QvAdy3Vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9jhqN011441;
	Wed, 29 May 2024 11:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SP7r+/9vOIiDhIdLbDBVBorrd8fvJYwJfnczReif0ZY=; b=QvAdy3Vks2lxWAdP
	LKqn0Og9ORaR3o0voQdEmqpgtL7iXO6T4Vblm4lvFI2sna9dj85AA+pI0W1st3Hp
	YFcuWUQPld5FcYs5f+g+pavKl35s/CgT18gmxEoUU8aMj7avrrH1+kU7JDTNJsdZ
	I2p3TEzsJ4xDMeVTvHjxCEXdXoLT6rL9P+ih4aFBaexk6nR+t6G2soOpQI3EICl5
	izAVJsfjs8RmZnHfDVhUgN1kYVVXDszHoP+jse8D2PnoEhvKVKH4ateE3CWYMqIw
	VdAFmzzM4mu1MAqV+tXy+itVnpXpZyuOyG/Zs3VA9Rr8+LmPmy/Bz0x1K/4f3gqY
	06oG5A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qgu95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 11:54:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TBsvnQ011684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 11:54:57 GMT
Received: from [10.216.41.231] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 04:54:54 -0700
Message-ID: <d85bf913-b6dc-e9fd-7c54-fe52b79c2593@quicinc.com>
Date: Wed, 29 May 2024 17:24:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA
 memory from lower 4GB
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
 <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
Content-Language: en-US
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aL52d0rawomMSiGPufVMQOfTYaQNQGXX
X-Proofpoint-ORIG-GUID: aL52d0rawomMSiGPufVMQOfTYaQNQGXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290081



On 5/27/2024 2:16 AM, Bjorn Andersson wrote:
> On Fri, May 24, 2024 at 09:01:45PM GMT, Mukesh Ojha wrote:
>> For SCM protection, memory allocation should be physically contiguous,
>> 4K aligned, and non-cacheable to avoid XPU violations. This granularity
>> of protection applies from the secure world. Additionally, it's possible
>> that a 32-bit secure peripheral will access memory in SoCs like
>> sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
>> needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
>> pool can be used with dma_alloc APIs.
>>
>> However, dma_alloc APIs will fall back to the buddy pool if the requested
>> size is less than or equal to PAGE_SIZE. It's also possible that the remote
>> processor's metadata blob size is less than a PAGE_SIZE. Even though the
>> DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
>> back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
>> is disabled.
> 
> Does "fail" here mean that the buddy heap returns a failure - in some
> case where dma_alloc would have succeeded, or that it does give you
> a PAGE_SIZE allocation which doesn't meeting your requirements?

Yes, buddy will also try to allocate memory and may not get PAGE_SIZE 
memory in lower 4GB(for 32bit capable device) if CONFIG_ZONE_{DMA|DMA32} 
is disabled. However, DMA memory would have successful such case if
padding is added to size to cross > PAGE_SIZE.

> 
>  From this I do find the behavior of dma_alloc unintuitive, do we know if
> there's a reason for the "equal to PAGE_SIZE" case you describe here?

I am not a memory expert but the reason i can think of could be, <= 
PAGE_SIZE can anyway possible to be requested outside DMA coherent api's
with kmalloc and friends api and that could be the reason it is falling
back to buddy pool in DMA api.

-Mukesh


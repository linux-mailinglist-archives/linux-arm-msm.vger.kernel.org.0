Return-Path: <linux-arm-msm+bounces-78467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE74BFF9ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB084563733
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC8B2C11C6;
	Thu, 23 Oct 2025 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YloXzBjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0FE2D2398
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204026; cv=none; b=i/boUsK/x1rlWxDrd7pka4yB3Y/ZNeLetho7i2sJxFPhKcsJqnTTTb3hEv4cX/9wNegi3ZYI47k/NYTAsRuTi/pu/jsM8C4yncLOA+vXNyqpMkVIk7S/579Nj5MUAQw4+Ba6P5SBRNMavwVBnc42qjlfpTtUYXxnlW8Ao5nPh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204026; c=relaxed/simple;
	bh=NnxtzqoqTOtTzkYunLy6kdr6K45/xO1JpMzpIxWw0GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxvLw2/QRXPPBtJOo3YLKmmMxrq94tUxq+i7vnKhVX8bBd9z2aPq7C5q2ps+3VqzP2xqu22lRl2Mal2Npg+tV8fS+uvl6mQ8b/NyaSePbXJ0Mwu5BZEyJNrrth/j29uYjMhgBDlrDiSVObpaHzvldzhdyc0m1KQb+ldgHPMp6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YloXzBjR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6wtpF022471
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bnwHS1/yOaQxHpzvdkz9xhr9di2Zfg0xQQ+FZkciYw=; b=YloXzBjRRk98phbn
	iH9My3iUv5EljDC3hFAScjp25dXc24XGB134wsy52DlpBXchuGKtJDfeR2V73VMG
	DJHwC0mHbFCM29XZaGPs+fyMwzB8xD6hG6BEqe3AONAGYS5v22xyKjBhOG+Yq/fU
	7JMYuIO/Z5VcfmgCtqJ+o+vhDTEKfU08o+B9eps2C/qeP38F4LvsyOxBDjBfyVFR
	QDwtMptgH7zvFnWDPhD6D0oev/4lUfdIFg2qPoPBCH7l8uH8sTGgz2qzQstj0c1o
	Bukk5N3Zl4NTkPf2HaLAMEAcRpe4B94VKKSLmDo19tbJRdKpjRc7qWk4dT3ha7tL
	fIOWsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w87dnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:20:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so468489a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 00:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204020; x=1761808820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+bnwHS1/yOaQxHpzvdkz9xhr9di2Zfg0xQQ+FZkciYw=;
        b=ss1Rv5T4cEyww1fMrzxrNr12BkOO26x+Cbc9fHlrlFdRte0OJGZ+LZcql3Azsq3TsN
         3n0A9EXzKm6MxuFpRmmqlsysx/oUov3cClRqn8opv3ADrKRNFM7R2INh4Fmlt1ZMoHl5
         NOJn842Jh5xBsD8XJqQxTyX49ujH0jhNmjkrqRLIcY3VnWQ2OYZVEvlekU52LFIp3Djv
         tYnzVOLzP39Ho4cszPMXb3E3tvS0uy3GqddfXrSTMHCp731TtMo7Oy67B0VRa4K7/tz4
         2Q0nwDjW1kq/GJrKHRgNgNkEKpePVBUkAwz3s10305ycmLg9gDqXo4lpQtIxzjcnECkE
         IKGA==
X-Forwarded-Encrypted: i=1; AJvYcCV3nNPtBHln/WRbOhnCVICpxL4/Za/JZCBprjShtpmT8PeZM6HlSTphjGYqvBP3mBc9oDNw11kATNK0CF8i@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3acSCinQSKFH7gcpa5TjygssJxvyJxEhfmdQlM6TVRc4hEt3
	ZmTn5EnAceirzyWvmjKNrr7gBqVNWEX0CocrqGHIg0xaEq39P2i4iMnT8FYgMxa/PLFhRw7JccV
	+ehgaIJsPz7k8ukm8pT2bGSqwpo7+G0dOJacEIB9YBeVlmWuHb1K8baKmpFpvdT0sD5dH
X-Gm-Gg: ASbGncvas1kilnivikDLNdk8kc+RMas5G7xqcD4xDe1ADwVJdi4fUTTNpQGa79zHOxi
	s8K8ffH/C13UpVibHOkl5oUIPuMLkQ0FN1LCvTBBoFAf0Isdxm/HFX00jcevvpYZQxXE7IHE7jO
	IO36yYOm0CCaPXSKIwenWkX31vxWvAV3goJQwcd5T0CeKo7gtziHd8iDlqcTYmgxmsbB009t9EO
	ShyLoV0gV3LK9QSNKYAomIh0gcA+/XRTcm3LQoAn2m9sHKpPfFrlkprGJECVKNUCOvwywhev0V/
	vrtB8ov5IipAAGNrSwtCuXAL21W5BRrUmr6YMQ7pr7SxdbIBKLggqu6OGluXE3b3rs/xCljG3PU
	aIQ29Xml9TD23Xs0Rr0kKqI+T+4MwRiU=
X-Received: by 2002:a17:90b:1b41:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-33fafb97f5cmr1702633a91.2.1761204020242;
        Thu, 23 Oct 2025 00:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2fcSY1TNJQstdN387DaRrxHE11mr6Jmptb5iITLfgYGoj08YKIaIx+q2b22NC4ilr2/vXKA==
X-Received: by 2002:a17:90b:1b41:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-33fafb97f5cmr1702599a91.2.1761204019686;
        Thu, 23 Oct 2025 00:20:19 -0700 (PDT)
Received: from [10.204.86.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9ceb8sm1525999b3a.21.2025.10.23.00.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:20:19 -0700 (PDT)
Message-ID: <75f6bbad-49a0-4a15-b976-a0450f66a4dc@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:50:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
 <svekpvatqpymzxprc5n2tlndqlwze3tj6kr3bzszjnoay7oulk@zslcxpsyuzdo>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <svekpvatqpymzxprc5n2tlndqlwze3tj6kr3bzszjnoay7oulk@zslcxpsyuzdo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX83AxIGSVoJtG
 XQy44CrpKSNFvnsOqMy70eQtJoiy5sjAPW8ox1CVSQklncRRFMglPq0YT6FmSVsNsNf/cTUCatp
 xsMk1fQ4r9ezqWGQvTnB7nsH6iZvf94m3c660/Di66pjPr02tCssGuyQyW6sBKsE9vPbpI8RFkI
 vKFTJHqDQP/13XYuiJoPxpKkwMlbikrBblLBOlEv59mcvXjmT7r3EVohZMwI+j068u0tONoj/Ix
 eRbnMdyfYUCNTWWIgyzDTOd94Rre1U9AVTyZyDz4b2QWEnwp825NT6YAD6a7+VnDX4VWYHgj7Kc
 uLkjOz/pLWzGE6mJl/lN+S7QYygJMevqq9nT2OQV7ALsFriyBrGluQpU2HouXVS5ddV+Nvt0QI6
 3i4FTMs5gLFcMkGZK1UEcwnTMlRmzg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f9d735 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3sZQ8oCNBwzgLSnuaQIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _MGO_e4xB5CBHH7-mXA5sHMGsPBqyBe3
X-Proofpoint-ORIG-GUID: _MGO_e4xB5CBHH7-mXA5sHMGsPBqyBe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/15/2025 3:37 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 15, 2025 at 10:27:00AM +0530, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 68 +++++++++++++++++++++---------------------
>>   1 file changed, 34 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 621bce7e101c..975be54a2491 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>>   	struct dma_buf *dmabuf;
>>   	struct device *dev;
>>   	void *virt;
>> -	u64 phys;
>> +	u64 dma_addr;
> 
> If it is dma_addr, why isn't it dma_addr_t?
> 

While the field is named dma_addr, it is not strictly limited to holding 
a DMA address.
Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is 
set, S2 mapping expects a physical address to be passed to the 
qcom_scm_assign_mem() API.
reference- 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b

> 
>>   	u64 size;
>>   	/* Lock for dma buf attachments */
>>   	struct mutex lock;
>> @@ -217,7 +217,7 @@ struct fastrpc_map {
>>   	struct dma_buf *buf;
>>   	struct sg_table *table;
>>   	struct dma_buf_attachment *attach;
>> -	u64 phys;
>> +	u64 dma_addr;
> 
> And this one.
> 
>>   	u64 size;
>>   	void *va;
>>   	u64 len;
>> @@ -406,12 +406,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   
>>   	buf->fl = fl;
>>   	buf->virt = NULL;
>> -	buf->phys = 0;
>> +	buf->dma_addr = 0;
>>   	buf->size = size;
>>   	buf->dev = dev;
>>   	buf->raddr = 0;
>>   
>> -	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
>> +	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->dma_addr,
>>   				       GFP_KERNEL);
> 
> If it was dma_addr_t, you wouldn't have had to typecast here.
> 
>>   	if (!buf->virt) {
>>   		mutex_destroy(&buf->lock);
>> @@ -437,7 +437,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->phys += ((u64)fl->sctx->sid << 32);
>> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>>   
>>   	return 0;
>>   }
>> @@ -682,7 +682,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
>> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> 
> FASTRPC_PHYS trunates addr to 32 bits. Is it expected? Is it a DMA
> address on the  Linux or on the DSP side?
> 

Yes, it is expected as the device can address up to 32 bit memory range. 
It is a DMA address on the Linux.

>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
> 

Thanks,
Pallavi


Return-Path: <linux-arm-msm+bounces-77365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635CBDE11D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09F8535572C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDE3315D4B;
	Wed, 15 Oct 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRWQcRDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716AA3093D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525243; cv=none; b=f6EJllBqLZ3GHnlAvHLFuNNl2envU2IXKbLzBKQ3NZ/mgeEsRqV8lfkeKvMbq5CFEkle97yHjGUsanPp8xTuIoXe7KLk76hqrGNxhhLhBdEVK6W8CsAnEY5kS/+JxKGk7tdt2YEcxrPOpiT4kFoajqO+iN+mqS3m4Bc82f7zAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525243; c=relaxed/simple;
	bh=6t2VjMzmYUpCUm4tfw2LHG2B2SP1VyCR0KGFGIZx14M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lL+08PxhpKL1P4P1i0dHhzz/5Jr1RnzxmA7sTKit75GILV0ImNwVPmr7jMMDIcjBQjiA/jHWJZNqeIqRZoP0/+zY4d/DR45AK9hSoy/RTBVFZ8mWSxh2TYUxzMvcmGI1XWyVtf5nhRv+aOZu1rBePXIRh7Khv+75p+F8gGvpYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRWQcRDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sDUI004070
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jyhIXaZyVu1vjZr+AhCvbj4p9RRg4EuzAX/ftNllyA=; b=dRWQcRDoUsIV+zy6
	e4UoDqN3V9QggMrNt59OUBwEgPBB7SWceFY/Lbnz+3axglGjbfNdbPr5nrQ27+J2
	LDB655Jis80SGDOvau1MfPUvxzZeLN2cviJ5fb6FsQJM4192tSGgUCVev/CaNGF6
	eHE3ZvTwD/AWGs6gzlPaXu7OVHK40VvQEsXOVDZqW4acxmBS73DEN254Ew6dvKV5
	WO1VdB5ttc+b/mlTR2qzz4PtX6OkHDwH4WcFWRz8m2ZXlK+KDOzqVxOX/j2SwcT6
	GoCo04fe5S1s/2AnuOtLr1qR2/4qXDB6woyiEiZODrk/pJJM2KWlmXqz8HYkaEqc
	stwlQw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg3yfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:47:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b60992e3b27so9568189a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525239; x=1761130039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jyhIXaZyVu1vjZr+AhCvbj4p9RRg4EuzAX/ftNllyA=;
        b=oAu7/2uBnHiv2AAXihd4LezXUWXpr8xg/L1GKXRfjcT8Qun8Xbb9TVVtKV+eFDk2en
         zo/X2Wp2/DcPem1e+ehXYodPbEw4ylQhdEqxakCVewHlHaob+C2N/mqhS1Fe/pwOf6AA
         Xx/B8NZtqAqJHlHX1s2BN06tvznL9q7YR0BrUAmu/5wIvG9bTh6BVdc4TwgDmXsmYnUQ
         ZaJbu3kFnlHkAmdUZ1UNy1k+ulJUI9Yta4iTlJbqH9JBeAcKxzWMhpxhsDwMqrsh2a+C
         aRuhyaY9JFD7Nl2ZtjIgGWQTj3JDdJc6mbI6JnE62QnjH1Xyzz4eBoDrrcs8FH7GYBld
         kzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZvfc0qQ+oV7/aXIWJdGmG76FhlWiaYI01YJnrAbnompK6vv+8c64EN+aj02n9YhgNly124pqhAYZuOoM@vger.kernel.org
X-Gm-Message-State: AOJu0YxrHiMuBxytktCpuLeg7NSWVwjPbG0ij/Qa18ItVR3wncg0w08U
	JBE4LYz95oTmbkPWQgHht3Cw30pK1i3WcNMRpiLYR0tkS/NtMUwM0YrqW7Z0A/Iiam5Y0B7bGGp
	z38FSoGWl226bzVp1gbO8JAa9sSQiRdmTSClFNsEHFcrzjzUTxdu261aRXbV7X6PyzSRS
X-Gm-Gg: ASbGncuLC/G7xWo/hN5FxQzUcu37/I2GT2VsuKL1RbBZBmIXEnoN59Te7REpwXaPTSd
	SBu2vqN2r5rwZk4LcmVtZgnWtihOz0msmBbDgQb6YmF+ZRlWCmee2lOEXJhO8VGV2bwKLMC6Ft+
	fojykDno+nc+QVCIuaT8ltEqFEVbXojlohZexW8HyhfEtlUuPG5p0UV1/UeDOGJ5QxD8KIqwYsh
	VGBrt4kSbwtcqCwRiGQbrSRjGtBA9CqKR+ibhlREF8pybCSNBEsE2ppseDrt3687V46U/GmAK6S
	F/v6k1s19pVOX4pUdohO1U1ljUg9ihcO2w5pFOU5rEwshW8mNX31wp1FXBcknErBqPKkMeRJ
X-Received: by 2002:a05:6a21:7794:b0:334:912f:acfa with SMTP id adf61e73a8af0-334912fcd16mr632542637.56.1760525239408;
        Wed, 15 Oct 2025 03:47:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIEMUhmvkmMQ7AQcHeMmduK0Dz02ZbHlXUBpApGcjOnAKPUnyrSve/YQwVmvSweGwvIVOo0Q==
X-Received: by 2002:a05:6a21:7794:b0:334:912f:acfa with SMTP id adf61e73a8af0-334912fcd16mr632512637.56.1760525238884;
        Wed, 15 Oct 2025 03:47:18 -0700 (PDT)
Received: from [10.206.107.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52937898sm12711791a91.1.2025.10.15.03.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:47:18 -0700 (PDT)
Message-ID: <9e59d1dc-5805-4cd2-9a65-f3f0f45526d0@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:17:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Srinivas Kandagatla <srini@kernel.org>, kpallavi@qti.qualcomm.com,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
 <75433294-4c47-4f4f-9de2-ee29af01f021@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <75433294-4c47-4f4f-9de2-ee29af01f021@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX5nGirG5T8RPJ
 PCRYyFMvEzSMwMC8NsR1YHIfC1bFqzab0+HFjR8bnCitj5DobOQ0svtmUAw+0L67q83hQqosV7N
 xUhQIjjgYKtUZXK8gUsm3aKcIWXc2Lfad2W8zxpCqXrAd6WBRr94DMBSDPARUV8vyEU8P+tP2Nc
 l5XceGiKo6qcE7wvLi6IXiuoYrMKOgJ8N90x5VLdmLIOTA/jfBBAQhSRlOx8ojHvWMQRnvTRzxN
 dUAQ+W4oByWtNvyqHM1MuhUWShrQOCBgPJ/3qKPpdN2qFRdRrOxXtG1YIqWzNkyVDgMXC0eOfAv
 b5bb4gknHKnlmkCrQMzME7cvvRkMEFG875aLu4VvT8SsZGCsRJNLdLhKyvhp6WvwARAjzR+a3sF
 1UhxoBxxxRr0ka2k0qa5TehVUH4sQw==
X-Proofpoint-GUID: TDtIcmntShHgDIA9DJJrnbKrRapwCHls
X-Proofpoint-ORIG-GUID: TDtIcmntShHgDIA9DJJrnbKrRapwCHls
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ef7bb8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O6bt6N2DZ8TKcyxEHvQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025



On 10/15/2025 2:22 PM, Srinivas Kandagatla wrote:
> 
> 
> On 10/15/25 5:57 AM, Kumari Pallavi wrote:
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, set SID position to bit 56 based on SoC-specific compatible
>> string from the root node within the physical address; otherwise, default to
>> legacy 32-bit placement.
>> This change ensures consistent SID placement across DSPs.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 59 +++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 52 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 975be54a2491..1a5d620b23f2 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -33,7 +33,6 @@
>>   #define FASTRPC_ALIGN		128
>>   #define FASTRPC_MAX_FDLIST	16
>>   #define FASTRPC_MAX_CRCLIST	64
>> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>>   #define FASTRPC_CTX_MAX (256)
>>   #define FASTRPC_INIT_HANDLE	1
>>   #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> @@ -105,6 +104,15 @@
>>   
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>> +/* Extract smmu pa from consolidated iova */
>> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
>> +/*
>> + * Prepare the consolidated iova to send to dsp by prepending the sid
>> + * to smmu pa at the appropriate position
>> + */
>> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
>> +       (phys += sid << sid_pos)
>> +
>>   struct fastrpc_phy_page {
>>   	u64 addr;		/* physical address */
>>   	u64 size;		/* size of contiguous region */
>> @@ -257,6 +265,10 @@ struct fastrpc_session_ctx {
>>   	bool valid;
>>   };
>>   
>> +struct fastrpc_soc_data {
>> +	u32 sid_pos;
>> +};
>> +
>>   struct fastrpc_channel_ctx {
>>   	int domain_id;
>>   	int sesscount;
>> @@ -278,6 +290,7 @@ struct fastrpc_channel_ctx {
>>   	bool secure;
>>   	bool unsigned_support;
>>   	u64 dma_mask;
>> +	const struct fastrpc_soc_data *soc_data;
>>   };
>>   
>>   struct fastrpc_device {
>> @@ -387,7 +400,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->dma_addr));
>> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -437,8 +450,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>> -
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr, fl->cctx->soc_data->sid_pos);
> 
> deleted an empty line for no reason.
> 

Ack.

>>   	return 0;
>>   }
>>   
>> @@ -682,7 +694,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>> +			      IPA_TO_DMA_ADDR(buffer->dma_addr, buffer->fl->cctx->soc_data->sid_pos),
>> +			      buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -731,7 +744,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->dma_addr), size);
>> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
>> +				 buf->fl->cctx->soc_data->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -786,7 +800,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->dma_addr = sg_dma_address(map->table->sgl);
>> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
>> +				 map->dma_addr, fl->cctx->soc_data->sid_pos);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -2283,6 +2298,19 @@ static int fastrpc_get_domain_id(const char *domain)
>>   	return -EINVAL;
>>   }
>>   
>> +static const struct fastrpc_soc_data kaanapali_soc_data = {
>> +	.sid_pos = 56,
>> +};
>> +
>> +static const struct fastrpc_soc_data default_soc_data = {
>> +	.sid_pos = 32,
>> +};
>> +
>> +static const struct of_device_id qcom_soc_match_table[] = {
>> +	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
>> +	{ },
>> +};
>> +
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>   	struct device *rdev = &rpdev->dev;
>> @@ -2291,6 +2319,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	struct device_node *root;
>> +	const struct of_device_id *match;
>> +	const struct fastrpc_soc_data *soc_data = NULL;
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (!root)
>> +		return -ENODEV;
>> +
>> +	match = of_match_node(qcom_soc_match_table, root);
>> +	of_node_put(root);
>> +	if (!match || !match->data) {
>> +		 soc_data = &default_soc_data;
>> +		 dev_dbg(rdev, "no compatible SoC found at root node\n");
>> +	} else {
>> +		 soc_data = match->data;
>> +	}
>>   
> 
> I think you will be better off moving this to below helper function,
> this will simplify the code to:
> 
> soc_data = of_machine_get_match_data(qcom_soc_match_table);
> if (!soc_data)
> 	soc_data = &default_soc_data;
> 
> ------------------------>cut<-----------------
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Date:   Sat Oct 4 15:09:46 2025 +0100
> 
>      of: base: add of_machine_get_match_data helper function
> 
>      There are atleast 3 instances of this code in drivers, add a helper
>      function of_machine_get_match_data to avoid code duplication and better
>      error handling.
> 
>      Signed-off-by: Srinivas Kandagatla
> <srinivas.kandagatla@oss.qualcomm.com>
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 7043acd971a0..ac4b965f06b6 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,32 @@ bool of_machine_compatible_match(const char *const
> *compats)
>   }
>   EXPORT_SYMBOL(of_machine_compatible_match);
> 
> +/**
> + * of_machine_get_match_data - Test root of device tree against a
> compatible array
> + * and return data associated with match.
> + * @compats: NULL terminated array of compatible strings to look for in
> root node's compatible property.
> + *
> + * Returns match data if the root node has any of the given compatible
> values in its or NULL if
> + * compatible property nodes not match with compats.
> + */
> +const void *of_machine_get_match_data(const char *const *compats)
> +{
> +       const struct of_device_id *match = NULL;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(compats, root);
> +               of_node_put(root);
> +       }
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);
> +
>   static bool __of_device_is_status(const struct device_node *device,
>                                    const char * const*strings)
>   {
> diff --git a/include/linux/of.h b/include/linux/of.h
> index a62154aeda1b..4d6792abf5f7 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -407,6 +407,7 @@ extern int of_alias_get_id(const struct device_node
> *np, const char *stem);
>   extern int of_alias_get_highest_id(const char *stem);
> 
>   bool of_machine_compatible_match(const char *const *compats);
> +void *of_machine_get_match_data(const char *const *compats);
> 
>   /**
>    * of_machine_is_compatible - Test root of device tree for a given
> compatible value
> 
> ------------------------>cut<-----------------
> 

Ack.

>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2343,6 +2387,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>>   	data->secure = secure_dsp;
>> +	data->soc_data = soc_data;
>>   
>>   	switch (domain_id) {
>>   	case ADSP_DOMAIN_ID:
> 



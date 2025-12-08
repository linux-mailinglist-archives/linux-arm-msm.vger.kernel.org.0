Return-Path: <linux-arm-msm+bounces-84636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47DCAC533
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 08:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA4A53050BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 07:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6CD2459D1;
	Mon,  8 Dec 2025 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nypYuYi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdgSjgZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18E22D4C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765178788; cv=none; b=RR6RdG3UIQZjcuvqrnnYZLANjPhGcT2msHcvFBRegEAEpXIIDOU6+z5wtdholPjjmbe5aHBVx4G/L1vUmgR+6o3KZS6QK90lZkXQKYCw6wU0HtAtG1QTf9bfMILc+BYuKokYXaKPj8NOcGw9cqRXfhL9Jm6AZ27AWY7p+hNtBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765178788; c=relaxed/simple;
	bh=ksmgttzQLFh3OuBHy84l3+sgG/orybEsGuEn+HuOuQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swCXA2E5dzvuqPumVclsHfboBCcRPPAqvdmTKgjiSCrt6s5E0oXFZfpsk7PR+QV4TIM+eHAbxALUlgMy8IbZkn3ReaAp/IwxLTSvz3bqxRTpjF8qhLwKe/3+F08v1xZjaP2/ynT3uC8O28vve/E6Qs/FCsc8A31olL9IiFyBFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nypYuYi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdgSjgZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7Murcg2928399
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 07:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2h/9s5/6yuANhhb+4rM83nToq2nw6PNRAP/thpKEdn8=; b=nypYuYi2PJkd/rEX
	SXLNA4AiYWXHklByR+7kfPQ/uytnZYtZ4hD97v4CqeAiNAzxwlY4bfWibsrMlmUY
	+Qc/o0Swz7Ras2QRZgVNk56GHoSSd+RcHd78XSU7Ldq6RRpYAwmbBEEgox+HU2/r
	/QsnqR4w0Bia7OgFjBi3RfcQR5LGlcbELwfZFjDbap+VRbwiBfggyGxmQaBay5cd
	jnSYK+ITDVz7Eyd2ANhYuLZ/JCFvOOA5aMCK9hPcffJc2ofUS7hOiJfQYd7gzp/B
	AaUM63NoEPwupv9SC/fbvA56tH9wQ4tRo2MZGo0y8bPP8V7qXEYKVloIuyv3TVAV
	OESPsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqs1cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 07:26:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437f0760daso8185979a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 23:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765178785; x=1765783585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2h/9s5/6yuANhhb+4rM83nToq2nw6PNRAP/thpKEdn8=;
        b=NdgSjgZknqhhYUvLpdWYEPAtm2BDmR4knqf0F9RbAk5gOVLF1sfGchMd7swiZSnAuF
         a5pdwJzVidqYg8vzynUqlUegN2w1ONdnMSNVSvbNuS3vHxgCBuIX+Tm3TZIKpY/XnA04
         Zcj/LYwyo6S6VmFnR+0FRak9PvC3VWkl3n5AM2tCq/B7xr3jI0bepjxjcF2ivaQGZVbr
         G9k15Ygx5RYU0XczAQqfegzGr/nWd5y/t7avNckjclzRCQTgElfI3kK0/S28bNRCG/vb
         BKR1ucQobQdIQhOedxnj2afuX2RvR5O5mQmYWVbXo0Y08hCRD/3dr6n7Z5rTAxHBkeR1
         1+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765178785; x=1765783585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h/9s5/6yuANhhb+4rM83nToq2nw6PNRAP/thpKEdn8=;
        b=fhM4JVArsXibuerapbAru1IKd8kux7tCs0av1/nbUMdi5uQlGw+tzAv6QMaQVBoyBP
         4TAgdll5Wk0JZyzSkd8olks4h2AtGOWSIjjn6XL9V4AdMJ/FMXo5DtlSZBiMfsaq/KJb
         FurljITjN+gqK578OvjuScyM8Kfgtc0pU5R4sjK7W+hORK8Fo4fVjPy+30TWKoU17yym
         7CCVCO4X1Z5ARUkgBJsquDxIH7Lb9dfbkvRV06QzC5bg6YSdXymUnecQWqdc4PQeWECA
         6QX5DSlUmGnotFHmROmWXQTKWtHi1hEXsujq7EoKRq1sAC4kRbrYGb/HvCkUg8rpk3tt
         K//w==
X-Forwarded-Encrypted: i=1; AJvYcCWIdkEJR6PY8HsKtV0c1HhpN/T3F1eMD5ILUjkzmW6ceDAcg8KwR52yaP1DAmsv7NAe/mbJoyiCn92+mY2f@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgQ0iLhfVCHRWbXbZ1ZpssDSkpZmnKSQmAzwRW9b5N+NRIuqI
	5mIpd9YEBHwRZDJXBeO+S92i0+J7k15ALoMelTic837f7KnXwhNbr3XR0dpQcsffo1Bm/mWIb5b
	AFX1zWvy8V+UOCgJ8UuPxLN5Ykd6MSdbCtXpxiO8u6FoZldr3eI7nTNI39BpuhLb1D9+t
X-Gm-Gg: ASbGncvIit0d1v9aEbzbwVK9cn1iwoO5wjviSAVsBHJAwPxHiWukZCFrUluV13uRx4W
	qzC7HAIU/cyM3AJs/5/vdz1cfYQ6oODxdux4vIgbHfCvrvIZ03GsLRzUAIS6E1eu8RGkBA/ANrM
	1Ymq/WXPEJhU/jAvIgJwFQKqHpC5tjP1ushRBR0TukvX91kfH+rJaPHYtB5Z0KeYx0Sq6dekDoI
	LJ57iI95T5EVQ9xqBOiXdUZMnsvP9lSR5NYOhau3Dch9v4c+0YnPKSDZ8lSZTO6pX0jptxP49ah
	KwFS9kYOaQJ18pisM+fnnR8bGLRyWCeaQ0R6cicZsEcH61g9AEfJcPKQmbohZh6vkoyiSgIM5kV
	3Zc5QOpiVuoT7jukZaVKy2UN635DY9F5PuxiiV2qQ
X-Received: by 2002:a05:6a20:1611:b0:35e:521b:f488 with SMTP id adf61e73a8af0-36617e6fc2emr7346569637.25.1765178784737;
        Sun, 07 Dec 2025 23:26:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvKeeA4DXCmYUvwrhih0Cu9+rs4tlldWdh2NkFE2P+F8QEKjsONEnnopM4FdT0qAkXdvE1Pg==
X-Received: by 2002:a05:6a20:1611:b0:35e:521b:f488 with SMTP id adf61e73a8af0-36617e6fc2emr7346522637.25.1765178784199;
        Sun, 07 Dec 2025 23:26:24 -0800 (PST)
Received: from [10.204.86.50] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6b3csm113773845ad.101.2025.12.07.23.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 23:26:23 -0800 (PST)
Message-ID: <18c6b95a-961d-4544-856d-7dc08f7d5d74@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 12:56:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
 <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA2MiBTYWx0ZWRfX8qwu4aQAUVqh
 csdG6bI4lPNHgEWhPkr0ponLs/XqB9GdYFtzLpzjSwGSYwQsximqUBk4XIcvEMNFk/fSx9MdJwu
 5tglGJuOnxzdWmCT37QCXcWV8qG7mfgNnRdVV7kkly0t2ToOMMgIrujno0cmMt3pg3WYz2W4K7M
 tzDXg/C1sRC+nm75QWBHvjQEPEHoQeIbWBdQtqO+jYz7VAiyzomDMDv3BgXMNVRljvd6YE9Msu9
 Pqlkm4a3Y0klUz/TF3lEEGoO6ywZNf2DlrN5qQy7SyGQGtWKoI4e8Xdr8JvaIZOEMKMoPPPRUIZ
 LmODZpWxv0D1O7hZGzKeRGaNSZcH2dCcNdAQ7AJ+Y/3j6iac2ZX08BI+PGVr7XQ8YRuUa4CWyxS
 0RxjNXt4q10d4D8FP9lL9Oo+6Bt8vg==
X-Proofpoint-GUID: nceAmrdjqcX7_vYz_P4XOxVVt0o8yNYX
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=69367da1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Qodh5YlAHioYhAOXRRMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nceAmrdjqcX7_vYz_P4XOxVVt0o8yNYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080062



On 12/6/2025 8:00 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 02, 2025 at 11:36:27AM +0530, Kumari Pallavi wrote:
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, set SID position to bit 56 via OF matching on the fastrpc
>> node; otherwise, default to legacy 32-bit placement.
>> This change ensures consistent SID placement across DSPs.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index eb9501fe79bc..6a67daafeaa1 100644
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
>> @@ -105,6 +104,17 @@
>>   
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>> +/* Extract smmu pa from consolidated iova */
> 
> Nit: SMMU, PA, IOVA
> 

ACK

>> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> 
> GENMASK?
> 

Thanks for the suggestion. I’ve updated the macro to use GENMASK_ULL 
instead of the hand‑rolled (1ULL << sid_pos) - 1ULL.
The new version looks like this:

#define IPA_TO_DMA_ADDR(iova, sid_pos) \
         ((sid_pos) ? ((iova) & GENMASK_ULL((sid_pos) - 1, 0)) : 0)


>> +/*
>> + * Prepare the consolidated iova to send to dsp by prepending the sid
> 
> Nit: DSP, SID, PA
> 

ACK

>> + * to smmu pa at the appropriate position
>> + */
>> +static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
>> +{
>> +	return sid << sid_pos;
>> +}
>> +
>>   struct fastrpc_phy_page {
>>   	dma_addr_t addr;	/* dma address */
>>   	u64 size;		/* size of contiguous region */
>> @@ -257,6 +267,10 @@ struct fastrpc_session_ctx {
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
>> @@ -278,6 +292,7 @@ struct fastrpc_channel_ctx {
>>   	bool secure;
>>   	bool unsigned_support;
>>   	u64 dma_mask;
>> +	const struct fastrpc_soc_data *soc_data;
>>   };
>>   
>>   struct fastrpc_device {
>> @@ -390,7 +405,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->dma_addr));
>> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -440,7 +455,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		buf->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
> 
> Drop type conversion
> 

ACK

>> +				 fl->cctx->soc_data->sid_pos);
>>   
>>   	return 0;
>>   }
>> @@ -685,7 +701,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
>> +					      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -734,7 +751,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->dma_addr), size);
>> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
>> +						 buf->fl->cctx->soc_data->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->dma_addr = sg_dma_address(map->table->sgl);
>> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
> 
> Drop type conversion. Hmm. Looking at it, would it be better:
> 
> map->dma_addr = fastrpc_compute_dma_addr(fl->sctx, sg_dma_address(map->table->sgl))
> 

Thanks for the suggestion. To confirm: you’re proposing that the call 
site use a single helper returning the final DMA address, i.e.

map->dma_addr = fastrpc_compute_dma_addr(fl,
                                          sg_dma_address(map->table->sgl));
I can implement fastrpc_compute_dma_addr() as a thin wrapper that 
internally calls our existing fastrpc_compute_sid_offset() and composes 
the consolidated IOVA (SID in upper bits, base DMA/PA in lower bits)
?


>> +				 fl->cctx->soc_data->sid_pos);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -2290,6 +2309,14 @@ static int fastrpc_get_domain_id(const char *domain)
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
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>   	struct device *rdev = &rpdev->dev;
>> @@ -2298,6 +2325,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	const struct fastrpc_soc_data *soc_data;
>> +
>> +	soc_data = device_get_match_data(rdev);
>> +	if (!soc_data)
>> +		soc_data = &default_soc_data;
> 
> Define it for all the entries, drop if-check.
> 

ACK

>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2350,6 +2382,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>>   	data->secure = secure_dsp;
>> +	data->soc_data = soc_data;
>>   
>>   	switch (domain_id) {
>>   	case ADSP_DOMAIN_ID:
>> @@ -2487,7 +2520,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>   }
>>   
>>   static const struct of_device_id fastrpc_rpmsg_of_match[] = {
>> -	{ .compatible = "qcom,fastrpc" },
>> +	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
>> +	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
>> -- 
>> 2.34.1
>>
> 
Thanks,
Pallavi


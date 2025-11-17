Return-Path: <linux-arm-msm+bounces-82048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A1C62A42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F45E3572E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEA62550CC;
	Mon, 17 Nov 2025 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p45iE1sk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCImLTtW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2EA25F7A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362990; cv=none; b=r7lGdIm3psTAwCIx5W2Y9712NYlGsScHd6+EuAZaaxqmNrgYWiTlBvGcJ+Tt+8lSzfoSyIC9ufwbHI/xthZDDwLfMdIb1OaipnvBiRETBfNI2TCeBduu247hqAH972eKrTKzaTaAMa/WJ6nvxUEwn52tHAC3uPXGqfXs3UXoEFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362990; c=relaxed/simple;
	bh=bQIUv8Izz1fw/VOVTE6GyNu8EcLyfAHPLfWdr8X2H2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZoJtF0sf7k1Crf0RsaFPR/VppEcSrgPRjXS/1HK6W/iWPEx34JXjuACpvu4mjtGw4lH7HBKKLRDEoCGMmblbmiDl2t6KJahrriB9xEsuFRpJmeScuLmPocOuNLu9ol0icN0Fv8smbYchYOMfiQMmUdP5T4UJkS1MKwCHSSNI2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p45iE1sk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCImLTtW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4npRP2851524
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qII+zf/ExS1R3Wfv7ODK0uvd5zJdIQqQ3+eKaPpyEM=; b=p45iE1sk4oZzCoQ6
	2oCNDERpc6aL1p0Orj+hksG7eh4lep33UbHnWEH+m2fBHVnGN85dGEc5E/tGSglB
	QIobdrJJZDhf+b2Hl8m7NoZbUUvfpS5zIWEOHWxuL2w/C6qaE5cp08zccejfWJh2
	p4XIseKnINrQQ9w6tXijUIAXx+JPl08Mrvn/K1isDNJ15lbNDKf/zItRDtUdeP5M
	lB20KGThsaBdBb96JDluxEhD/oMkH0r0R/pV5Mv5axL+osbbZCSf2O2Ab8UX5Y5m
	DJ+JcbsPurdJ4cPFQX4pJbEdlMmLW0Z1IyX+c6sUUsZCGQtOl+noBxTEslXPN8kR
	XO4D3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0bnn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:03:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e66542afso134152395ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763362987; x=1763967787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qII+zf/ExS1R3Wfv7ODK0uvd5zJdIQqQ3+eKaPpyEM=;
        b=iCImLTtWITlpxKiO2aLreiYJ9rCtkMThxw3S+nLZqt/dTyxtEBOya5pva5j0Z6qoS/
         9/4GkU2cLPsTIdGALvXYwMZhrflBwSHggxNgC3YHM5aCultfA5Urjl6UArqgW0b+dMAk
         4eMA1aqRMvk78/fcd/A4noSodEHdtXknDZlKwdMQTz51SaoM25ppZJ90TSWCkgRjw3m6
         N5EL6VznI9nghzLblXlz/aBqVTMit7T7jTh8H+rpGe/T9JqvqKT7MbHwJmt/wDfq9rz/
         t1GT+eOfZzqenJFkADXfDlJeCytP9tAkyOg/pazpj8dicPbUZDQCQoAxak7/GedvaQ69
         mh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362987; x=1763967787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qII+zf/ExS1R3Wfv7ODK0uvd5zJdIQqQ3+eKaPpyEM=;
        b=jCFUh3bajFIx5QCcbiFVyj1xzXVGXhrv/5TQtJA6+EUlSxFLd6StagudlseSTTXP39
         Oo+i/5j2x58HGszg1ndzpcOIcevR5Paon2XdiWLrDhMKWhb+UU/iCCWJFdXo8xnVxjx/
         sOoM13ejo2VpbcJLEO6i5nw/tGnWr0iTEh9VjRtTVHkMwlruVpu7t+HG32cjpH2spXmu
         tXUdjuagmrIKH3g4nPcX8vLmPeX9llmj5PfwjtlVxpLYfsoxAcoOLVFgUSpNKkUDnpFa
         qO2VRXfojIAECLdVk5HZkXQOHS6lSIWnlWs3Ky+RxCO50EfvSFEbXTdYd3T8q4On9ylM
         8fWA==
X-Forwarded-Encrypted: i=1; AJvYcCV1mG6Mwb7u1uLX8Q7/1c3Aqht4fl+OlnSnVedfn43oz4xDLl+CvTh+NSYjkwA1/vAc6KlR8EmM47s4h8nz@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcHJAQMhk3fxvNUjleleqYsghMtY8uA1h/9rxJBaLcelM01Jb
	uXKweCTwUJmMXmCSS2SSxqmvZrwFanJIChEEbF8U3h/b4uAo7iAPne1z5aHN/vAfsfOLG9dw1gF
	epl+R6WVVWZN8I9Ebnnb5zzj9i0fg/dpwTlZiQ1zkUmkBfX9iagy4VxiWpuEmJ/2+YsyO
X-Gm-Gg: ASbGnctYb9q0pAlJJUFt8m/md8blf97fdU8A93PCU8DdRFfSxAkA/ZeoQ3ZtZpCn6//
	qKilSf9XrW2s35AeDjfGobL6xqJjVvLcZvGPPsiWOsehHsvrnDufFiOb1ID/elpNCeEJojFxq5K
	lYi39/Ddwuaopg6gmv7075RH4fYwkrO1Nofquyy0ZqolSo06Oet+72Dy/DaoYdsvIlkX2xaPIgs
	k/7bzAwn+Gm8g3PI3fcsO5xHdPl67omB0SI3Xt3SCWbaMCPgpuA8IYq4X0MiaKusMj2tTRZr3q2
	GPlpnMRjoPOyZZoK4AjFqlIeMsLDgMqF8aKTtLBnAYLqVMiMQ+NbWy2HPnrl1lTmE8GsZMc1VjR
	CpcCiRUjjCkOH2EARKrOx0b85+eDUbZQ=
X-Received: by 2002:a17:902:ce01:b0:295:50f5:c0e1 with SMTP id d9443c01a7336-2986a6d0c19mr134921115ad.15.1763362987031;
        Sun, 16 Nov 2025 23:03:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuYuxukvLZ6TIescHXSf20IFBxcChefEVmcORcYzEbAtfmXjA2tfVU4500MuQt0ad+uan6ig==
X-Received: by 2002:a17:902:ce01:b0:295:50f5:c0e1 with SMTP id d9443c01a7336-2986a6d0c19mr134920625ad.15.1763362986457;
        Sun, 16 Nov 2025 23:03:06 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245e04sm128321445ad.38.2025.11.16.23.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:03:05 -0800 (PST)
Message-ID: <8c59e08a-99cb-473b-999c-e7d08bc2124b@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:32:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Bjorn Andersson <andersson@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
 <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: czD43ey0dfoZI0fWcO4gc326BR6FXtdJ
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691ac8ab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AqClqBJQwO-Rircdwo8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: czD43ey0dfoZI0fWcO4gc326BR6FXtdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfXyg/gXFARigpE
 rgXYWhXs9DbZi7yb+JxkX9DB5pVLlX0uld0V24nZIP3p104BDOHM2o+Uk17Zfty20uuad6HgwM8
 QnguD7cbHAjtwLxXJ8u0md+ml3t0NYa+3IIysikrsPqVjG6EjvTuwGvq+ZhasTSIMWhD1xVMEet
 wFS9/M8MuTyfjKOWQRk6fUhGbdjMyJGb/f89w0kEblIR/4YuT8BuD4tgq+QkKJa9lnd+yQpB4Ki
 Abs9I7oX+vMAoY3nESmFchv6jWMFPU7CGcAHj+mhG4gjbM6zQzAbpZSRV8j3g/knlBlvgZssDzQ
 yhKC7av8HEeE1huyaIEwR7TftviTFFg5p+1mFzaCtXMvb83hepy/X9nMOmfRL2gRopp0SuFVGmH
 bwgwiq8IW/R1PcxAKP3Hlb8SaFPyYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058



On 11/14/2025 9:21 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 02:11:41PM +0530, Kumari Pallavi wrote:
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, set SID position to bit 56 via OF matching on the fastrpc
>> node; otherwise, default to legacy 32-bit placement.
>> This change ensures consistent SID placement across DSPs.
>>
> 
> In patch 2 I said I think it would be a good idea to separate the two
> perspectives (Linux/SMMU vs remote addresses).
> 
> Looking ta this patch I'm completely convinced that it's the right thing
> to do!
> 
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 39 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d6a7960fe716..bcf3c7f8d3e9 100644
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
> 
> This is a horrible macro. It looks just like a function taking values,
> it's named to sound like it takes a sid and pa and return an iova, but
> it has side effects.
> 
> And what's up with the ordering? Take argument 1 and 3, and put the
> result in argument 2?!
> 

Thank you for the feedback regarding the macro implementation. I 
understand your concern about readability and hidden side effects.
To address this, I’ve replaced the macro with an inline function


static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
{
     return sid << sid_pos;
}


buf->dma_addr += fastrpc_compute_sid_offset(sid, sid_pos);

Could you confirm if this is in line with what you suggested?

Thanks,
Pallavi

>> +
>>   struct fastrpc_phy_page {
>>   	u64 addr;		/* physical or dma address */
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
>> @@ -390,7 +403,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->dma_addr));
>> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -440,7 +453,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr,
>> +				 fl->cctx->soc_data->sid_pos);
> 
> There's no way _you_ can look at this statement and feel that it's going
> to add the first argument shifted by the third argument, to the second
> argument.
> 
> Please write that is easy to read, follow and possible to maintain!
> 
> Regards,
> Bjorn
> 
>>   
>>   	return 0;
>>   }
>> @@ -685,7 +699,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
>> +			      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -734,7 +749,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->dma_addr), size);
>> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
>> +				 buf->fl->cctx->soc_data->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -789,7 +805,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->dma_addr = sg_dma_address(map->table->sgl);
>> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
>> +				 map->dma_addr, fl->cctx->soc_data->sid_pos);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -2289,6 +2306,14 @@ static int fastrpc_get_domain_id(const char *domain)
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
>> @@ -2297,6 +2322,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	const struct fastrpc_soc_data *soc_data = NULL;
>> +
>> +	soc_data = device_get_match_data(rdev);
>> +	if (!soc_data)
>> +		soc_data = &default_soc_data;
>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2349,6 +2379,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>>   	data->secure = secure_dsp;
>> +	data->soc_data = soc_data;
>>   
>>   	switch (domain_id) {
>>   	case ADSP_DOMAIN_ID:
>> @@ -2486,7 +2517,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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
>>



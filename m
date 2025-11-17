Return-Path: <linux-arm-msm+bounces-82050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73FC62A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 7790B23EF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C062874E1;
	Mon, 17 Nov 2025 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njJ0o/UZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WipSZTPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6E4315761
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363263; cv=none; b=PIOILfzK8y1M5LqZlE2KeLy70RMCG/ZeIhktNixI/dQyzhn9+4L8r5Pu4d+XyjZ9kTMaqx11hFWqZD5RiR0p1ca4x5RYvJwdzkKs+Qf70s5stVz9lT2oeAyU7xTFxPhZPbP08y/UPhEiPViDFwHM5VEhV6yoFW/yB8usv26Su48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363263; c=relaxed/simple;
	bh=5gNFCTGA+Tc/ZCoU0PdEGHKM8VBxUVz++3gIE8vJXGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lv3RWodnXZd4SS1AzruFRwzJL4tzgqQwPRtNwvDO/JctrG6+QlHaqZ8Ih7P6eJSaKYYfrtgOIixME8a9uFlRdJh/HSJBK9HZ/l+Wv1rmE2SNFfhYOrOW7luX+zRj2n1m9vU01qBi43B9SvfhPcl1ffuv4WkK7tE1tjyaKfzuXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njJ0o/UZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WipSZTPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4p6nx3192127
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+L9dKXUNJ/0YqqqeqxjRtTyQQ45AAju5TOgvH9J0mQ=; b=njJ0o/UZ+9ShrMnm
	i9x5L8kKQwqqxedY1NPVdJ1weBfATrA1hD23fBtmp1keh6LHzRMaqQtueXvGQ7fB
	T0UrGJ2dJeuGXNmWE+tFpK1CP659lasYZ1WCWUL2/6BqKYTFPV4Rdbo+/iAN2KJG
	L/2fQ6+DuThudvZHCFGeDY/vvSpoOI8D7DTq9Y3UMmsutyhc7zpkbxGstQJmZcpW
	7EMeUB9XhTVpnX9pn+4YUq78iWqSG29enmFRULKEJOSb0AtaK1Ya1QroTcQL0PCl
	/Jit4owggNVBIxxih9Au2hYzL72Vt+CO2F8d+nZU/hunufdhN929BO5IpHO0NSD3
	AkZeCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmbpvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:07:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so9701864a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763363259; x=1763968059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+L9dKXUNJ/0YqqqeqxjRtTyQQ45AAju5TOgvH9J0mQ=;
        b=WipSZTPsoEmS09B6zCF+fQDUy/O7hla4VBHNFLhY/KckZ8uBl/JL/XLL6MkNSd6Ne+
         5UITKWbvg97ga0fJByRBHm8B7w2qRTNUKN6PRWSoq9XK1Vc1TFs8cPA+In67f1s2TVz0
         n748xPdTmHOOJU1q7bPrSAgyjXJOPrdsVXI/2a1+5g5jKUzSnCqQA9kdAYvQqmtlu5z9
         8x9NBALQ6k+SMgK6YrQujWCaS4ZphvHvTayZAiRj0E5GtOVMe47wF+yUSYl4NIjvQq03
         AGkdxsA6MMh4DdoksTzLgIgkWFbJrNf0CUfRE5W9z/Ob2cEOyKsEiIBlG3eoRQzKwmkA
         uJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363259; x=1763968059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+L9dKXUNJ/0YqqqeqxjRtTyQQ45AAju5TOgvH9J0mQ=;
        b=Q9/53w+iu7lVJ6BS/sLGnrZ/IzrBJmPxwufX94wfEHvHEW/HgpxcozXpsznVA6Q2kL
         C4AkbjMxk+eVMaIQaSUR27DUPtPHarxOfEN5aZXheTiNAOimRoV1HyYgakvcWnwGdpWV
         L1zeRsS32O88WhNtPav6P3ozg04lU0GJIvFXEt/pXtKZS7uBnVilEjKaJFzdWmgIkNcz
         YmWTU46SDVk3EtspN7C8Lhgl42E00n63ZrF54pRbXu8t5yK406afZkAM+rEOIOI1i6nl
         fHCujmHNHZCPB3aaP1BNxti4jQPG//f4ZYkDPx346DF2qANHNMoQDC+/ENGFVgfprAqC
         KL9w==
X-Forwarded-Encrypted: i=1; AJvYcCWI/V4xe58FOPiLx9G03QQ3O8PFotrNj4Jj2XRz/EXdZ2QBitoXaKzqLV26tTdqW4aMvrlRmiWD8Z+h5W+5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj0dYXJWAGKCqbY4rpKujGoYvEuxV3bfbJNHEbzPeDF/zaIjww
	pp/y91z20rzxFPPqlVEHuIBEF3AnTWWYgw2tzTqzApH8tVHEQTlb7xuo/cyQAwkdfbuSxKHFjzz
	wO+eFI1XsX48y2i3VVXw6bieXcKNI2aNfKk7zH1ihqMww+3nQgNqNXSB70NVsXEjAeF7N
X-Gm-Gg: ASbGncuvCBaH9DNQnzAvUF4+ismO0XfGlMD0T01q/kpYoBKUJ4JSqawQGhdZGq9t8Dk
	pBpSCOq9DHjBJVPWwzkyPg9K+t5q3+d6IqRLpWZr2i2kJiGMdumnVMMMdwMT1WGXNFSpO73TtfD
	LY4Txs8MrpLAGrGhdn/bIAz2TyUwHehCH/rM+ELCw2wawoSn/3kVfELtLTSafriRJdwOBTyDLzQ
	R30AO9Xw7K85BMINNnkKS9nP+BcdCl2ikKyFecJ/2jE/WyzgzzUQGsnsbMplJrUlGb7mXCZAuKD
	Q7PcqRoBb5/Jx4aHgBU0LtcrH7lZJ/QcchQkfA8WQv3xl3bwE2efnCu4Jkr8A5jTyCeGRi7NF+f
	4+vAtfhs+xgRkbbDN6qYUtgfvM1hiKRk=
X-Received: by 2002:a17:90b:2e0b:b0:343:747e:2cac with SMTP id 98e67ed59e1d1-343fa761482mr12754858a91.31.1763363259470;
        Sun, 16 Nov 2025 23:07:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1bHDIuyMF/Gxb9CuZXRy44lstMx2jZjo5rsVIGCWOU7oyYLn01+2EDK0qIIevhMCmYZDNCg==
X-Received: by 2002:a17:90b:2e0b:b0:343:747e:2cac with SMTP id 98e67ed59e1d1-343fa761482mr12754813a91.31.1763363258869;
        Sun, 16 Nov 2025 23:07:38 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ea5f9fa4sm6266704a91.0.2025.11.16.23.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:07:38 -0800 (PST)
Message-ID: <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:37:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Bjorn Andersson <andersson@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6HdtEtuLnyWjt4pVnn49VwR1EboDIdxZ
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691ac9bc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aU0ChUNEQ9L6yK78W9kA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfX8Fash6AxwtqE
 UoTJZRwMS9tsR5/0NFMNdtWMTyZ5rTo042szd7WoDCVkdmY2+rYQAB0Xut5rjMpQeZupG02tXFP
 54Cq8ZvuqsNHMBrhBRvuEkgokHerJwkEn0TjcQzyJxnFt6/7lU/c6U9dP+lyoo6DbhJDg1YsEdl
 z7bjU1sta1l1fXVpbQxsChBkNedE4g7YpthbQGVwAfyhpYptgEO0MB8Wr6Ou8rgQHvfPF0XGJ/d
 s8QyCJtshQPXmWnKsH2YE4Xsma+jisgCWU62HzLz+8Yt9cfPi3L+YcuGfQR/Sk4KzILS1l1wS2Q
 3OCYPQWmHjPi6eTsVVyJ0LjRackwOROSqEBMgx+ocwNzU3thVx/NalFjYwxhqJs0WgIejLcrkqa
 CZ2XuxbDPkibuoXE5cCUWyeqmMvmZA==
X-Proofpoint-GUID: 6HdtEtuLnyWjt4pVnn49VwR1EboDIdxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058



On 11/14/2025 9:14 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>>   1 file changed, 40 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ee652ef01534..d6a7960fe716 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -106,7 +106,7 @@
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>>   struct fastrpc_phy_page {
>> -	u64 addr;		/* physical address */
>> +	u64 addr;		/* physical or dma address */
>>   	u64 size;		/* size of contiguous region */
>>   };
>>   
>> @@ -171,7 +171,7 @@ struct fastrpc_msg {
>>   	u64 ctx;		/* invoke caller context */
>>   	u32 handle;	/* handle to invoke */
>>   	u32 sc;		/* scalars structure describing the data */
>> -	u64 addr;		/* physical address */
>> +	u64 addr;		/* physical or dma address */
> 
> Can you go all the way and make the type dma_addr_t? That way you don't
> need to typecast the dma_alloc_coherent() and dma_free_coherent().
> 
> I believe it might complicate the places where you do math on it, but
> that is a good thing, as it highlights those places where you do
> something unexpected.
> 

While this not strictly limited to holding a dma_addr_t.
Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is
set, S2 mapping expects a physical address to be passed to the
qcom_scm_assign_mem() API.
reference-
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b

If you suggest, I can define it as dma_addr_t and perform typecasting to 
u64 wherever required.

Thanks,
Pallavi


>>   	u64 size;		/* size of contiguous region */
>>   };
>>   
>> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>>   	struct dma_buf *dmabuf;
>>   	struct device *dev;
>>   	void *virt;
>> -	u64 phys;
>> +	u64 dma_addr;
>>   	u64 size;
>>   	/* Lock for dma buf attachments */
>>   	struct mutex lock;
>> @@ -217,7 +217,7 @@ struct fastrpc_map {
>>   	struct dma_buf *buf;
>>   	struct sg_table *table;
>>   	struct dma_buf_attachment *attach;
>> -	u64 phys;
>> +	u64 dma_addr;
>>   	u64 size;
>>   	void *va;
>>   	u64 len;
>> @@ -320,11 +320,12 @@ static void fastrpc_free_map(struct kref *ref)
>>   
>>   			perm.vmid = QCOM_SCM_VMID_HLOS;
>>   			perm.perm = QCOM_SCM_PERM_RWX;
>> -			err = qcom_scm_assign_mem(map->phys, map->len,
>> +			err = qcom_scm_assign_mem(map->dma_addr, map->len,
>>   				&src_perms, &perm, 1);
>>   			if (err) {
>> -				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
>> -						map->phys, map->len, err);
>> +				dev_err(map->fl->sctx->dev,
>> +					"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
>> +					map->dma_addr, map->len, err);
>>   				return;
>>   			}
>>   		}
>> @@ -389,7 +390,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->phys));
>> +			  FASTRPC_PHYS(buf->dma_addr));
>>   	kfree(buf);
>>   }
>>   
>> @@ -408,12 +409,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
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
>>   	if (!buf->virt) {
>>   		mutex_destroy(&buf->lock);
>> @@ -439,7 +440,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->phys += ((u64)fl->sctx->sid << 32);
>> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>>   
>>   	return 0;
>>   }
>> @@ -684,7 +685,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
>> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -733,7 +734,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->phys), size);
>> +				 FASTRPC_PHYS(buf->dma_addr), size);
> 
> In fact, we invoke dma_alloc_coherent() above to get a dma_addr_t, and
> then we call map, unmap, and free on the lower 32 bits of that
> address...
> 
> In other words, each time we reference dma_addr we have that implicit
> thing that it's a composit of a dma_addr_t as seen from Linux's point of
> view (which is matching the addresses in the SMMU page tables) and the
> adjusted address that we use in communication with the firmware to
> direct the accesses to the right SID + iova.
> 
> I think it would be quite nice to make this more explicit throughout the
> code, rather than juggling the two perspectives in the same variable.
> 
> Regards,
> Bjorn
> 
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -785,10 +786,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   	map->table = table;
>>   
>>   	if (attr & FASTRPC_ATTR_SECUREMAP) {
>> -		map->phys = sg_phys(map->table->sgl);
>> +		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>> -		map->phys = sg_dma_address(map->table->sgl);
>> -		map->phys += ((u64)fl->sctx->sid << 32);
>> +		map->dma_addr = sg_dma_address(map->table->sgl);
>> +		map->dma_addr += ((u64)fl->sctx->sid << 32);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -815,10 +816,11 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
>>   		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
>>   		map->attr = attr;
>> -		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, dst_perms, 2);
>> +		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
>>   		if (err) {
>> -			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
>> -					map->phys, map->len, err);
>> +			dev_err(sess->dev,
>> +				"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
>> +				map->dma_addr, map->len, err);
>>   			goto map_err;
>>   		}
>>   	}
>> @@ -1009,7 +1011,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   			struct vm_area_struct *vma = NULL;
>>   
>>   			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
>> -			pages[i].addr = ctx->maps[i]->phys;
>> +			pages[i].addr = ctx->maps[i]->dma_addr;
>>   
>>   			mmap_read_lock(current->mm);
>>   			vma = find_vma(current->mm, ctx->args[i].ptr);
>> @@ -1036,7 +1038,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   				goto bail;
>>   
>>   			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
>> -			pages[i].addr = ctx->buf->phys -
>> +			pages[i].addr = ctx->buf->dma_addr -
>>   					ctx->olaps[oix].offset +
>>   					(pkt_size - rlen);
>>   			pages[i].addr = pages[i].addr &	PAGE_MASK;
>> @@ -1068,7 +1070,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   		list[i].num = ctx->args[i].length ? 1 : 0;
>>   		list[i].pgidx = i;
>>   		if (ctx->maps[i]) {
>> -			pages[i].addr = ctx->maps[i]->phys;
>> +			pages[i].addr = ctx->maps[i]->dma_addr;
>>   			pages[i].size = ctx->maps[i]->size;
>>   		}
>>   		rpra[i].dma.fd = ctx->args[i].fd;
>> @@ -1150,7 +1152,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>   	msg->ctx = ctx->ctxid | fl->pd;
>>   	msg->handle = handle;
>>   	msg->sc = ctx->sc;
>> -	msg->addr = ctx->buf ? ctx->buf->phys : 0;
>> +	msg->addr = ctx->buf ? ctx->buf->dma_addr : 0;
>>   	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
>>   	fastrpc_context_get(ctx);
>>   
>> @@ -1306,13 +1308,14 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   		if (fl->cctx->vmcount) {
>>   			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
>> +			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>>   							(u64)fl->cctx->remote_heap->size,
>>   							&src_perms,
>>   							fl->cctx->vmperms, fl->cctx->vmcount);
>>   			if (err) {
>> -				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
>> -					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
>> +				dev_err(fl->sctx->dev,
>> +					"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
>> +					fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>>   				goto err_map;
>>   			}
>>   			scm_done = true;
>> @@ -1332,7 +1335,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->phys;
>> +	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>   	pages[0].size = fl->cctx->remote_heap->size;
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>> @@ -1361,12 +1364,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>>   		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
>> +		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>>   						(u64)fl->cctx->remote_heap->size,
>>   						&src_perms, &dst_perms, 1);
>>   		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
>> -				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
>> +			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
>> +				fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>>   	}
>>   err_map:
>>   	fastrpc_buf_free(fl->cctx->remote_heap);
>> @@ -1455,7 +1458,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>   	args[2].length = inbuf.filelen;
>>   	args[2].fd = init.filefd;
>>   
>> -	pages[0].addr = imem->phys;
>> +	pages[0].addr = imem->dma_addr;
>>   	pages[0].size = imem->size;
>>   
>>   	args[3].ptr = (u64)(uintptr_t) pages;
>> @@ -1913,7 +1916,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   	args[0].ptr = (u64) (uintptr_t) &req_msg;
>>   	args[0].length = sizeof(req_msg);
>>   
>> -	pages.addr = buf->phys;
>> +	pages.addr = buf->dma_addr;
>>   	pages.size = buf->size;
>>   
>>   	args[1].ptr = (u64) (uintptr_t) &pages;
>> @@ -1941,11 +1944,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
>>   		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>> -		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
>> +		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
>>   			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
>>   		if (err) {
>> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
>> -					buf->phys, buf->size, err);
>> +			dev_err(fl->sctx->dev,
>> +				"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d",
>> +				buf->dma_addr, buf->size, err);
>>   			goto err_assign;
>>   		}
>>   	}
>> @@ -2059,7 +2063,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>   	args[0].ptr = (u64) (uintptr_t) &req_msg;
>>   	args[0].length = sizeof(req_msg);
>>   
>> -	pages.addr = map->phys;
>> +	pages.addr = map->dma_addr;
>>   	pages.size = map->len;
>>   
>>   	args[1].ptr = (u64) (uintptr_t) &pages;
>> -- 
>> 2.34.1
>>
>>



Return-Path: <linux-arm-msm+bounces-75533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11EFBAB650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 06:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E25216953A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6FE25F78F;
	Tue, 30 Sep 2025 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9ru2ksC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1BB24EF76
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759207433; cv=none; b=sTkGRSo7xplok0QjZ8ngsxnOLVNmP3ml3ulCktXSuz5sHcdmyx9Zv9KXaMRFjo14r7cgUXmcAQpzyBXX/xuKoEZHBqeJElmyM2kj2x/6+SH7gIMuboYigzFVVQug4utTmjhFhEYhc62OcX1TsJyzJxqnHJIHmbPAElGyimZvGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759207433; c=relaxed/simple;
	bh=j8q6uJl5fy6jJeLuXaWYMOkAuH45bCKK6J2wa7jnI7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZnKQ80GKx/Tpcd7KchVhjTIGQ+oNXrgWG04ettnIL0Tq7sEOx7t2YzlqS0/8Q3fMun8YqrPmzMv1zM+LPKZWWqkt0jZ2L5gH4/KBJzGUPY+gCOiaWxTwMLVLj8JziV7+U+6mf2xkZcCV/kV5C5oDhPZvRiKdCIUZOKB08AU+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9ru2ksC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HPp4014865
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HE/PwEw34TV6LP8lhYgK0e9HeuAiGSOeepZM8oUrj6E=; b=M9ru2ksCa1GEFU8c
	1feiQsJ20gekJQg17XQxfryuD1t1nHSrR5pKllm98O4v/Q2XmPwIKj8CzR0U3+Wa
	3G5kJGcMGs/O2pDd+Jv6OisWa5PyKEpAwkCAiUBz8NZmdh6wFTO7SpmLPneyQ+zU
	uirrFtxI6LxVIgKNYVMJiouhcgB5SI5PS9TIVa5jin8S2ZIkqNWhrhDo7yo/Ze4L
	arTeFz09TtWaBjMntt6wDTTR/U4d4l4c9xYAUB9bBk2oATJRNx1ak/2g53ZNyR86
	XvAA9IwgFb8OXyNCM0qH4CWdrfE81aZSftCbt3sddqW6KQlFDAcHiq1ghY951LoZ
	XtCeUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqyncp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:43:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78108268ea3so4017511b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 21:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759207430; x=1759812230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HE/PwEw34TV6LP8lhYgK0e9HeuAiGSOeepZM8oUrj6E=;
        b=Xpb2SWUYUWgCP6d4Z6E2Gmr1mlscSU/y3yuQ4RpA1u+ooR8Sq46TrPu4CBjzGswjvC
         8/OVO9IH/bINi8Ymu2HdqYdtKIcRvyFavj1lQ9ysdvrNW31iW3MZDsI8STRkFfbKyC8N
         nN8+c3X1mG+Cw0Cxchk0ac5Ab/aNJhHc1hW/03fHZpmh7z2wKTjTmo9dm2L7OOdCIhex
         x4reiSXYmBAYTstcclZzYUwJriUH95cE+ZCDns+8uNi5q1njHfHOKC9Xa6kMilncBlU7
         pZxwJNLRTlBljctXNiKRvcpbkzLehQMSmTnpXOZqnaqH+2HABzftPEjuiZwCx1L6jWeg
         MEow==
X-Forwarded-Encrypted: i=1; AJvYcCX1FT44uH0iW2dzye7k24m+tp9OSzH6N5TZz0n4e3aaqHrsRJELdWnYJzK2cBeXd7N7c3Oh924V3ZpkOOav@vger.kernel.org
X-Gm-Message-State: AOJu0YzSINPQnaWNy5tsKkyhRgxD9BXEHWb+70jVgihbzRvdZWgp8kah
	DWrndgQQ7AtMTFFlGA49Rp86O2PG/g7hu9a9LX9z62Ewa6Tj0vLy2miNxEd0VQ36c/MJnwGIWD+
	8lXH8Z4GOp6Ro/swB3VE6SC3ROwhz3tWwzhiPt7RyswQH/tVOsLHHJ99joU/y8wsJxRVT
X-Gm-Gg: ASbGncu8UhcQMPzyRrEhZqLPbmvTUlfLNje5RHJX35cm6J73fo1IXfmjcbs+gzhLfd9
	PgEl2iNSnBGAqYO9RCWfmCXs6zB/Y2qZ+xOH5k7iUS/r6RDMy4tAgvSylOdahiD72xkkhOUm+d9
	++doHHwuUCKvy8y59UrELbMmE0HzT91OT0HgpwrN1fxBHH5PpBNMUqP/nbNigHAx9ocb9i7oBE9
	gu9sqOzUq/FQuaPE1zSaQS47QbLPVGVxHZYeViGpKSvU/rG77opqFgYLFidpMJvusiBfmR1AQDI
	jQjO0YZ/xpNkfcXwkcmlxQf8fuWFqLWEtKmT4rLyk6RifXq5JzTYD/ORrbS/dFquUHwsawA8fBP
	p
X-Received: by 2002:a05:6a21:3290:b0:261:ed47:c9b5 with SMTP id adf61e73a8af0-31766f0f15dmr4276720637.13.1759207429950;
        Mon, 29 Sep 2025 21:43:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcw5Vnw0qMjbGYrHmXkdhasUR0s98OUAwY84goAdi/+syAZPhKj4afqVsIm4XzxONViobouA==
X-Received: by 2002:a05:6a21:3290:b0:261:ed47:c9b5 with SMTP id adf61e73a8af0-31766f0f15dmr4276665637.13.1759207429205;
        Mon, 29 Sep 2025 21:43:49 -0700 (PDT)
Received: from [10.204.86.68] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c557418csm12593166a12.30.2025.09.29.21.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 21:43:48 -0700 (PDT)
Message-ID: <cdb8f84c-ed62-48ec-b7ce-9744a80e56af@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:13:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
 <42ge3imptxp46pltqhktrptm6paivhmhooyehc7zigfdlk2qea@zi5ulbgtvy5h>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <42ge3imptxp46pltqhktrptm6paivhmhooyehc7zigfdlk2qea@zi5ulbgtvy5h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HLuXJ82VpPPYG0WE1MMTZiWhOMq9GvqQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXw8GIRgb7/H1p
 ank38PIKPRIijTx5chUw+U0IhhBSUcmTCiQV2AxxCjnorsA60HTiaNT+A2E7QggkTTNpDalN/fP
 J+qcOWmjgUdSTP2wRDHC4FpMuav/wg40EIOWuyIl7Xr5jVS6tTDVp3jE6ZkWTOIvkWRnAZkkYbR
 XObDf5dzHzRRyAHMGwSj0hDQCY4MqYla62p51aUTp0V4MvCAk24RWUEj7rOTRqs6gsoH307/FHA
 1/2+CVTy0XRuwCSRQJEdu7+Ch6a0Jtf36L0BtnoBEev7bqNADcFkIe3GU3nSLLDJRzUKN4g/JcU
 ByspmQ9XVLTpfBoaj6HmDPF53dVqnywa1rNtp6+2XxJlmjrMXvhNQBpIDwgpwlf0KtrhJmPoQOF
 qfLi5GeLmRTQRcTNJJ7cXsnx+SaN7A==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db6007 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AqClqBJQwO-Rircdwo8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: HLuXJ82VpPPYG0WE1MMTZiWhOMq9GvqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017



On 9/25/2025 7:55 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:46:36PM -0700, Jingyi Wang wrote:
>> From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>>
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, add an iova-format flag which determines the SID position
>> within the physical address. Set SID position to bit 56 when iova_format
>> is enabled; otherwise, default to legacy 32-bit placement.
>> Initialize the flag to 0 and update to 1 based on SoC-specific compatible
>> string from the root node.
>> This change ensures consistent SID placement across DSPs.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 68 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 8e1d97873423..db396241b8ce 100644
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
>> @@ -105,6 +104,26 @@
>>   
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>> +/*
>> + * By default, the sid will be prepended adjacent to smmu pa before sending
>> + * to DSP. But if the compatible Soc found at root node specifies the new
>> + * addressing format to handle pa's of longer widths, then the sid will be
>> + * prepended at the position specified in this macro.
>> + */
>> +#define SID_POS_IN_IOVA 56
>> +
>> +/* Default width of pa bus from dsp */
>> +#define DSP_DEFAULT_BUS_WIDTH 32
>> +
>> +/* Extract smmu pa from consolidated iova */
>> +#define IOVA_TO_PHYS(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
>> +
>> +/*
>> + * Prepare the consolidated iova to send to dsp by prepending the sid
>> + * to smmu pa at the appropriate position
>> + */
>> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) (phys += sid << sid_pos)
>> +
>>   struct fastrpc_phy_page {
>>   	u64 addr;		/* physical address */
>>   	u64 size;		/* size of contiguous region */
>> @@ -255,6 +274,7 @@ struct fastrpc_session_ctx {
>>   	int sid;
>>   	bool used;
>>   	bool valid;
>> +	u32 sid_pos;
>>   };
>>   
>>   struct fastrpc_channel_ctx {
>> @@ -278,6 +298,7 @@ struct fastrpc_channel_ctx {
>>   	bool secure;
>>   	bool unsigned_support;
>>   	u64 dma_mask;
>> +	u32 iova_format;
>>   };
>>   
>>   struct fastrpc_device {
>> @@ -391,8 +412,11 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>> +	uint32_t sid_pos = (buf->fl->sctx ? buf->fl->sctx->sid_pos :
>> +					    DSP_DEFAULT_BUS_WIDTH);
>> +
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->phys));
>> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -442,7 +466,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->phys += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->phys, fl->sctx->sid_pos);
>>   
>>   	return 0;
>>   }
>> @@ -687,7 +711,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
>> +			      IOVA_TO_PHYS(buffer->phys, buffer->fl->sctx->sid_pos),
>> +			      buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -736,7 +761,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->phys), size);
>> +				 IOVA_TO_PHYS(buf->phys, buf->fl->sctx->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -793,7 +818,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>   		map->phys = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->phys = sg_dma_address(map->table->sgl);
>> -		map->phys += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, map->phys,
>> +				 fl->sctx->sid_pos);
>>   	}
>>   	map->size = len;
>>   	map->va = sg_virt(map->table->sgl);
>> @@ -2153,11 +2179,14 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	sess->used = false;
>>   	sess->valid = true;
>>   	sess->dev = dev;
>> -	dev_set_drvdata(dev, sess);
>> +	/* Configure where sid will be prepended to pa */
>> +	sess->sid_pos =
>> +		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
> 
> You are using iova_format as a flag. Rename it to something more
> sensible and turn it into a boolean flag.
> 

Sure, I'll take it up in next patch series.

>>   
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> +	dev_set_drvdata(dev, sess);
>>   	if (sessions > 0) {
>>   		struct fastrpc_session_ctx *dup_sess;
>>   
>> @@ -2256,6 +2285,19 @@ static int fastrpc_get_domain_id(const char *domain)
>>   	return -EINVAL;
>>   }
>>   
>> +struct fastrpc_soc_data {
>> +	u32 dsp_iova_format;
>> +};
>> +
>> +static const struct fastrpc_soc_data kaanapali_soc_data = {
>> +	.dsp_iova_format = 1,
>> +};
>> +
>> +static const struct of_device_id qcom_soc_match_table[] = {
>> +	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
>> +	{},
>> +};
>> +
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>   	struct device *rdev = &rpdev->dev;
>> @@ -2264,6 +2306,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	struct device_node *root;
>> +	const struct of_device_id *match;
>> +	const struct fastrpc_soc_data *soc_data = NULL;
>> +	u32 iova_format = 0;
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (!root)
>> +		return -ENODEV;
>> +
>> +	match = of_match_node(qcom_soc_match_table, root);
>> +	of_node_put(root);
>> +	if (!match || !match->data) {
>> +		dev_dbg(rdev, "no compatible SoC found at root node\n");
>> +	} else {
>> +		soc_data = match->data;
>> +		iova_format = soc_data->dsp_iova_format;
>> +	}
>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2343,7 +2402,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		err = -EINVAL;
>>   		goto err_free_data;
>>   	}
>> -
>> +	/* determine where sid needs to be prepended to pa based on iova_format */
>> +	data->iova_format = iova_format;
>>   	kref_init(&data->refcount);
>>   
>>   	dev_set_drvdata(&rpdev->dev, data);
>>
>> -- 
>> 2.25.1
>>
> 
Thanks,
Pallavi


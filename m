Return-Path: <linux-arm-msm+bounces-84633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130ACAC443
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 08:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCDFD300B6A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 07:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F0921CC58;
	Mon,  8 Dec 2025 07:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeWKF68j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfqFeBHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72474BE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765177500; cv=none; b=lBM3Bx5+Nmjmfw51fGLRi79tIpNGZQGxhLcUs75kxwoEgKXSdA/T2nbXBlQUgouTRp93daQR+4XHRUEHdYU2qn3AZRW9zGc1n15LH7S72UasZE7FhV4SG8l98G3xZnxvkHK8752CZ3++AKNS8+EQY8g8j/yhE/MAS3dhfoamOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765177500; c=relaxed/simple;
	bh=NyGPQggKOw9qL9pkvluZ0L9NKyLKpnlf8eo1rG4t4AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWlZfb2rLbpkzQzIV7l3r+LSt7QQdfjCm8dRhood1jQiqPtKjw7RzI0E4B5oN3mr7nNbfTkBx29Y1EYvCrjqKLXW5bySkGFootFiE1oqHk/ZsgeOixHVM6Q1QenT4EgaHV4eOp1E/TpbnAzA3NXqGynGBmFsbhSmqPismFeOZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeWKF68j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfqFeBHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B843JqJ110183
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 07:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGaVPlF30fkBj2JVwi64KaI/aCwHZ13hN5EJA5rYn0s=; b=TeWKF68j4BUrPE8i
	MB4GCUuy2K+U9PxBHNs9VjbQfsR2vDbNGjJkh02rFWs1e+/ivrKlgQ+bJWlX25zj
	94T07y8hQjGMT92GMedbpJBbD83KBeoFDeBunvx7lxrfP6pJ6PhCbHcV8K6xVhF1
	QVXZMdyJzI9pZIGH+Mx/J7v79o1FBrLju0UQzcrYCpwsflME2/7b8hG9kJdtLDGW
	mCKn4KJAT14gvbstOnOEiH6vltuyIeZftfxeYxCF5WsDEmSm0/gqZ1ULEC9eJKB5
	6R8S4iuHeDxdxNHDnUT5Wo/qjqzMb0bRCcW0BTbRu/AyUx1YP0tgsZlxWQdqxl91
	bKyg8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awqabgdsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 07:04:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c240728e2aso7598762b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 23:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765177495; x=1765782295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGaVPlF30fkBj2JVwi64KaI/aCwHZ13hN5EJA5rYn0s=;
        b=HfqFeBHt8RaD1pMKnQSR/MXs6SEsxIuIAcHBxk8GbR1ShrGCEEvIt6uQS7ay6/p1tx
         5Dudt4/wm2ZEVBmKf+KsIpHT9uXNA0tv4o+WK+lNn3dTelAX3RF3dYj1Crbo0KXCWw2J
         cTCy/2D0GtAOrVjxj4aW/5vlzUVTWvNQcrycHmDhaC0qvs9fcFXOIh+eFc/KD9nJgx5t
         lH5OlBPLsJ8l+5k2zGsASgNJ5FpWhVy1pxRCiY3qkt0OOql/1UXou5xLkRsU7oRb8pBa
         evUctwRVszxO2edXo7ctHsw0QYI4EGRIL+Qlsj+jSDP3KJx5I64pTW6H6nkO/iIWow8A
         zPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765177495; x=1765782295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGaVPlF30fkBj2JVwi64KaI/aCwHZ13hN5EJA5rYn0s=;
        b=u8SaFFfcmhfdethGweUUC1d7/kR5UVhnICoY1bxzqEHpQWXkPiLHdLgI2zPhZrsN4A
         Kn4kTQ5H99XlxOH5j0nxNfg8X4PDp/iJaH5MXc8jJ0PqFX8ptZWwGkrAK2ncv8gvWwKY
         WBKLxIxT8i2SMdZ/mlyWuDSqoj9milk5wbAFEq2f43J00nUM78rc6+sI0pdt4vlB3Y4h
         j/76mL9bfsD9k/kUbZxrsbZSWuFkvFeKvcFVtz2Zo+9GFUrEoDIHf76JokoQYxqi6gUU
         1k3+c6Rtnz2hOiufHDu7OdZY4+b475KzuNOyF0vatzzlo5RzjKUZWQGPajrQinJ1BNOV
         GZBg==
X-Forwarded-Encrypted: i=1; AJvYcCVRDncbgJY2jMxJB6PT9w1UuwyJSz2mlVkbVlQMHdPAJUKAYXXG9oA4ZZa9tBmY1v6/VwuiR30orIBarB/+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0mSPRA+kp043koo0SSTHvpRCnJbOtC/D+B8MSb6HKnT7gdpW
	VMbPP+JKaq04smuv0HySWNId9oYatpL/Sf3BUEqkWN7WzuAtWLXmZthGe018RMg9dqqQPAsiRW1
	+BiaKDY+fOiNVoT9nVIRzuWlUDb3Ot+Ke/GfGDZrd784FYnPsYVLt4nKDXgrt6xkalFf7
X-Gm-Gg: ASbGncvcECvc6Tq3Dk4Nw/co/qfj6QD7DDPwqMoYS/DcB1EbK/XEfpu434X4m7usMgM
	+RoQ3aypWOtjcLm1+l87choRVVUaolohCmaFHYHAYXu5lw98CLvfhgpqv9kbIdZW3aI/0kmM0Oa
	cXWGZBTvFRzgL4wDjZpvzWqhDhYEy0miY9omU5kCDWYm1OZuQotk0LFfAAJv96tBcotFfT/j0nF
	qZsql4geM7Hlm66ux71awCJkHuMhSeFjlcm9eAWLCjLefz8K9zKetqno71baFsq4oLRoWoPP//E
	/C0VX9SFGhawTrkUYhGcCFdACV1ZO/8BB8pA106+u1j6LJhwB6hDsqVev4ZLIt38CFwraPRunfM
	Cy7ecRaMrv/GVPgv1l31p+spOWvK0Yic+aFNJcvjL
X-Received: by 2002:a05:6a00:198d:b0:7e8:4398:b351 with SMTP id d2e1a72fcca58-7e8c4a760b0mr5135538b3a.36.1765177495284;
        Sun, 07 Dec 2025 23:04:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXXstO1/aH4pNkltYFRUw67jHP+4wYmmld/ualkI5pVrl7sEs1XBsQY9dBdbZ/F4pmYZUYPg==
X-Received: by 2002:a05:6a00:198d:b0:7e8:4398:b351 with SMTP id d2e1a72fcca58-7e8c4a760b0mr5135511b3a.36.1765177494761;
        Sun, 07 Dec 2025 23:04:54 -0800 (PST)
Received: from [10.204.86.50] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e73079fa24sm8726983b3a.40.2025.12.07.23.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 23:04:53 -0800 (PST)
Message-ID: <5f4efb71-4d39-45e4-bb0f-dd3c3c5b3a28@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 12:34:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
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
 <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
 <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rVVr647XQFrqA5wXY_ASl8Lr0eaH9_SI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1OCBTYWx0ZWRfX8ZURTLWAJht6
 88QotWej64qVta/wc0PP2/Jq2vTWUEZek6x0JymiJgyPx8BowN2ke8WZ8ZX0tn0gkIUjeMh/YcN
 02L3m4ju6pSq7ExuE/JmwM5kaBRSy5rajLDvh9L2EJUnWgnthuWyiRbnMpylWmLtTZLX/RMHGXG
 mW1K3D+AnorykUDg2CEseBnfE8grRA2ov3vA+1khqibmCgfEICoP3T5RLZJiZlv56JxbsJe8mmK
 nuT4EwiaQF04zhrnSHsjMFsSVuDW663TENfJu0rWJCiuwIzTgwmQwSJm0R9Qh0/nAxAnPxNxP9v
 pCsAUfcvqLIVMHopeWwbyD5d4E30CnVvNRKthpJveWnVUWHF5XYwgniGaYowS0zUu2tg0SLOdw5
 w8IPJM7L0shtIKPdyEL2bRfgsZywmg==
X-Proofpoint-GUID: rVVr647XQFrqA5wXY_ASl8Lr0eaH9_SI
X-Authority-Analysis: v=2.4 cv=f7lFxeyM c=1 sm=1 tr=0 ts=69367898 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zVikO9lnR5s5zLRVlN8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080058



On 12/6/2025 8:01 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 02, 2025 at 11:36:28AM +0530, Kumari Pallavi wrote:
>> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
>> both Q6 and user DMA (uDMA) access. This is being upgraded to
>> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
>> Kaanapali SoC, which expands the DMA addressable range.
>> Update DMA bits configuration in the driver to support CDSP on
>> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
>> it to 34-bit based on CDSP and OF matching on the fastrpc node.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 6a67daafeaa1..c5d2c426fcbc 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
>>   
>>   struct fastrpc_soc_data {
>>   	u32 sid_pos;
>> +	u32 dma_addr_bits_extended;
> 
> s/extended/cdsp/
> 

Thanks for your feedback.
Here, i have used extended instead of the cdsp as to replace the 
domain-based naming with functional naming. Currently, CDSP supports an 
extended DMA address width of 34 bits due to specific use cases, but 
this could change in the future for other DSPs as well.
Using names like "dma_addr_bits_extended" and "dma_addr_bits_default"
would keep the design flexible and independent of domain.

Reference of the earlier conversation regarding the change of the name
s/cdsp/extended

https://lore.kernel.org/all/e0d039e8-8f65-4e2e-9b73-74036dc0bb8d@oss.qualcomm.com/

Thanks,
Pallavi

>> +	u32 dma_addr_bits_default;
>>   };
>>   
>>   struct fastrpc_channel_ctx {
>> @@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	int i, sessions = 0;
>>   	unsigned long flags;
>>   	int rc;
>> +	u32 dma_bits;
>>   
>>   	cctx = dev_get_drvdata(dev->parent);
>>   	if (!cctx)
>> @@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		spin_unlock_irqrestore(&cctx->lock, flags);
>>   		return -ENOSPC;
>>   	}
>> +	dma_bits = cctx->soc_data->dma_addr_bits_default;
>>   	sess = &cctx->session[cctx->sesscount++];
>>   	sess->used = false;
>>   	sess->valid = true;
>>   	sess->dev = dev;
>>   	dev_set_drvdata(dev, sess);
>>   
>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>> +		dma_bits = cctx->soc_data->dma_addr_bits_extended;
>> +
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> @@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
>> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>   	if (rc) {
>> -		dev_err(dev, "32-bit DMA enable failed\n");
>> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>>   		return rc;
>>   	}
>>   
>> @@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>   
>>   static const struct fastrpc_soc_data kaanapali_soc_data = {
>>   	.sid_pos = 56,
>> +	.dma_addr_bits_extended = 34,
>> +	.dma_addr_bits_default = 32,
>>   };
>>   
>>   static const struct fastrpc_soc_data default_soc_data = {
>>   	.sid_pos = 32,
>> +	.dma_addr_bits_extended = 32,
>> +	.dma_addr_bits_default = 32,
>>   };
>>   
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>> -- 
>> 2.34.1
>>
> 



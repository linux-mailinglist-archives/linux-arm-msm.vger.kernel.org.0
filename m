Return-Path: <linux-arm-msm+bounces-89010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D23D1EF40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95DC730198C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770EC1FE47C;
	Wed, 14 Jan 2026 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GucrZAKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5JAAuet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633E396D3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395736; cv=none; b=fsK5ouiTwaSIZsAYNCFpmkg/goFwV35HIx0Odu265AU9+svYAGHC4Ecvkyi8cM2mX/pcX0V410gPg1IbPbOWA4kO1jzgktRkuULFttcb4HBZUBaC1muBMFhCLyyylMf5a/YX8+VvLOG9fWDHMFTMLrR9oykaMRCXkg4q1AfUJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395736; c=relaxed/simple;
	bh=sD9lD5wb4oL54obmEZfcsV72oWhEv7t1KvFAr0Lh+I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnxf9skzDVDu5wu6/gkUhxBy5qt4SP7XjsHfbwuwG+Fa3UnVEWDODpebsN1gdyVbjOBJPjvXTF+uxXYMPbMzI4zQLdv/tQ+Q+yb30DlpvMqN3Ml+t5FW2DUMwpJX2rthyanIpcAY7iZqwjAMM6GedhSFeJcl9dor3YJq5iGshBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GucrZAKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5JAAuet; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E9jpvE3296325
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AVkdAwzTz15AVGc6zGzqmSVEPx7IpTdFQTllaA8Exc=; b=GucrZAKY+oSiaDfn
	f/ihbNSu476xRKUei314nWlb7mJlzMi9jMnRryjguOFOyTN+ZC4GUjU3lfwaZlSP
	xLh2JnVrJI1rPGA6xmJXP5GF5Gyw3N0mXQMH+hDmM4o7CZh6AyqrwoiezpQPZLCl
	MV7DIj70gKgrzzjO7nKwhRJ38GlpxZJa8SnOp0m3oQai1C2y0K1NoXMyMlexDt7B
	O44ud8ZbWeUYHpt5kLoKfobjkSN59cg37qzZtsLPDJYL9PQa/7lwphvmnFmWuqaQ
	OCl4bwzwLbXjXy7Vq36lY72JiMkbXI5uGHopUhaPCT6THxHJrHYV1F/Y/+/PVRnL
	AJ5/Kg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2rpcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:02:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56345323f29so1017665e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768395731; x=1769000531; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7AVkdAwzTz15AVGc6zGzqmSVEPx7IpTdFQTllaA8Exc=;
        b=H5JAAuet70cm3P2Mk6f1AqG65eH7Baea2Cx5T2/ODc4ySoOnICq7Ls2E9gAHB/khLb
         AIT+wdSlVO/HSt08lecipiJiYqRKbJFElxU2fWPBGJWy1gu+t+EXDFMn9tQrVelhhYct
         2oYMRGYkLP7bi9Ieh9xWy8pPuiNuvKrspF7AmYEOoQH0RhPc6EbwoNAR1G1TooL1GU/X
         pC4N7g51E6dQ4Oo6cGC4DbZ7FnPD9AxVPtQI8TOOVtl6SsNGPtb3ucXHf9T2Xp7IhfnM
         x111YXtMH9AFrY5O+eNhL9U0Ve2w+MSjlqsazlQJWq5f8UbtWdMGX9n+Adm2dzygghue
         64+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395731; x=1769000531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AVkdAwzTz15AVGc6zGzqmSVEPx7IpTdFQTllaA8Exc=;
        b=Qg2ndv72NSmJf/e5AQl8WrZB+zRt9wx4VwyEZGHmeed86hMZon2uwP8KXsZcLFdPan
         5i7b0YDAH9wKE90QoNv1Gxpo6an8wLJ4P2nA+T+MxMnT1Au9Mr7MAH6EymxePJP2jYD2
         ZJPxCkCN7PVnQp4yhXaZlVlVXjuPBUHPPBQrgKslBnqazhHvs+G//dPOdt9I1yN6146D
         VmSHVN23RUZCpmQqYwknuxsoIwxYtcW0c4jj/tMBRI1tKscJH80cO6ojOQJVD2X+OK9k
         3+SvhhfAWBIgkZ/cHkOWwi62bfoA2gm89YGUHWaF8HFwZOAyeaWBtEwdPtLdatRtgili
         8vdA==
X-Forwarded-Encrypted: i=1; AJvYcCX7L9oYG9iY9Y25anV2ZCDLoY4gOSbwKaq/v8a91V811rMoiynQQdD7QVys5T0EkqQoYQXoSiCvJI8JhqK0@vger.kernel.org
X-Gm-Message-State: AOJu0YxJnThJY0+G+HUxG8Oiw8ns6lbG7VwO2u0d2w0XQ0ActFgv0tvq
	7ynRy76Q8ql/BXRAo2S6EuIlaOhufcMvMIeMZx7Vrp8maFMxGDDzXvI85pCwsRRcQmIs059KP5F
	arsES5kI/QdWJyokv8GEVI8gctdGPNNsGR2aDxUScIyT/Wjs84dJRge1tV+vi7omDyT9F
X-Gm-Gg: AY/fxX4/B4DpvSiZPGADNhZjkTxI4cr4FgjDBSpa9Sf1RrrjuTYToPOXhO8tmNwfLFg
	PHQXCDjvOhptx1sNLRxhPPFqxYly8EEyenBBuegafW8kV51GoNry+JuodrNVJ43ZUbnrHEa72k6
	wM2D1WDboYjGBuENf69IMchVh7lKx/SPmo7Ow4RNRX5bHymmtTK7ZzFj6GzGIbfmB92hKIjB++4
	GWnMvSWgp0pOP7Vm6yOxy1B53FGSnr/QWeWk4w2n4elZMZBvZZMaD9alRNDlelWGVjCY9WIvktZ
	2Ae8BcRn6P5Q4FrU+2gKt9e8oWK454/l4qjCvKQ4WzYvHGsIhaC97yR4Y7ynt1rCx/2mS8TTniu
	COyXMi6DpU7hLupNQXpMgeXM/UjrpUynNnhNmRQyGN+6ZjYmy+MK/sixbUDvqlmksz/45E48K3e
	z/6pSWAIMCd6CAJ0mof9Mi+lY=
X-Received: by 2002:a05:6122:3c84:b0:563:5b70:3707 with SMTP id 71dfb90a1353d-56395c89911mr2454769e0c.9.1768395727585;
        Wed, 14 Jan 2026 05:02:07 -0800 (PST)
X-Received: by 2002:a05:6122:3c84:b0:563:5b70:3707 with SMTP id 71dfb90a1353d-56395c89911mr2454683e0c.9.1768395726881;
        Wed, 14 Jan 2026 05:02:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba101bcb3sm676215e87.21.2026.01.14.05.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:02:05 -0800 (PST)
Date: Wed, 14 Jan 2026 15:02:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yedaya.ka@gmail.com
Cc: SzczurekYT <szczurek@szczurek.yt>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>
Subject: Re: [PATCH v2 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <bqlwe7fx4kzj3eie6hmffxbr3zqezxsdbnswg3i5bpnz22pf4e@n6ogchhf7cdv>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
 <20260114-touchscreen-patches-v2-2-4215f94c8aba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-touchscreen-patches-v2-2-4215f94c8aba@gmail.com>
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=696793d3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=ECEyCYeL1hbWFqLZ0VkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEwOCBTYWx0ZWRfX3L3Th78zzE4B
 IRj6kte0lIjmSqDYny32gE9ByACAJt35L0i9S+fYCpY7RxLpNalnKQaMwqLJLw6aIUerExhlp02
 DusLb1CtIcp/Pttl/PgKrCPsWnQFAQsQW7EepVONFPi0e3uST+JE86DBNFzP8E95mLxqjzJ/MWj
 14NSyEsc0SnlHNLHgk72JJk7Xkodzbch7ILnoKZ+LpXTjUdJJDZjNdIaeWQoDlGrom+7MpVwNVz
 SqoYQs8tDOYiPL6fM5yOn8nWX7ySGLEG7CVuNfUf9VT4FWmXoQxEH9TzA8Bk45Pvm69QNpYb9JT
 aYdsoKMXGDuALCWRiA0tkmM+1Y3OjPW4H0n51iS/xwSIOE8IXBvE0oOcgavwXLQN9SUWnOlcu8v
 zx4MZpUcqWQDLXJ3Yz1HhFmNJIEiXB1Fi3vuM8y49wF64GowcmjOC/R1GkrCb08Sa+NvIN8Nil8
 OhZ9lTqHASeJA+Dagyw==
X-Proofpoint-GUID: MMpeGXYkKhQsz3JkWvqOGsx95a7Sy-t1
X-Proofpoint-ORIG-GUID: MMpeGXYkKhQsz3JkWvqOGsx95a7Sy-t1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140108

On Wed, Jan 14, 2026 at 11:31:07AM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> The driver also works with FT3518, which supports up to 10 touch points.
>  Add compatible data for it.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


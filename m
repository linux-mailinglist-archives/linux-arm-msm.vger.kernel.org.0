Return-Path: <linux-arm-msm+bounces-66108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578ADB0DEDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A320BAC31AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7532EAB6C;
	Tue, 22 Jul 2025 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxG/FZr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BA1A3178
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194625; cv=none; b=lAVhVtyB5q0C+/QbOXbqUIX4J43d5Pq1cBJDBAKFV72Qb4/A7okJQU6QeEdluNkFZqt6ARsdQqnQ361XyWbzGW+UOuQ85tzRSItyevtbNM9D3X8RddTnbKMkAPWecsqcrDLcaQ9c3wHBL+vVenVXuYV8fA+5fw9/X5Nal70IbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194625; c=relaxed/simple;
	bh=Bxv9ni4w1PYvtb96P2XChyJnbKJIDZlbHmmvm46D96Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnD0T6E0fZNFE8oPtic8CqoFSJHdY9iFikdqZODZdD92ZtsU6PVN0t4fuDEBtu4/DTBbUUpdzqNgaNcETzXmiY/4mYORALtl3ErFqDCx8BvCP9a9DduL+50ZqdmbO1h4tn7Yu8Jepjapr1dvFvUj0ngswMkCBR5/ZY23YQ6mdZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxG/FZr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8Wt0M012550
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/SZ0lHFoJHSAX7MLV7k/Qc97OKQJ9c7d2vsYjpczs4=; b=RxG/FZr4xEQeY5vn
	qX0sSrMzgTq88IcR0hMrfzu1DG7zz++O/Lr4qUiZ4BpYMf1H1giGoptn5fgASdYu
	1ObLnGbCwr1ZmFHNUcOOmgpWZl25DwCALBpE2u5ybbdzbmO1VPC05IU2x5xntwY2
	9LvZmsMFtEBiobzrI4UnwVd5wAWazVZpkFS0un7Gj8j2sF23onazRJsScif5oee+
	DdN63Eqg1ZaLwfSLz8/hoH5rdt49Rib7jtZxL+HW5gCDDYuHT42RWz2axWsv5Sru
	YnJ56uXovMXv+pKNUgcbcA0r8R+R+h2H+krvNdnxXN4vapRvF8XVPE9IGygnMAZy
	+oeBJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6m16d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:30:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fac0b29789so20617906d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194622; x=1753799422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/SZ0lHFoJHSAX7MLV7k/Qc97OKQJ9c7d2vsYjpczs4=;
        b=fTF5j1Ht/MMUenHIo9XRMKroobU/ET8DNYsgNKmTa2zi6xXWJlaymjkWcanm4O+uxB
         +PlOFm+XFSw47Urn1241328qLAyX/MWkA0/duc2L+Mb3xwHdqet6TiqSduhSvsEkRsmq
         ccB5hnaAp0MzTWsYMQXTwobG0z82gd7wN4GjnADVTD+b7rHSItFsi8c9U0Q3bGxhj7ZR
         gruLFW6dHABdoKO6hncPxGj9toE+HEVNlv82IzI1+G52hK6Rz2vZqbHae+lZiPmwMhsl
         rSEcGu87fuFXNywr7nQmwIWrSVWGF8/oGdph+ByoA9BIxyZ3LwMKkys7veJ1rNi+tloV
         a3iQ==
X-Gm-Message-State: AOJu0YyVGPKMQ1R9XCJ7s9lw5q3ltjuBfPJTIkiZCu7cGxoYl/D/JAFe
	+V9Pr4cBiLSym0RwKia/RzqACbrRcO7XFJhv+jakfBCVnJqn+GbZeAbFjx9CrI6ryZdrZTrFDKN
	0aha9JQTS4W7O7SR3reTtJmzj4iDg5yw1B/oL+nUgMHi/2Up/wJSe6QZoREYlAciai98x
X-Gm-Gg: ASbGnctbfESbINJnvREagWpFE+eT/JPCYScBTqEUPOdMxZESnJJBpqKVJ26YHIt74Vi
	r52Fc9QHVtzgwoG0+O15q4LK+GLJZlLrC1BWy6r8X30+RHPPBeWGoIoeOQUp/8NM10tXUAjB1EN
	AUD0bsrVc7SHevnIjE+0V4TfMUgHqHBv07FFdqGfTYGe1ubT/91R9ec4DiblYLnM4w8DgZcNW1d
	c90F5YSi8vxfNOFka+Bs5NGcChe+aqsVhU0pAIHzsF4Ji+bjrz2ZJdEHGlGzfefKPRk892pOdBW
	GTWq5swiDqcPc49P/yKbPRUTpoU6HJXbZaNxweEzZltb6DCDwQsdEUfvZFCDqdP3XKcm0RhykVj
	MEDYg315C10mnC4s5gMHu
X-Received: by 2002:a05:620a:a48b:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e62435bac5mr97899585a.12.1753194621243;
        Tue, 22 Jul 2025 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELIFe7dttYXlWKLb8+yk+ojhPQpxXLFbOGTgUNnufmtAMzR7XiOb6CgD79dyMxVD6171XqNg==
X-Received: by 2002:a05:620a:a48b:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e62435bac5mr97890885a.12.1753194619840;
        Tue, 22 Jul 2025 07:30:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aeefb091e4dsm486326866b.12.2025.07.22.07.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:30:19 -0700 (PDT)
Message-ID: <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687fa07e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=68B5CXoyvkL1tjfyVhIA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: UV3l9oLVBwTuL1hbYQxsmwa6g2ulIowj
X-Proofpoint-GUID: UV3l9oLVBwTuL1hbYQxsmwa6g2ulIowj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMCBTYWx0ZWRfXwDrXSrPlE5rO
 z+1A7xdHfufk74qYIVsITcE9atAVmoRshiuFB7Qx8S+OhyE8l5NiAiUjn0BkHc0/6Nr8LOUhFtN
 GeEJCxbhsVpztRsET4PoLPLXwoVxs+qtlX78aDnIiTjBoFY+zLnz3qwR+tGGDkDUIUMQPNEyhDD
 Dm6+Co9Pf1xOrduGgdmYq3PxBPFWTDO8Xi2/8pMHMg/SieL2qGo2PxGeuzmHF60JiCvVegEl4GJ
 tdBr0Ha/J+T4T7bzjEQdEX+0E7uuXQZaOLBDbDOoygml8DaRCTdCb7ISx4fCRiosy0ouGBReOtp
 hkeWhpd+cFlRZ3h8n8prR3zcQ42ESYp4p7dJ4oo0zxq7K4b+srcu8IWkBWOPIgTolKjuyzoggl7
 rag16YeFHiv5OrfJXXQv56fZAmRjJbVh49inyQyxMS23lILtI6g7Iq65Zj7sixiBXHZEbqbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=824 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220120

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> A minor refactor to combine the subroutines for legacy a6xx GMUs under
> a single check. This helps to avoid an unnecessary check and return
> early from the subroutine for majority of a6xx gpus.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> -	if (!gmu->legacy)
> +	WARN_ON(!gmu->legacy);
> +
> +	/* Nothing to do if GMU does the power management */
> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)

This isn't quite a no-op, but I can't seem to find what the '1' value
would map to, even in 845 kernel sources. Do we have to worry about it?

Konrad


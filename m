Return-Path: <linux-arm-msm+bounces-66227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F31B0EFAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936051C843E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551C728B50B;
	Wed, 23 Jul 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSbZ/oLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B783E277C9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266184; cv=none; b=ncbghOZy6sS5EL54+jviojZe7NYDmD9LfVG96hCT7FtwZfreD3IahW/se9GFb5eBQnJ1SwEnRRiHUPpuDoGprhHCn+z7lmlcDsri+6RTWZr+QmrB5JcPOPnpWzsiyS1pVMNGJ7cH3H6k16LaASYeUXh9KwAm5vC9xctTnZCFpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266184; c=relaxed/simple;
	bh=bcyKLsB3eb4YS9fuhXTf5h3qyk92uF6p/Os/+PB4kTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chumnFgywlFbPye7+n/peQHVXJYopmLsancEV7lScR/3L90odn4MoslAXxqKH5WyAeYvAeb+Rovuj16QzTONXYW3Kv6tWrOK5IlzrxThsJp3jQCg0rFTTERElMUSsl7zYUSvsUfdX+KJaAXhtHDB2NfiF0XEmT9CBoO0EQ7L5fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSbZ/oLy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9FE6t007882
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8pYxrLggsp/Pc9lqDpa3++CGRfIO5nj4AvygT3vYys=; b=dSbZ/oLyUawVCApG
	U9s1cCPf1xaU5ffr1QouCSCReiTXpsSdXT7yImzX80Ko4E33y+KWyJl5y7B9zmS5
	D2U2UwBB8crRwf3p/3/G//AUWbfC/MJa/EU5dDSNahH0XM6MGursDaTOnoT41VX3
	ocl/Y16OYNQ4+WFYSx/gSyzZIKXHpeXcQs5uQB271ERjdxN9/O1rNtjPHXFw6z0n
	4UzOtDr4+5w7tSTHVyINko/jOvcoEB2IihBvFnWmlWvjwYT5s/B3LblCndbDvFLh
	LXymxsVGKKRdd6tKAMLHV5BmUU5Xv3YP7Vx+u6BWr5Y4jeKNNlzNPAclWLc0rl+L
	ivewTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qcs7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:23:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so13890796d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266181; x=1753870981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8pYxrLggsp/Pc9lqDpa3++CGRfIO5nj4AvygT3vYys=;
        b=Z1JCc1gqm2Rc7dGffe2/02DSs9XBVllp4vSexrKdLLNUXHfAYnKQvGttrDzDF1Krkx
         XTDFxeUSsvBK9++qRofkam3+zw+0LngcZhIZA6XFlBJBRgBpicZHyO7iwzMWckl8ThDc
         odVdjWFF5kGwnKgDaVWeKpQxtYC371lr0P1PQdkqGj/91J6M5Riidh0n8lnxBzMTYpxa
         72+5r6lkWyJmmDNjYTUC6Wv+WDzHv0m4AY44BbRUNtkGO25VUMZPoFnDSsa8Zc6VSua5
         jpze1eNQcUWiGraj/pW1sgYaVacb13dWIR+g5G9DiTqZ0frvXQAljaT+zxfKmGXLW9Vr
         ja4w==
X-Gm-Message-State: AOJu0YxY5g+FRV43FSkqeD25WKv9Une01iCB8RkyZ9e/ZBDcHYgWvNzn
	7R4cvDNxyDzlXXozKZn+S1vs969udcqKg0ZiOEAbAw6D/SZviP4pV4XYAAH+GXjSk6YjYdBxPFX
	32XV2OtadbKUp+B0kmhCOwFs+bfN8SclhVdxriIUPR8iLLDUFvqSnTd0CYs3jc9XQc3O3
X-Gm-Gg: ASbGncsxEfeQ0eML4Lz/CHalRWSnuGpVUmndCrF+xIUsKQsfhByj1D5i9pb+jotCi5g
	7OpkxAus+g0AbZc2lC+xMcaDiGaOFBWXmr7FNkD8lKcyZOIDrJjsDOHoBQtOfp4yvL1HBkPRpHS
	FSpC+CtTGoucj06Tt9ML9AMj1XIuNNtYqX7FIYl2LGF2q8tHTA/jq9nl02ZzBanr+hUULOoy3ob
	/LdfaFPe83Knsp9EgGHRNwZ5JX0T+BQVnL9lhdNTVYQreOLT/2A5i0TLuaiwQaoBjmMcdlB5WMc
	rIcOODOIOhucvMdXqg9ADURi7gjvYW3XL0j1+2AjceECcPRV3k/7tsjWN1TFqNobCtGFlHoz7MA
	SP9xrx06A6vXm2BudjA==
X-Received: by 2002:a05:620a:28d3:b0:7e1:6d46:9bde with SMTP id af79cd13be357-7e62a1af38emr109302185a.11.1753266180900;
        Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbdAr1cLYfzXD8fo0X4Lr4Ip40OFyltSfV9KEUBwzI9EI09L7HNQRYzee7xRd+UpVLCkm7uQ==
X-Received: by 2002:a05:620a:28d3:b0:7e1:6d46:9bde with SMTP id af79cd13be357-7e62a1af38emr109300185a.11.1753266180496;
        Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6caf9ad7sm1021436966b.164.2025.07.23.03.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
Message-ID: <ffc28d89-ba45-480a-b664-9e4ffc50a3bc@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
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
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NyBTYWx0ZWRfX5Us2eS6GN9EC
 ikIozyx/83tjWQ5dfVelFGe7pPgw1XTqWLbty5ccXpJQMwRFDXmxxHGOuLNGkPS/8AGEqan/2h6
 XRqNexUbsnUV/1Nt2AtVxUByVm+dDtMlQh3IhD5ISkAy9YJGGePqnZroU3CGJj3TjH3W8A3vq5w
 cfH2WQEdZ4ezwt4+ejibIzOBDRoPo/+Ek0BFXAGt6Abx6ua/YD/Srten9DU53R8N4HlW3wYA0AU
 LOUac09mgg9/oJU2XCxhy6nwIvaYIJV5qaT5HhSe22syBgty4wkaO1Q6VaN5+RqxAuUhX2JLOHS
 UjN1/QoZlJOgmSv2tI06ur3XXBImyfVyswBmQTv3M2YJAiEK0jbzM6/z5sJ0mU7CtE5AuMIYXM0
 xK5mLNlBAAq27vbg/MpbSQGkTynu0Y9tnWj2RL/aT9oNjsn3Ia0mbdI6stbbLLI7RqsSxzsA
X-Proofpoint-ORIG-GUID: OCliS0EFhdKfSGEIi_74Vd3Xj9B2tZwx
X-Proofpoint-GUID: OCliS0EFhdKfSGEIi_74Vd3Xj9B2tZwx
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880b805 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mXZsdZnO6U5RsJfdWwEA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=982 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230087

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
> for a gpu. Based on this flag send the feature ctrl hfi message to
> GMU to enable IFPC support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
> +{
> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
> +		return 0;
> +
> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
> +}

If this function is not used anywhere else, you may want to inline it,
checking for the opposite condition

Konrad


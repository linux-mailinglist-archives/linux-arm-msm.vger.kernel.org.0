Return-Path: <linux-arm-msm+bounces-78396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90231BFD8B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 144EC358C1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A2627703C;
	Wed, 22 Oct 2025 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kV3uDGCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790028725B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153752; cv=none; b=TC0dESapX7Ye3WLV/mJePizmhSVeIx1B8bk6++ppdAxX6CtIRRfM5QbQrV58iburs713z3T6o9c2feyBnfPGXpikfqtDM14GZmcvYdGyeUG4564zQvhg6tFvKP7fGV2IFLfOWvU/pGG+5OVTglRGBSDdOjRdbq6d43IAKG7OJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153752; c=relaxed/simple;
	bh=eC/41dwUoIrEEDzHs7yuaoKF13e/LUGftpm4gCobTQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkZthrWcU+iwZH3x4I5TEema/HQiAiT9dJfYQjc4jiG2LzJ+Vs3KdVpqRStpKXlYDBIB78Ywm5Dux5VbwpNGcEh1jhsIn4AUDGr3pgXtC+8uTVQtvbgZZbeEdLYJ5bQU7GqFLlDIolKilR+2u3zxe06Q24WHVH6xF6BaHeAC6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kV3uDGCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBZG5k027828
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voTjpZJScGbpaAh+LIIeJcD5hnR/2l86hSL4gjLUr2g=; b=kV3uDGCkQlEzVfmH
	GHqRMCkeEJVe48Gsl4gm5a1eqh8ZBJRui9LL9BcSW2lMBA842rD9iaXdrX4C8kd4
	J/HXdmG9BK+VWdUWOF+F8c+0CjPKHBMzN8oOZ8/CIreJ/NSwQZGX3ia3gROyB+gy
	W6M2HS+AYRvsDrCxsbLq+YeYoHUNSFI7HfwDAv7Bl4s3L9j9FagqTmr7xWDD4mJc
	JW1ZpehARakuTi15YMcQC8RxiXMV7LyTOeO8TnVKONImo5el6B2r9iAXblNp2twH
	xKGa7WWyjifvzIQjsFhGHCb3MXSQlVSkF9mtRWhlH3aLbwxRyhrYnhy1miW0xcO2
	Y2DZ3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j5e5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:22:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6ee6so73526415ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153748; x=1761758548;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voTjpZJScGbpaAh+LIIeJcD5hnR/2l86hSL4gjLUr2g=;
        b=nPKOd+FQGwYYYN/mzsnC+7TXTGRY1CIg5vhLxelD23NN6AvxGLM6tq7+bEcYHBuP6C
         cbpewhzG5xdTTT406VMu5u8PtwZ+LjO90N5+jr79fGpixltBKFk72IA4htpuRTe77BDe
         5nKo7YAkH6kZXXwHFsoUJ0W2UstkYsdtzO15Wzxkialj76atFNFlfRghMbfdCKDnaK7b
         ZP7fB62Rd2hxbtMHPO11QPLoWys14R1eAgbd97aR391Ci2zyy19giK5mfJoI6gh/ZCwc
         RtBp/URl2N4GKQlWnK1Z2y6XxqMunsUuDWJHbbPQapmv78qLWf5UNVSnOXLfyKnEbTyq
         SJnA==
X-Forwarded-Encrypted: i=1; AJvYcCUEEtjXogdt7gRUDp2DAusvU6gul1hQMqtGd/uxdrfmUj0IPOA8fhpFgk4RBQkdFCRA10XavuvQLNYjGotY@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTuAWww+OjpIpMcI0CHPqkk40FJmlbtHCE8pox3SUV7j2Xr/D
	mmjZwpW8erNor+gi42iWpodBS+CJlzROFUpuDUWdF03ABqNVpXpN2gImVEGLXVB7DgZMge+8UWF
	ZxHhj+gLJY/NvV/ipExqrtmONQkQG3MKtHpkbimFuOd3+ipb5J57T/+LxA+aWOgkTT8Hf
X-Gm-Gg: ASbGncuwdC0n+GgB9JQkEVYoOoS1UdXGjZBxEuhSZWNXDmhVVt92VgiYNfsMDRd0KfP
	7N7Pr2/X3OADcb0P07sa9OgZ2rSo1DOihbV/vDsLd4EaaUL1dtlnp4otBQKA/aHcbvX+ZtoiNmU
	IVIalVUNyCBKppITEWtatGakEW3+atQGFR7MRot/SX0MMPaQH+oNP3iKlDEW0/7uboflIxpklAh
	qqSrH5lwhwQBKEhgc86MeVsxUiIcF0XsmV80QMFpbzTZg8RpYb6BmIEqZJOuYoOYEnuycDxwexh
	rxA6q99MM8ldjpf7SGqbhPwS0ZWTyIf9Rhw+GTcFrfSX2ONgWR2GYuVPyIwr9K9ioQrGottjBhR
	Ix32Nv/wU2FxawxZaHIgTUq6+500eHjgNBAXH6d9TC3oP1PRXGaZoCfLiql424w==
X-Received: by 2002:a17:902:d586:b0:269:8072:5be7 with SMTP id d9443c01a7336-290cba419dfmr259563935ad.56.1761153748008;
        Wed, 22 Oct 2025 10:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUtnk/zARI/NFYLbVHaAKvyVscRFUT3H0jNKPi1KTDyIE2ZTjtsueDNfbPwZeS9DXYSJYTjQ==
X-Received: by 2002:a17:902:d586:b0:269:8072:5be7 with SMTP id d9443c01a7336-290cba419dfmr259563565ad.56.1761153747516;
        Wed, 22 Oct 2025 10:22:27 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292ffe67d03sm31383415ad.86.2025.10.22.10.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:22:27 -0700 (PDT)
Message-ID: <fd95a733-98c5-43d3-afd1-7052be02bcf4@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:22:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix comment
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX6NAT8mglW7Hh
 8k2/3N7IaXGdvX6GpUwmRhR3mCBZljjn632PgEyddGASulwC9Jh0nSIbe/29DsrnuBixVGrQqpS
 s2qXa//ujDZsa+qYVoKRQkX1K3+53t0Ovk3B3RzFELFK9n9lTRLcQZIUHpV+LxzheZnR37uZctd
 lYAzNvqEN8yDIXpHteZDwmRqUVCbyhaaN+Yj45P0sKVwRWkKPGMV5jkcTle94JT7qwoaf0QKchR
 sFRPEoaYfyyZBew87PYr2Oe+xMnTIEZxg3RBbwDxhpp6o6HGsln0MxkRw6l9RmTZHdpRwx7kt6D
 Nplu32w2XJ+Sic9oJOmuyW0AcAS+Ku6mIhSXPGL+UBFj4w3NfLEueCbZCpsdtqSyULMH9YYjSz6
 2z9L4NXk5MqFo7wCS5W3XdTRRSBr1Q==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f912d5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sS_EF5oJ7B5xURoN_h4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: mssg4-uJim48-Z6AD6z8yPe_JPqYoRxr
X-Proofpoint-ORIG-GUID: mssg4-uJim48-Z6AD6z8yPe_JPqYoRxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018


On 10/22/2025 5:41 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Replace the word "Qranium" with "qaic" in the function parameter description.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---


Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>


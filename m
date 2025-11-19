Return-Path: <linux-arm-msm+bounces-82467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCDC6DBC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1818F500ADF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD33A33C1AB;
	Wed, 19 Nov 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS1JNsBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/AcjZx7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5933E350
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544100; cv=none; b=MKeYludT3B6cDHeqP/JEbfqyjhUk0KJwBPpKJZ83ivR1Ry9IjcSXhREtcUE1QSe5O+stF12PUY2AkREfT5RRTtndiw3SI8QjFZeC3lcTYYaQg4ZB00MzuHQzBihgN2N0tFj6+BNIKIUE4xfn/FUvmQk2eVUwbNqIIJZCngUwo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544100; c=relaxed/simple;
	bh=ZfYhmBz3xGG8TUF+q0CBzEzR+jURigJ0Wq12vttxGXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEGYmu6K6q92GZ7jM2ATGVAKJj4otDJidnDm9ll8HDb0aJEuh+vHlhv1Tz7dERKC4AX4ugxrU//k2wbY1tUqIEhihmOfjV56ddduRJLzcpylHozkFWl+uth5tItaJCeUyOOpP7R/1Yb/oem0Q5lnD0yJtsIcWhLRp2RqZflRYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS1JNsBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/AcjZx7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4XgL7885023
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsasINejjR8g08Tdd6hEVHUhnhzo91JEEiJc6r9moRw=; b=jS1JNsBoI95sKzs4
	MqiTEZpwFEAIEUJbcbyRp97rjhf731FPMzj748RnXZfFmAX/bE35dx/tSG4hi4BN
	urT0yhlsAn8LgWFuU6QKTMN6uMPgvJmRUGNI3yflOtM3AgG3lQ+36sWm0QnjWuLH
	ToB/iSKBbhS2jA7NeiqJDSAuRyVqJKF9rrAW1fNs4EKKnutxSM5GUHrI5bmnInDU
	ok0pdU8mJNaCsn+5XzlnrRfF8gwMGu+NwPXMipwrNQcmJS9V2kBAeA4XwdE2fL90
	W2M7wbXU3acHCgEkAq3ZnH08ylfEljdLGu1mR491YAN+pvNsy3XDCOx3fVqWz+CG
	D8Nk0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8t64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:21:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29f90f9fdso229998785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763544097; x=1764148897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsasINejjR8g08Tdd6hEVHUhnhzo91JEEiJc6r9moRw=;
        b=W/AcjZx7KQWkfqfR3p9SS/rqwgsML+3/1X4iYI8gFwsMOt1SkYBgCyI2OHw+ALEb0X
         fy83rolEgg9373c5tLIBTZFZrmqJJUQ1WtgoSehghckkkGTFIvMTnkaKPhU5O6Ot6LeW
         S/n8G/BoIl2i6mwZtK8IGpHNY7F6lRfjl12uLpIrqeyhW9wdvaMwpTGc2JA8Uc8DLHXj
         ZvSAgcSGZK75YJklOIwsNsODVnEc3X5cda8YjrMpv4SyGS7xDVf2kPsOD8BoWsCZtM/O
         hVwv0CRG7ECLbpF5678qRU0wAJxWoogmEtcBX/fcHZwQuvRMp6it6qlo3FLVFP80mmYI
         bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544097; x=1764148897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsasINejjR8g08Tdd6hEVHUhnhzo91JEEiJc6r9moRw=;
        b=f7xaI5FDbPcSVDhHmL3cqAvq0AIhH3mWhvstubXW3JaFbBYmvfUgaBKvSgDoZaXonJ
         +ry9TZ0jXQVUI2K6BkLNENuLS/2nThYw1f7Nh59uUlbpkx7K6HV9CaYDapKZoGi7m/wR
         zwBsqpSrig9DQDtmXG6wbdwd7H17IlSrJS3Rg3TziEuKDAacjZWCZ+WQTvvD1+KxoIuf
         k3ad0hWpsq8s/7aMThWBt5xthkDYPQ12U3SMFCsnDxHEXdovGnHL4Mrc/oNICh5NiWTa
         P8+BhCWsxdbUQMsEbJ5NO8Y8F+TXbKx3zgqBMjetimyVaGs9KaQtcnij9ngkudqucjjy
         cQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUtk/Ed0PjhtlcHhywY7q4BlLcqzoY56u4XMRE7mAz+oPIQC9TGt0mkNAEVBEu/M9GwikWqkK+LW11Vid/F@vger.kernel.org
X-Gm-Message-State: AOJu0YxMK5AGXa58oP7buycgGkH+87M7q2sJmXP+BJIIaEXrGvGzKcQS
	bEp1IL5irLRMPy8BySQQiYwh7PfIIsa2ibiwyYua/sykvmoeGJB+zJuvhIuU2De3eRA2WKVf7Mi
	pUnoRjV0ESDAC/QV+AbJ+AX4kv04pi0nKs+RnbrX0jAFS6YVVh+JWPoLsR2BjIWXxSq1J
X-Gm-Gg: ASbGncue8C/XxoQzXPjYZRj19LAPpmS5vgJaSCJ+oEFzkNw98/xvl3GWlluqlXcTcei
	6iIpu//34kE32Omz6NOw7AhLXx4FSoQqq+tpcMsNeTQ5h02WG1/R2CXwiHaaKwE0lRImQEOMaWI
	N7KjxXRZONdjiGgyjR4NhO7zabZ9MNKF8QRdqsfPRYitYxlp2IJw9EHmX1djYLVZbcixcDF5oz3
	jkgGtCFvBHGqriYHVO8+ryoAKIviwmPxczrgpn+DfLoMPaAIP4YD+IZqhkTKXXSSue+/jT4TZll
	ecuvUS1FKMtSQyPdyO/7wOA6knHeMzatEMMWGCi5j4l7bMnC1T3YDLPfuLfAt1naMU5hYSIuoJU
	m0zfckJGLtvBj1NApAZz0riNFPwqNC8r0HDau8+fLlWf2uHv/pFgA7NhwxFueyX4wZfw=
X-Received: by 2002:a05:620a:318d:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8b2c3130cc8mr1747633485a.3.1763544097063;
        Wed, 19 Nov 2025 01:21:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsLJdReja/OXKbrpHJO47YoHvi536cH4Y8e7+wYlA7NU9eLvsGh1wk56IakY9aXYXxXYXOlQ==
X-Received: by 2002:a05:620a:318d:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8b2c3130cc8mr1747631285a.3.1763544096559;
        Wed, 19 Nov 2025 01:21:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7335sm14545720a12.4.2025.11.19.01.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:21:36 -0800 (PST)
Message-ID: <8adcb880-a2d3-4987-88c8-c3441963fc53@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760
 modem
To: Slark Xiao <slark_xiao@163.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251119084537.34303-1-slark_xiao@163.com>
 <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
 <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fgVXFiLq94e-s2YXGbuo6IcIIi65Upy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MyBTYWx0ZWRfX0L1EwvqhfHj+
 Swn8xDzlk/HCh88tqCAIif03/uah/T0mR5sO9P9Hk9VFHzRb4k62B8lFdBGwy3PDxKG1lcNZhzB
 dHkWyhbhe1iFHwe42MyBYpm9jMztkffT9h8+4BKv19IOrLaKIIviGWmPG1xzxrmf25xbiENNMKn
 fLXBzMF/hBYe3xneDFXL8ZBQQENL0qEa2CVaK2Rk5U7vEGZvgWN4oPQNBzlkIpAqGuEohpSjh+k
 g5X7XPx84NV94jTGBdjDPF/OAltv2+Wb31uvkGU5Ax0mZqeSXgofS3idUyg4seIVJSIXyWx1WMS
 QagrQPKV079Wh/lRMVZgsl4w5NqoAfsCV+YxNSprdFRoqWkW/sIxL2/p60kdySG+VO54munAre9
 2kBN6bpF3c9X/HccmLvP392mtyEdNQ==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d8c21 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8
 a=G7VRq2ROR16SoJa6LKcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fgVXFiLq94e-s2YXGbuo6IcIIi65Upy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190073

On 11/19/25 10:12 AM, Slark Xiao wrote:
> 
> At 2025-11-19 17:05:17, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> wrote:
>> On Wed, Nov 19, 2025 at 04:45:37PM +0800, Slark Xiao wrote:
>>> T99W760 modem is based on Qualcomm SDX35 chipset.
>>> It use the same channel settings with Foxconn SDX61.
>>> edl file has been committed to linux-firmware.
>>>
>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>> ---
>>> v2: Add net and MHI maintainer together
>>> ---
>>>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>
>> Note: only 1/2 made it to linux-arm-msm. Is it intentional or was there
>> any kind of an error while sending the patches?
>>
>> -- 
>> With best wishes
>> Dmitry
> Both patches have cc linux-arm-msm@vger.kernel.org.
> And now I can find both patches in:
> patchwork.kernel.org/project/linux-arm-msm/list/

It seems like they're there, but not part of the same thread

Please try using the b4 tool:

https://b4.docs.kernel.org/

which will help avoid such issues

Konrad


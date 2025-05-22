Return-Path: <linux-arm-msm+bounces-58988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDFDAC03A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8632C4E44B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 05:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708A91A238E;
	Thu, 22 May 2025 05:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7MTAYN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1FD18E20
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890103; cv=none; b=G5jfLWzItCKdhjkgqZIkLJfNQOekY6Zqt0+IAVFtzcjPcaaDrOOsafuotx3cUqFyWwN2paTBBzhVqUdQv2H580onKkT3HdALMWtrakLmtfFsYY+EPUVXm+ar7JtBMJgHGq6MFO+9fkq1kcCen6Z/rmvyVTEoczFTph+oUpMHr0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890103; c=relaxed/simple;
	bh=JZo8UVqJRmNJzDbf3oQ5DpO889Stb2poHHW95w5J59g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soEzPU01SaFDdZzx0+l1oY0bFRwqntGdTs/t7zaeR7wuXBnNsdKz7ePEzNKgmmbCnVYx3iz5m2WXNcbYUM9D604RsH6JADQjY6FkzhwI2QohO4x7pKK2h6KdJYYF5xCMs43kGYba7l8Tz003qQH7Van6l5J9l4nufp1XYnVskvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7MTAYN4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIDGHL020957
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NguXm4WSpZwqx/Kmkhi3HpZA4psVbbg60toSxwm/2O0=; b=k7MTAYN483dQAOFt
	s/oWC7P/5M3KlMd8ARsGibdvzc5q0Qw+filZYucDDzpw7+vtKHg0bT1FKrEGrDma
	ElgABAl7Y6+iIiZVGjkaJKEZbh7tS27RgdbMvhyqlZrf41gNxyiAs81G+bjJEYyd
	ZlA0i8Bri6dZ8HJ9AJFXfWezEk5tOenlitwDnC9pSgB2TrtP2wCLQD3nT84zFXOs
	Njrv99lb/Yb4B44hg2NsDTIUQsNkqfQZO0uOIWqSUt3bL4W28pIpTcIi1pN3xBc1
	LUMq780a1L9tGgwpw3WvAPsE4SGXbm6wFCPIBsP3tliV32ZGuu2xjlns0T6etT6y
	L1o48g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf055nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:01:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e5c14b49cso5360762a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 22:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890100; x=1748494900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NguXm4WSpZwqx/Kmkhi3HpZA4psVbbg60toSxwm/2O0=;
        b=Ff4Mh/xWzyJiGYw/hp7P82zm/e13Au79BHYsRgsRqiGniCiJfszYnoajvBu2AYs/q9
         CbGXCFKKjEX3DrxY+WpDfmLT50CdymRU5YXrHeQoI6xWl19zKDoSOJZh2Rjj/KcpGpkJ
         yFKjzZAhbuwt1b1BacbnEQgSRUrERbua/60gg139w3a7WN7Zi7yUG7Z6uMf0A1sufwbi
         PMMP6dXI2WBAdF0nsm8VpCFA9TIHp0mDK/nXLFSTUd5dlgHs3nHwi1w5v9SXoNTYO7cI
         LFVL1DJB9GxqF2ZRdSVehCCXZFeMgU+jloYEMBmyufsK79To11ZGrfbOC3T57wweMFyA
         y87w==
X-Forwarded-Encrypted: i=1; AJvYcCVRkHOZZ18RVH8tKoRDkZu1sTFOOdUx0ebZT4fHuuQaOJKxkaIrl9cyiuID6z66gD98S/e7iquDJ7Xaknas@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbOD69hbuNQfAKQwS/AxPHnINbEy0mBZnvhu6H8zXTe9s4QUC
	c+qKS0WppuFifnUBFzM9rEsOLwIGQMYDRa9cqrMMHu75rG8luLiBOCp/cJeaNTqkrpdh5N6IZmm
	AAAGP6L/6bFP3yg1LptUu1L282TJPEsE4/rJoqFuodoCn85zwsvgC32I73N8ktXddHBsK
X-Gm-Gg: ASbGncubbSAxoQL6nMIavGmIrlqIIcfA8pj6OksUA+WvJFiPC34Fgk89i/k58AFqv75
	Cksqi8LGyE8wBwrkbowWbdku3YJDjGIPvRjJgOEgxUaRgqMB5nV6/eM6WWEMo6OSL01NnLUJht/
	drG6CJKWuWxc0mgY4Ca6IxL6gt8JlslfNiupPxS0O1oI3osM7jvaWmZS3Ay9V1lRLNvLmunFCLU
	eF8ydADiqmNG8Vp7HOh5u+rdjVVI2BxTshVUslUgGWeDoVxYudwDzmG84oUy1/1cu8T0hx6FToh
	xDz26Mvq6ULIbSKtgascRBtRXI0Ad4AGJJn7MU4=
X-Received: by 2002:a17:90a:f943:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-30ee9f1850amr16977023a91.4.1747890099910;
        Wed, 21 May 2025 22:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8WP7wi8k/4svaSUleZJvoLTwWHT3Rb3bGLTRbKSE5yOdFgLg+Fxp/WkOQUjL1YK/uYfk0iQ==
X-Received: by 2002:a17:90a:f943:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-30ee9f1850amr16976988a91.4.1747890099336;
        Wed, 21 May 2025 22:01:39 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36491d85sm4591925a91.29.2025.05.21.22.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:01:38 -0700 (PDT)
Message-ID: <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:31:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vyWXE2-qtGgWU6HjrF1H17GPbnwkWp4_
X-Proofpoint-ORIG-GUID: vyWXE2-qtGgWU6HjrF1H17GPbnwkWp4_
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682eafb4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nXvCle_wObFXJBZB-yAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NyBTYWx0ZWRfXxhe7frYpFzcX
 IvPnYCrjFGblLSYCGXVPICE04js137lrDUbDRJWi27BCAk6hdbwRKK/0jy1evQyu/0GAq7hxJcB
 yeKlhjpB/6Sx8PcmySGIKvSwPsU3827gjakm1gj9OWE4SGOV8uGS0CIIdVxv9kTPMm9lUjafNG0
 6JsqbFgB8+VDkoS/3h7x/dCWWCrwC2p+VmnF2ZOepapjlcDrFbzgW7dj0hY8okThnLY/XeLNxK6
 i1Gl9CECoVbObdSv/A41HVwfZ0ywVGJVlPMpODpoAVMM8QihuDI7Pr8pWX97khE5dO7yigsWGZ3
 gmj9UFEdQYjaq8spooyT9EryXnY+Z8zSSvmnBBFeUZqv3CBOsm1s86LFKelqQxwGnL55j5skI6A
 GZaelPBSB0W+VL+VG23AY5gYft5fNA9a6XfO/Plg3Hi8+Mfh1wiQ/37aTVlbPY6rPTLvnvhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220047



On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>> User request for remote heap allocation is supported using ioctl
>>>> interface but support for unmap is missing. This could result in
>>>> memory leak issues. Add unmap user request support for remote heap.
>>> Can this memory be in use by the remote proc?
>> Remote heap allocation request is only intended for audioPD. Other PDs
>> running on DSP are not intended to use this request.
> 'Intended'. That's fine. I asked a different question: _can_ it be in
> use? What happens if userspace by mistake tries to unmap memory too
> early? Or if it happens intentionally, at some specific time during
> work.

If the unmap is restricted to audio daemon, then the unmap will only
happen if the remoteproc is no longer using this memory.

But without this restriction, yes it possible that some userspace process
calls unmap which tries to move the ownership back to HLOS which the
remoteproc is still using the memory. This might lead to memory access
problems.

>
>>>> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 51 insertions(+), 11 deletions(-)
>>>>



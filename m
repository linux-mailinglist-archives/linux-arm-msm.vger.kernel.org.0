Return-Path: <linux-arm-msm+bounces-79174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F760C14596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9399F1A66F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F78308F24;
	Tue, 28 Oct 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCdJFf4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79182306D48
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650816; cv=none; b=uxAkMQe5mSQM9jgpXzljPwU4Xp8mTb1K79qPkmY0Plcd38T73AZgjTtRE3N0lSbThE52Dw8k5EUdSMeyBcPLIALqGTv9JrXNLUh4bt6S9qk6wmUUN85NvQc3Q0GPs6Pzq3Qi1slpE3/PKsfGNzu03ancTo81Zk51iOF9PPrwnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650816; c=relaxed/simple;
	bh=fBufmoiCsGgn84g8PYJQQN0ig+1uXDDqG60gqXk1NoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ab2OsRbAakK17fkBLVky+DkmWvr2qYZBsYdRXlpEl7da5VR2QGFfuGkZ3eKlwxy8oqhKFHg7YqjLNT6U3SaYA5b3F8GyAioJE4bukBak4eM4lX7lt2yWl1Z0raCBJEnviW0IBc3L1aIn5ylHKtXOxn7owPrJA5XAYIYbH7i8WgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCdJFf4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8jeX02881678
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxtEXxyjpblH1VkRqNJLlrUhubXxvJIKK5oYF03s0To=; b=DCdJFf4gvZ517ofF
	nGY8WnAseGDEFBoaLpyMtbN8khAuIFnGBNuJ7YoOCdjHGQAFMKdLHtyjCXv9naVc
	G4Qn/fMz156ukvgkfGVX9XK9Lx2lozqLOrTmTfBIfV8nxYX9Mae4x7U6PjZMVy9J
	fo47om5K9W3tNzidex0+VYvMP6ml9ifgOoElcsB395PbmQHUwFYP6TZ8PeZEZv47
	75MzaeR1z3fnrZOdTJ6GeGh2LJ1NKQhThdBGSP2a0gzfI5WfgwCCi5B7pCTZE+Ey
	GX3fVQUfu/6NUNv2gtIT3kJMHbxrZQ/EJ46YPVTZVROuS/9dlHW4pYDEKbAkwol8
	9/AkDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uhbm3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:26:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78108268ea3so5467754b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650813; x=1762255613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxtEXxyjpblH1VkRqNJLlrUhubXxvJIKK5oYF03s0To=;
        b=o0bga9d2Kf4i0U0COjyP0Da4Y9TmSB4s2jSveQjS2s267c0Grr96S/Rm0kOwBr2sjA
         U1KgkjPhs3t0OA8Qd1QkjvO20NDG/1VBAJS79pWkqFV6W7ykiQTY9UzDOMEvlJmxvjYV
         QWevMXnl+5683d09rZt+FTJ7wWES8yBVbr+0w7J4kTXwYjRR7f76uQQgXKeOzOL4s0g0
         Cm5QXLLm+bd/Zyei3zZmQJ8lNC1ZYe7ovEnA0ZRLsq7SwyASG411JTQberp0HbjrNKK9
         7JZ8iDBj0SqZ4j5LpaD48btCvWS/YLawl2xPJvt9sqkDkI91pCHMi6X+LPRPtYLp9UiL
         3vZw==
X-Forwarded-Encrypted: i=1; AJvYcCX9txb2DmQ5PxFURevzJofYyYvEztiCe93MonLQAyel/W1Gnq+CN645ILYzzQjj6js7YeqF5dUR5hfJpwhl@vger.kernel.org
X-Gm-Message-State: AOJu0YysXx/CfI11/mvwTNuZGwZSIqQAFuHYsC+m55z4w11KXrnPvOON
	HJYlnrvxP9U/A8uMh3xOerEg+pa7HUbDHibYkexJ23VhvzSXCs/Ih6bDx3gWgnyFD+Q9m/Kmi4K
	P3xi0RgTK2jb8qZQdkDyhsiS36+WV6rDgvvSktDT/S8p0OBdAB96WhtHm7OP3BgyBmjW7
X-Gm-Gg: ASbGncultz6iBVATTUoQquCHbe1XUCUUHu4RfzFK4pqvyIOBC4/5yGZbWb4uUaZEodS
	fEiFAYl5n1ELFWrjwOtlOJ/H/AbWKKex3we3rxWilH3VFCSBvp3gFbEnzc2njY+HHAHeIlPDu1F
	gC+e6II9NY+FsSxA/Hl9Hs83YUKiYBTNf7MZ+BQMZZq0QKJ3CaZTG2DyyheW5DV1hAWKTWDCxhf
	B34Xb+qDrrsqme4oVh4lYSBYDv1sWyQxSeLyEIoQ3qeL3v/CZEzaGYAe8s38ocsWpqvIYQJSQVk
	+AXex/0XfWIPC38XDMAJcL8ZqtxQy9UadXN8d5PbR/bnDxPvMIhsYjyiCaXAiR69NuaNyqLAtf8
	QvFdDmUeAoUJJBgUmnPXgSNJ3kxFjLvlJ
X-Received: by 2002:a05:6a20:6a05:b0:343:5465:bb99 with SMTP id adf61e73a8af0-344ddcd8a01mr3908420637.6.1761650812668;
        Tue, 28 Oct 2025 04:26:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGq8RNQDq78SryaeLfUbPZNmMQJGMYafxHnDpHHZnEWn3AO6zvI3CRYSi3qIUs5L7z7X2/ng==
X-Received: by 2002:a05:6a20:6a05:b0:343:5465:bb99 with SMTP id adf61e73a8af0-344ddcd8a01mr3908389637.6.1761650812224;
        Tue, 28 Oct 2025 04:26:52 -0700 (PDT)
Received: from [10.204.100.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340299e6fe2sm1297385a91.0.2025.10.28.04.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:26:51 -0700 (PDT)
Message-ID: <ef879fc3-b437-919b-7ba7-d67671cacd77@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:56:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] media: iris: Add support for QC08C format for
 encoder
Content-Language: en-US
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UvhhutzE-IfCz5Be_m8HPA1potL4Jihz
X-Proofpoint-GUID: UvhhutzE-IfCz5Be_m8HPA1potL4Jihz
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=6900a87d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tQ2HcwaAKAc4KCduFuEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5NyBTYWx0ZWRfX4w8c4osh/1qJ
 ga+g6ch8WExUVuTrKVL3vs+9RBRKMiex2UUCJlE3R5f7aLpLE+Wr/1l8GdqngTCxsRjSC6LrCec
 a5awc3C9V+WmO3KAIni332uAB576uwG4hIX3xze5dtj478he+6g+fl1PjdpZwRJSh8tXp2HbPa4
 JYWrz5COPg8lNKMCtsA9JuMATCA06eyWt0FQeqK8Y/zvELXi2YXqDzHiLSePQCiXkdNJpQ0fu1M
 OMazlud+zTqa6lDZi5zvuoZ0nVd4QmJ7XLYZuWLbNPXg3ob3oiTlc4+NvLfA8HKZDQgQd6X5GCQ
 WE+5gq+Qk50+Fgi1VZLNtXd7pYTPwYBdvIs892c3l1Nm5JwVWYPwLJJ6l8KLFZTGs71Y3+Ds8N3
 8IHynl98pGqp27br40md0agaGXXP6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280097


On 10/8/2025 3:22 PM, Dikshita Agarwal wrote:
> Introduce handling for the QC08C format in the encoder. QC08C
> format is NV12 with UBWC compression. Update format checks and
> configuration to enable encoding to QC08C streams.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 12 ++++-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  3 +-
>  drivers/media/platform/qcom/iris/iris_venc.c       | 59 ++++++++++++++++++----
>  4 files changed, 63 insertions(+), 14 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


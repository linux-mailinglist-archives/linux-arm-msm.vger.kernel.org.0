Return-Path: <linux-arm-msm+bounces-85291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A8CC028D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 00:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 948563017397
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 23:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9537B2FFDE3;
	Mon, 15 Dec 2025 23:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZ52vt1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym0Cd0qW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C628CF5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765840307; cv=none; b=Ocfxemcc6Xzw/KwYXiqo/UDNlRuszLmNMWfxYfrdV9Ca9cqVp2B3nh9fWLYFZU7jfy4nARAy5K9Vj48saRI7p2ZXn/bVywk5NBVC/QJe6o4h59h0MkSzMOEV8xE1WsQIQmZ7MyDMJxnF03bwdSS7bAPp0BJE9a8nNNFGrwAaVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765840307; c=relaxed/simple;
	bh=9mOXI8QC1AqpHbGM6zt/JfJr3fh2o/pCGCDLcVW75h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goRl6sSySxEMTqDpIujfwmvnevr0W3a2vGaeYjGxRABg8mKc6LYIcWEgp5f5DEzvJE1p3jN+9btRYD3PGABCkky8xfvgpaJpIBCM3cN2LYuSA6X7T3Mdl0ep+uFjM9pkrN07vsR5JYv0v7zdwjlOU9mEraiOYyLkaJ1SlQSmfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZ52vt1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym0Cd0qW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGOjS31391484
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mOXI8QC1AqpHbGM6zt/JfJr3fh2o/pCGCDLcVW75h0=; b=IZ52vt1O7GbRGxZu
	lel5QAK0hybX00it8t69gxD0F7mnx4QPZ3B+kbXA/rI20xX1m9ErEW5R6pgQA4Uj
	wCJJj7udaLtcaKT4YO057G3vSTVIESUcl8OVV0WXsuhTzbqaA2owK7RHkKWb26yj
	jisMFLSZmsVzmC9SOrfkeNXPFHdF1I3lXfyyQUMVy1fndiLe77rNCOKYFtJewORX
	CQudnR5ELeWdRZwvBB1sxj1UucYCHx5BYqXgtDVDj/XWaRDR+TaQs2ZE5NKGDsV/
	UJiWpVLrLYGCFuuWJ6xWNcLxj2UXfqyB6TDwFvmfN9hYPoAhEKQHWb46kvUHhw1v
	f5Ffdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nu1h6j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:11:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bdced916ad0so7201422a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 15:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765840304; x=1766445104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mOXI8QC1AqpHbGM6zt/JfJr3fh2o/pCGCDLcVW75h0=;
        b=Ym0Cd0qWNqXYuqDahsMcitJ89Up9/5HwvSRnVItLnKnKg9X9vGYzCPX9FJrINeBWgJ
         JQKN2pY+g+ybf9wtutefelZIF6gzx9TJCQdDUfqMi+FdACmHzGSpxFA6o/jeP/Lme/9w
         zZqXGNNSGVPW3ShgQAqBTZ9y99WE0DGtAd90r7U+VJoODY1ePuekwCSRGE6ABDDryWcz
         DRYeM2JWtpn7iRyOWNpeLung6xF5BeT3CJegAyifser6KZP7BDO/pjIPf+HAWMcv3VwE
         RfayB0seXyl+oO3I035a8z/bW5mJoF06fo4+6cFwSZa+wkL0vItnBym2EW5PDrjXkpRW
         3avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765840304; x=1766445104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mOXI8QC1AqpHbGM6zt/JfJr3fh2o/pCGCDLcVW75h0=;
        b=JK1DtXY3Fm6GwTCL5eKHDRJvoEKWhJ+F+MeJ5qDAcYwwtJ0jzCgmm06NuUP/iI4VBg
         83pklvdFRJ9uwMmAQMBLtUP1mTUguVG1HxxU6JVgTJni/EhvUTtzlU6F/kcXe9BM7knP
         rRPkc+wD4slaW4uJzBKQ9JR+MNJQY/bedsd9QRQyD6Q/+oY0LlzlYUhqjZcOeb/t9yrY
         Z+V/K+Xq7aAV6+fnzUCgsXuR5c7NaSrEFX3H3Gti605B9UH4/OUJs8qBo9sR+Tb5GdII
         1S1BW84xCY0ro03NFapNzLuzJuVkAu6+JitXGv1bLPN0dxI5l9i2MYV6NQRCdfxlX2cF
         lvIA==
X-Forwarded-Encrypted: i=1; AJvYcCXva/8wgAl0K1AgDuJga33XTdK8yBKRvirc4gz/YlHFf3950Z6ihT0Mma7zu+xbD2zN4MzCT3Dz9uZMeqHe@vger.kernel.org
X-Gm-Message-State: AOJu0YwFi0jvl8d28BgVRnDeKPiz3vZeKVRo2g1lmvWIeqWWKNJ2+VfB
	sIguCn2H06yQyTGTUQ7KRAvRRZFzPplaMv+tRq3YVSuUsQQaFJzcRBbtduA3rLTytPwIPRQysXd
	r1U0+JlTs1pJecmqK9X3lTc+St6vnPiwPkqdQX8pNFo5bUXjjrFxsPiyYnNUr+jsgNe4ffBk/7I
	V2
X-Gm-Gg: AY/fxX5s9S/KZ2Zf5AapavBwxPFdlF3PTB7lducv7mVpYvdURkK8U9BuNTT570umKqD
	aQMMXrz01vVC4T08PK5ycyaGYPQ7onvWbgU50Sr22oXnQpgD0r9GDku+AQCImFf+QMHxhTg0gaT
	e8FSGEqh96plPJt8ofRtHUvnPUNcpjHBGNzdeZzd8w7NEJwUSvl+O1pAqcc/49R/VNS1hYLkUfs
	HQPvxWkAqjO7WK7c25+zlWrS/yS5lDt/w/h5U+H+GtNmrM1mzz6/zApJAd5wV5ODdjylyuE1twR
	dNuewKUZyHptRrv4h5LYIANx3fvaxHrb+s7OOXiAHg+Qd3TYHTvyFFe3kBOsr2SgRuZSjURctQR
	wgnJA+1Syd5uXtHDEd4D3+xaBajn3RbNP8nVxCdKppw0ydOOb6eohG/UdTEQ1872Sc1M65Afi4y
	kl
X-Received: by 2002:a05:693c:40d0:b0:2ac:2480:f0ac with SMTP id 5a478bee46e88-2ac300f6569mr7656631eec.23.1765840303795;
        Mon, 15 Dec 2025 15:11:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGWd9bZdX9FqE4Zu9kudeOlBTu8WHuiZEe4iQU/7cEpax6mK1X2xvTe73Hi7niTXG2c7K7BA==
X-Received: by 2002:a05:693c:40d0:b0:2ac:2480:f0ac with SMTP id 5a478bee46e88-2ac300f6569mr7656615eec.23.1765840303310;
        Mon, 15 Dec 2025 15:11:43 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43ced319sm15594685c88.9.2025.12.15.15.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 15:11:43 -0800 (PST)
Message-ID: <178f4564-8b59-4cf0-8274-dba7e58ba596@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 15:11:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Sumit Garg <sumit.garg@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aTtn-x0hh18V7n7J@sumit-X1>
 <b29c97cd-cade-40ef-8e6d-d164b1d16059@oss.qualcomm.com>
 <aTtyR5J3AqXoE7to@sumit-X1>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aTtyR5J3AqXoE7to@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aSiAUdl5vIsTMhiA4oVGNq72X0Dp3RLH
X-Proofpoint-GUID: aSiAUdl5vIsTMhiA4oVGNq72X0Dp3RLH
X-Authority-Analysis: v=2.4 cv=AOuEbwt4 c=1 sm=1 tr=0 ts=694095b0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=AIc35tNdPba7fq3S6GQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDIwMCBTYWx0ZWRfX3+L5iorKCSBY
 EiPItYnwTHO8G1+T2I48R9b22mRdXi6zImhE9nXELEKGDjUdtTa1viIz/BYp7FBYti/EmP4RpbA
 V7ThLvagkqFAqLQtAbE9uFSz+5A8zcqG9Tr+L8vnYjlC9okhVBOJvg25POKo37t09rcpPb58qvs
 vzn5VKvjYvaRlCof2C6IePF4HszoLXD0hr9UgngJksD5zWlxAWazEdmaQNblXgRp3kIkvLKlfiR
 QTJzXdkwi+EiVwom5n4i8VncXR/EmtIHSlq14KB5bgBLKztCGGRzAvyDIuXHn1HYUqr++Y9ex30
 nvIOX+AWAUYTD1M4IfoscXlOa07cIB93AOvzGGNXQnJE3aJUr4FBsUoGtvXcuLD+0ExCiRKhQM7
 Bt6tnjWkvBq2WB6ycCSRftrwUrQZnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150200

On 12/11/2025 5:39 PM, Sumit Garg wrote:
> On Fri, Dec 12, 2025 at 02:07:40AM +0100, Krzysztof Kozlowski wrote:
>> Sure, fair. I just don't get why introducing cleanup.h without actually
>> accepting its explicitly documented style...
> TBH, it is likely overlooked during review of the QTEE driver. Having a
> builtin warning for the undesired syntax would help the reviewers here.

It is in the works:
https://patch.msgid.link/20251203-aheev-checkpatch-uninitialized-free-v7-1-841e3b31d8f3@gmail.com


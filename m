Return-Path: <linux-arm-msm+bounces-102289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FZ5Nxse1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:21:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C43B9CA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CE23300B06A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18142D29C8;
	Wed,  8 Apr 2026 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4DAvfDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfI6n+t5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC50282F01
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640043; cv=none; b=I8SZmsJ+eXRhckAr0tMwgNDu31vNf2sMrq7f94fPCAwnfrfh+UTQX4v54k3ta9pFE8ThDKlw5I63XJgwqv8DSMzFqF6tZ7PfwePTzG/LxSZyrngsxh3Bo6FtmBffP9u7zCM6RjR7fX0tDcR/ZRNd3i8wTLqrxGxPtBT24PBGC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640043; c=relaxed/simple;
	bh=1fEK+3/IUaI6PtifAJ2tgPApAe8vnhtB5kNDXeehzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7LO8pqycKPf+/tlSJPYh6RJaWExlQhTswzI+UL+3osUPCcM/m4gKF4UTfZlrtdGtlpRWrWmE74mVuGXuTEIEexFLQXqIdIEyWExwhOQmf2gSJDOgEI7FG6EziAV+DaUB6sOheWh1tq9yduphSe0AAFDimqGmwJAswlwV5bb5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4DAvfDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfI6n+t5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386berp249488
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=; b=h4DAvfDNKDlR4sAy
	ZZ6qcNPxwUbDAsBIQCLqK20ilbf7/A1LN99AO8gEj7ml1YVzHCizEGrBtbWCnXgU
	AwD9jAyGTdgFtviLpWAJopm6CYLkn4G8L7jxq3/ejyd1bDZJCZWEwpjNITvjM2au
	QYk4Sw0Z8hCjkjSZMIQtNXd36XIVqJMzpf/G45y3SaA+wb5S/CRP5tyd+BacypCT
	XSsTcYNcYrt+bTvVaERG9ur5yDj9VlC+tNLPvrjhU+5nmpFkGhWa40X1fzGd6yuA
	DxVNGciUerA1HbMoF2SZNTrDl+oQBJ47wB8+ZtMs7s9qFZOvSCYV17iYfWIUYG9e
	H8YTcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9ab6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:20:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242b9359aso58849495ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640041; x=1776244841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=;
        b=hfI6n+t5fZqydA3iXu2mh3qmy3zaL9SpFZ4oaI4AYcLMEH7r2/dbVesTDYoW1eYusL
         qUl3gRZnuajmthuw5SlcXIDBvC+cTFjLQyaNRCOckxS2MIDVstbnYUUaemSF12iLc6IG
         64XOJ1Fj/ZIvSloZKn1G+rYHP+8DhSMWZH6oi7JisesTw5CptQR5hClCs/7ODbtAfU4V
         SWUgMzrxIvVW15D5GjDYTVythr0/UO8zV3gJa1wboX/OqWFuDOQrVmHuuefw9dtcXn0C
         4ARrHcHVwvBElNDpVtrQsBiC1R4cCr96wdKWsSXXlJFzt4gzi1HSE3GgIldNQwLwEbE3
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640041; x=1776244841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=;
        b=BZGPVnlSzPmIZH2SfqJYQ2jEmcKjDbvkMXLJ8CbhllLacgY5KJ7350QrflE9U7taxO
         QTouNBE1NMFbWjqHcUn8oclFp0Y9GgEvNVGCHtModKGji1lKGlc/boymdUshhwE5XQK4
         b8XEcAvwbAKusIyZV1lvzqmk7Q/rb777tWViDYpX9UBjlUPxIXTgZxK/3nVoIP1IJNVs
         XacWrUTY593UUBzEpoKrvlDA/5fjK/LKxfgeMT7sv3SDuadT/akzLQzNCJeAC6kLoC27
         fbgjjf580LtlFV+ebLZ3UOnOmh/hovtor3zWdSt1Rut5rpkOslUGq2D/cSziaDV7+48a
         idkg==
X-Forwarded-Encrypted: i=1; AJvYcCUI3MOi0dcJktcvpb7fFdvq6Fgbrb2rdgBv+wfinH+0dtq72yhElqit0/NsBzqZ0h2imUdX5d5kcY/OPvPK@vger.kernel.org
X-Gm-Message-State: AOJu0YzhP7mPl+3qyBtrU5bD5vxeDYXis2PUF9CvV9told84OiEDTF38
	upcfEhDhHi/ySgw/J7JdZOgwgaz0gPhE3gRd3ZDbc1tU0ZRV2ct8FFG34QVch4/Lx3VPSp5iy/c
	/39HzjEZk8TnSOp8whuu0D/CzwHeZPuWMbrkVcedIkbj3gWBAnTCvyGU8BIIrAM70KnHI
X-Gm-Gg: AeBDievtMWMCg4lKNcmPasBu0wUorDZJL++oX3SMF8uGU+x9Wv3uxf9b4ULOdP+LDPK
	Sqv+3bNOIOpWB13W/ratxVHbdje732Nkx8Bid0vSyZlVUhHcYJ+VssFyBCUJD9oAp9nC1B2vOq0
	VEiKGNrnxNl4n+5CYSNrmxSYyc6ANXGXu2Wh3C9b9vSr8mj7Z+vlTTVnCiLtBbASe0LhiZoY0b/
	mjueADc+1lcg+0ZyQV9CEPDtNtap5c/zbqaCeV0nh2sgncBhlqSO81qCxCfJRUidvnViMlO9mFC
	wRwmQNnxndkl3TuZ74apcx9xgabJ9B/NoqzIwPyx6VOLYXj2oJ9kSYtV2Z7b5fKdGIeq1HrAfB3
	mU8l0gQB2a5kxbA8AzkkOV6H2UVMQ0U9DXR4ugH8NqcBHLEb03zdd
X-Received: by 2002:a17:903:37c7:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b28ecb83e7mr183196325ad.14.1775640041292;
        Wed, 08 Apr 2026 02:20:41 -0700 (PDT)
X-Received: by 2002:a17:903:37c7:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b28ecb83e7mr183196065ad.14.1775640040829;
        Wed, 08 Apr 2026 02:20:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm193886955ad.24.2026.04.08.02.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:20:40 -0700 (PDT)
Message-ID: <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:50:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
 <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d61de9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/ZU3Ovutwf0He1FzxNd9ng==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JisTeJLCnvBdXki043gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX1UxhFEMpuqVB
 F/8GDddk0BQfoN/Y6l727ggzAGBHrdvlQk6RU6hQilQJgXfNvw28dX2KJPd3+jqn5Zh7oPJ3x34
 Bjw+z7B8+iuPDyO/KRNeQwFb2ODkgwzfdaV6WyPomkdIoT5a4DaMBBqEWVo2jv2IthLpUk/gCoG
 d+ViZMxgD/DFY8dlZ51wwN3H89TvGVCOccRxpmC6I3fcsUzI3W8usEnOQwcZ9XFjDp0U0Pr9u6Y
 nTo/QKfmY5PVEqNvXCyep07olSFLf2lpF8KDsTblY3L6tK7Wja+P9Ke4FiH3spIXWAt3WiEJ2je
 C7iqVe56Ncgr96LbbZBWpvY21786pGhLPuej2TOBkLX5UKJIZSYBZdjjcBSX8sAO1s0CC9js26/
 UqQDcSO1W+OUltgYGkZ7Yt7wDtjx7UxAe0Bmp94KKem4SqHrEahhoHAELfZ2Zhn4ub79W/f3gH/
 sbX17DAna5UaDULF18Q==
X-Proofpoint-ORIG-GUID: S7lcgYL2LI-J7af8P1A5Okdu1_4guFTp
X-Proofpoint-GUID: S7lcgYL2LI-J7af8P1A5Okdu1_4guFTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-102289-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 898C43B9CA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 2:47 PM, Wangao Wang wrote:
> 
> 
> On 2026/4/1 20:40, Dikshita Agarwal wrote:
> 
>>> +const struct iris_platform_data x1p42100_data = {
>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>> +    .get_vpu_buffer_size = iris_vpu_buf_size,
>>
>> this needs a rebase on latest platform rework series.
>>
>> Thanks,
>> Dikshita
>>
> 
> Will fix in next version.

The rework series was expected to land in 7.1, which may no longer be the
case. Please hold off on any rebasing until it is clear what the correct
base for this series should be.

Thanks,
Dikshita
> 


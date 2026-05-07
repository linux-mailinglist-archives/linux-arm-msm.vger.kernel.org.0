Return-Path: <linux-arm-msm+bounces-106328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAUyJO1j/GkqPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:05:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B43B4E6752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37F363005D04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 09:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D3F3CBE78;
	Thu,  7 May 2026 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2kgtRor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLw16P2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F43C73D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147912; cv=none; b=KvLY1013KSyb0ObpE5JBzaTyHmgrRI4vMmGzUOnzvwGWar6jgEw1MjGFRenQgTod8SJJXaeqw3i7aCxCxsKw+BMk6EmioOUdEDjD4WBfpHANn0Rzyw2Rys8wFB7YvUWqj1Yn/yFXoSeobIw+nqYaYYONTRx/MkagH0dbmVYBsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147912; c=relaxed/simple;
	bh=ueFkU1uS82QA7Qz5PfMYXENS68x8c9lLBflhnOVZ6aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fk3gGpxtAJ8D2L2gM7lEGKcAAMaU6Eb442Vu2VGbmZSP3cycGlrg3CoivkUNFuZmksdkjgzpXOMZEg+/nR7bAj+AXAg8VHgkXww7CtNHA3TGjoG0lPUAVVzCZsRS8LYZ7kWASpQ7RLrJ5GoyhCFs8jtB+Pl+RVZ4HWGgpnGgZl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2kgtRor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLw16P2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479vQ6T150875
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 09:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ueFkU1uS82QA7Qz5PfMYXENS68x8c9lLBflhnOVZ6aQ=; b=W2kgtRorpmg7moVR
	3nlYSTqKjEDGPqScfuuynl+ySOpMiJh83vEoZcBlOZEBh9yd3nCqsBUdd8VyvyP7
	GunBZVbuedem/NmEEbvHSKYmCNI8BbCFA88sy9bQWNUT3SjpawchIXUNJcHbNCNZ
	A6y+M4ZcA0j5BqpSH6Ippu7OdwKtHpIKqCiEW2Gy4eXjArnoKxB7hI5nmunLc38a
	S/rIBKkfYIiUNH9HUrcODxWx6Ct18jo64EBIz2ifaGHEVpsG81ZQF4ejIDHW1cmw
	wFYxfs4tdAcbB07HrRZgEQplVz3PDrPovSug5QxRHGiIg2JgXC55BG65GnfwaiBl
	btSNSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kcts9cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 09:58:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36629e48023so187584a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778147909; x=1778752709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueFkU1uS82QA7Qz5PfMYXENS68x8c9lLBflhnOVZ6aQ=;
        b=RLw16P2+pV8KRfHB0cRjQ65JlYKBoRLh/0UBTz4b9Wz/2ZycMkkYwLpcETZ0Njnf5u
         kgyudRmonENtAHNeSGC/d+EIuqGj0EDmCJxjsTJuPJNuugP7kec3/hDc/vT02v5mda1i
         RECzlyvYw3aMnwAETJfNAW2Fv6tumPqiYV5EtyCQ1LQ1Jso2SmzJ9pzjl4m9VfdxoBc8
         xebAMvaWJ0+vjSfBsplCR/MGxDJZ5sJNygkmmJ98SrIz79cRtYbHXG1EBhft9ZCfiCs+
         YpNxiVb+jRXaLFMH/2EP0w5KZlzQbomwPUGFN9AjmyE1hUzS/dIKyLECsoviu6O4sp9r
         x2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147909; x=1778752709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueFkU1uS82QA7Qz5PfMYXENS68x8c9lLBflhnOVZ6aQ=;
        b=IhoJ1GtkICiDU/r37oGPxifxnu6GIEgiDTBcFgrlkFVAgLFZQj2jj5BCESWD0IObgZ
         2hMZu2TwJphF8jVmoNRR21Cf8ivtN/ox6PWomeumovyMyphN6VxhwDU7uQD4rPU0yFJ0
         QE508HmHJnns3qhI3e/mnRaVJ5G9dKhPMdu2SgSxT7/A+AHv9flA7q3YkrOR4vNDFTqf
         +u6n4PNk1ZWOYaZCXURVw+aDHDjrE4INZvyLhaQbUHjR5fKmCPUZhY5FXGxEQzCeiJLT
         EjuLpPvpEUP/1Mt3z4Oi1Fkb42nnBUIVOjqpPgWBjU1/0lITIYK+Em7l00/9lnP6nC6X
         Nu/w==
X-Forwarded-Encrypted: i=1; AFNElJ9ew8YSe032dfUeTZkWe6SAWi2CoPCFetpSMUbJyTXHR97h7JIsbNUZry4Vrl3lurdBABUzlVehhI/Eu3D1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyao60aeB9wDFuOvunVIoJJU/kdtQmmacQ0ospzP9/9U9SKmxb3
	gcOPkUXkcPi9dHbOoI1Rs3hHtHSC6WAr1MbkF9rxKhSlkrnXtrCH6jDp13wgvcdt/LE1wE8XdRH
	R3y6v6ZbVDQOfj0mycima7Z/FcrXYkqJ6eWbvZbOhJSb+uop1t639xcs/5wIqN4fJFMfD
X-Gm-Gg: AeBDiev0tC30t1frsjW02fBKzD0+dTRPNIV/z3lGr4ZS3QWz8IcvTpMjew3MJpfqrAF
	s+XLFcmzA6jW12z2oC5tt/DbBZoCCu/Bh/hhbBYkxJ/XKC4NpQY941J+Ogzt5epvE9I89dkCAX0
	jnZvP9I17tyFXVG1YkhSVa+4MN8QD8bIUKYf/jXZm6CF/j1wvk9I2x4MIyh6jmiKyixjz2eUJu4
	WYPtFwftTtwlbMDtY6IBc0+qYpZiwvrqTuYQNElj3+JBdpq7ibFpQQIh/A6LeKc/LgadUN10Sq2
	PUbBj2lxKI0cUb/eSsCEj2unZ3s1rO9iovgS0l1kV2b/wP2GXJkEn3LyvzsHXbPDVlsn70YVD2n
	PbJ+vwhx1Qt+XUdqWrFNQDb7zkWTFv4AATQaZyMozRCnrPPFTMiVXaeEUa2L7IK0xlYXU9ebwAO
	DaKR105X6x7ID0Iyg=
X-Received: by 2002:a17:90b:3a0f:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-365ac79e167mr6984139a91.26.1778147909430;
        Thu, 07 May 2026 02:58:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-365ac79e167mr6984112a91.26.1778147908928;
        Thu, 07 May 2026 02:58:28 -0700 (PDT)
Received: from ?IPV6:2405:201:e02c:3e:6c6b:1a56:afde:6508? ([2405:201:e02c:3e:6c6b:1a56:afde:6508])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c4270esm6906007a91.9.2026.05.07.02.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:58:28 -0700 (PDT)
Message-ID: <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
Date: Thu, 7 May 2026 15:28:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc6246 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=nip31g8rMu7ECPMDnyQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kBBGVH17r1tOULaieiM4Lz8GfSJfMFgc
X-Proofpoint-ORIG-GUID: kBBGVH17r1tOULaieiM4Lz8GfSJfMFgc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5OCBTYWx0ZWRfX/owVfBBETcBs
 Ah/GvEfCxeSwZi9H8mXVN7u41lIx244+L1wi7CoelqwVgEuE0h60AkQ3WySGsyPKdhbh4GYAoDT
 mpE6ZQUk5VVvJUGDVP+fnAP1ZVPG0e8iKpQuNaz85hRfEA+brd5/p9Cs4ykEyyr6MaqlV5/hGNA
 3aAu37/PpbW4CyHLBUrwOgdCvxd53wTj3EYuPvIGJh/LTdnqs41sj8qCqeDzefSfYM7vh676ZXX
 RrCGrGs28tXLR7eixBe3HLivq7I/iuqGFqHKbaXIfH0Js0a89U34owL+XatC4rdeiQnJ/NefNtf
 Sf0zzmwbspR7s1IsBhVh1F8ZoIYsAW8kcj+IiIt+VbpvH+okZJjKlEHnHpVzmHEcVO9PktjK/nf
 f7nfBYOD3JXnCul6FrVWEf8KeFf50C04gDn7AQ1MCIEhfapkqXjFCkU0aEmmgy2jpNzvy8TH+jZ
 3GXGkrLKR3mwfORry4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070098
X-Rspamd-Queue-Id: 3B43B4E6752
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,samsung.com,vger.kernel.org,lists.freedesktop.org,nvidia.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-106328-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 2:40 PM, Dmitry Baryshkov wrote:
> On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
>> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
>> mechanism to control the various caches and ram is hosted on the CPU Control
>> Processor (CPUCP) and the method to tweak and start the governor is exposed
>> through the QCOM SCMI Generic Extension Protocol.
>
> Could you please clarify, does this apply to the common commercial
> Glymur and Hamoa laptops?

Yes, they do apply to common commercial Glymur/Hamoa Laptops
as is. This is the same solution used on the windows side of things
as well. There can be certain cases like Johan has reported earlier
where certain oems are stuck with on older version of CPUCP
which requires a the memlat string to be sent out in lower case
we should be able to handle those as well with overriding those
by using driver data and specific compatibles.

-Sibi

>


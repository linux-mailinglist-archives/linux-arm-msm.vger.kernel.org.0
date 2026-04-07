Return-Path: <linux-arm-msm+bounces-102223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM+AHSRY1WmC5AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:16:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 121873B350A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A80AE302F272
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035CE313E30;
	Tue,  7 Apr 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX1jWm1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O49Dm4JQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299F1FBEBC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589403; cv=none; b=aSsq9NkkUTCv4aRVS7sz06nc2+mb6yHqLEeto9/wgiJtyXM6BIEwSzlMcmlw4C7kZonnxdpvzGhLanuV1U59LBZn3QyvlfugnT/t7DwSNlwkUXDvnvrUJYTOl28Zz1CkxKDUp8/uBohZtknYNUm6bNeP+rpEcq+OkR4LPVGaOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589403; c=relaxed/simple;
	bh=4HHk02k9YaB3V/oje3HicvQ/jxq5i/u20i8lkV0JhtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfeBOc6RA1VjoZdqen80p2RENTlYQwwJ6v04KXphzH48v7wMDUYNxPOmFAq27wqPDqPZQ/1UgMUptGrUrSmLpTabZ7IlwPBGvorhF+lDo92HET6OK+fgLWKojtfpxji3d2sx3wtCDAJ2aI4qb0Rtzbk5zgYe6UAN4oHBwXrWkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX1jWm1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O49Dm4JQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CjuPP3815288
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvnMmdo4Wei5AuJO4jFfKnRL9Ab9uaFew2yOkjgAHXY=; b=GX1jWm1A22dLBEHn
	LbDMrxMuxB0ntj5CLmZzrttGhhPdimmav09K5d3WLx6I1jc5SsU1e/Mj8SJ/cqlC
	IXHLFg3bR+82fu/aDC9nVV2qHvWIZcw9leEQHv9gxEJPKBIa5GZ2Xh8biSoFiL/L
	K4GFpIxUceDEy3gn7nvoOvaIOPqeU0CqIhVoydn7RNAqkSBUqDi3eP4/Xoo7dcgW
	bVOeF3HGflNuvWPGw0lN7cTOUeG5q2KQ9d7ioZjb6vrRC7IKHF2E225eFPd8sQh7
	igpHlZaPg99KFP8pFwci2VV+cnAbtvmxA1xyaoTaBrQH7SKj5oAdP5TSI15RCkpn
	szpVPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4vaud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:16:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d02942266so6779216b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589401; x=1776194201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvnMmdo4Wei5AuJO4jFfKnRL9Ab9uaFew2yOkjgAHXY=;
        b=O49Dm4JQYif8jrRJvxKrOfUJdxcvKjNnhnOKqmUbUTkpI7JA/184CVm801yqhF9ZnQ
         jRczx5vNmzcZx1x7oEc9Tn8wGPoGvuCwZuAy1MsSban6F3QwvdKA9KTC2pSJrXliJmL6
         Ine9z93c1HmbU4L8T8ulkWg5xBgDea2LZJDJ8VjPK6ysLwA7JabcP0eVs09o6mE2wW21
         dlZFMV5BXgDjhleSKl0bgZCLY5fZt3RGJmHvdJKxs+9bbX3GQiCq+VJXjj/e797saPAC
         gTbRgTDPgV4OtQB5A/hmhgjoelA7P6v0aK/N0Bw2UQ24PZiJe7XE3mWeqTbEqQQsaXgi
         JJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589401; x=1776194201;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvnMmdo4Wei5AuJO4jFfKnRL9Ab9uaFew2yOkjgAHXY=;
        b=ciCNb51P5k8rccLw91UFiTY+5n3fb8FJu5kRvIQCk/lGp7cmz13RCnbGnOleCqTUh2
         LsEvMFF9Bq6GL1DMNlRJEujAam0TpndQu1bIp6No1Rk3MZk83TjKFIjvlxE1M0SoAUKp
         tlj658h2Alz60WcmlViuqq+ii408rY38T1V4TW6GO6ppAzsgNiBSjUS0ojHvM5k0Xx4r
         2OrrDi2QejJ0aKxJKg0A3jQAgNdD3/kF32oSAcNxScsXhT0J4VYeduUAwSEnTqgzbtp/
         5L9AG9NTEfmLJnDvL8mEs2nRrMmMctTNIIl3TiFdAehtpmqOSji3xvos2/oGSYTTi0HF
         OT1A==
X-Forwarded-Encrypted: i=1; AJvYcCVmQdCC4F9uSW/kG7NCPcGP/r6c1MzgLrnlbiryjmoSG7+YXAiJB16BWiMmbrg+OrjoqCFQe+rHQOsZO4qL@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3VwX3aKLE7428sO2AZ/tasbhzR/Dd9I4gPwG9gI2qoYlKO1y
	XkQyOM9OsEMbnkhz+UeIjDkBD01Eb6zHHZzpaX+R4txRjHxqBRS/NV3oPMAucHTpT8uzsjFN3Hz
	wLdbbHHxU8Dprc95p/hSOZCCgxTgMrcleavqsXmpo8zFEgHtpER5xcDo8ujDD2zMlJAoA
X-Gm-Gg: AeBDieur1aiWODA4soLq4yoISqk4vHcqcy6QcmmrCKKug0D3Gj1tKd3Q+HpqoyegJjZ
	isy6MP7r2FzqsAo8cnizcEJLS0cKKjYGWAnWtX8exWn6fH687L9mz0CbpcZLA49lCZmSoT5Sn+g
	LQz7hn5zTFrSdAuzCDUNHqdT9a3xKyzmk7GTe47mMbnt3+4+ogZ2bTrgBkHykImbBuM3b+HksLx
	QbzCU7QMk0uYFMuiYvCPotDD/kRG2/yPSt7SXFph5e/vlngjeSNSUCD03BtkJ3gqNiJJyj7DvXh
	4Ne/wYx8mRwWFBxHkBP5F63faEOEl5xEWQzd8ZpC8MQEjBrs8laI+ddtwize/Heia1r0bDt/0Hh
	CtBJy0Gf4CRxXHZ9nTLjd829hw7w9VXxKmTxx7CaCH91ndg==
X-Received: by 2002:a05:6a00:b53:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82d0db88417mr17663422b3a.39.1775589400501;
        Tue, 07 Apr 2026 12:16:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:b53:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82d0db88417mr17663393b3a.39.1775589399957;
        Tue, 07 Apr 2026 12:16:39 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41a2asm19340341b3a.37.2026.04.07.12.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:16:39 -0700 (PDT)
Message-ID: <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:46:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
 <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d55819 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KZt6Vqo0b7mNqYgsowAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 1sjnkSGtd7d88mru0NMWIwf2CKNCej5s
X-Proofpoint-ORIG-GUID: 1sjnkSGtd7d88mru0NMWIwf2CKNCej5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NSBTYWx0ZWRfX9VDioe70Hvzj
 RJcLVwFu0QkcvW7aHc2q9i4X37sbd+mMX8clDLkq6qOhVgLxCXUOwsULgPjCW1AWCqLrktlmDlC
 lKhTp+nJTzcR4EzAoHirwMal7Z7fpv3dDYcG30o1DWjhxrXIY0hy/8OG8swbx90oyoixuXqLRQt
 qMUaIedi6q6EGrQhcV+WLHNFaJSuxhkqs515SLljgwzlSINu2IVhwL0EMs2cd5I2+1RONw8GrBI
 ry1pRPM5ir8tSLzKqiskh381Zz97tqAGeZvoRRQH8WHtn9d6Rgj5vmfAUYIHos0GrGO5dX+FdkG
 Q215NDvhmVQsK7sPsmypYRYUC2whZteL76uPlL+6SVrsWm4/84Wmjdt3vr64J08CDvR5YCAoha1
 MOol0xi0MoF42WhfqpaCdwn6AH/Kc0sx0M3flmQc7oZQOfOxmQCBrtWmjC/c+JoQssk2y/DaiGX
 tQqii9WdsOwmD1N/W3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070175
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 121873B350A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 4:31 PM, Konrad Dybcio wrote:
> On 4/7/26 11:30 AM, Taniya Das wrote:
>> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>
>> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
>> which is under the GX power domain. Due to the way the support for this
>> block is implemented in its driver, pm_runtime votes result in a vote on
>> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
>> architecture which require GMU to be the sole voter of these collapsible
>> rails on behalf of GPU, except during the GPU/GMU recovery.
>>
>> To align with this architectural requirement and to realize the power
>> benefits of the IFPC feature, remove the GXPD votes during gmu resume
>> and suspend. And during the recovery sequence, enable/disable the GXPD
>> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Can we simply make this change unconditional on the gen, so as not to
> maintain 2 separate code paths that try to achieve mostly the same thing?

We can skip the gdsc vote on A8x because the 'gdsc disable' callback is
dummy when the synced_poweroff hint is not set. Otherwise, gdsc may get
disabled during system resume while GMU assumes the ownership. Taniya
touched upon this point in the cover letter:

"""
when GX GDSC is managed through the generic GenPD runtime PM
framework, it can be unintentionally disabled by the OS during system
resume (resume_noirq/complete phases) or runtime PM suspend paths.
"""

-Akhil.

> 
> Konrad



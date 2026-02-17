Return-Path: <linux-arm-msm+bounces-93130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHwqH9FPlGktCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:24:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E2314B4DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76BA4302BA6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAB83314B6;
	Tue, 17 Feb 2026 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsnF3Gnn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4DtzTA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8833120D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327388; cv=none; b=iHdJhx895rR6Y6T9gbznkpuxp08M0+Olc+5rnqPlBPe+y59DOGoHkpFxiKq9AW1QSbvWlDRPnPezxmRWcMqQt2Pq4SWChl4ZUYmqyqqaDYATmX9GWlFJ/QdVypcJ4BNYwnxDZAT1dsbKl+F9HaH19B9XjWQ3S750OGhbZMZF5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327388; c=relaxed/simple;
	bh=xMN3I7zoAsk2QRMIeIe/BgW1V6LYLwzLJyzQwBQ1T6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxAg1NJpJv+37PCMiFDw5/4AfXwjh17qcqh2AEyA/zVUwxImyGLPRSkMXA1IgOuV1cSKFwos0ORSoihcZITFFnKpkkeZZKP+37G9jkJe6HqFTteva7LedxXzd5yDv8cUjRN/11359/bpBnlPndMZoiBUZPnWkkpW/r6lqRjpKXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsnF3Gnn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4DtzTA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBEOaM1614526
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLaDJ4loHiaVAWlFSAgg1xguJUSqstbP17hVYmDKCYs=; b=IsnF3Gnn5ye/iHcw
	Ybegrhzv4Dn8vOTIoswtCGxJln3J7pFCnQuBWp3mLmeR5KTtDBFLQRMuSCYpExW0
	jUwYtfKlIaLiUrNnH1nx74+sGAj0/wjvZGrNWpDO5PyPkClIWx6nET5WGqjolTzL
	lwjqV20oMJtnyuImRrWOPv03M0iTpp8F0qraTl/PlytuZQ3bCnMIQrkLIeahBKOU
	4PK3QwGS7kmlwExRGS6mo99T1E139RX//TCmFGuCuKNl0H8xgpwbCoBwKgEYS+wR
	N42BQaJOB0LlmT7wzNY//GhGVKgYzTlPi6oTFwNey00FKrUqLxqmMjQqTXdb+CfV
	pKguzQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662t56e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:23:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946ebb51a0so33188206d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327385; x=1771932185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLaDJ4loHiaVAWlFSAgg1xguJUSqstbP17hVYmDKCYs=;
        b=A4DtzTA6/uQkXrmefpxp5FYxogPL/wQHbJ9EtBfZk/V7ePND9Ghi6nI4f6a5LQJd5t
         dpzcay4mkHE1ZeayfrUXK8QCuDi5gl40V3GieXSMNvva76dbIwUWYytXejvTGhbWW10Z
         mKON6BGMZflOMIbXtlOSLqgE4M1uEQSHLc5kgn886h9Ij+4BiyYioa2Xzee7rY5bZS+F
         KEI5x/NlV2vjaO9Q/kmSDjJtsd3mGgjMvDwEPic41Joa/avO9A/O8AWxr5Vm7K2/JlJS
         riKswsX1UgeOkwhDbEgk+F5fMG0JsThtx9ItkPOyOmTNQ+eK0vOxgu9uS0NV0rbd/uiG
         kxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327385; x=1771932185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLaDJ4loHiaVAWlFSAgg1xguJUSqstbP17hVYmDKCYs=;
        b=aGeR/Xp6wf+6oJmSH5Z/jvwMDum9bM9Bed7ue9mdT+3PSp8HMvaVgdBX7UflygoV4n
         jPZhPNo7WwPYutHvRq86wES/6sRYWKeDBZIKb2gHZvcTYbB4oNoD1fMXczxI+1fVMtIj
         WK0JVfhaeI5tZxVH6XJnp2iWjT3/WbxoZ7+3xlIdj+OBbVnb5hVHotc+fn9Hx3awpN8w
         l8haDCKtRh6TDSw0m+AdyIBTuXDOGv/f+KCSD7RO+yGtJ8C0wLAQ2QDk0qAlkbDaD77D
         zoiXi5j7hbV12tAjPErRAGe68V3NsFDKQVybh4lQJqpeiog1tMiAA82HDQOPXqtEIKr8
         NlRg==
X-Forwarded-Encrypted: i=1; AJvYcCVFIZkLlvaSH2DlA/3vBAfsdKN+m8iL4B+GRWARZL9rSiqIZI2m7UWSDL9Qs0+loGDoVptHS+2QPOKsRWPW@vger.kernel.org
X-Gm-Message-State: AOJu0YwJN+jO0UJMbeqGkk1vLAS50MffeyibbgtoR+apIpG9e9oB0PBz
	NKjuj/2z8R55Qrgv7Ig68aDmwD4ooPc10ay5hCRMg6M11D794DDlYajO++QV/co1gGQDyxWfR8W
	DtXlBeML0//zvjpjZ40GYlAtTq5rrs/oNDDdaXecuaSIYOHXHtY35zXkf19AhglUTd8E+
X-Gm-Gg: AZuq6aIy7g64RxznH2jxJj+Az9OXh86VnXApWnIdKQY41Ew6weYOfv+0TdzIv6go7vU
	vOYfxgCSBirhIMG7OKhQE3XpB4wW2pAwDj2jrWoXtgrcuRmpKlebtjMsaxpdEoxspKuzme8NlWQ
	JEcymeASEWwZYXKBHEZ/KqQNn1dm8CiYWpmemvnoYZBZC+ziYOPc2QV+qT/IHcJcQr70WqJKCyL
	nQ0xYxTWpAO3m6kDktdduWQEcP+afL3H9TKcgzPYO8/Qely6QOVj7tlXU9qypaJDpKa0M1YyI4w
	3eKmQ7RGP2qH6MArgRUAQ95ZM7BPMRA/ica4xu81EEhlfnH1Y3MneBAXMd7bKPS11MBlvOpxwpo
	z41Sssi37eB8YIPIoUyJkfP3DSINElgl3hMDfpqWUZlIw0dMpWZiFrU680RuYM5N+UN2ldbDNKm
	uZ+K4=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr1409356085a.1.1771327384734;
        Tue, 17 Feb 2026 03:23:04 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr1409354085a.1.1771327384207;
        Tue, 17 Feb 2026 03:23:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f102dsm336964566b.26.2026.02.17.03.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:23:03 -0800 (PST)
Message-ID: <c99beabf-9841-44cd-9450-2f339d1d5c41@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:23:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>, rob.clark@oss.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
 <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NSBTYWx0ZWRfX29iCr8/BkDq2
 YjSWBhJ/eyZxAjHTphrdVXgJwbAWaX+Rw0Ix62T5gGNvJvVTAr1v2S53FT9LCB4FMB1hrzkfzo/
 uVmuqe90QyHlVHzwARJkjqq5a0a5GdFWktLpOYsDT4T6uy35HnXGO5s6xEmV1lXIsnU6wGSaEbt
 cXS9swmqdxBXnPHGghl+OIStnw1MNvfQ21Dt8N3xy4xYaNY4Fajq7XIHjmDX8LJB+wjw2b/4WTT
 Y6TNpDyvnnCm0yVmeY7VKUuR0++Erb1gzFsfu28xz5DNxt0vzFPFFPxiROp8/j872OwTv8ILljf
 pC95dRy6PhEV6NShsonfALzr+pXi6/+Df+M4HifDqjkC7Eu9MNBWX4mes3y5yvsV5hRy8nGNTJU
 CydwUp98pZ7KmoUwuXFQ6COn/COBK80EcXE/xNTWSR4fWB4yCoQlG+qLTwDZykluDBJAO1OcXHB
 ZuWysrIreh8iPFp2Y2Q==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69944f99 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=cGCGxpJvRk8pEJ-QcToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: HrofIrTk1rUPO8JBTXqF-ibmVcz2Q1Hi
X-Proofpoint-ORIG-GUID: HrofIrTk1rUPO8JBTXqF-ibmVcz2Q1Hi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,poorly.run,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0E2314B4DB
X-Rspamd-Action: no action

On 1/9/26 10:03 PM, Connor Abbott wrote:
> On Fri, Jan 9, 2026 at 3:41 PM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>
>> On Fri, Jan 9, 2026 at 11:11 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>
>>> On Thu, Jan 8, 2026 at 9:22 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>
>>>> This series introduces an API to retrieve that value, uses it in the
>>>> aforementioned programming sequences and exposes available DDR
>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>> information can be exposed in the future, as needed.
>>>>
>>>> Patch 3 should really be merged after 1&2
>>>
>>> No. The HBB value currently returned by the bootloader is *not* always
>>> the same as what we use currently, because some SoCs (like SM8250)
>>> with the same DT ship with multiple different DRAM configurations and
>>> we've been using a sub-optimal value the whole time. After all, that's
>>> the whole point of using the bootloader value. But patches 1&2 will
>>> only make the DPU use the bootloader value for HBB, not the GPU. So on
>>> one of the affected SoCs, it will introduce a mismatch. You can't
>>> change anything until the GPU side uses the new ubwc config as its
>>> source of truth.
>>
>> Hmm, how is this even working today if DPU is using HBB from the
>> global table but GPU is not?  Are we just getting lucky with
>> compositors that don't know about modifiers and end up scanning out
>> linear?
> 
> It works out as well as it's always worked out, i.e. we try to make
> GPU and DPU config match and pray that we didn't mess it up. At least
> now we'll get a warning when they don't match.
> 
>>
>> We do log warnings when the global ubwc config does not match the
>> "fixed up" config.. google search for those msgs doesn't seem to turn
>> up anything other than the patch which introduced them.  Idk if that
>> is conclusive in any way, but I hope that means we could just delete
>> the fixup code on the GPU side.  I suppose we could add:
>>
>>        *cfg = *common_cfg;
>>
>> after the warning as a first step.  That would maybe get some bug
>> reports along with enough details in dmesg?
> 
> Yes, the plan was always to delete the fixup code in the GPU config.
> And even that first step would be enough to prevent regressions when
> switching to the bootloader HBB value.
> 
> There is a problem in that ubwc_swizzle isn't as well tested. Older
> parts supporting UBWC 1.0-3.0 partially or entirely ignore
> ubwc_swizzle, because it wasn't configurable back then, but we rely on
> it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> textures. So if ubwc_swizzle is incorrect you probably wouldn't
> notice, until you hit the HIC codepath in zink or some game using
> sparse textures. I think we fixed up all the cases where it was
> incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> check again.

Just to double-check, is your expectation to just double-check the kernel
settings, or would that require some intervention on the mesa side too?

Konrad


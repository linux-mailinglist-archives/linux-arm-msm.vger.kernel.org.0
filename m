Return-Path: <linux-arm-msm+bounces-90113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHHAJSi9cWkmLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:01:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 493FF621F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 175DC522220
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 06:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDE5340279;
	Thu, 22 Jan 2026 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAyxnsct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fv/fLUTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE98472789
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061584; cv=none; b=jRxKB/0l55FeoZImlvfqiLGyM03IdMpyAILZ5Ua1+mqrN9FjFqrpPwaxbfxoadoEAjzT8G84vS6QyRmoSuWZVohoY0onHEf+wRB/gFOPoTV5XMH6htzuwnkIkL+B3nZMxLOJx8GcB+i4a85wrmyy5mT0AQhcYpcev07tvl9pqJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061584; c=relaxed/simple;
	bh=rREvRz66ppSzw8zf9t7lk1EK+5gjHPTxTR90Fq0WYz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/iPuJNVsEvBzbcFkaWyi3l4CB7i1JMVqw2DIN86tSfIYzoXDq4MNQ3fzo3rA2mHGmIwvHRsfrVuq37jJ7IjXizl0YdVUJNdPbJszShdZslIIdLy5UgrOC/2orBNdPtfiR2D8HSwgSGhyeD+t27JsapySbFWhl94kKIVfruIfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAyxnsct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fv/fLUTE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLqjKV3868713
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYq+uyK/jDolhx3ukdLPNMLoMLU6DcG/o/t/J1EddSo=; b=HAyxnsctrSR3guez
	7Uzm2fVbo7VVqjluenZN5y6e7L3xU1ptxEHwC+xni3yQ1LJtBkCJyqPbfNS6lx88
	SrGsHtC7PCGNsS1kcweHwJxCgs9kYJh0CIZkuuq0yHtbAGptOmDsuMgsAA3R0ufh
	tMaCuGNhvfqbJz/U6Q3mNyULS6/j1SigK+HfNEJP8dJB3G5Q4yjJisp9BSCSlBVI
	wGOoge4yPFleUfDQO9E+NukiNZUzr0yg0z8zKceKIDdJKOHkITvuuRK0wp8Hlc/7
	lB2PcwJ6QFfxzGTYzz2/hnDC0cf1+cp3ychxQMccz8z555antFaBDkt5cdQ37JHA
	2EFEvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btyrpjtsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:59:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so7643205ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 21:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769061580; x=1769666380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYq+uyK/jDolhx3ukdLPNMLoMLU6DcG/o/t/J1EddSo=;
        b=fv/fLUTEpKzYbBa1uIWbTrwNGu/W04KNYJnK4twytVruck+NhoLpCbv6C9opkEFgNt
         47eFZRMz69+HAYRMJIkaMtTdKDyMWuJKOtPyBxneGrjf6KZ06GXNBSXdBJ0VfTda/CbX
         bfmqFzxr1EUlXkJAJzNxpGuhuwuv0QeuX3BLrpMu+DpuwQE9OM/Ccti8srasB43iRE3W
         lo1jVWLzYZh3qHZ7tjrx8ia5mciVWEm60C9vRw+Skdel8Voy7vcGxKGq8JBcnEzDZJYZ
         lZs0dOF965Nl09DuYra/Cqe5Vux93S3Mk/fY2nU795J7tW5dM4o6x5Jp3OhhhqwCb4ay
         Y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769061580; x=1769666380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYq+uyK/jDolhx3ukdLPNMLoMLU6DcG/o/t/J1EddSo=;
        b=WpcTNG8LZGcMWy1RYOAmz5ikLaS7wPJUvXcdAvwEnjGzZXesheQSpiaoMSjRbb4u7R
         L13JHaQgoSKahQKN/QM20bLDdypvI8oJNASlovKbERPgHHGXlV/9z8851xHZVaCsF4qf
         PxweuE4OjkN8I1hs82BC6I3a/tFDtiuJVkiwqgOPs3QyzzKIGZu3oI4Kzc8byykI4sDt
         dtQltryqYOUl2wzE1soMv9TuF5PmVSJwS+pOWIo2EUNGi8/b9OY7O3FrvfLvxkkSjJC9
         TLIIvrZWclAALMOrK0w2lVs2CsWbDy9IpoV1JLDoqqcz+sdCKl/9mJ8cfAW3i7ZeKu6m
         j27g==
X-Forwarded-Encrypted: i=1; AJvYcCXAPOCRNqXbCIf6h12w1jLvDM+YrVhgGhCoWunv7PUlMBsqwoxanA8DieyHxcr+CgCCwrOeSOPNJHSn9OlD@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIsFdpD/M3JB6X+Sr4JxKiWwO8kqurNfwgLOng1a/0u3PFi9y
	antY2pCicT5mQ3iOc1OMKpETw3vPxHnKN1P2gvZXIQ8vUiAmuAjgTs5qucH20fi0q6EYMas7WhC
	JmOHcA39+gPKrrQXBSqCmtpPJUEzRM9ploiWK6666EaHGw+Bbd/m9sFO3ryJdUxQ7d/sg
X-Gm-Gg: AZuq6aL7Phd5Q0TIIWZ705U9N0Jx7deNyvqt8oB1NvRsCDflM0IW9HnCSL3TDNvfe68
	0hpyLBmLwjUP+Q93Ln5V9YR3G6GI8advXH8Rm9ZBLiPypFNUVyowjCc/OE+6lyy04AFIWZmCO3O
	ZmCZ/QHgEwcrHfJgrWYDO9ligGyx2QT1ws5mYBMOlSshAMO4ZL+BK6e1ULCV+AiC71EaoCUAxWK
	wm4J6fzfM1YX8moaLYU7ljg4/XgNQv+jYS6fxOQp+feHVkMsCTb/veLED2sAnUTSHVszbJ47dK0
	dN/MFymL6xKmHbE1fRt8NhvXYO6Vth6/z3qfdwR+IrJz3UvIDqcVCDtoi5jNZm/oZL5QVFce1Y+
	R0NWvMt9T1MZ3nAxD2+o0ac2/XeECN7LrG/LAXdy1U3Dk
X-Received: by 2002:a17:903:3806:b0:2a0:81c1:6194 with SMTP id d9443c01a7336-2a76b16950dmr72029655ad.47.1769061579680;
        Wed, 21 Jan 2026 21:59:39 -0800 (PST)
X-Received: by 2002:a17:903:3806:b0:2a0:81c1:6194 with SMTP id d9443c01a7336-2a76b16950dmr72029445ad.47.1769061579089;
        Wed, 21 Jan 2026 21:59:39 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fbfa8sm171765285ad.76.2026.01.21.21.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 21:59:38 -0800 (PST)
Message-ID: <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 11:29:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
 <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yixFYVLdyhMCisvp5grkGaslpDVkWksd
X-Proofpoint-GUID: yixFYVLdyhMCisvp5grkGaslpDVkWksd
X-Authority-Analysis: v=2.4 cv=KpdAGGWN c=1 sm=1 tr=0 ts=6971bccc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=SS8V8czUUEjaKKq3JI+KvQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=-l4P_tr_EDuyF4aq3zoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAzNyBTYWx0ZWRfXzmcR8tMmwztm
 Uz7Jd/Z2K2wk0GkWYjDBUFYoPUtYLcPyMjDPQfdLkc0NlzAGaSmuBz6cJjQPIXTf4/OzN1YHj30
 EKTvreRzk6wK0G3XVfXSHP+kK6w1C2gt/Wt1Vy3Kj064JAuQssq2p1tWjyJLFVkUIBHxFUV5WTK
 v0BMI8tFmGBmIlJLvN+B+GjkRmePGtv2vNzoo8o4ipL5VM32k16hHiHbNbwJruycsSRpqg49fZt
 NxQGeQtELewr+l0i32jHs+UiSaVVDm8zWL8lwnoZHFbcYAsRRrtSyLJpaKmBYHeOJohoV8s/luj
 MVGn5WpY9OVM6gRT2/Ab267iwU9884+gL9fhfNfCB9YVgUOyt1/EWyf1vVr0rjE+BNBjnCkmbIV
 botEP8nOorbNWkviV3Hc1oCAAuRO3pbIP5Z7jKVIqnACnQmI/3aCrTTDj0Be4LLkuNMOluigd8B
 wO7MVU5aE3D/8mJ/i5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220037
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90113-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,gitlab.freedesktop.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,ndufresne.ca,poorly.run,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 493FF621F7
X-Rspamd-Action: no action


On 1/16/2026 1:16 AM, Dmitry Baryshkov wrote:
> I should have added GPU maintainers and ML beforehand. Fixing it now.
> 
> On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
>> Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
>>> On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
>>>> Add support for the QC08C color format in both the encoder and decoder
>>>> paths of the iris driver. The changes include:
>>>>
>>>> - Adding QC08C format handling in the driver for both encoding and
>>>> decoding.
>>>> - Updating format enumeration to properly return supported formats.
>>>> - Ensuring the correct HFI format is set for firmware communication.
>>>> -Making all related changes required for seamless integration of QC08C
>>>> support.
>>>>
>>>> The changes have been validated using v4l2-ctl, compliance, and GStreamer
>>>> (GST) tests.
>>>> Both GST and v4l2-ctl tests were performed using the NV12 format, as
>>>> these clients do not support the QCOM-specific QC08C format, and all
>>>> tests passed successfully.
>>>>
>>>> During v4l2-ctl testing, a regression was observed when using the NV12
>>>> color format after adding QC08C support. A fix for this regression has
>>>> also been posted [1].
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
>>>>   
>>>>
>>>> Changes in v2:
>>>> - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
>>>> - Updated commit text to indicate QC08C is NV12 with UBWC compression
>>>> (Bryan, Dmitry)
>>>> - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
>>>> - Link to v1:
>>>> https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>> Dikshita Agarwal (3):
>>>>        media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
>>>>        media: iris: Add support for QC08C format for decoder
>>>>        media: iris: Add support for QC08C format for encoder
>>>>
>>>
>>> Looking at the series again... What is the definition of V4L formats?
>>> Are they expected to be self-compatible? Transferable between machines?
>>> In DRM world we made a mistake, making use of a single non-parametrized
>>> UBWC modifier, and then later we had to introduce OOB values to
>>> represent different params of UBWC compressed images.
>>>
>>> So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
>>> should we have different format values (at least for different swizzle
>>> and macrotile modes)?
>>
>> Our expectation is that the decoder will produce the same format regardless the
>> resolution. And that format should be shareable, so that same format coming from
>> two drivers means the same thing without out of band data, except that
>> resolution and strides are needed oob anyway and can obviously be used as an
>> acceptable workaround the issue you describe. It should also have a single
>> translation to DRM fourcc + modifier, and hopefully the other way around is
>> possible too, otherwise its a bit broken and unusable.
> 
> Well... As I wrote, we made a certain decision several years go: there
> is only one DRM modifier. At that point the decision was made by
> open-source people which had a very limited information about hardware
> internals. We can probably try deprecating it and shifting towards
> multiple entries. On the other side, most of the blocks would only be
> able to support only one of very few possible configurations.
> 
>>
>> So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
>> format as a pair of DRM fourcc + modifier. Decoders typically only support a
>> subset, or hardware engineers can generally pick a handful of performant
>> configurations that works for all cases (its all 2D with similarly sized
>> macroblocks).
> 
> This is not quite applicable: even if we try to fix all other settings,
> the format differs from platform to platform because of the memory
> organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).
> 
> There is a description of swizzling in Mesa ([1])
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc
> 
>> Since these formats are only usable when consumed by GPU or
>> display controllers, its important that all party uses the same convention for
>> the limited information available.

Would there be a need for any client, other than GPU/display, to peek 
into the data OR to validate it, it need to decompress it. For that as 
well, it would need all the associated info to decompress it.

Again in same SOC, camera can produce compressed YUV with different 
parameter while VPU different, it would again need the associated info 
alongwith single "UBWC-compressed NV12" to decompress it.

> 
> Yes, we added UBWC config database in order to have a single source of
> information for the kernel.
> 
> So... On the practical side there can be:
>   - UBWC 1.0, 2.0, 3.0, 4.0, etc.
> 
>   - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.
> 
>   - HBB or 13, 14, 15, 16
> 
>   - bank spreading (true or false)
> 
>  From the practical point of view, drivers/soc/qcom/ubwc.c defines the
> following formats (currently, I'd like to cross-check some of them):
> 
> - linear
> - 1.0_123_14
> - 1.0_123_14_spread
> - 1.0_123_15
> - 2.0_23_14
> - 2.0_23_14_spread
> - 2.0_23_15
> - 3.0_23_13_spread
> - 3.0_23_14_spread
> - 3.0_23_15
> - 3.0_23_16
> - 4.0_23_15_spread
> - 4.0_23_16_spread
> - 4.0_3_13_spread
> - 5.0_23_15_spread
> - 5.0_23_16_spread
> - 6.0_23_16_spread
> 
> Would it be benefitable to define separate DRM modifiers (and NV12
> compressed variant for V4L2) for each of them?
> 

Regards,
Vikash


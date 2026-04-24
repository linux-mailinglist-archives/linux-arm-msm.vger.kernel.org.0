Return-Path: <linux-arm-msm+bounces-104493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DdxIUrA62ngQwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 21:11:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E3462B19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 21:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 867073009503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 19:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F17D3FA5C4;
	Fri, 24 Apr 2026 19:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="nnt1cmrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377313EFD05
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777057703; cv=none; b=b/Z8YiCTBYc3L2KipuJnKynHrwUFtiqfPAVHArmFt1rr2HA1F4CsgXi6xrmkdeQQhHZ6P3R1xntj/u/AD17OLt1iM070sDxHRrhIKaNX6M2LLJVTl8VSiuFQkfJTiJ4HJaLSSQiHDvgAgHryEqw8J/oCgf7l+ySmuSByiC2jfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777057703; c=relaxed/simple;
	bh=8A6x/gwvigokDWQHjH1XTTPUpJb98Mhg/r0z4VARm4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipSGLJ2j4SJVXguRjy0g0Kodb7OH0j7Hjtr/y1l62jAQPmlJlUU4Vyy6DUzyKM4GOHWnclz+mGpXDBJ9+Jyerxuip33sTu0M7yHRUCL6V1m/18+Qomh2GowGa9pLxF5M1sNuqtaKAJtzoZJfNWmbYEGDlV2tDspgxM89G0zxUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=nnt1cmrY; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <c3b833d8-2e8a-4418-9043-6cd04d9901e1@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777057689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q7AY28qlHBjgzfWhhXsEAsuWHcEKhugX23O64AEQqA=;
	b=nnt1cmrYKgqViG1liVRq6/0f4EejzGYfXen3cebO9qtTfbXXcCQm7vSo3J/ezkwa1y1Huj
	yuEhv5AQt9otPdCsyU5Si1H+ksvzqUjbHms01qDdVFCGwSYpnMkJQ5N8epX1tab+xAO4/G
	vz0B/vHMxyRIHTeAxHIvhXQD/5e2r3gy/cVkFvTUbSqwfMeUKqL4bIgfYr1vFyVfTWGLb1
	FOwQHBlzAxLRyq4Pho8rDP6u2W1W42Yf6R5Op7z9JzR/sM2fZLT3XWXfKQTxjk4rJ1uNZz
	tXuapn2aXf9bId8MCU6aT1JfKrUHgu0GpKyNf/R0irr3cfRjvi4KIR+j5BMtXg==
Date: Fri, 24 Apr 2026 16:07:56 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
 <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 267E3462B19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104493-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,radxa.com,kernel.org,gmail.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]


On 4/24/26 9:28 AM, Konrad Dybcio wrote:
> On 4/8/26 11:47 AM, Xilin Wu wrote:
>> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>>> Q6A.
>>>>
>>>> This variant enables the LPASS blocks and codec macros needed by the
>>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>>> that the audio hardware is owned directly by Linux.
>>>>
>>>> This DTB is an optional configuration for systems booted with the kernel
>>>> running at EL2, where direct CPU access to the LPASS hardware is
>>>> available. It is useful for users who need low-latency and fully
>>>> controllable audio.
>>> I believe on Chrome platforms it was done this way because at some point
>>> it was determined that they would specifically like not to use the DSP.
>>>
>>> I think this is more of a hack than anything else.. but at the end of the
>>> commit message you mention low latency - is the impact actually measurable?
>>>
>> Some of our users also specifically prefer not to use the DSP [1] :)
>>
>> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.
> We passed on this feedback.
>
>> Since the lpass-cpu setup works properly, I would not consider this a hack.
> Well yeah it works, but I was really hoping it would be made
> unnecessary and available for removal sooner or later..
>
> But since there's a genuine usecase, perhaps not.

lpass-cpu is also great from a "I don't want my pure libre operating 
system to touch dirty proprietary binary blobs" perspective, but you can 
definitely argue that that's not a genuine use case :)

~val



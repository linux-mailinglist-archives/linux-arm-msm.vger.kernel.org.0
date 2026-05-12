Return-Path: <linux-arm-msm+bounces-107053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHbiLIfkAmpEyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:27:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365D51CAFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EE3D3020886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ACC3C553C;
	Tue, 12 May 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEnV6RHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1fesyPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434383C3432
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574455; cv=none; b=RljWjneLQQx/k0LVYjHg90bZLPlvj35S4IKe8qr/19ZZG4ILj2LuzylmhoLm9+CyCCVCPXsEswQO3TH6nI/P9L9dOK/tNc3DcsZoMiQP8H1JzQa13QjXHfb7LelFeQEAPNxXpHbPvkoLf/zmDRtDJPrzS3VSfk2KtnoBJl01fP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574455; c=relaxed/simple;
	bh=fp+V34hpoB4yOssKdt0U5isqsJCDpUTiW9m4DUr8URs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3BcCRxy9OTXUqPD1i2LUbIPplpP4OLqjFSAkSjvD7L5zr3Fc/5Zg5OjzY/bvwWwnUQnA85baTyfHOHe+OkpOoEODpeKyGgsIZFICH98Uh+ImecbfTI9W6Mw/EEydogpgf/KaQaucOAtc5erWHtv9Xs7TDMCF62lAfYzsBJFzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEnV6RHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1fesyPn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5GJRK2518581
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=; b=HEnV6RHMDE4ksLLg
	IEaGiz2OR8zAqO1LerOH0lU+PAy4b5wNxrY9c9U5uTFxTGWm9QgiSi0Hhmdy4MHB
	pG4F3GeTaHtLd2glTpAetIfgj39iXLPal9qQaAecm3IBpzUwYp6Ba0hpSb2nEv+W
	2pBGfqeZKkw2LnxszX1expqBrAaBTK8Sk4YgMG7U/N2kIFqKfmzaedlze2P1fUmw
	kO4YWxBjGdA+h7AWnQjX/u7iRfu4ZPukZ5G43k9Rg8vzpN3XGY8zv9dSd6NO7BeV
	mAxvxbK68mqak6VB7l+w0HwGdbtqZm10YXRitdMKsKK831LmdCxpWUq8DMXDBNPy
	YW9WBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1j8ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:27:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso34912001cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778574451; x=1779179251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=;
        b=c1fesyPnvyYxCUTVrflmRdKR2aUaRSBQSR5bwHXf8zi5nwrc9kkPqArFeOUKEeVhUB
         ndy0QZBCWaLr6vukAurdrwGvl+lL+Fg1iCZ+GM+uQHYrBcZyPa2VHxe29G4Koy0FJWFh
         OSAaClRwZ3eqkQ+9o8jI7FOEUSkaPBa8j7ZZk9VRTeS06zeyDCK7EYdmESUSIg3XbZzZ
         dDY9SPc2cT3GP9NNamNO/WNI960vfw+KEIQbBxsjOp7Zz4b+QdNdHxwBg+mVEOVD3VV0
         IbziAW46I/Wx/1JAA7lRhqJBb7iyvjq3EZowD0aKy1cFuz2zR2Hn9yjsYomripsoS+7K
         cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574451; x=1779179251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=;
        b=qef9Cohw4FayTmsfKNvSQX+lI71H+v04j74lZHDA1V13UzfP2q5ygcPhl0Tb0K3/5k
         jF+KqSaEJOQT6qJMn0S34y+cb/I+20OJIFuCijKa9Jc9aNvEsG8Z6jy3r6Mj/DTXV1zk
         z9kUQ3/uv8WsVHfzduBBoWrNtdP+w7abAW6IpStbsjg/GsvCw+vc9O3OxnTRrRu/EhOc
         O02Q398BcGyqfiLESqbUnjYjPcKwnA1ZFQ8bYow4Sf91W8k5HXH++tKnPEAMo9fb4Sn6
         FxmnzHPiXjioJxzts+966ojIQljkclxN6j3UF7KnE1EOKwN+Mm4zP1piqM5wO+JbMQRr
         pkxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HT9NsCsMYf77Hk6B1foPjIz3qwqS0diaMF8YL91/UcpxHp1Bk2Z+jxGyGirm9kNyIJ3XvTIPxkaqR4FH8@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmuHDhst9iTADJJTx8DEOAKX+ZVVssPy2O7SAZ87WS48TrhYD
	nPYOhx5oVdZtwL8E5UuHR5Qoo1PLgfFXVBMVw9Dgct5bcqYmqW3rB3Hs6SFbYCAgGveJSiMExKr
	RA8Lu5tqEYQ9zq8xYa3Lur0xjTsC8TUn+tEr25Jb2CPGGwHE4FiE6ujLxQmJvAzALQxih
X-Gm-Gg: Acq92OGTuk2Ja43cIWe7AJg+golXBpi6zY1thgU8g01yk2oXxCZYk1Ph2IsJjbtVqxp
	azIFY3BKayL3Jgv1GMeLTzhKMnF36XzBSp1dY535onpYr6elHvwE7IeiW0o8/dDQeOoCzSbBobv
	lRiKUx1gSatJMkLAj/qohyXemIgIKRafKdoHSmKJ7qYEVAYcHD80ubFuQfEK85ot4HJgYVdCRUO
	am7Ria5J9/a94J5S7BpLl/x2L9/eSxF8Ud6dSpKeyqvVYw7sR4kwcqSsZWTyucF6HzmtdiZ/IJ5
	l6aU6Jec6EFnEyNktE9pt5n0qZdGRdkMw7e0B0VdOZ4wu9QUHP/aff+xQTUl0DcJfVb0r6VN/ng
	R0fXub8rmNUiXvFJp10MIOu1sgyGodlAQ8h75bkO+/Y9/O0XC
X-Received: by 2002:a05:622a:2613:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-51461f9fc6bmr388503601cf.38.1778574451524;
        Tue, 12 May 2026 01:27:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2613:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-51461f9fc6bmr388503351cf.38.1778574451002;
        Tue, 12 May 2026 01:27:31 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ba2aaec3asm589796f8f.15.2026.05.12.01.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:27:30 -0700 (PDT)
Message-ID: <2acc3606-2e34-4037-94c5-9f6f28e497d2@oss.qualcomm.com>
Date: Tue, 12 May 2026 08:27:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
 <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gER1E3fWj1GdhSTdbj7Mx18d9quz09rj
X-Proofpoint-ORIG-GUID: gER1E3fWj1GdhSTdbj7Mx18d9quz09rj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4NCBTYWx0ZWRfXwflvX5PJZ3GA
 N5UIKXzZbk5FbzOoQkd4b1exoFR76H2hgcTCjvi2TKMDzo47nGTmU3teTImRabTOV/bPgnvRwqd
 IQs/4WwMQFPrBuOPwtdVpaISZpOhpK24OkjkDk6qzFDNvIdoBWGU2Ga73Q0MsQ1lYcuKHFoMnx1
 uWAtKF7KRlYJwkLm0jdR8VNYgLwlDua0zff+QL5OY7xRRRVdfKKr0l6wluQb3E8azbyZGfrJrk1
 xdA5tc1avePa5q3qKqmiiwrXTXbowdfRN0G0A99Zzaz1drVg76BiwPK0DLW72quQ+8QwLcNipyw
 7WCgmgAgOo0VRcqZKW+YejKmzmKyzDyakNGSlny4bWcYycvW2RPImtLWpMnhielUfrKVechJT5C
 w1Fuv72l543N3wDWHxWN6A5OS8V7rQJ4HPJFnZaJ83/T+T+BIBPzLrhZsATs6AT8HM16PypCHaW
 UQtItO9Yh0+KHfZa0qA==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02e474 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LiCzDUw_Kzk_wQzT1yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120084
X-Rspamd-Queue-Id: 9365D51CAFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107053-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 5:09 AM, Jens Glathe wrote:
> On 02.04.26 10:11, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
>>   sound/soc/qcom/qdsp6/audioreach.h |   5 +-
>>   sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
>>   sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
>>   sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
>>   5 files changed, 202 insertions(+), 135 deletions(-)
> 
> Hi there,
> 
> I had to revert this patch from the series to get back working sound on
> sc8280xp (Blackrock) on 7.1. And hitting the right patch was pure luck,
> tbh, since I integrated the series on 6.19 and couldn't apply the last 2
> cleanly. But figured these are cleanup/refactoring and left them out.
> 
> The errors I'm getting on Blackrock are these:
> 
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: Audio Start: Buffer Allocation failed rc = -22
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: ASoC error (-22): at
> snd_soc_pcm_component_new() on 3000000.remoteproc:glink-
> edge:gpr:service@1:dais
> 
> Since I'm way out of my depth here, I won't cite from the Great
> Hallucinator's analysis. Only reporting that this refactoring breaks
> sound on sc8280xp.

Thanks Jens for reporting this, Let me investigate this and get back.

--srini
> 
> with best regards
> 
> Jens
> 



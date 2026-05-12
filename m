Return-Path: <linux-arm-msm+bounces-107032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LaqBQq2AmrFvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:09:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA2519BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48C953028B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEAD2E7185;
	Tue, 12 May 2026 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Eb9ANd0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24D1B87C9;
	Tue, 12 May 2026 05:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562565; cv=none; b=K6szZKo+pmbkmZ1zZr2O2xXuAr87DPpjZe2Td4t5yjBMGllb2Lvsj/42KvDkMWHXj5pgys9M1097420iPRtAAPYvypxXTtPHTQFqOHNUbHjmaDa9moRwlSVzLv0DW2rUHHL62e95mgBr/o8snSepZuj1SrGiuU/kL5mLM7yo9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562565; c=relaxed/simple;
	bh=Rc/YVW1Q8CsjbSRbXm+gYWkAxLZ/MU3pMXvtI/bzI1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMANzQqhO1Zwg1AtNJNhBQTZAohgwyB69NA09O9U7EE3lWfmd4yApkU+Kq+BEBPho9cIRlA0oZNCfmWdQFHzisFNXYAEvROFJsMjKCplGd2dnQPC6ofErBSXkg/S0SeS8CtKex+8CRKq0P5H9fhjwlQ8ARflcAUd3GrqLdFuMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Eb9ANd0/; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1778562555; x=1779167355;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=CosX7A9vpaqpQ0xU4OXwYdMZ9c6lIogVrxnX1tL5G4s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Eb9ANd0/LRgsE5s0BKCSdMc3tJCjbhoNXJW6xaBaA93B4hmvGD4lW0dPZ37eLItc
	 wDjV/ykZI9ZEtgoN0b+Q6Ni+aIVkd9KUZpxVzjWtNqpLuUFYb9HQxx9PG+q6OAGO7
	 P9kH21IViWhmj73t4jubNgf0wL2HuFxx/X1hXrTEIOkggvcQfP0IGTztxRHzDcG7A
	 rkEV65AG32qkW3WABG7YOknQHVTOki73SJ4tjmraV4Z6nGti8lXgf9pVp11Nhlr+E
	 Xt14YEx+Yk6BcXGn4Xv4oI5WH1wQNRkV8XKdEhjTRLLb9J935imf5VY/nai4k3kBE
	 wGzj2xXlffFsb2EDsA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWzXj-1wtxmk13EH-00T2qS; Tue, 12
 May 2026 07:09:15 +0200
Message-ID: <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Date: Tue, 12 May 2026 07:09:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
 mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YafkRzPZ9n1/Nj+u2h3UdiH1N8qsZJz3xiK9CX0NBzeuaS6PNNr
 5OE3I/IQSYVZybyxwwW6Rq1Yl10i9zYcTfAKrYGHL5/U/kWOhUK3Z7fIWqM3FXVKcVWCXI7
 iy7+IQaKOQYi6R7VXjOvBSX1HKBUqnBT/dHfkhMN+XpYz7yZvON22dD62A0zMLFGP2fWu9W
 S+TWhIu3RBd3Isgs7pJqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/RqtPwo1yDc=;QYZE7Pe4obKqJuK56IbiqMO6Y/Q
 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
 Q6KfmNN583/QMKN3UFLPmeLK1CEt8=
X-Rspamd-Queue-Id: 67FA2519BF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 02.04.26 10:11, Srinivas Kandagatla wrote:
> Buffers are allocated on pcm_new and mapped in the dsp on every
> prepare call, which is inefficient and unnecessary.
>
> Add new functions q6apm_[un]map_memory_fixed_region to map it on
> to dsp only once after allocation.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com=
>
> ---
>   sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
>   sound/soc/qcom/qdsp6/audioreach.h |   5 +-
>   sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
>   sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
>   sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
>   5 files changed, 202 insertions(+), 135 deletions(-)

Hi there,

I had to revert this patch from the series to get back working sound on=20
sc8280xp (Blackrock) on 7.1. And hitting the right patch was pure luck,=20
tbh, since I integrated the series on 6.19 and couldn't apply the last 2=
=20
cleanly. But figured these are cleanup/refactoring and left them out.

The errors I'm getting on Blackrock are these:

Mai 11 21:26:32 volterra kernel: q6apm-dai=20
3000000.remoteproc:glink-edge:gpr:service@1:dais: Audio Start: Buffer=20
Allocation failed rc =3D -22
Mai 11 21:26:32 volterra kernel: q6apm-dai=20
3000000.remoteproc:glink-edge:gpr:service@1:dais: ASoC error (-22): at=20
snd_soc_pcm_component_new() on=20
3000000.remoteproc:glink-edge:gpr:service@1:dais

Since I'm way out of my depth here, I won't cite from the Great=20
Hallucinator's analysis. Only reporting that this refactoring breaks=20
sound on sc8280xp.

with best regards

Jens



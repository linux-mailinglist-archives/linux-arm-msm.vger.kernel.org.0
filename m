Return-Path: <linux-arm-msm+bounces-107966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOorDp5oB2qZ2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:40:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B6556659
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E77F830215A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 18:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5613F9A00;
	Fri, 15 May 2026 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="mIM1Lzbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7493EEAED;
	Fri, 15 May 2026 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778870105; cv=none; b=qVUwRNc9nS876Rr0zoH9GOdva6Zt4cU24so0RTy0itdmItdiQsP7IAynlwJMLJpajbNwBNePs4EyLe7bPjZzIfdyyfJIa9zRX9EQBeGsPywBGRvzwk80unCsYRwVJTU1TdzApcph6V46x6xDFawJnYxnYG704/XDQCe7Po6/A20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778870105; c=relaxed/simple;
	bh=0va+p57QfeIXjAOCoOZbtm/d1y10zNtarNsxeosxD7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnQhf1MLWpua5co03Iwk0tU6tJm8JH7gcJm45Es/Vx9LZ6H5bjNPeLh4kytTv4TwlttfBT3anNH6i4ZsK553Nv1So8zMLwm4rlTsyn/QPrYXLmev8CCCpG+nPsbu42Gb+0bOUp03X3eBKTX/tia6JtKPKz4loiuWId+/klz/tdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=mIM1Lzbh; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1778870073; x=1779474873;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=0va+p57QfeIXjAOCoOZbtm/d1y10zNtarNsxeosxD7U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mIM1LzbheHBVKLVsN4FU+HULpLilpS15vhAiucwLX8EJj5xA/CJ3ECEEnUOnEW45
	 /gQk5slWBeqHdVymTpcvdje+bIRmmU9mP8JmcbNXbGLojD58jEY616c+B8A4zreaB
	 YJ6fY5LaU2bpZV3EbEzuelleGMt+5xsTryhsQ8fMmUMY/r4TDCtps5tAPvV0FqT80
	 9vXKwMcsXtTuvQyDoaupAjWS1pibqMqSF0ZTvDo97ERgUt2rtkXrtD6h8zEHEMuyt
	 RQBZf8bgSt0BlvqHXKgaH61BOQ7MhY7/t0HXNmPkicMPo9VVBbdgREPrapfP/mZ9+
	 ji06os4GbNjiBSA/9w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MlNgz-1x6sxI20mT-00mYUF; Fri, 15
 May 2026 20:34:33 +0200
Message-ID: <10e69eef-c510-46bf-be0c-ef09caf2556f@oldschoolsolutions.biz>
Date: Fri, 15 May 2026 20:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM
 buffers
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, val@packett.cool, mailingradian@gmail.com,
 Stable@vger.kernel.org
References: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LQgE1aRYJDyiRMjIh4hSFhNG0UsI9fb+tTKKPb8hZHiqweyeWds
 I2KzkiwkZLpjfWzNS6wj16syAuERJnNzD5Jh59o/cAuGCD494/cY4M9W49+CBMdzhxBZqph
 M38HGFNhI+HAecZr2YqQW6DpMGwrK/wSX79FJSxZZzsCqh/zqf7b8txckUarENnkW8L0J36
 WHBwThHwVV5VYDo61Ibnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hSxGGJLq7zg=;/BvLIbT9seQ+Xg74L4gxNoU3+pe
 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
 050PWG6bovCPgafZIesDz7l3wZdPc=
X-Rspamd-Queue-Id: B97B6556659
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107966-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,oss.qualcomm.com,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oldschoolsolutions.biz:email,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:dkim]
X-Rspamd-Action: no action

n 5/14/26 11:06, Srinivas Kandagatla wrote:
> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer ma=
pping on DSP")

Hi Srini, thank you for the patch. I booted with this patch on one of=20
the sc8280xp boxes, and on x1. Working well.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens Glathe



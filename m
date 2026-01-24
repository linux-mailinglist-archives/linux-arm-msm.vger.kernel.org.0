Return-Path: <linux-arm-msm+bounces-90402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHHNADKddGkO8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 11:21:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB87D3A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 11:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D2BA3003E99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 10:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26932239E8D;
	Sat, 24 Jan 2026 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GKn60WWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF8A2620DE;
	Sat, 24 Jan 2026 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769250081; cv=none; b=DAfq4SfFWYx4POtyrjLpox4IjBeVTG6p6PlrzYdBjlCN7Ax2/fXMRjWAgxOhm4J9ILva6TAIRfgbvX5w25n9+MfXOAhccwOB3SFp8lZhUnyrIXRdvRLdCThtzGQPDe5lt+OZ7gGd83XANKC7Tztn4rANSYnlPpyeBzKlSrQ7SUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769250081; c=relaxed/simple;
	bh=bFrSSd5Qtg4UO8XXkSP+amSdRZUQGGZ4bNUc4IQfyYc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=XAZwqU+TAwufADM3Vr3QDZ9aE8p+UZm+0XPJE2fWFA+O/ExfQi3tjxpgMi14hOeUrVmk/8VFBM2T+/0bv4tgMdoNecA5ZsDoTWHfMovVv7WDE6Jb7EBI2MyWcrgk18FLMQdL+Tv+eeOPoDDLuCFopA1vVKQk0K91wFVNUT92ShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GKn60WWE; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769250074; x=1769854874; i=markus.elfring@web.de;
	bh=rsoERRKLk8v/HFgJCO+IP71gVuF5bKGFSkmvd6+xYB0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GKn60WWEEwdnoQP3M3h0c9nY2knlcLyRX3tfG57xcaANlatVIAtyqsnV29s1Tnlz
	 MgcQciSaYneSqrkyp5yQIxAVChn+PKxbcOSWdQOJgg2GR/F6vrC67Mnq4VUCW+KJ6
	 dojFwbWgyLrIu5r5NezbT2FTnpmArtrJCCiYhBd9mwUkroj9SOJ0d0zpktWT0LW8Q
	 93mt5A2KaAB5W4b+tTp4SMpuLxP32ZkEmVtV6m99U7asxyoTvZkeRuk/dTkEdZJh7
	 qKXiWEY6HYYRku4QmtoefFoZvPxSlKdrP2HRoM5vipUPDjjaAyTjDoTZkCjSYpoJL
	 cOcNtqO3vIlcx7cLsg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M28WT-1vm3WH114L-002UvM; Sat, 24
 Jan 2026 11:15:32 +0100
Message-ID: <7c9ebd40-07cc-4a52-a6e8-5c590fc6714e@web.de>
Date: Sat, 24 Jan 2026 11:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
References: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Fix a reference leak in
 a6xx_gpu_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rDUKSLjdKvXS80KswokFGF6f0IpYQClanYs9CehPNrF9i3pUFKD
 P1u+dHyIOtB+faI4YxACJ7LHN0jCNnqAD3Aq78roIOl7maptFb3p2kSTnQtN4VU4ZCywaiy
 8evCaPNT057AQVnzsuYenWKnEwpvcitPFFxgWW6H6Yif6MO8QgjzL4HronOImimA9XTWC0b
 jbozeFU6nB7claAGb3wBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ViE3nTXxqGI=;leiRrsyIkdg/oomjkYMWb3vD7Nn
 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
 w2B0WYubKL5dMngG5cpfRvQZ3/n3I
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90402-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,oss.qualcomm.com,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DCB87D3A3
X-Rspamd-Action: no action

=E2=80=A6
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
=E2=80=A6

* How do you think about to benefit any more from a known text formatting =
parameter?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc6#n659

* Were any source code analysis tools involved here?

Regards,
Markus


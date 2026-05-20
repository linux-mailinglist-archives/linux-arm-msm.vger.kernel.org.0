Return-Path: <linux-arm-msm+bounces-108635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKrQF9ZnDWquwgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:50:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A25892AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17B37305129E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 07:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18C5382381;
	Wed, 20 May 2026 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ZOYepXhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84204382294;
	Wed, 20 May 2026 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263141; cv=none; b=XLc1+1X4TTqCZkDl4CKOE0OKUP8uU4Pr/ljQLAIukUsz3ZjLgk6WNp81SP4Vi1Ao7NMVx/XB0P1iZqnwwqTTpbQDgmb/MZGguCYZXfB+E8WuTKOBKS5+mrwKtWHD6ZnSRM4Fa2JJGZOujAEfvo6YodNXSkZwoMd3+u6NAhkWMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263141; c=relaxed/simple;
	bh=7m4whd48nEkefMmqFxlybBMpq1Yg2DWG5MrPOu4aHuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I28hj8WrtECTi1SwcTF8o+XWa/2iEDmEKO+tu+3A6tbD4MEimOurxicJGS5XhHLdq+GvGXUsxfK4+G1x8IqrhE4udmGDDasexUdPgAe59+mBe+UXx2D06unvxBrlvBdRhgYSloEsLFHAPZ0ygd5kJNCv9G2MYgoBemw3EfiZsS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=ZOYepXhz; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1779263124; x=1779867924;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=7m4whd48nEkefMmqFxlybBMpq1Yg2DWG5MrPOu4aHuw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZOYepXhzxdPUwHlD3IDIiAhQZMYO5VbYUHqZ1QOF6ucYugNdzREY6phfTs5I4mIS
	 eYOdU5XPav7I4s/Ecup/QSMEy3s3w4bgS/URHm5cuBz8rv4hle/9BlCa1+VTmvnzU
	 cNxH8F5mRP4XbvUDsycpXO+/lsI0iwr6kHecrUJw3BlBrxgDrOnni5sv3BJ9zXA0e
	 Bi3F2l33MxAf+6Kd5No0HO4TmIIynfDs5K5v4QzuDylqWsgZwjzwut2erCiI9YOX7
	 qeUcu0CyozvoqkYKe4eKxVMownqkr/reIiQXeOZd2VsTl1dbLU3lMjBcVz7pfeqB0
	 3CTVU35+hpymuYY4oQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Ml6i4-1x4PUW1zJc-00mpIy; Wed, 20
 May 2026 09:45:24 +0200
Message-ID: <ec4d11b5-7a82-4e7f-bab6-290d1055f1d8@oldschoolsolutions.biz>
Date: Wed, 20 May 2026 09:45:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xilin Wu <sophon@radxa.com>
References: <20250110092326.167575-1-mitltlatltl@gmail.com>
 <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
 <CAH2e8h6skog5P6hPc_DkVpJzR1Wj3s7j8jx3vMcRyCn0+sYqCA@mail.gmail.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <CAH2e8h6skog5P6hPc_DkVpJzR1Wj3s7j8jx3vMcRyCn0+sYqCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+R5R84FRyQ1rgInsgvZ7tldbeDTH4RVJEekhSNO3QvSHwQ8vckl
 tj+RoYcZwvYfqcpRXU1DQE6xdE5UXi6AOClaBgCudlJ2WndCAoPREDSKktLBhiDeVeUulms
 L1cFqSoUtIXvUftv5DfWaTenbZUxek4oLDP+VNGBted0e2cwDJWlmFZSxJC0RUoYkB1az1j
 uabSJiy33Ulkh8NF1Q6Qg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SJXqJghJJz4=;/ndlRhWkDxq1Rdz/+3yvZZ0bDpX
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108635-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AB3A25892AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.26 14:08, Pengyu Luo wrote:
> I think they might take the power sequence into account when they were
> introducing the devices, vdda-phy(~0.9v) first and vdda-pll(1.2v)
> later in the upstream while vdd(0.912v) first and core(1.2v) later in
> the downstream. BTW, the DSDT is unreliable. On my platform, it
> describes that several components are consuming several LDOs, but
> these components work well with these LDOs manually disabled via rpmh.
>
> Best wishes,
> Pengyu
>
Hmm looks like schematics would trump these speculations. Maybe wait=20
until this can be confirmed.


Return-Path: <linux-arm-msm+bounces-108192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCffBqIEC2qj/QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:22:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5AD56C8A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E7E330598C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A2D3FD150;
	Mon, 18 May 2026 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEcpMgSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB23F6C36
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106199; cv=pass; b=DhYVcF878umaKg/U/1+NqY/TS9/O6kqo/UKR+8YDsHa+ywQeT+Z0d7XM2Zxn+4TykkMD7sAqM2pQZq8Q6tmZFJBq+vZ4a/yJtbQBFeNzk9yy93L5D/Xni0SPHJsLK7MsLDmxfhPAb6DNjb/kHiHqgLBIvdpe8N+As6g9fA9kEx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106199; c=relaxed/simple;
	bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGsC+8AQczxJM41C0iq3CL7jnt9X90O9xEAsI4O2P1GfUWVv5w0fVCig5z/n8RR5jDMjFckPt7NqncWbA6lMYuEmveLjV41gsrF7QaV1rauLPMCTJ58zRB43tuPgrcVBqpn/v4y2un6F5Zfvs57HBACetfvWBz5L5pv2WtbC3YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEcpMgSr; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5751770a178so581583e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106196; cv=none;
        d=google.com; s=arc-20240605;
        b=R/2cqpFAcDfE7Vd9j7yPZHJ8U/RzmsbP/BINf5F8EFtshMw0X9dPQ/NQHAIXmLziSx
         FbAP48Wf5hp9YTlpbFSKLcq8yIvKrroTRz8nQ/HE3K4q92l7C5j/4kYQJsPv9XIWTt46
         nvZEAmdb7HkNBUKEzrqtCDL7PQ/jjxjDFAtax4HXf/jXnLD26jaHf8IS9a5n/0aO4AqS
         KUgTInezqTT6+N/XzC4PN5qquOJaXiqIWan8XvLelOWvINxvsVOGzWOdDei3Xd5rDq9s
         cXRGoth8Hpzaza2g951hTLzh1ko4iujgx8fOJddmg1wYmguc74vKx/QrW6GMcdPDl3xC
         3UwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
        fh=+ZDjFk1FBNZcZPRnKNNUYqg6eYJrwbCrXvQ93jj3rE4=;
        b=R4V0ILAIG3/omgsYUmwqUN1Bk8Jnp2eQIb/bPERCXkif4mLeZ4vb24oOJ3WaMRA+tE
         dBZiBZDYYFT1cs0pJuhPeE6Ugkw0aGwgJPv3iTqBKpTXSAJ8t5YblQiECf4bkGOa6gXE
         NA7v3JbKhX8gK8frRRb9gavLbHMqPunPHtzWxcti5kqTalHid8EAfOXKO554m5o5Mh6q
         vIbbuP3mWfTsAjUQXUGSGz5v7Z5veBFu+N6m9goo6GsrFKAGFkwNKvo5u2MUrTRjQ9uI
         7FS/V6xPiW6UpzxbTuRB18xq4Ydfi6cLODrSZ3Nhklqu5/klPEm8eVXPGGk75zb4cv5x
         YUXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106196; x=1779710996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
        b=VEcpMgSrTCWwLdGo0GDRrmhpXA9gDUw19PYPHIJ/h6olhVXjCM9NfJIMfLmqMrXm6V
         nheU+I20OqX1XY7y+v4ZU5uP6sqFkWtgKE1N1sf4QrxOFYP7/tvZoXNYYBYtR0IhXH67
         PnnIjsO3DgjsB6pJZI/eirDcTSr7IkgENzY7LGs+aeNku70w4WAJ3TbmZ26HbUd7dCkC
         QuWKkgEmBA5uQ3XwAvHKcjHECfWEVM0/GDmhab2Zzj9EBVjnBdk2mw4RoKzJWXpBCvnn
         pEf61eqSCi2Nj88PBo2EcQ58I25w+xs5AMz5T+PhDkqa0jzsejkPjZh34Wwwhz3PHxVQ
         D4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106196; x=1779710996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cd9XDVS5bJ+dblAmZlrlop+kZgyj3GivNWTk0OpSHRQ=;
        b=iUbj+HYUO9KqqEx9UVvTnyDpLDZ8RU3PGq2sKi4iZMEXLR/Q2TiU0YVEDfKeJV3bFU
         C67e8E9Pl/oPVUBJld7KodhEu4RF2ru375+f+BGhdkx3dpVXwjTy9UWTOuIXE23Dgijx
         azVWsxPXDeJ5sTZFD5xgRAXmv5os62zHS8PsQppGjnq7sw8dh+3sbXBAhbRQKI2f3HdZ
         owpgUnCNQ/xQ8rBKmgXiSZgNAZ+W5ALZcx9pnXVtY9AmS39n7kZu/vohU0pMp7CDN2Cq
         qe0FKkxPVMNjf3nPEyqrav8frgxucr5MDv/jGVrmuGa9UiiUb9VSapsMEx3TCRQI4btj
         Ycyg==
X-Forwarded-Encrypted: i=1; AFNElJ+inVJHS6T9auoMC+mSDG6YMgNRiztdxp3ebnLrOKdaf+ERHIPVS1FNZjn5/gLj1izEgrPW90lICZy1Jrsf@vger.kernel.org
X-Gm-Message-State: AOJu0YyyTkC8esBCt3qGJfsYw8ekZ85w7VG7IGndec6aSAqoMwjaMUg+
	hAAvVjNgo7Pf0ktWlB9lTVjrfH3uCWiouq1LqdW2istZ7kKyIa902RdbZzrpfE6Ud0btTizGZNP
	I28s3r8V0seCxzb2RntrJ3sPxev90bEE=
X-Gm-Gg: Acq92OG6tkTP50zqqzO1gcOT+nx7JJ1SThK9Q8M5Fauh/dP6O9Zuu1yuXj4AF0fLp+y
	CLYb51fjokpVk1RF20/rXDIahG9ORi4a3UtrjgT6lyr9eBrD1imiRvDnc7cv5obsY8k64cN2Or4
	TsENFkBrgg5k2c2ppMTUoejyupWoakMGT2V5IcY5CkXfOvZ89Aq93qAYQ/wHZV9woo2extNiFw+
	IC2EAxwUreJC2x5pl+wqkajxV60bfjhTjANArKWoWA/7jJ46Oxe+n4aVCleku8oU0SdmUnWCnuc
	mLAb+C9p9Mulw0XzHLigTuxtcZwgH1ubcvR+Z3Y=
X-Received: by 2002:a05:6122:2407:b0:575:29ef:7df8 with SMTP id
 71dfb90a1353d-5760be39b70mr7202066e0c.2.1779106196212; Mon, 18 May 2026
 05:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110092326.167575-1-mitltlatltl@gmail.com> <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
In-Reply-To: <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 18 May 2026 20:08:55 +0800
X-Gm-Features: AVHnY4Ksrs9aTussseNr09raAikIjCq76pmPVkVYEhG45aPbYof4tvxp5Ck7-Mw
Message-ID: <CAH2e8h6skog5P6hPc_DkVpJzR1Wj3s7j8jx3vMcRyCn0+sYqCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8B5AD56C8A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 3:19=E2=80=AFAM Jens Glathe
<jens.glathe@oldschoolsolutions.biz> wrote:
>
> On 10.01.25 10:23, Pengyu Luo wrote:
> > On this platform, according to dsdt tables, usb{0,1} phy consume the
> > following regulators. usb2 phy should be corrected also, usb2 in dsdt
> > is a little complicated, so correct usb{0,1} only for now.
>
> Can confirm that this works on blackrock and x13s. And I went a
> different route when I tried to verify vregs for blackrock and noticed
> that the vdd voltages didn't match the layer of logic schematic in the
> dwc3 block (some TI documentation), so I switched them already for
> blackrock.
>

I think they might take the power sequence into account when they were
introducing the devices, vdda-phy(~0.9v) first and vdda-pll(1.2v)
later in the upstream while vdd(0.912v) first and core(1.2v) later in
the downstream. BTW, the DSDT is unreliable. On my platform, it
describes that several components are consuming several LDOs, but
these components work well with these LDOs manually disabled via rpmh.

Best wishes,
Pengyu

> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> with best regards
>
> Jens
>


Return-Path: <linux-arm-msm+bounces-108017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEl9AT3DCGo64QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 21:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BD55D856
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 21:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 032E93009CC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 19:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F5B34B1A3;
	Sat, 16 May 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="y6lWXTn+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9432DEA7B;
	Sat, 16 May 2026 19:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959161; cv=none; b=EE8ANqkOMBzY5EewXoEh0UMTpkj2qzGj+yDsTRyTR1IX+4ht5x3mlFqT9S5ItEH8nSgO/Js6Y4mjbUvB0Debkp9IBThRQrj6S4bzJaABEce7t8ik226epT37c6dFUiLbXA3UqAF0zcfhtFmd3Za3UgD2EsftslKxUgRl/HGiJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959161; c=relaxed/simple;
	bh=pcYymB/j06J6E3QBgWT3spkGVEN27teZkiA59m8H69o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAOHilRcntzD0xdTtxlU1bIMJk4xWldHOahv1iNehvMqVuXLAZwgaSQKJBNOzmOu5ah4tO2dFoeb5YXbknARtqfyttyBRM0WZqXKOv4yK6o2qhcDUgs3vECbIAZ/49xo0xc3kDih06uFvrxT20SoL3wG1OsKN1HlmBo5FkF5zpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=y6lWXTn+; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1778959156; x=1779563956;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=pcYymB/j06J6E3QBgWT3spkGVEN27teZkiA59m8H69o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=y6lWXTn+hJd6OBdUYpEBLG4lEGc88Hw4v2jE16UDJQ4+saU2gLuFLrWkjJcGAbpH
	 W/MAS5yOmnu5cqkAq6RcIIEQJedTWImsZCpPqYVAh+zWcKTSvNKeW0XwWZ6xs7vVa
	 TEoQa2tckRLEVwaN32s8u+AdtnUeHsxsssXTs9hbAJJ4fTgUNr+WSQV3fqhkkWKyd
	 OnoegkRQTKtvalSla11MLvD72eYf/Ks/zi438kX1KyF+C+VV61Qzz67r9FggiEdVj
	 786DLyCZklvHEr/rz1ERAysxO7nGcfgAS0iSgPgs3bfdjl9IlRIJIGWPNd+WQ3f4/
	 UjQAqli2nphqEd9lyg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmQUL-1x6Uyr1J5d-00kXvK; Sat, 16
 May 2026 21:19:16 +0200
Message-ID: <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
Date: Sat, 16 May 2026 21:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250110092326.167575-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250110092326.167575-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rAv0Rgj9KzjEzq3BPqeqB9eJLb1lnyjfdenOxDfIlNMteaG/fzh
 H7Rtsuo3wCJIPP+hlkzkF0CDtfhYrjUNCfe80spRT42FLJ1oX/OvpissBQSIHkFRgV9tb6F
 LHDpLSCxkHEG2HkHMPImJ5SPktgJ6def6BUh9YVswShog2UIkU8cNLnwfHiB7UXAN2/zODg
 t/cOB5rE3aYHQXJOteiZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o3M8M8xJ9Hs=;6btD2gE9uKOchXrutrXB9HKWvX5
 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
 vuzAWOtwIYsEjoaeTGiGbT8Q9uwVg=
X-Rspamd-Queue-Id: 5E0BD55D856
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108017-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oldschoolsolutions.biz:email,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:dkim]
X-Rspamd-Action: no action

On 10.01.25 10:23, Pengyu Luo wrote:
> On this platform, according to dsdt tables, usb{0,1} phy consume the
> following regulators. usb2 phy should be corrected also, usb2 in dsdt
> is a little complicated, so correct usb{0,1} only for now.

Can confirm that this works on blackrock and x13s. And I went a=20
different route when I tried to verify vregs for blackrock and noticed=20
that=C2=A0the vdd voltages didn't match the layer of logic schematic in th=
e=20
dwc3 block (some TI documentation), so I switched them already for=20
blackrock.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens



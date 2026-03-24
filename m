Return-Path: <linux-arm-msm+bounces-99704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDIAOC67wmlilAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:26:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D3318FD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6277D30297A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852CE38C2BF;
	Tue, 24 Mar 2026 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="SBGv8+Bo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430E39FCB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369036; cv=none; b=PbVlrypDfqyKc4zncNvLVdqYGWcU/M1HAXrcnH3MpsJDbvWRUdGGlV4gAkrAJE0fEJiYPRN96ITJY9kUs6ffXTWoBALRiR/b9irh0WBX8Ex+Ecz5G8dI/kdLnDQca9VbFtgMZUhmLiStPV31dN2zru6/yGxv7vLKWqp7zN8sfNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369036; c=relaxed/simple;
	bh=Ph8L6+gJe19poDr+sVxhDt5mPh/0Ip+l1jVhOmzfP2c=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=AnZfZUGV35twtY1ufyRPFjnxHMD1ppBqTJWMejD/q0HlB6VfwX5CaFzPj359pIYnBew0ePVMXoXqR4AIITJhz4CtALtefLYr+TMzP14AioY/t7L5fnfFUc1ZLjMFd/GriYa4/NsxgMDWyq3sWVHGKkcavsJLE/fSrEah5OWgMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=SBGv8+Bo; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774369032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph8L6+gJe19poDr+sVxhDt5mPh/0Ip+l1jVhOmzfP2c=;
	b=SBGv8+Bo2ZzZsy2wDVzsRPzQ/icH2qnrLi7yUqrdCnafoTDUs4mOLEsMTHHCe4nRE47HHv
	YR/KoFkm32uLo1ggRVYzyyR+73wSxDqNNb9WV5KhVqDPcA5ImnAnofcGWzODTcT/KpGS4j
	1EPhQWqIOMRKZLuruv2/CwLFhK3jaVxinN22MVyNYACcpxQ0giajLSnJdfYK3DAUsgTuZt
	C7iRJ6O+BaYHlj0fmpGOfN/mOYZldnGTkl6lDiqkMXhRw0DSjYUyoKedsI8N3N2tZv9Tji
	jKB9q/G7lkAF717vB8nrCB+NW+l110dJRFhZy95sa1pLZkwPankhoAx8yi7Mzw==
Date: Tue, 24 Mar 2026 16:17:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>
In-Reply-To: <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99704-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:mid]
X-Rspamd-Queue-Id: 3E0D3318FD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.c=
om mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%3C=
konrad.dybcio%40oss.qualcomm.com%3E > wrote:
> What about the other board (judyp)?
>=20
>=20Konrad
>

I don't have it.


Return-Path: <linux-arm-msm+bounces-113021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id isniOdzfLWrNlwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 00:55:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D267FFAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 00:55:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=R0bDutmf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 769FF301C95D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 22:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608F139891D;
	Sat, 13 Jun 2026 22:55:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AB348860;
	Sat, 13 Jun 2026 22:55:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391316; cv=none; b=hAIYgCpvICCj0+d0oncvq0XSsqbbBtCp/1XfEk7JbG42+zay+gk2ZX2Aa6qNiCtk3F6ufXc/6fNmriTFXLxKt4/3GEAZfS8pUOyB4I1iAB9zKGBbS7eofwb2u22XtHEFcd59/m0Ouwq8AhVDhUQ6opjixxJ+LkCKgpf5wbvmECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391316; c=relaxed/simple;
	bh=cojz8L42QoYl4v8USwM1fmjxLhPaAAO4EBmbvPz+95w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PZCdw+Y+cJintVHJE0kCBqX4YU2kRvarrgD3hzuuKGqGCxnUgi93dAl/qh+VwnwUbYivzwjMo8moX6+EzgEI4cGuNRstVHK/KG7aUxPqGuz5l83TWINaIB8y1KYMo33GqwxLVzAmkAHHH1e6zUFr6X9KLrpWkRcd++DXpxWn6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0bDutmf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2750F1F000E9;
	Sat, 13 Jun 2026 22:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391315;
	bh=cojz8L42QoYl4v8USwM1fmjxLhPaAAO4EBmbvPz+95w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=R0bDutmfWV/1bHtsseUtk4NuDpcqjBpr/3X+l3QT539C98oqUFuVRoXwhZ1F2tApZ
	 EW/xXcgZFOh7w64Jo5SZaoqimxnssWMc6+6R9W1g622zYTFcIA4tG25g5i/Rlq4R7t
	 Ctlpp9R954fGyNfOFhZ3RCoQ2EjhMFHy/738yV+2iM1UIjkNDj9nt1TUczgUmyBqCO
	 fJBN2bY4g2szgbiC2DvRWiGDReP5v4+8Ir7c5RIbH21a07TU2VIYEI1trbZfpMLAF6
	 N8LgYf7wRifY93I7rYZWS51KP6o4igC1/ML7WG3ZwCwM77pPfSGbz6n8KavhuLmEVQ
	 moBbAo8FWIijQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com> <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/7] clk: qcom: Add generic clkref_en support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
To: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 15:46:17 -0700
Message-ID: <178139077723.819343.8364833855890359860@localhost.localdomain>
User-Agent: alot/0.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:bmasney@redhat.com,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:robh@kernel.org,m:taniya.das@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113021-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,localhost.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 986D267FFAD

Quoting Qiang Yu (2026-06-02 01:02:18)
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
>=20
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
>=20
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
>=20
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
>=20
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
[...]
> diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> new file mode 100644
> index 000000000000..09e2e3178cfb
> --- /dev/null
> +++ b/include/linux/clk/qcom.h

Why are we making this file in linux/clk when only drivers/clk/qcom/ is
going to use it? We can have some qref.h header in the qcom clk driver
area.


Return-Path: <linux-arm-msm+bounces-118821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nrnmCcQDVWqoiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:27:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBE474D04B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Ep/lieFP";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118821-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118821-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E874530A185E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE179433E81;
	Mon, 13 Jul 2026 15:07:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C73DF001;
	Mon, 13 Jul 2026 15:07:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955222; cv=none; b=Tnp/uePex3cPSEPLjBUMy1bnp/gS4sFaRkU6yQ9iDAc+GOiemZSVJjujkeTXLrK+VRfTb89d3jrXMQ1VxEA3hOPJ6lOymiUlpntq2KWo94ROpCHtCK+yYeLq3l2cb+rzrqku1UXe/S42S9yrNLegzb5OzVJR4L/2VMiFRMhAlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955222; c=relaxed/simple;
	bh=ZIpdAJ4bmdTFqnuhuE9RaLH9b1VH+Taw8/lQhKFaGio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShXosfQ2SDpPBTbiRXlfC2J6gLLaRdtXC3+b2jg+THELe+ub1boPLxwrq3QphprUuQNV4CjIvbeKlSrRr+x/L4yCe0zmxpbR0szBPb9+8IAowURWmNcze7xP3Pe907F6vdb7fZ9//+3vveNdsHdbDA28l7QvR9j9nLRZq7Mx01k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ep/lieFP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2A61F00AC4;
	Mon, 13 Jul 2026 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955221;
	bh=R3L1naumqWNyaudCbdR47FwKzhGb9mf+M/UdPi1v7lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ep/lieFPmyoGgoRPfdp4lX2plMZ6ww0fhXlQCrCbZPrd2HkMbfcwwgKgFNf5hVi43
	 6NnGXoEicsvhLL2Pjs2i27/8wetCFgxlNuiCZBaPeMHInoM+VesU/5v3j2Z6W4eX2I
	 G0eXeMKvt0RoCnErtEJavXXaHX3IlSw+F7uivteHM7qRdDSBTpxXVMSQ1dZP508vFV
	 kkvE8Rk6aQu5zBvW50WCrfXQmOyoxbtDYiDbuFAu7jsOqyhyfQ+9Wj2glmDB/4Vz5M
	 oFYCrC5rEy7TPbuA4tqki6adMoOpDt0C/s4TKtn42PoV3HeujgE6Fje0gDEl1VW4Uj
	 gm/w1/Pkm/aBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/19] firmware: qcom: scm: Add minidump SRAM destination support
Date: Mon, 13 Jul 2026 10:06:54 -0500
Message-ID: <178395521265.422064.3221954804170759106.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118821-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:mukesh.ojha@oss.qualcomm.com,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DBE474D04B


On Thu, 25 Jun 2026 00:38:11 +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in
> always-on SRAM is shared between the operating system (OS) and
> boot firmware.  Before DDR is initialised on the warm reset
> following a crash, firmware reads this word to decide if minidump
> is enabled and collect a minidump and where to deliver it:
> destination (USB upload to a host, or save to local storage) and
> OS is expected to select one destination.
> 
> [...]

Applied, thanks!

[01/19] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
        commit: bc3c98b7761f98d2e4aa72259feb2b0902c1e86f
[03/19] firmware: qcom: scm: Fix missing smp_load_acquire()
        commit: d9603a7790d164657a51997d7265ca845bee78bf
[04/19] firmware: qcom: scm: use dev_err_probe() for dload address failure
        commit: d0a05db99bd0d76aafc20245922eec28c939a192
[05/19] firmware: qcom: scm: Add minidump SRAM support
        commit: 7bd52a0d456eef0243f508fc712e59c612ee7d45

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


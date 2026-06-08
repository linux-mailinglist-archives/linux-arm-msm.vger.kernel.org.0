Return-Path: <linux-arm-msm+bounces-111927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pY0GLJXmJmoKmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 17:58:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7B6586D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 17:58:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ANXHFp33;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D27813188AE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 15:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09043E3142;
	Mon,  8 Jun 2026 15:10:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85983E275F;
	Mon,  8 Jun 2026 15:10:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931407; cv=none; b=VsLxffaXlq7yrSnoZj+xRJP4tjw6GJdc2LsDhTVyMc+htEk5TyYGWwSVN1zdvPR2caoemdrrekn1PT+zxuqQWEibOJ70MWok5L7ERyew8bCL6c8SI+eHik5C7+VbAQRLdnTNNWUSo5J1lF5Gnmbw5eVyOV3O/rXucPqfWC4N714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931407; c=relaxed/simple;
	bh=bPhomuasu6Q+0DBnKHEAjJ7IHxLg/GC0AK6dL5klywQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpz3THltNFQABDo1RYd5IqpB39dnf0a5nGw9yBElZsZEjQrYHch5C56zPEiYnKJSJEzboFfiTkRI+KNiRwvC1VlMvOb4gAm0SYKd+3L6upIs8cW5iP+EkZpEnolo715W5py+KXy0Nk3pMtYfZeRXJ6Y8G9Ko5qPGQ3DeqZly510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANXHFp33; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4CC1F00893;
	Mon,  8 Jun 2026 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931406;
	bh=hkndTbrT1r7tieuraToUJXt3JGqX5yY3VwdAGotOMmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ANXHFp3311twQZ1kOJUEk3jIkKtgPgnaotlgZ6A4xPqR53TZmdGnxmLtWtXdIERnO
	 2Rk1KzTliOeX9hyILHLzIt6fMmpthETBItXjkJhbCm+i8MLMMGZSnCdaQKpillah2y
	 1MbBV7Xf837dn8vJm7AYFB7wmHux9jOvCur6opJwyRPOCTmoaDYbU+d3Y4lG+P8pg3
	 NOA3ALHcgRK67OsZpYfFEJVJVcXudOCD/2TxoJ1Vr8Tv3FuY9j2WQDIMbKG0E7t8+q
	 cE7yTtH7PRbMrrpef6bgw403HerOj6iOpXefgpAYaAiSiobF7AdcX0Wfvb4y+K5khF
	 KwLSrXjtKUMXw==
From: Bjorn Andersson <andersson@kernel.org>
To: Georgi Djakov <djakov@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] Support enabling interconnect path for GDSC for fixing Milos camcc
Date: Mon,  8 Jun 2026 10:09:56 -0500
Message-ID: <178093139444.244194.10957734005800853010.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mike.tipton@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDE7B6586D1


On Fri, 01 May 2026 11:18:28 +0200, Luca Weiss wrote:
> Some power domains like CAMSS_TOP_GDSC requires the enablement of the
> multimedia NoC on newer SoCs like Milos.
> 
> Add support for getting an interconnect path as specified in the SoC
> clock driver, and enabling/disabling that interconnect path when the
> GDSC is being enabled/disabled.
> 
> [...]

Applied, thanks!

[1/5] interconnect: Add devm_of_icc_get_by_index() as exported API for users
      commit: 771ed1b12942dbf592c34554c81f25a627fd254e
[2/5] dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      commit: 7e622e74d2700da4d6ed3aa2a4d7e1b7d7293768
[3/5] clk: qcom: gdsc: Support enabling interconnect path for power domain
      commit: bd09d87c55d6e7783ee2394c30061d66cc9df299
[4/5] clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC
      commit: 205aefa0db8bff56f08d0e06a0ca628555758805

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


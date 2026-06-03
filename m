Return-Path: <linux-arm-msm+bounces-110899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +H8DCS7AH2qWpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:48:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AD6345CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:48:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b="f1z0le/q";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110899-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110899-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D02BF309A9F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 05:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D1D3CDBD9;
	Wed,  3 Jun 2026 05:48:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1603380FEC;
	Wed,  3 Jun 2026 05:48:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465702; cv=none; b=FmzrehjyGFwGEiV6X2IJUP5uReHIfcdlu9qbw8kNa9hA8ZL/8J8oYLooFD1LcoEc5MFSqYuw4F+M1Hma+JZ0FQaeTfp5UpW5sS+Ufdj0MmtnZifsLdn3T02eqmaFuiBlPG5EhigSdhY7uki1FpbujsKObh7Um+HLH+HiOEb7V2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465702; c=relaxed/simple;
	bh=bp/IWa5z2V9WT6pPsyaWkau1T/t8udfbkxWFTUVWyjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lldHZl5+uASeJzf3mPZhWT09oDf+oC/Of6GNH0gkOqa8p/xbi35rCM5auZeySLJ6NTkhjgdUTpo9OliV8VeaqvaHVgM9p9qExtb7GYlI0EobtaO2Y81675TsxxeaLJvUxy5TfJ/FJuwOYdBZlPXuVctV6v9oDko1aUgwRjNyWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=f1z0le/q; arc=none smtp.client-ip=136.144.136.7
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gVcDp1z9GzQvvWR;
	Wed,  3 Jun 2026 07:48:10 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission13.mail.transip.nl (Postfix) with ESMTPA id 4gVcDn4x8wz3fCxJH;
	Wed,  3 Jun 2026 07:48:09 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/2] phy: qcom: usb-hs: add qcom,vendor-init-seq for raw ULPI writes
Date: Wed,  3 Jun 2026 07:48:07 +0200
Message-ID: <20260603054809.565723-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission13.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780465689; h=from:subject:to:cc:date:
 mime-version; bh=hVZCz5sHTIIVILXMn76klOgPMKZ8yUMAhQN47edz0bs=;
 b=f1z0le/q/Dl/sOei+NLytTWe9CIPo3w5AbSbDbP2hjCuNosEx/vD2uQtFrr5g058Kw9x8k
 BgLR3DqQxu0GYFjMs1wpGKDul9Vh72h4wmrhCfRqU3jEfGwaqX58y6uhMelUi9ePqwWYyt
 KL+elTHEUe7Gq+2CFFvJAMkdZdV+rg4RJHDhWaMgvMtIxJBhAkXrQMBSmw+e2M72e/2HjA
 pLjjqSf4WeK10+4rEHvgWdGDRfcfW/awOyUm7s71g6CyfUxxMAlw//eJAmjJTniZLLnQhG
 eeq2F4GTea+sjuXwSgYP0jpVE9O1C2AO8sfeYToudrwMI9yFYuGG4oG1qOhCbw==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110899-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[herrie.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,herrie.org:mid,herrie.org:from_mime,herrie.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 816AD6345CB

The qcom,usb-hs-phy driver already supports qcom,init-seq for
board-specific ULPI initialisation, but the address field in that
property is always offset by ULPI_EXT_VENDOR_SPECIFIC.  That makes
it impossible to reach the standard ULPI vendor register range
(0x30-0x3f) where MSM8x60-class hardware keeps pre-emphasis, HS
driver slope, and CDR auto-reset bits.

PATCH 1/2 adds the DT binding: an optional "qcom,vendor-init-seq"
property carrying raw (addr, val) u8 pairs with no implicit offset.

PATCH 2/2 adds the driver support.  The new sequence is applied AFTER
reset_control_reset() so the values survive the register restore the
reset performs.  While refactoring the shared parse logic into a
single helper, two pre-existing bugs in the qcom,init-seq path are
also fixed: an odd byte count would previously silently drop the
trailing half-pair, and there was no upper bound on the
devm_kmalloc_array() allocation driven by the DT value.

Herman van Hazendonk (2):
  dt-bindings: phy: qcom,usb-hs-phy: add qcom,vendor-init-seq
  phy: qcom: usb-hs: honour qcom,vendor-init-seq raw ULPI writes

 .../bindings/phy/qcom,usb-hs-phy.yaml         |  14 +++
 drivers/phy/qualcomm/phy-qcom-usb-hs.c        | 109 +++++++++++++++---
 2 files changed, 104 insertions(+), 19 deletions(-)


base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
-- 
2.43.0



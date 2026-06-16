Return-Path: <linux-arm-msm+bounces-113423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NgX2HrtPMWoLggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:29:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01668FF15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:29:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=r3hMYV12;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113423-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113423-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E7AF319C8C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44EA32FA18;
	Tue, 16 Jun 2026 13:27:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA92332D0EE;
	Tue, 16 Jun 2026 13:27:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616424; cv=none; b=Jv+tUdYA+iPFlhxU1ldZQWrHwDrD+a1A8JRAaNp+iOfcaelNsBVALl7OJtZVoDCDneT03Jj1+epu1e+58kL2R0OVgsdIZWic1lw7+UIlnvDhgTPlvgR90Toc3cePrjP/lbMjDb+qG0g1Ty2B8WlHvHoS2mxkfHQNxz3hzFrmuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616424; c=relaxed/simple;
	bh=QxzEAuQxibbMXRjJzE5v7vlVvETfRHRlzoNHKYQcRvo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kkOA9BL4aOzDJGru/QwnmgAhpn5khNaxf/Dh9B2d2l3dZg6TsHaC1VCEmBmrsVsc1wGsQq72Misq8cCPuocEgLKoxeOr6gPMVcyTkwBzIiB91XiCbXITPnisY1Cq5JD1nywGPhHtBAdkR5LJDw4EN1J1lX/tgKw8NlYO0jOIjyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=r3hMYV12; arc=none smtp.client-ip=136.144.136.2
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4gfnp55MnlzwPSJ;
	Tue, 16 Jun 2026 15:26:53 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gfnp50TYhz1g93PY;
	Tue, 16 Jun 2026 15:26:53 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH v3 0/2] phy: qcom: usb-hs: MSM8x60 vendor ULPI init
Date: Tue, 16 Jun 2026 15:26:52 +0200
Message-Id: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxPMWoC/x2NQQ5AMBAAvyJ7tgkVTfiKOFS7dA+KLkLE3zWOM
 4eZB4Qik0CbPRDpZOElJKjyDKw3YSJklxhUoXShS41yDDPvuPobDxnQC54U3BKRQ9JCGxpXNU4
 11pqxhtRZI418/Y+uf98PCrVKtHMAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Herman van Hazendonk <github.com@herrie.org>, 
 konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781616413; l=3528;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=QxzEAuQxibbMXRjJzE5v7vlVvETfRHRlzoNHKYQcRvo=;
 b=RLcxVZCoWq7ZQlYfkLDUXilWs09Z7OWsMIY6BDvnh5qQEITspTK2w0whn+t5l4UfYygvAAOy4
 TUhdxRGfv/uBs9QFgRUtQ0RoXelFhVm9jri0MiXyuvcmx34Xif5MLHl
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781616413; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=ACun7JswmPdJb8Ejo5q1RfESUkL4z6rwXeuZJzAnH1o=;
 b=r3hMYV12CW7ncILVmWGj4XaUdax9q6dSZj3VaGRR1f1m3rSWoaT7Q91KTVnpQqbyHRzLl8
 ggKlRsJIHUnfqNFapxYGQqhO7LtkntPHiALT0WXjwsUxaa0VraYPfTtxYYSzptN4VVo9iT
 o5ETXOH5rTPNws6eLXuZZ6XhRqq+1sP6jnJyZLqzGmzWfBnmgZw3aexTe3iPr6mYpcCftQ
 pqMJaF/e0kVydIozohR/giqfDthdMTpt6yvXcgHe2GHpZ+o2rBHy2FouRZJ/vGMSv7GjL4
 hEIkMQC5v+36hclokIfsjjGtw/9bx50KHQl65iU94B6J2xDWq6vZmgefd7Z2tQ==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:p.zabel@pengutronix.de,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:github.com@herrie.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113423-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,herrie.org:dkim,herrie.org:email,herrie.org:mid,herrie.org:from_mime,googlesource.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE01668FF15

v3 (this round):
 - Re-introduce a much smaller DT binding patch following Konrad's
   "do we have values for MTP/QRD" question and Dmitry's
   "qcom,hsdrvslope (or similarly named) property in DT" suggestion.
 - Survey of every MSM8x60-class downstream tree I could reach --
   Qualcomm reference (SURF/FFA/Fluid/Dragon/Fusion via
   board-msm8x60.c on android.googlesource.com), Samsung Galaxy S2
   family (Q1 / Celox / Dali / generic 8x60 MTP), Sony MSM8660
   (sony-kernel-msm8660), HTC MSM8660 ports
   (shooter / holiday / pyramid / doubleshot / shooter_u / ruby) and
   HP TouchPad -- shows that pre-emphasis, CDR auto-reset and SE1
   gating values are *identical* across every reference board.
   Only the 4-bit HS driver slope in reg 0x32 [3:0] varies.
 - Patch 1/2 adds a single qcom,hs-drv-slope DT property (u32,
   range 0..15) gated to the qcom,usb-hs-phy-msm8660 compatible.
 - Patch 2/2 hardcodes the three platform-wide writes in the driver
   behind the same compatible match, consumes qcom,hs-drv-slope for
   the board-specific bits, and leaves the silicon default in place
   when the property is absent -- which matches Qualcomm's own MTP,
   Samsung and Sony reference behaviour.
 - The bit-level meaning we *do* have comes from Code Aurora's
   downstream arch/arm/mach-msm/include/mach/msm_hsusb_hw.h, which
   Samsung and HP both shipped byte-for-byte identical.
 - Per Dmitry's request, both commit messages call out explicitly
   that there is no public Qualcomm documentation describing how the
   4-bit slope value maps to an actual slew rate / V/ns / %.  The
   field is an opaque hardware control; boards must copy the value
   from their vendor / downstream kernel as a measured-per-layout
   knob, not a derived one.

v2:
 - Dropped the original qcom,vendor-init-seq DT property entirely
   and folded all the vendor-register programming into the driver
   behind the qcom,usb-hs-phy-msm8660 compatible.
 - HS driver slope was hardcoded in v2.  v3 promotes that one
   varying value to a DT property as Dmitry requested.

Companion TouchPad DTS work (flipping the PHY compatible from
"qcom,usb-hs-phy-apq8064" to "qcom,usb-hs-phy-msm8660" and adding
qcom,hs-drv-slope = <5>) will be sent separately with the rest of
the apq8060-tenderloin DT series.

On-device validation (HP TouchPad / APQ8060):
 - Booted with v3 + the upcoming DTS hookup.  PHY driver bound,
   msm_hsusb HS link came up at high-speed.  No regression vs the v2
   hardcoded build.

Build / schema verification:
 - dt_binding_check DT_SCHEMA_FILES=.../qcom,usb-hs-phy.yaml: clean.
 - dtbs_check on qcom-apq8060-dragonboard.dtb and
   qcom-msm8960-cdp.dtb (the two existing in-tree usb-hs-phy
   consumers): clean.
 - drivers/phy/qualcomm/phy-qcom-usb-hs.o builds clean.
 - checkpatch.pl --strict: no warnings on either patch.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Herman van Hazendonk (2):
      dt-bindings: phy: qcom,usb-hs-phy: add qcom,hs-drv-slope
      phy: qcom: usb-hs: program MSM8x60 vendor ULPI registers on power-on

 .../devicetree/bindings/phy/qcom,usb-hs-phy.yaml   | 89 +++++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-usb-hs.c             | 68 +++++++++++++++++
 2 files changed, 131 insertions(+), 26 deletions(-)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260616-submit-phy-usb-hs-vendor-init-seq-ad39d29ccaf5

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>



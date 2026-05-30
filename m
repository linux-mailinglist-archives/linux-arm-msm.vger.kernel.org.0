Return-Path: <linux-arm-msm+bounces-110392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOXeDxjwGmre9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E047A60D595
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1EA230A5E0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B295C2F6184;
	Sat, 30 May 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="iqpEBirg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CCE2F6188;
	Sat, 30 May 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149967; cv=none; b=pF5AqOVa/46mGtZYWMeNnb6szOwbhxw1TNIEC3AXDZpndEHPE6hTTNNfuf7qX/n2d9+4B8GWK/LAfAxcbBN+7Youdj1FdRWu+Xw5SbAMXQnGK0DXAPI3ZVCq0IiIv8mHtGw1PrOPr0wO/j8GRA9uzgHPBI1dyl0n4AoSVHb/pwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149967; c=relaxed/simple;
	bh=K8/BKDabJLDDfOSNJkWSZ7hJ/g0gsdZHDLLgKnRqCZQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DdJGTkxyRnXzHS6KfetDci2UCqHEQMaY/0DpHCFIFiLYawCOX79o+pUuPIFwSbItZmFkJyN5PVuV+QR4HmSjNfk8AlhQUhP1xQAIbUW1Y1zdeeBq1XT8ABHX6VqXR/TNDLnhM1VS42zqTrt20m6VxDrL8kdSFqzK9SvzkBmKVHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=iqpEBirg; arc=none smtp.client-ip=136.144.136.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gSMKb2YXMzkQNKg;
	Sat, 30 May 2026 15:59:31 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission13.mail.transip.nl (Postfix) with ESMTPA id 4gSMKZ5Cdkz3fCxJ8;
	Sat, 30 May 2026 15:59:30 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/3] clk: qcom: add MSM8x60 Multimedia Clock Controller
Date: Sat, 30 May 2026 15:59:30 +0200
Message-ID: <cover.1780148149.git.github.com@herrie.org>
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
 s=transip-a; d=herrie.org; t=1780149570; h=from:subject:to:date:
 mime-version; bh=g6KWoP0ras78wxvA6to307pcmesEU5I0awyDC6y+AC0=;
 b=iqpEBirg/cnr3eTqNM5Nyrvt3MMQx0t4GJjPk3DT0fDFEdl/v4Kr9sj9DceiJ6DB+eY/59
 lfKz0SxcJVJkYKqrjiPzNTwdXWtaWf3gLUOSIQt09NR6SpKmLWaMXtnTVkGK6Pq8rvFZND
 WlZTkxJyapttiDOlIsGuOJuaRkiwMSOMKuXST4UDw3JcdJU5ysyjs/Mwc1gaJoqG8+k0rB
 qkKBG3bvvXbR/j6PESebxTxTLq7zSOH487ismxszED8J9dYDhjW9jTO7l+spSaRe3Wc0wf
 POBHMLCAZ0Yl2m/EMJ6zTbz3kpqAPb2ytRfLbszVCeCijvvlgbR/7AvVj8BAVw==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110392-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[herrie.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E047A60D595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series adds the Multimedia Clock Controller (MMCC) driver for the
MSM8x60 family of SoCs (MSM8260/MSM8660/APQ8060) - the Scorpion-class
generation that preceded MSM8960's Krait CPUs. It also introduces the
clock-ID and reset-ID device-tree binding headers that the MMCC consumer
nodes will reference.

The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
make a separate driver cleaner than parameterising mmcc-msm8960.c, most
notably:

  - the pix_rdi mux requires a custom set_parent op that temporarily
    enables both parents during the glitch-free transition;
  - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
  - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on 8x60
    (e.g. PLL2-derived 228571000/266667000 for graphics);
  - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
    later 8960 reorganisation.

Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and rotator.

The driver compiles cleanly against current arm-msm/for-next. The two
new binding headers are dual-licensed (GPL-2.0-only OR BSD-2-Clause)
per current qcom-binding convention.

A companion series adds the LPASS Clock Controller (LCC) for the same
SoC family.

Tested on HP TouchPad. Full board DTS will be sent once this and the
other foundation series (interconnect, irqchip MPM, gcc cleanup) are
in -next.

Thanks,
Herman

Herman van Hazendonk (3):
  dt-bindings: clock: qcom: add mmcc-msm8660 clock IDs
  dt-bindings: reset: qcom: add mmcc-msm8660 reset IDs
  clk: qcom: add MSM8x60 MMCC driver

 drivers/clk/qcom/Kconfig                      |   11 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/mmcc-msm8660.c               | 2998 +++++++++++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8660.h |  126 +
 include/dt-bindings/reset/qcom,mmcc-msm8660.h |   88 +
 5 files changed, 3224 insertions(+)
 create mode 100644 drivers/clk/qcom/mmcc-msm8660.c
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8660.h
 create mode 100644 include/dt-bindings/reset/qcom,mmcc-msm8660.h

-- 
2.43.0



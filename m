Return-Path: <linux-arm-msm+bounces-108157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAELDTvwCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:55:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B856B0D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6181430815F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16AF3EFD09;
	Mon, 18 May 2026 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJPqUXk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D373E95B2;
	Mon, 18 May 2026 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100381; cv=none; b=qTc1SSjksl8+R5DAJTEllFIJhcQNi6R1kl5eg6R9u1IfQEatfJ+ccC/u/owMUq6CoyQw2vcXw4Jjuprh5e8qz/bOGmaOf7WT3a/PvwzyMPGggVtSRB0Ovo0pSbNF/nAZh+nXGRLQS8lvX0iRP7lqWl/SpTEKLh4jezObhuYGun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100381; c=relaxed/simple;
	bh=u4mlMQuiRSVOJoZk0W9VqXiNcwQBWqJwQpwyGvpon/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ru12k/9LW8U52ynUWEmnlU5AQYkNIGfy5ncIupAgCRc2Nq4jyHbogDMRIB9nZA+utQgvq4t4ZJwKf3nlEZyhxVG2Nik5Tj+Ty8zQK8GXIiMWZGdFTGwRhDQffNbxJ2OZZB1mQeNuaUVXZ4Dbs2bJ6BLUZuzgdeoVsNPrXyAmzi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJPqUXk9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2286C2BCC6;
	Mon, 18 May 2026 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100380;
	bh=u4mlMQuiRSVOJoZk0W9VqXiNcwQBWqJwQpwyGvpon/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZJPqUXk9C7D6Skr2TewVA109U1nl6rojJkb3hOnerw8JaFH01t7Jp0RxNIwADMh+L
	 gcyI0My5UXZFeWnFGu9DEwpbDtJy8ySc2xY5Zs6glEeeibD0WalAaLP7qQhMBRi6QG
	 LLt0CdJpCx45pk+mFaSIzyee30qnNghStmR1a20KYwoH9oDfGpjjaq1E6PoTR1RLoU
	 DO3l6ohZZQMfs6+0ndlpYSjD9J5RwJQ+XpKN7qGuUWpWPsYM4LZWCipo3KB7nwgrom
	 Fr0pbXNUau8GHVDBC57KvT1e+tSeK8BweVTh+PxpWlvYTMTv4TIXKkcwP9QEvBx+N6
	 gWM/EwdAAqu+g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 18 May 2026 12:29:49 +0200
Subject: [PATCH 2/5] phy: core: Define TBT phy_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
In-Reply-To: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779100365; l=1765;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=RMwhfzMTBEbqo12DI9ixrBoeEOqCH1NR2RKBf/hbieM=;
 b=AlyKt6pSJ+eYUl4BNy94aQsgcx84VvCq8TLQuBoxvud08RayFKVzo9wrDoixbllXq8g/RVP2d
 DdYg++MadnIDHHLqs0yjHVPDGwobA/FTD3UPon58ucRoFN5ESPsdOX/
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: A60B856B0D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108157-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
configuration. Define a new phy_mode for them.

Currently, USB4 and TBT3 are defined as submodes, because they're quite
distinct, most visibly in the electrical/analog aspects (slightly
different frequencies, timings, etc.). This results in a need to make
the PHY aware of the actual mode needed (at least in the Qualcomm
implementation, but I believe that'll be a general need).

Newer versions of TBT are basically supersets of USB4 with higher
host-side requirements, so these are not defined. This can always be
changed as necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/linux/phy/phy-tbt.h | 14 ++++++++++++++
 include/linux/phy/phy.h     |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
new file mode 100644
index 000000000000..5f48059814e1
--- /dev/null
+++ b/include/linux/phy/phy-tbt.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __PHY_TBT_H_
+#define __PHY_TBT_H_
+
+enum tbt_phy_submode {
+	PHY_SUBMODE_TBT3,
+	PHY_SUBMODE_USB4,
+};
+
+#endif
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..26a91c070f8c 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -20,6 +20,7 @@
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
+#include <linux/phy/phy-tbt.h>
 
 struct phy;
 
@@ -45,6 +46,7 @@ enum phy_mode {
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
 	PHY_MODE_HDMI,
+	PHY_MODE_TBT,
 };
 
 enum phy_media {

-- 
2.54.0



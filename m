Return-Path: <linux-arm-msm+bounces-110710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGqMFr9lHmoNjAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DD6286CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A7C304B9B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628892F5487;
	Tue,  2 Jun 2026 05:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="DwAOXYdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CF82F6562;
	Tue,  2 Jun 2026 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376934; cv=none; b=Vh74ZUpK4Luwr42TBqmwuffyJYSPqMLONyUf52zD+S5LgeNFbIjGxrsv2oSzjnmA1cgUBvPWxrcL+JQ5n4ETFoykrSnCqFYo4L6vCihgpWNVN0PQ+0FbuO4gvnT1ShwG2VQnA+Lbw6+bBOWO/Mwqw9WGtE86PL8lrAHpM74fpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376934; c=relaxed/simple;
	bh=Cmjxj2wiF8u1sHHEj9jShD68h3zUTLE9XEce5rurbVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOO3sRw6ozX6AX5Xs/iTvHVnZn5MzCjKajhkwwDpUn3nAze2EKA5TJu3f/THwhCHIZ927an5s5k5cKzFNdQQme/QpWvGut4r7KP4ePnY76T8FlrdDb08YhML24063dOjnXXR/QHuDR63ws9pMX6vUqsBW0gw2va/EdbPBdFUw+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=DwAOXYdH; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gTzPl0sDPzY75Yh;
	Tue,  2 Jun 2026 07:08:43 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gTzPk43fJzJjhXx;
	Tue,  2 Jun 2026 07:08:42 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gdsc: add RPM_ALWAYS_ON flag
Date: Tue,  2 Jun 2026 07:08:38 +0200
Message-ID: <20260602050840.435933-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602050840.435933-1-github.com@herrie.org>
References: <20260602050840.435933-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780376922; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=xFtJj1B1CMj58yblyln1H6UDnsMOa86FbyIpKGGyomc=;
 b=DwAOXYdH8lQh0TqznRGo5pj0C4ol9TGBTvc3hYn1gAD6VKrbxivwuvv2dVXSlSivwG9/PU
 FrzDoNSnCaqSKZOZmMar30r+yrvHZyIZPbHoABaOQdinvERbbNVmbQ9vTtllBYfT+A8m0D
 cdiaxDfkHV/KQjNM15V9Tr9m58gNDd2oUJyXYiGKiacUXTawYJdAxqvKXGTKFI7cmKBl96
 4meP30Ec4/L2XrpN5i+H3Q91Z+KebmW+lW+CM0ERGegX7F40dWiPK/VTziOwB0IRUiWasB
 ppOe39+4GvAsMQpuoIiAZGlyalS3RGdy8GXOrht38UyaxRI8UqNkirs4KWVVyQ==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110710-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F07DD6286CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some power domains need to stay powered across runtime PM even though
their clocks may still gate, and only collapse on full system suspend.
Add an RPM_ALWAYS_ON flag that maps to the existing
GENPD_FLAG_RPM_ALWAYS_ON on the underlying generic_pm_domain.

This is distinct from the existing ALWAYS_ON flag (which keeps the
domain permanently enabled and prevents collapse even during system
suspend) and from leaving the flag unset (which allows the domain to
collapse on every runtime-idle transition).

The first user is the upcoming MSM8x60 MMCC driver, which needs
RPM_ALWAYS_ON on the a2xx (Adreno 220) GFX3D footswitch: cold-cycling
the GPU rail on every runtime idle forces an a2xx_hw_init microcode
reload whose MMIO burst can stall the shared MMSS AXI fabric when it
coincides with an MDP display client-switch underrun, hard-hanging
the SoC. Letting the rail stay up during runtime PM (clocks still
gate, idle power is still saved) and only collapsing on system
suspend avoids the corner case while still allowing full power-down
during deep sleep.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c |  2 ++
 drivers/clk/qcom/gdsc.h | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 64a9b315a9c2..e319b905c31b 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -632,6 +632,8 @@ static int gdsc_init(struct gdsc *sc)
 
 	if (sc->flags & ALWAYS_ON)
 		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
+	if (sc->flags & RPM_ALWAYS_ON)
+		sc->pd.flags |= GENPD_FLAG_RPM_ALWAYS_ON;
 	if (!sc->pd.power_off)
 		sc->pd.power_off = gdsc_disable;
 	if (!sc->pd.power_on)
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 13ca09f93a01..27acf20e8d68 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -75,6 +75,18 @@ struct gdsc {
  * transition completed after a fixed delay rather than polling status.
  */
 #define LEGACY_FOOTSWITCH	BIT(10)
+/*
+ * Keep the domain powered across runtime PM (its clocks may still gate via
+ * the clock framework) and only allow it to power-collapse on system
+ * suspend. Maps to GENPD_FLAG_RPM_ALWAYS_ON on the underlying genpd. Useful
+ * for blocks whose cold-start sequence is expensive enough that runtime
+ * power cycling causes user-visible latency or hardware corner-case bugs --
+ * e.g. the MSM8x60 a2xx (Adreno 220) graphics footswitch, whose first
+ * power-up after collapse forces a full microcode reload that can stall
+ * the shared MMSS AXI fabric when it coincides with an MDP display
+ * underrun.
+ */
+#define RPM_ALWAYS_ON	BIT(11)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
2.43.0



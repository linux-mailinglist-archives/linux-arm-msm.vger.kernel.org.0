Return-Path: <linux-arm-msm+bounces-111504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3HyeIOQTJGrx2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:34:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B564D6E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=Onljp8uL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111504-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111504-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA9E301014B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA90839DBF4;
	Sat,  6 Jun 2026 12:34:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound6.mail.transip.nl (outbound6.mail.transip.nl [136.144.136.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323B376497;
	Sat,  6 Jun 2026 12:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749280; cv=none; b=msUD4/bPkZtAbMgv/mDAr1Rls7d/UT6P4T5ChIDIgIusCoHOWG5ZGedXlzhtob+WuDeQGxns9oGnZwzNXVEX12W0T/3ck088Xc9ABOvVmeStLe5CO3QQrnISRWGB+RLR0vEUdJumie2dd3BZN+NdgDdK+dvtXm0NXBkvHc7Rocc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749280; c=relaxed/simple;
	bh=LzvzZKmNu1BSB5msNlu9m3rhENlsdqQSZlFNw6binx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZ+ObhNV1Z0UK5LPUayxDEYgipBdM3cymJN/GpL4n8SaQFiTSvhw4xnqmEY4s3zYBIjPDwkmRFm798857s/nZw+mOFDgAEjBpI4X3CYsMudPGhXkgwaYhLDazALGbzO215vX/No9qc3O9v5b9qDJTJosBoT0xOmLbZqJcZEIeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=Onljp8uL; arc=none smtp.client-ip=136.144.136.128
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound6.mail.transip.nl (Postfix) with ESMTP id 4gXd6D29rczwLHKF;
	Sat,  6 Jun 2026 14:34:28 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gXd6C5D0HzJjhYL;
	Sat,  6 Jun 2026 14:34:27 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Date: Sat, 06 Jun 2026 14:34:27 +0200
Subject: [PATCH v2 2/2] clk: qcom: gdsc: add RPM_ALWAYS_ON flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-2-187a32d2f015@herrie.org>
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
In-Reply-To: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749266; l=4171;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=LzvzZKmNu1BSB5msNlu9m3rhENlsdqQSZlFNw6binx4=;
 b=Ssu9KUA/LX8wD8/C3T6ykEBpfByQKBjqjdM2WK9ppfDvJRI40d9Q7jLDH/HW5Jg0YZRH8ejcg
 Dr1o5/XfaiIDS59eUyEwsA4y1HY53Wa8zYuhJzPdWSLznrcPTNFhDnT
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780749267; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=Q0oQqrHUfpO+gdshMA+ahrF6Af1d6WXHr7563kjZMYU=;
 b=Onljp8uL+x9Rt+NkN8iixcVKSTqNNxr8vD7bEgAOcdWJefYh4mdWi9X8Ii3zTrnH03+0Uq
 2aQMHk8FVst+3NfbBwy3DDG1l5fW/xt6phMBDYIGSmzWkXX1TYzPti1waYdZcQcZsqMqlT
 vrTULDmshqlgPI1KUDfETTSQtMZiCvMUjEhGU9UTdKCDQT63TIxXAt2RzVRlk1voBhT+0c
 my7S8fZ/JZvHXfvFv9+/BjIvY0e3ZOV3I30o2xiUV2UgoMqHLQL7c93U8WXZKpa73NRmQ+
 zFSaeDJnpLBRiV6+t4kipawvTVkCcdFrYZtlQsjGkVTeGH8EGi2dEY/2MieuiQ==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111504-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[herrie.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE3B564D6E3

Some power domains need to stay powered across runtime PM even though
their clocks may still gate, and only collapse on full system suspend.
Add an RPM_ALWAYS_ON flag that maps to the existing
GENPD_FLAG_RPM_ALWAYS_ON on the underlying generic_pm_domain.

This is distinct from the existing ALWAYS_ON flag (which keeps the
domain permanently enabled and prevents collapse even during system
suspend) and from leaving the flag unset (which allows the domain to
collapse on every runtime-idle transition).

GENPD_FLAG_RPM_ALWAYS_ON, like GENPD_FLAG_ALWAYS_ON, requires the
underlying genpd to be in the ON state at pm_genpd_init() time --
the framework rejects registration otherwise. Fold RPM_ALWAYS_ON
into the gdsc_init() block that already force-enables ALWAYS_ON
GDSCs found powered down at sync time so the flag combination is
honoured consistently.

The first user is the upcoming MSM8x60 MMCC driver, which needs
RPM_ALWAYS_ON on the a2xx (Adreno 220) GFX3D footswitch: cold-cycling
the GPU rail on every runtime idle forces an a2xx_hw_init microcode
reload whose MMIO burst can stall the shared MMSS AXI fabric when it
coincides with an MDP display client-switch underrun, hard-hanging
the SoC. Letting the rail stay up during runtime PM (clocks still
gate, idle power is still saved) and only collapsing on system
suspend avoids the corner case while still allowing full power-down
during deep sleep.

Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c | 21 ++++++++++++++++++---
 drivers/clk/qcom/gdsc.h | 12 ++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 1f80bebe88c7..0622bb23d17b 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -777,9 +777,22 @@ static int gdsc_init(struct gdsc *sc)
 				goto err_disable_supply;
 		}
 
-	} else if (sc->flags & ALWAYS_ON) {
-		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
-		gdsc_enable(&sc->pd);
+	} else if (sc->flags & (ALWAYS_ON | RPM_ALWAYS_ON)) {
+		/*
+		 * Both GENPD_FLAG_ALWAYS_ON and GENPD_FLAG_RPM_ALWAYS_ON
+		 * require the domain to be ON at pm_genpd_init() time --
+		 * the framework rejects registration otherwise. Bring up
+		 * any such GDSC that is currently off so the genpd flags
+		 * we set below match the silicon state.
+		 *
+		 * Propagate the gdsc_enable() return so a failure here does
+		 * not silently set on=true and leak a vote through the
+		 * err_disable_supply path (which would unwind a vote that
+		 * was never actually taken).
+		 */
+		ret = gdsc_enable(&sc->pd);
+		if (ret)
+			return ret;
 		on = true;
 	}
 
@@ -790,6 +803,8 @@ static int gdsc_init(struct gdsc *sc)
 
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



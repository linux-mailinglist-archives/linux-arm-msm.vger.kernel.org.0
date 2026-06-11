Return-Path: <linux-arm-msm+bounces-112622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +IggGM1QKmrCnAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:08:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C266EE5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="EfiKN/Hl";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112622-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112622-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 692F4303CC00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E89234CFAB;
	Thu, 11 Jun 2026 06:08:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F41277C88;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158090; cv=none; b=PaadHLzFbEaRrqqFeGfISP5eDr5YRJQtK2zTc2/XUJ2n/4wCOPRRhPpND0xGSe1wzxkcukV2TmuI+1RquVNqWUhX31Vm1/LvIk+T3ZhhtXPAZZ8nwDQoykkdtMZyhrZhVQFEA++qd/6sdRzbVRiVQV6H0Uzdeh2pcjiIBpJLi7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158090; c=relaxed/simple;
	bh=YjlzsUes+UHXIygCtMqm0Y8N44gS9Cw237mZnXW1wqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pI1a0TogyQxwlthFKzx3FYVsyoVZ9s0mMAyuFkeVlu5/YnFSxutEZhS42BhTRHe+DDcjnhpUjw0Ua7H1DSbDUEROIfVG/ZWl/NAR47jM2SQM9ef/VvF2BlR7VvB67m5DR6OiwlS2C0T2dCWKvUlHR+NRv6n3mcI7RO6f0lfK2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfiKN/Hl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0C36C2BCB9;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781158089;
	bh=YjlzsUes+UHXIygCtMqm0Y8N44gS9Cw237mZnXW1wqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EfiKN/Hlx/WLXRGvf5c2da9+KDLKknWoGH2bZ6Z16GvyqUHNbros8kv3btbgJszRX
	 RlaV+/h/acI9Gyombtzl+CZXPnRWfX0+XYN3QN39H9KVSSccK9FsDCsY9vVAoA/TgH
	 kM9/6S8rYEGt6/FE0VD8UrLN2+A5AkUuxMoXwUT6BIYFijvv4AngakU+HujBr9hiDq
	 iZd3PPxgNrNizXWmFvW/sZPNv7Ssj2kpR/K9hvxrisr8mz3ufejnLTGAgjxxiV2Jmy
	 B2Tqm1Kanh9sFS6AJcz3oQmqerTNMskkU2CAgPEHj5AmJc7rQRwXhkQZDkDacq4nQR
	 XDD1r23oewG/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5892CD98C6;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Thu, 11 Jun 2026 08:07:46 +0200
Subject: [PATCH 1/2] drm/msm/mdp4: keep the bus clock enabled while a CRTC
 is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781158087; l=4146;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=ACm6LaIl/jyuS325Hv9bN+g+5H+Dcl4SC+eD28CoCEU=;
 b=O6NrUIlgFenxGp9OOWJzkRKkFIKgz+wlKqgIXH32ktejtvQPBVJcNJ+FOWQfWSaa54UAs4AVU
 H2/pqqJzCR1DNklPeM/2xWcUC91xOF6ymG3DW5C+ZoKrWOOUNiT3wSI
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112622-lists,linux-arm-msm=lfdr.de,contact.alex-min.fr];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B32C266EE5B

From: Alexandre MINETTE <contact@alex-min.fr>

MDP4 scanout continues to fetch framebuffer data while the CRTC is
active. Keep the AXI/bus clock enabled for the lifetime of each active
CRTC so that temporary MDP4 disable paths do not gate the bus clock
while scanout is still running.

This avoids display corruption seen on the Samsung Galaxy S4 when the
display pipeline is active.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  2 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 42 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  6 +++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index e8066f9fd534..9e53c9d956ca 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -271,6 +271,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
 	mdp4_disable(mdp4_kms);
+	mdp4_crtc_bus_put(mdp4_kms);
 
 	if (crtc->state->event && !crtc->state->active) {
 		WARN_ON(mdp4_crtc->event);
@@ -295,6 +296,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 
 	mdp4_enable(mdp4_kms);
+	mdp4_crtc_bus_get(mdp4_kms);
 
 	/* Restore vblank irq handling after power is enabled */
 	drm_crtc_vblank_on(crtc);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 809ca191e9de..4c60b49fb784 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -118,6 +118,39 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 	}
 }
 
+void mdp4_crtc_bus_get(struct mdp4_kms *mdp4_kms)
+{
+	int ret = 0;
+
+	mutex_lock(&mdp4_kms->clock_lock);
+
+	if (!mdp4_kms->crtc_bus_count)
+		ret = clk_prepare_enable(mdp4_kms->axi_clk);
+
+	if (!ret)
+		mdp4_kms->crtc_bus_count++;
+
+	mutex_unlock(&mdp4_kms->clock_lock);
+
+	WARN_ON(ret);
+}
+
+void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms)
+{
+	mutex_lock(&mdp4_kms->clock_lock);
+	if (!mdp4_kms->crtc_bus_count)
+		goto unlock;
+
+	mdp4_kms->crtc_bus_count--;
+	if (mdp4_kms->crtc_bus_count)
+		goto unlock;
+
+	clk_disable_unprepare(mdp4_kms->axi_clk);
+
+unlock:
+	mutex_unlock(&mdp4_kms->clock_lock);
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -137,6 +170,13 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	mutex_lock(&mdp4_kms->clock_lock);
+	if (mdp4_kms->crtc_bus_count) {
+		clk_disable_unprepare(mdp4_kms->axi_clk);
+		mdp4_kms->crtc_bus_count = 0;
+	}
+	mutex_unlock(&mdp4_kms->clock_lock);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 
@@ -514,6 +554,8 @@ static int mdp4_probe(struct platform_device *pdev)
 	if (!mdp4_kms)
 		return -ENOMEM;
 
+	mutex_init(&mdp4_kms->clock_lock);
+
 	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
 	if (IS_ERR(mdp4_kms->mmio))
 		return PTR_ERR(mdp4_kms->mmio);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c..86391d9bc55f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -7,6 +7,8 @@
 #ifndef __MDP4_KMS_H__
 #define __MDP4_KMS_H__
 
+#include <linux/mutex.h>
+
 #include <drm/drm_panel.h>
 
 #include "msm_drv.h"
@@ -31,6 +33,8 @@ struct mdp4_kms {
 	struct clk *pclk;
 	struct clk *lut_clk;
 	struct clk *axi_clk;
+	struct mutex clock_lock;
+	unsigned int crtc_bus_count;
 
 	struct mdp_irq error_handler;
 
@@ -148,6 +152,8 @@ static inline uint32_t mixercfg(uint32_t mixer_cfg, int mixer,
 
 int mdp4_disable(struct mdp4_kms *mdp4_kms);
 int mdp4_enable(struct mdp4_kms *mdp4_kms);
+void mdp4_crtc_bus_get(struct mdp4_kms *mdp4_kms);
+void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms);
 
 void mdp4_set_irqmask(struct mdp_kms *mdp_kms, uint32_t irqmask,
 		uint32_t old_irqmask);

-- 
2.43.0




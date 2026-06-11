Return-Path: <linux-arm-msm+bounces-112623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pVIDCc5QKmrFnAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:08:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86C66EE6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:08:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=eG8oKfde;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112623-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112623-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AA373043529
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311B03546C4;
	Thu, 11 Jun 2026 06:08:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC228643A;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158090; cv=none; b=U6WMOtMvPBQaooabmZeJW3V4lJ8PHDv5KZ+RGkGxSMv0mlJcuNq9/ysR0HirQ5t7zv8UW31lpU+Gy59IkgzGreXE1gBSSArmTWeuo/rrVH+02AcBwaR8GFcg3f4I6t6L9lJOnyviWUs9+hxArdnrSfkVfamb4/5Y7SLtaRfS4K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158090; c=relaxed/simple;
	bh=N4TX6TuZny23eBaXcZmnD0Ha3T+/QtIMM5zVz19bTXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoFXstUW/Lhe5Vxg5dnA/onpKySnTcL7BA8F7ssH2Q5DfILEF80FLUU3bujgjfVBINqMBIg2DdMCbcRgAYI9LpiZcHMAjyJzvte4apGDohSOh54/RaSSSyd1k54GNIn3UkRENVbiv5CRSqhFkgEd5ZlqMRNkUBzNq078WPS6i4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eG8oKfde; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C55CEC2BCC7;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781158089;
	bh=N4TX6TuZny23eBaXcZmnD0Ha3T+/QtIMM5zVz19bTXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eG8oKfdellegnf4TQ3PZr60qpVlD9RhvBTBcAq1E775G7u2oYsyfcsnA34ZIG1Jcr
	 e6IlvPFQGGaByfNKnvlOhXVjJK4MtSnj23cUkroCF42v/G1sPFx0baE2/NoYyPK+Ih
	 TKOvMBwM3gJQ/Z38qWBLyMsR8Nu9JRCpScdMbvdMuxsZuOH1Y8cGnqu50HtgWmj+mb
	 cqddv5Uwvs6EnS/dUPshVHdUL0Xz54Sl7/LyS7GUPjNr8uLjtEtHY855OdGXxU3T9t
	 26wU/IIwyvVyhqNQRnXBTV6pVVU3NHRR7HsBoI4kocg3/4YIeg8/qcpeL/WvrhsnWJ
	 Ask7Z90fId0PA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DE3CD98CF;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Thu, 11 Jun 2026 08:07:47 +0200
Subject: [PATCH 2/2] drm/msm/mdp4: keep inherited display clocks enabled
 until modeset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-2-22925600e4f2@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781158087; l=5355;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=bRl6/0Ew6JY9Fp5O3asZLYPvgCZok6zy103T4pX0/Lo=;
 b=N6BN8t/pvr/mk8k9OqSwa+SamY44EgWxbcKuRlCORo73qZPDSRrVALCiktAauT8vcvXJIXhbn
 FC+BsZ/5NhSDqG2snx7vVR0mS6keV3KDb/GBnnp0ZXwU8T3dyQRgzyn
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112623-lists,linux-arm-msm=lfdr.de,contact.alex-min.fr];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C86C66EE6C

From: Alexandre MINETTE <contact@alex-min.fr>

Some devices boot with the MDP4 display pipeline already enabled by
firmware. On the Samsung Galaxy S4, disabling clocks used by that
inherited pipeline before DRM takes over can leave the panel showing a
blue screen.

Keep the required display clocks prepared when an inherited
DSI/LCDC/DTV enable state is detected, and drop the extra clock
references on the first DRM CRTC enable. At that point the driver owns
the display pipeline.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 66 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  2 +
 3 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 9e53c9d956ca..0aeefd48be1f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -297,6 +297,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	mdp4_enable(mdp4_kms);
 	mdp4_crtc_bus_get(mdp4_kms);
+	mdp4_inherited_display_clocks_put(mdp4_kms);
 
 	/* Restore vblank irq handling after power is enabled */
 	drm_crtc_vblank_on(crtc);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4c60b49fb784..1264ce7e8459 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -151,6 +151,58 @@ void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms)
 	mutex_unlock(&mdp4_kms->clock_lock);
 }
 
+static bool mdp4_has_inherited_display_state(struct mdp4_kms *mdp4_kms)
+{
+	return mdp4_read(mdp4_kms, REG_MDP4_DSI_ENABLE) ||
+	       mdp4_read(mdp4_kms, REG_MDP4_LCDC_ENABLE) ||
+	       mdp4_read(mdp4_kms, REG_MDP4_DTV_ENABLE);
+}
+
+/*
+ * If firmware left MDP4 scanout enabled, preserve the core/LUT clocks until
+ * the first DRM CRTC enable takes ownership of the display pipeline.
+ */
+static void mdp4_inherited_display_clocks_get(struct mdp4_kms *mdp4_kms)
+{
+	bool inherited_display;
+
+	mutex_lock(&mdp4_kms->clock_lock);
+
+	clk_prepare_enable(mdp4_kms->clk);
+	clk_prepare_enable(mdp4_kms->pclk);
+	clk_prepare_enable(mdp4_kms->lut_clk);
+	clk_prepare_enable(mdp4_kms->axi_clk);
+
+	inherited_display = mdp4_has_inherited_display_state(mdp4_kms);
+
+	if (inherited_display) {
+		clk_prepare_enable(mdp4_kms->clk);
+		clk_prepare_enable(mdp4_kms->lut_clk);
+		mdp4_kms->inherited_display_clocks_held = true;
+	}
+
+	clk_disable_unprepare(mdp4_kms->clk);
+	clk_disable_unprepare(mdp4_kms->pclk);
+	clk_disable_unprepare(mdp4_kms->lut_clk);
+	clk_disable_unprepare(mdp4_kms->axi_clk);
+
+	mutex_unlock(&mdp4_kms->clock_lock);
+}
+
+void mdp4_inherited_display_clocks_put(struct mdp4_kms *mdp4_kms)
+{
+	mutex_lock(&mdp4_kms->clock_lock);
+	if (!mdp4_kms->inherited_display_clocks_held)
+		goto unlock;
+
+	clk_disable_unprepare(mdp4_kms->clk);
+	clk_disable_unprepare(mdp4_kms->lut_clk);
+	mdp4_kms->inherited_display_clocks_held = false;
+
+unlock:
+	mutex_unlock(&mdp4_kms->clock_lock);
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -171,6 +223,11 @@ static void mdp4_destroy(struct msm_kms *kms)
 		pm_runtime_disable(dev);
 
 	mutex_lock(&mdp4_kms->clock_lock);
+	if (mdp4_kms->inherited_display_clocks_held) {
+		clk_disable_unprepare(mdp4_kms->clk);
+		clk_disable_unprepare(mdp4_kms->lut_clk);
+		mdp4_kms->inherited_display_clocks_held = false;
+	}
 	if (mdp4_kms->crtc_bus_count) {
 		clk_disable_unprepare(mdp4_kms->axi_clk);
 		mdp4_kms->crtc_bus_count = 0;
@@ -549,6 +606,7 @@ static int mdp4_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mdp4_kms *mdp4_kms;
 	int irq;
+	int ret;
 
 	mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms)
@@ -594,7 +652,13 @@ static int mdp4_probe(struct platform_device *pdev)
 	if (IS_ERR(mdp4_kms->lut_clk))
 		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
 
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
+	mdp4_inherited_display_clocks_get(mdp4_kms);
+
+	ret = msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
+	if (ret)
+		mdp4_inherited_display_clocks_put(mdp4_kms);
+
+	return ret;
 }
 
 static void mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 86391d9bc55f..289b5b476d99 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -34,6 +34,7 @@ struct mdp4_kms {
 	struct clk *lut_clk;
 	struct clk *axi_clk;
 	struct mutex clock_lock;
+	bool inherited_display_clocks_held;
 	unsigned int crtc_bus_count;
 
 	struct mdp_irq error_handler;
@@ -152,6 +153,7 @@ static inline uint32_t mixercfg(uint32_t mixer_cfg, int mixer,
 
 int mdp4_disable(struct mdp4_kms *mdp4_kms);
 int mdp4_enable(struct mdp4_kms *mdp4_kms);
+void mdp4_inherited_display_clocks_put(struct mdp4_kms *mdp4_kms);
 void mdp4_crtc_bus_get(struct mdp4_kms *mdp4_kms);
 void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms);
 

-- 
2.43.0




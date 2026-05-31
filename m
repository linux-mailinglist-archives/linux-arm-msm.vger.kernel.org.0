Return-Path: <linux-arm-msm+bounces-110480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELyJJ2SlHGojRAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 23:17:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CEA618008
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 23:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3023D3007C89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 21:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B20933A708;
	Sun, 31 May 2026 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3arLX5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAE620468E;
	Sun, 31 May 2026 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780262216; cv=none; b=HXhitTnxP3hSskmJjqqHTW+zUWmxy7JSHLyAMM+fYqIaK1cO/CRMQIBZtF6ugaxV4cS5F7lRrV2Isj1uOl33exJ9d5z25MVB8Q/xre+UHTbJaxIHxkLJi3epJNi0j3Qq3Zny3gHfpByxZF6VeLHeATtVAhmCWRburFin1lpkQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780262216; c=relaxed/simple;
	bh=UqwX8U2pzE4HKkUAjku0ECYLVr1qdFYS0RFI2hwaBog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jzlhSd0T4iutYDeYIufNLuicOYMoyZDXmi8+/kyXbSZc7uBjpFm190PVZ8BIWdM9IHk6yBWW0cfsN1Y/VoPjWWZhkKsW7aqiLYninohB/U+DW/73cPpCGKJAEFbAwaTA6Cr7m9XjTu16dexUQG8YvpsVb2Sht4ma59M66vVlNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3arLX5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BC42C2BCB4;
	Sun, 31 May 2026 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780262216;
	bh=UqwX8U2pzE4HKkUAjku0ECYLVr1qdFYS0RFI2hwaBog=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=D3arLX5aI01X6W63GSr5RaxqFBnP+NlftlN4rhQh18RVSKIKic3pgUbSkXXk4I9Ta
	 70uU00SnoOEJ8VFSreqdnrljuaJ4gEIq0k0GPcFGZN+3FeZMLucUgDlxhPY5fBBuD3
	 DpjPCjwd/KP1iFJB2vzPLgZaskQX5U2zW96NDFCcwY2wkSCyqv4mHhKQ49Y/SoK8De
	 gZ50WSZvEJ06fvSyvvYeHgQIeSB8ct6izoa2pRArVTfpHNOh716iQ6kyi1wEHGc3jJ
	 XxWCck3HTSmGhS4y8Lh7zCSvXMFpakRHDrsGFYNYb+5Fs8XwET1lnxv2quZwcr4rhC
	 6Lh45u62SQyKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F650CD6E57;
	Sun, 31 May 2026 21:16:56 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 31 May 2026 23:16:51 +0200
Subject: [PATCH] drm/msm/dp: add EDID re-read retry in
 msm_dp_panel_get_modes()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBNM+6GuEiGiYw2VhVIU0d2Tl
 t/ivQciBsIIXfZAwJMibT6hyDMwk/YjMrLJILioeSULZsOq9uUYlVv0fCu0ZJkxTVNKV7uWt5D
 KPaCj67/2w/t+pFTkKmUAAAA=
X-Change-ID: 20260531-drm_plug_flaky_edid-cc7743f6f909
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780262215; l=2645;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=LLV/YX7XX1GqZAGEgoltmCK2iL/5xctBrdp5zxAObKo=;
 b=GLYLpyJ3FvnDVIbCdCUxHGXOTUaswQADP+GHzOeIi2qhcCoAlZ0jzcODmoI9JDRZtetZK6chQ
 gVkQC5yQIGPDzai1VWFPfxL0t+lcFo2vpqclOYDlQGoYhwoCzMPgEqp
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110480-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 03CEA618008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

drm_edid_read_ddc() can return a structurally valid EDID from which
drm_edid_connector_add_modes() still returns zero modes. This triggers
the error:

  [drm:msm_dp_bridge_get_modes [msm]] *ERROR* failed to get DP sink
   modes, rc=0

even though the link is ready. Since the EDID is only read once, this
error persists and the display comes up with 640x480 resolution.

Add a retry of drm_edid_read_ddc() inside get_modes() when the initial
read produces no usable modes. The bad EDID is freed before retrying
and container_of ensures access to the DDC channel. This directly
addresses the observed "valid but empty/garbage" EDID case on
flaky DP plugs and adapters.

I tested this on a few of my "flaky" type-c to HDMI adapters and hubs,
getting no "retry failed" messages and the desired resolution. Without
the patch most plugs would result in 640x480 external display.

Fixes: [5bea90ad9743d2] "drm/msm/dp: switch to struct drm_edid"

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 6bb021820d7c5..4f27c8129b0ef 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -327,11 +327,39 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 	struct drm_connector *connector)
 {
+	int modes;
+	int retry;
+	struct msm_dp_panel_private *panel;
+
 	if (!msm_dp_panel) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
 
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (msm_dp_panel->drm_edid) {
+		modes = drm_edid_connector_add_modes(connector);
+		if (modes > 0)
+			return modes;
+
+		drm_edid_free(msm_dp_panel->drm_edid);
+		msm_dp_panel->drm_edid = NULL;
+	}
+
+	for (retry = 0; retry < 5; retry++) {
+		usleep_range(20000, 25000);
+		msm_dp_panel->drm_edid =
+			drm_edid_read_ddc(connector, &panel->aux->ddc);
+		if (msm_dp_panel->drm_edid)
+			break;
+
+		drm_dbg_dp(connector->dev,
+			   "get_modes re-read attempt %d/5 failed\n",
+			   retry + 1);
+	}
+
+	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
 	if (msm_dp_panel->drm_edid)
 		return drm_edid_connector_add_modes(connector);
 

---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260531-drm_plug_flaky_edid-cc7743f6f909

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>




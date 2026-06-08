Return-Path: <linux-arm-msm+bounces-111661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 90LXIh5LJmrfUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:54:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D6652A89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=T3Fx+MA1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111661-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111661-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2713C300D920
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 04:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E658F34888F;
	Mon,  8 Jun 2026 04:54:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B062771B;
	Mon,  8 Jun 2026 04:54:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894482; cv=none; b=NGN2kVg5yphQ4U7wbDlix8f/hp49QZfdTMcOmlXgaNbltrfcNbCG9G4xbSSjqK1bGTEwTtpKtSV+7LTDKYdmUKY+7Q80lrCropGFQopHbzV9k4CsqVjsd3Getoxe0Q6txkPcbf4NwizW9eENQjRv7/TMC7qlnICF42R9morEGa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894482; c=relaxed/simple;
	bh=zz+ReJGPCjYBFBCb2r084XSplvTHAjsBwYFx0jJ9sDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YazjD8us7GMduEPFDzT1DgQ5kn8q55tZ6UCKN1tRJygJoMNT6hlR1RcYwVCS+m+48ZdPs3L8Boinl9b3G7fOLpjUxJefyglujgQsQEPLYlWPMS20STfwtdEvdX8wWPUYhlKos5oP/gCr6+Li9htHSW1T8990tzEhs6fwRLEjhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3Fx+MA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A03CC2BCB0;
	Mon,  8 Jun 2026 04:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780894482;
	bh=zz+ReJGPCjYBFBCb2r084XSplvTHAjsBwYFx0jJ9sDo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=T3Fx+MA1ifV+eBA9lm8IqQLJ3o7hr6+paOiASowXe+bLjRrfSvUB4ryQsiGA5SUGH
	 Gvv2i4WvmscspasIAR7weNHWYualDDgB/K1Ho4541rrU9qJf1w+BlyoyHzP4NjvaJi
	 OBhbUaMaXoVXiJU+CJcWRIhEAG7sS66IrLxSY2j18IU1druj2f2WKyujfKZ+wcr/Ti
	 fUZ/UnXA/d8tDPaBUOQGjnleik+SLOcjZT+KcTcG9s35AfHB8n3q7XQS4iTMMhnP4S
	 ftQCotpJGJjTLQ+jkomdLGsOgPO/byik5EjqaeSmbiXAYFdSkkWCQurQTnwWCJrs9t
	 IfQmEASETC0yA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40437CD8C92;
	Mon,  8 Jun 2026 04:54:42 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 08 Jun 2026 06:54:39 +0200
Subject: [PATCH v3] drm/msm/dp: add missing drm_edid_connector_update()
 before add_modes on cached EDID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm_plug_flaky_edid-v3-1-1ca632938e7f@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OSw6CMBCA4auYrq1pByzWlfcwhkAf0FgpaaERC
 Xe3sHGjLv9J5puZUVDeqIDOuxl5FU0wrkuR7XdItFXXKGxkagQEGDlmFEv/KHs7NqW21X0qlTQ
 SC1EUeaaZ5oSjtNl7pc1zU6+31K0Jg/PTdiTSdfrfixRTDAU5CcqkULy4OCuDaJ2zwdlxSD+GQ
 21eaMUjfEBG4DsICaTAuK55DsD5T3BZljf8jnCRFAEAAA==
X-Change-ID: 20260531-drm_plug_flaky_edid-cc7743f6f909
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>, 
 Jani Nikula <jani.nikula@intel.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780894481; l=2688;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=55G4LQVrxBJzJlYE3Z1ybkSrDyEmlX4rhTBkpovP1x0=;
 b=dAQQLZtUlP2REJbgAX15/NGYkNWqDsTe/tGnHcSFaGRUxwNNn1zj+Uv7+inVOEEmkB4fzz1Ut
 ucAanTR8vm7AfZs50kVKzzIvKPGuy40yr9sDOjDtfIMfCkdAB2fkAa/
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dianders@chromium.org,m:jani.nikula@intel.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,chromium.org,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111661-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F35D6652A89

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

After the refactor to struct drm_edid, the fast path in
msm_dp_panel_get_modes() that already held a cached EDID called
drm_edid_connector_add_modes() directly without first calling
drm_edid_connector_update().

The new API requires the update step to associate the EDID with the
connector. Add the missing call. This restores correct behaviour for
the cached-EDID path.

Fixes: 5bea90ad9743 ("drm/msm/dp: switch to struct drm_edid")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Hi there,

thank you for the feedback on V1. I dug a little deeper and heeded Janis'
and Dmitry's request to print the "garbage" EDID, and to my surprise it 
was the genuine valid EDID for the display. The code is documented in [1].

That changed the picture a bit - "right" EDID but not tied to the connector.
The retry code does the drm_edid_connector_update() before 
drm_edid_connector_add_modes(), so I only added that missing piece in 
msm_dp_panel_get_modes(). This proves to be sufficient to get a stable
link with the desired resolution. Therefore I dropped the entire re-read 
and retry logic, because it is of course an ugly hack.
I have tested this with my complete collection of adapters and hubs, and
all work well.

[1]: https://github.com/jglathe/linux_ms_dev_kit/tree/jg/flaky_edid_retry

with best regards,

Jens
---
Changes in v3:
- cleaned up trailer spacing, added r-b tag (thank you, Dmitry)
- Link to v2: https://lore.kernel.org/r/20260602-drm_plug_flaky_edid-v2-1-1269fb942299@oldschoolsolutions.biz

Changes in v2:
- Dropped the retry + re-read logic
- Just add the missing drm_edid_connector_update() in the cached EDID path
- Link to v1: https://lore.kernel.org/r/20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 6bb021820d7c5..5b4954e7cb748 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -332,8 +332,10 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 		return -EINVAL;
 	}
 
-	if (msm_dp_panel->drm_edid)
+	if (msm_dp_panel->drm_edid) {
+		drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
 		return drm_edid_connector_add_modes(connector);
+	}
 
 	return 0;
 }

---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260531-drm_plug_flaky_edid-cc7743f6f909

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>




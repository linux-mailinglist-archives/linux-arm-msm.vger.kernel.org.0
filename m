Return-Path: <linux-arm-msm+bounces-110837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jGrXLwUfH2ptgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 20:20:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83F631030
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 20:20:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=EVp9XMre;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E5F300F106
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 18:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38921390228;
	Tue,  2 Jun 2026 18:19:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4C3655DB;
	Tue,  2 Jun 2026 18:19:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424352; cv=none; b=O2g8r7G2BvrJh/Ulri0y4MHpTnrdP8I3Ac2pbTeFfQ3d8PI1lqTSrkO1+EYrISAYdH13/dFjWk01Ku5Q3vAIEBgMfOTAfTfs4avfJ4xzPcO9qXnfm3v6WOYvfmvYZ7UT3LvfOQ5Fva5SY03v+zc0got6h0/okuL8tdp0BpiLHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424352; c=relaxed/simple;
	bh=ZEtoPEqgGmXssbpUCxKbFAwXpqhQ1EcWO1Rqehosk/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WPreD9v1z8wjTLtoHMt7RyNtK6NkpikGv4qNFIhh6ZN+l9BAfwWxOh6B5Ws5IRR8cBOKGSOD1mZRJpqsR4Jz+RnQoYYYBGtzowY4DXSa+BVSA9fWy9HxKveu9ULBXUdYOHCohRwZsaWO+tbekzMG63HkMJwxADLyMBMKNBrJ+Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVp9XMre; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5666C2BCB4;
	Tue,  2 Jun 2026 18:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780424351;
	bh=ZEtoPEqgGmXssbpUCxKbFAwXpqhQ1EcWO1Rqehosk/o=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EVp9XMre43TccnHAT3L1eFxxz85qT2J+AktP1OQI1/xGwohvx3VRaNPFnQPbqkxez
	 6ekoql2qpr8WMHTK2DXAytaSnmMDWYswffz/wEK+XGSjWMB7TqQpQFe9JS1xqrSKQk
	 S6baHKLzXshpMxzsFwX6ZLLHxaL82PFSqY7qeKeY9buqRTqsfuItd2sZFx8qwrw8M6
	 Hm41snk4PJh1LmE3WrEONcxdpvfYncLbNihnYafdrhJ/QkvPM77IUEUrXBiJLO7DSg
	 DOQhVpSCogjo217MAg04eWHrdZOoQnm9gzeJ0jL9MqLYu+IV3MqfwTg3gSyub8O37C
	 86X38+pv/XwSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9486CD6E57;
	Tue,  2 Jun 2026 18:19:11 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 02 Jun 2026 20:18:48 +0200
Subject: [PATCH v2] drm/msm/dp: add missing drm_edid_connector_update()
 before add_modes on cached EDID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-drm_plug_flaky_edid-v2-1-1269fb942299@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBREr0K6tqYtSsWV9zCEYPsLP1ZK+oGIh
 LtbOYDLN8m8mZURRARi12xlEWYkDH0CdciY6Zq+BY42MVNCFeKcS27jqx781NbON8+lBouWG6P
 1KXeFK0XJUnOI4PC9W+9V4g5pDHHZR2b5S//7ZsklV1pcjCysgVLfgrdkuhA8BT+N6SMdH/hh1
 bZtX6MI4UHDAAAA
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
 dmitry.baryshkov@oss.qualcomm.com, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780424350; l=2429;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=YZ7y8qgyyn7uIzSkFbhV3TyNem0jp5eLRvTq7Rc2SfA=;
 b=AfO11WxiGoEU81lVanf8WCGXKyt3VIimcAxGbFc3/GiVujnFc/fY13KIy0UpHPnTk5HvjjVZ2
 T3o35pm+MRoD28BWQjMjEuea2YGRd0uu+Cq+WIQJWWJBdt5W1k/xByk
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-110837-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B83F631030

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

After the refactor to struct drm_edid, the fast path in
msm_dp_panel_get_modes() that already held a cached EDID called
drm_edid_connector_add_modes() directly without first calling
drm_edid_connector_update().

The new API requires the update step to associate the EDID with the
connector. Add the missing call. This restores correct behaviour for
the cached-EDID path.

Fixes: 5bea90ad9743 ("drm/msm/dp: switch to struct drm_edid")

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




Return-Path: <linux-arm-msm+bounces-117956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6orsH2aLT2pPjQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:52:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22197730A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 13:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BhpIYwqZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117956-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117956-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DF973000FDB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5385C405844;
	Thu,  9 Jul 2026 11:52:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D7411692
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 11:52:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597922; cv=none; b=hfFKi5xZJQn/rQ7VELJU+lR/2AJWHTnNppvSmaeCUHaGKkyMgiHaWAxd3NKenHaEDDsDRzU2u2leo/vcMdNcSc+sCVixPvM/mhBx/LfT0QLQC7LBT7FS+PPk8ZBekIhju706dNiEM9QRBtAkTeGNJMfC13jZkbCs8y/wTHiZwrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597922; c=relaxed/simple;
	bh=dpW8I5bv7qJrrzpaPxAFRCLpqC/TXJuXDqzJfauMnng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9qMKpHCGwPwbDEFbedXBIYX2llCg2l/o8RN632ff6FnVK7UoQEMam29egbD6qvswlBOPZdHj56qhHJ/0gTf5prF2/relQWBIkSU00LtxhxlDlwUTRRTbK0OtP1lXrlVZhdOqbb5QPmfR1vEDf7wWJcIN6pnY0zod5nFO45S0YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhpIYwqZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FB91F00A3A;
	Thu,  9 Jul 2026 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597920;
	bh=x/dJi42lL879Y9C7WQ+qOaesKwOR3Zk94ejM/uNcfZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BhpIYwqZ19sZjOOZEqUfk9Ua+MDQrPrVQgqDKBh/C+qW2b3FbcnVpIxDCAR87j868
	 3gUnz/1c73Baa8FH8DG+dyUG4JzyRhKjvgbdEsrxEWoth6HgR7VpWdefvMP3ToxCOV
	 MIUBiobtHcVDQfnGrArhL3xMFN3h8lOFLFtLFW+dD3c30Zrxmu9Iz2iG6lQcBRNd8P
	 A/mNFpqKfUnZEUBDrKCeGp3gi2Pkx9tShz++PncwunQZ3hRyxfR6A2nDRs0kjbb9Pr
	 OL0TDqMhfE8fqVZaRykZK2pGPz/Hs6r4VqAaG/62MmbvZhjXtc2z8D/5+pTt54IfS7
	 pUbjs114p5E/w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 09 Jul 2026 13:50:50 +0200
Subject: [PATCH 24/60] drm/msm/mdp4: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-drm-no-more-plane-reset-v1-24-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 abhinav.kumar@linux.dev, freedreno@lists.freedesktop.org, 
 jesszhan0024@gmail.com, linux-arm-msm@vger.kernel.org, lumag@kernel.org, 
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com, 
 sean@poorly.run
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6191; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dpW8I5bv7qJrrzpaPxAFRCLpqC/TXJuXDqzJfauMnng=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3cI350iHTqzUKCwJ9cw4M9syMjPfd14Dw2tPi+ezI
 uuln3d3TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgInIdzE2bFy6tqHZrEbyd/vS
 T4t1Di34pfUuyevft0mJB5Z7L/pz/HFGeeyOnwoN4fI93iLrq9ZfY6z3aZj1ykcsxzr8TP6Xu8L
 nb7EsZ7z66tCO+NqrTreunpPi0Ynzj9ya1tJokX5o7v7X6l0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:freedreno@lists.freedesktop.org,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117956-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,linux.dev,gmail.com,vger.kernel.org,somainline.org,oss.qualcomm.com,poorly.run];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.freedesktop.org:email,somainline.org:email,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22197730A2F

The plane only initializes a pristine state in its reset hook
using drm_atomic_helper_plane_reset(), which is equivalent to what
atomic_create_state expects. Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: abhinav.kumar@linux.dev
Cc: freedreno@lists.freedesktop.org
Cc: jesszhan0024@gmail.com
Cc: linux-arm-msm@vger.kernel.org
Cc: lumag@kernel.org
Cc: marijn.suijten@somainline.org
Cc: robin.clark@oss.qualcomm.com
Cc: sean@poorly.run
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 9459f70ce0ba..f9067e508f4c 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -69,11 +69,11 @@ static int mdp4_plane_set_property(struct drm_plane *plane,
 
 static const struct drm_plane_funcs mdp4_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
 		.set_property = mdp4_plane_set_property,
-		.reset = drm_atomic_helper_plane_reset,
+		.atomic_create_state = drm_atomic_helper_plane_create_state,
 		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 		.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
 static int mdp4_plane_prepare_fb(struct drm_plane *plane,

-- 
2.54.0



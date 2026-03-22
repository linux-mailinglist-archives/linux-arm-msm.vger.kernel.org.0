Return-Path: <linux-arm-msm+bounces-99066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOncD4g5wGkvFAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:48:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9242EA5E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C1F9300B9A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E842F3C13;
	Sun, 22 Mar 2026 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="emA7uTEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921E1B78F3
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774205307; cv=none; b=RKjgWD7QoM8Cib21iYWrj149AU/yuonh503m4J04plxtePjLQXYdvjV2NANrLVN0qH4IktAe0U6cFYhUC8xmGp5Svsm5NzgvXvX7L6Z/q8amOTzhdtqlDtWfT+fJYtD8/5sLMBZswGgpDKzOoKwXgd2cAYOrJjTS5pabhRentpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774205307; c=relaxed/simple;
	bh=q8WdoOQnLFlKMthCaNNS1wcc56rilLpUD3yzl7joAaA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jUQZt9+5SoLFGJMJmPArZWehasC5W2a65jIl/fMT+qcS6Yawo8qANFe8SgNiS3IsADpkQdBwyVwEp9EyT56y9noqf1ofyZqlVShYjsRX+wG/nYwhLVaCHmkKxMq9H5a+ByDRJ94LFR+D9n9PSWN0bcK5JbuFuexDF1+lqiOkUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=emA7uTEb; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774205296; x=1774464496;
	bh=W2vGcjC6o/9rSwUMT8OLICaUBrAZ7/2I6vU0gYR4kkI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=emA7uTEbUSB1oLP8p8Qfqf3JY4Ah2oLbQEHzVwPVwpsJiypdw9g9gxhVLWtIwV7t/
	 6jWcwvikiTzA0HwQMpK8laie4hIDdn0yjZKUzRBXRgwjPCb2XUK1d/AriteyNhZ5kK
	 DHWpG/wvWPpY951Wee/DLhxlIO307BpjjvtvHd93n3/stWlHd1d8b4LrdMGd0c6P5d
	 UpRbOEVb3rBXCezInh5WXfImlckCPEYkT8XTZe+mlEX9AhkgrZopqeXN6GwoohF8U4
	 evuntgGhVq7wSf+Gm4GkaNVdcIrBkJaIrwTC+jpNi1Og2GtAlpJ5QZ4CfwXvzoWxZF
	 zZvCoqxC+x49g==
Date: Sun, 22 Mar 2026 18:48:09 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Jonathan Marek <jonathan@marek.ca>, Neil Armstrong <neil.armstrong@linaro.org>, Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2] drm/msm/dpu: calculate data_width like downstream
Message-ID: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 42764064717d064bdc2b817f89f4066be9490a98
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FREEMAIL_CC(0.00)[marek.ca,linaro.org,gmail.com,vger.kernel.org,lists.freedesktop.org,pm.me];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 9D9242EA5E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Derive INTF data_width from dce_bytes_per_line rather than
timing->width when DSC is enabled. Use DIV_ROUND_UP to avoid
rounding errors.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Added back comment about DSC & DP
- Link to v1: https://lore.kernel.org/r/20260322-fix-data-width-calc-v1-1-1=
28880f5a067@pm.me
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 26 +++++++++++++++++-=
----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0ba777bda253..ba810f26ea30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -10,6 +10,7 @@
 #include "dpu_formats.h"
 #include "dpu_trace.h"
 #include "disp/msm_disp_snapshot.h"
+#include "msm_dsc_helper.h"
=20
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_managed.h>
@@ -136,6 +137,7 @@ static void drm_mode_to_intf_timing_params(
 =09=09timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) /
 =09=09=09=09(dsc->bits_per_component * 3);
 =09=09timing->xres =3D timing->width;
+=09=09timing->dce_bytes_per_line =3D msm_dsc_get_bytes_per_line(dsc);
 =09}
 }
=20
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_hw_intf.c
index 7e620f590984..ac82b69aedf6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -173,13 +173,29 @@ static void dpu_hw_intf_setup_timing_engine(struct dp=
u_hw_intf *intf,
 =09data_width =3D p->width;
=20
 =09/*
-=09 * If widebus is enabled, data is valid for only half the active window
-=09 * since the data rate is doubled in this mode. But for the compression
-=09 * mode in DP case, the p->width is already adjusted in
-=09 * drm_mode_to_intf_timing_params()
+=09 * If widebus is disabled:
+=09 * For uncompressed stream, the data is valid for the entire active
+=09 * window period.
+=09 * For compressed stream, data is valid for a shorter time period
+=09 * inside the active window depending on the compression ratio.
+=09 *
+=09 * If widebus is enabled:
+=09 * For uncompressed stream, data is valid for only half the active
+=09 * window, since the data rate is doubled in this mode.
+=09 * For compressed stream, data validity window needs to be adjusted for
+=09 * compression ratio and then further halved.
+=09 *
+=09 * For the compression mode in DP case, the p->width is already
+=09 * adjusted in drm_mode_to_intf_timing_params().
 =09 */
-=09if (p->wide_bus_en && !dp_intf)
+=09if (p->compression_en && !dp_intf) {
+=09=09if (p->wide_bus_en)
+=09=09=09data_width =3D DIV_ROUND_UP(p->dce_bytes_per_line, 6);
+=09=09else
+=09=09=09data_width =3D DIV_ROUND_UP(p->dce_bytes_per_line, 3);
+=09} else if (p->wide_bus_en && !dp_intf) {
 =09=09data_width =3D p->width >> 1;
+=09}
=20
 =09/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 =09if (p->compression_en && !dp_intf &&
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_hw_intf.h
index f6ef2c21b66d..badd26305fc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -35,6 +35,7 @@ struct dpu_hw_intf_timing_params {
=20
 =09bool wide_bus_en;
 =09bool compression_en;
+=09u32 dce_bytes_per_line;
 };
=20
 struct dpu_hw_intf_prog_fetch {

---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260322-fix-data-width-calc-c44287df08b8

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>




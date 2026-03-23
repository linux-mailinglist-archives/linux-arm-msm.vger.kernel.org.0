Return-Path: <linux-arm-msm+bounces-99264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMSCM9s/wWlnRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:27:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6A2F2E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8767A3023DF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF593A9D9E;
	Mon, 23 Mar 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="SGyNTWIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC83A9D88
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272042; cv=none; b=RDim7kqkhL9kvwjLDG3nFzxwOuK5jPPJzGftxil64zcMYs8PqazeXf8EtfHz4AGGVFxmhabSNjXht6tOScLwGLv/pQL2unuGaoHGmBZT9IloUPy9HWe9RWvwHhxfZtlYgKyQLzCLl2TOVVwzRcD42WzskQZ2HuMp1pDeLZtIGJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272042; c=relaxed/simple;
	bh=WXQPiMkew25K2C6yWipgnGYgd2AsmfFBRRpO8UD4zSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBbaEErnHvDjJhDTroBDlup1imQdf9M0aBZhqXAQcj+kKt0qigqEUAlBGU8t4r5SuBuxH7lDlV/YZEtTZJjxtTPKCwh6QZ72Vo0bJDZPeUbPX8BSJ5MLofBtyJwdLo5IC0R4BpryfUvabEowHlMW5EnLr09FilnEhLXbSOLKyYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=SGyNTWIy; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fjgq01+zdtEciRBp9/sjCTWpbq8puyxzm8gScgWhTEs=; b=SGyNTWIyoa/AS23i9CHrbHQRYy
	xuR3xLoPXxh+LSFt4zx49fvkJrXSByv15o+3AbR6+wjBbo0tGXc3GoyA3YMaBFosg1ZnQ0pt9G4HV
	GAgTz+Cj6yYTuenLvETWN8SVmJv0leFGFKr0CE2jzZ+0ofwIsZKlV1JAOnWRkXi5MepwMIv1IwVzS
	uwy1ZAlo04sQ6yo76dhE5Y6McUTVXweUUVDBF/1aTDlpZlKNurlOaLR2m+lHODUxeuEO+UH7DkXqG
	covmLmFoHdnR1i74RejdTsjAhVPnVb6U2hQj6p5UsNCP/yaCOK1WlLhWKc0PpG1+vJOalqY4A9wQx
	knYF/Y6w==;
Received: from [186.208.74.38] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w4fCO-004rx9-KP; Mon, 23 Mar 2026 14:20:05 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/amd/display: use plane color_mgmt_changed to track colorop changes
Date: Mon, 23 Mar 2026 10:15:14 -0300
Message-ID: <20260323131942.494217-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323131942.494217-1-mwen@igalia.com>
References: <20260323131942.494217-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-99264-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,intel.com,emersion.fr,kde.org,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.083];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,igalia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 2DF6A2F2E7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure the driver tracks changes in any colorop property of a plane
color pipeline by using the same mechanism of CRTC color management and
update plane color blocks when any colorop property changes. It fixes an
issue observed on gamescope settings for night mode which is done via
shaper/3D-LUT updates.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dfe95c9b8746..dc3f284d0834 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9955,7 +9955,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			continue;
 
 		bundle->surface_updates[planes_count].surface = dc_plane;
-		if (new_pcrtc_state->color_mgmt_changed) {
+		if (new_pcrtc_state->color_mgmt_changed || new_plane_state->color_mgmt_changed) {
 			bundle->surface_updates[planes_count].gamma = &dc_plane->gamma_correction;
 			bundle->surface_updates[planes_count].in_transfer_func = &dc_plane->in_transfer_func;
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
@@ -11695,6 +11695,10 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
 
+	/* Plane color pipeline or its colorop changes. */
+	if (new_plane_state->color_mgmt_changed)
+		return true;
+
 	/*
 	 * On zpos change, planes need to be reordered by removing and re-adding
 	 * them one by one to the dc state, in order of descending zpos.
-- 
2.53.0



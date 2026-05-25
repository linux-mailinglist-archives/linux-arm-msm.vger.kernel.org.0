Return-Path: <linux-arm-msm+bounces-109618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNr0KysfFGobKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:06:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BDD5C8F98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D11663016EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CE733F59A;
	Mon, 25 May 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Y0YTuY2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918D21FF23
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703584; cv=none; b=ZpW6xteb/iS1bYNtn0dUU4DbioGpkoJrcgi0Oz1pvID1r8LPORu0sXFMzJTFrZLBzKaEzA9kdfcUjzman/KXT10HJC9zpyPHvPJLtEQSb/SNyBiKzvg4aHSQ5dYO0iBPOQVg9CO4vBLKqMZzLk5LHpVEVmDzyfuxFTFSX91MT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703584; c=relaxed/simple;
	bh=c8V1ZXh2wzkhoW/QYmT4IsM+k21gHP2b5On+ap6is+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWEFlhOXx3l91rBxx4GNeV3G/s4U5ycMxQsrF7vMm1CAPRZ3UdYT3HgabZT4vA3xZOofwSw6lvdvavefyK49CTKIGxYlBSxGQzU2Yh3qPCGRstutMjTAcp21Kmbr/4fuDtdygnmFvlmq04hGZenv7J3Qn5uji3pYK1AJk1Iis4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Y0YTuY2Z; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vbBesheMMq554jXUMZrm1tMPW4M3xt3l04YxRg3d9fI=; b=Y0YTuY2ZbXRuMynqtPpJXcfony
	RLkgNZ+9dJZ04e6qM6C5jfjYe1ML31gPn4hT/yPEjxaM5TtJW7lNa7HC1L2WsWeOzewj4cKcuPxKa
	7tbOEnmsMxxQqbCgDlCpMvvlS8Cec9B2QxqASv7jh9I1BKbX4UjL/YYUidWhyDXAcCae1UyCzhUld
	WNNtoav1PEqKOnbKyYsArtJcL6rSOA3lhNJUwWPPapTbKadQlXRoU2CvnMr/KjcKYTKGMyuIBGUxU
	BU+LGN197BCdIMP9BUoFTZbS8LixrG1SKPYgzonptPnvWaKVPRtL2xNIBj1VNdu3T1mcaa5qakVmU
	hY6pbA5Q==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wRSBj-007xuT-0r; Mon, 25 May 2026 12:05:35 +0200
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
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/4] drm/atomic: track individual colorop updates
Date: Mon, 25 May 2026 11:49:57 +0200
Message-ID: <20260525100524.304263-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109618-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.895];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 42BDD5C8F98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a partial of [1], only with patches related to individual
colorop update tracking. I.e., I'm detaching from here fixes regarding
attempts of changing colorops that are not part of an active color
pipeline, or in the transition between active and inactive color
pipelines.

This series focus on tracking updates for each individual color
operation, allowing the driver to react accordingly.

- Patches 1 and 2 make lut1d_interpolation and lut3d_interpolation
  colorops correctly behave as mutable, handling their changes via
  drm_colorop_state.

- Patches 3 and 4 track colorop updates of a given plane color
  pipeline by setting plane `color_mgmt_changed` flag, similar to what
  is done for tracking CRTC color mgmt property changes with CRTC
  `color_mgmt_changed` flag. The flag also tracks when a different color
  pipeline is set to a given plane, but doesn't consider as a change
  when the same color pipeline value is set to the plane COLOR_PIPELINE
  prop. That way, the driver can react accordingly and update their
  color blocks. As interpolation properties become mutable, they are
  also tracked here.

It also fixes shaper/3D LUT updates when changing night mode settings on
gamescope with a custom branch that supports `COLOR_PIPELINE`:
- https://github.com/ValveSoftware/gamescope/pull/2113

v1: https://lore.kernel.org/dri-devel/20260318162348.299807-1-mwen@igalia.com/
Changes:
- include linux types for function's bool return type (kernel bot on MSM
  driver)
- add Harry's r-b tags

v2: https://lore.kernel.org/dri-devel/20260323131942.494217-1-mwen@igalia.com/
Changes:
- [NEW] two patches to only consider colorop updates from active color
  pipelines (Chaitanya)
- [NEW] make lut interpolation properties mutable + Alex H patch for
  kernel docs
- track lut(1/3)d_interpolation updates (Chaitanya)
- rebase changes according to new patches

v3: https://lore.kernel.org/dri-devel/20260403135909.214378-1-mwen@igalia.com/
Changes: rebase on drm-misc-next

v4: https://lore.kernel.org/dri-devel/20260501132527.522320-1-mwen@igalia.com/
Changes: fix kernel doc (kernel bot)

v5: https://lore.kernel.org/dri-devel/20260506192633.16066-1-mwen@igalia.com/
Changes:
- rebase on drm-misc-next
- fix kernel-doc and correctly reword (atomic) state to plane_state (Chaitanya)
- reject inactive colorop updates in atomic check time, instead of
  during property's setup, to avoid ordering dependency as pointed out by Chaitanya
- use `|= replaced` for consistency (Chaitanya)
- add Chaitanya's r-b tags to patches 1,3-5

[1] v6: https://lore.kernel.org/dri-devel/20260519211111.228303-1-mwen@igalia.com/
Changes:
- detach patches that implement individual tracking from those related
  to inactive colorop updates.

Alex Hung (1):
  drm/colorop: Remove read-only comments from interpolation fields

Melissa Wen (3):
  drm/colorop: make lut(1/3)d_interpolation mutable
  drm/atomic: track individual colorop updates
  drm/amd/display: use plane color_mgmt_changed to track colorop changes

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
 drivers/gpu/drm/drm_atomic.c                  |  4 +-
 drivers/gpu/drm/drm_atomic_uapi.c             | 68 +++++++++++++++----
 drivers/gpu/drm/drm_colorop.c                 | 16 ++++-
 include/drm/drm_atomic_uapi.h                 |  4 +-
 include/drm/drm_colorop.h                     | 34 +++++-----
 6 files changed, 93 insertions(+), 39 deletions(-)

-- 
2.53.0



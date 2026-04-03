Return-Path: <linux-arm-msm+bounces-101659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L4fOgnJz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB4394EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE8130BC3A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEB33ACF1E;
	Fri,  3 Apr 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lE4nEs7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CE519E968
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224819; cv=none; b=Y1nWighfaMTyRSS+sBu3yZud8ZdBIilqq9kU/YQ92l75pGCHqu2KZfI4/fJbSQsZ3CwqL4rn+uuZJ+Ymyq4hLluPc4pkB7HeYM7Psyju1XvEP9XmhoqNRS7DOBb3Hy9SJ6HC7VmB7OK6xIq/FL6hdiGDGkK/HtvPqba+rKXJQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224819; c=relaxed/simple;
	bh=7KFPbPHY6ySHYalJtObLQsAi7yE4TwQMftXWtzxaNBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKWPOHInFLhDCvC+l7MiNY1hff+GY/38+gYXKvMspjFtEvr3ixNAwTlJWoYFyXHSY5heyW4bjJWH4Ju9j4hgUjMDgoHe8WILnEMgA1jv/qjp6DfUdIVYp+JiSmM96zZtRaTffDMN9Kxzf4wbvrOTKk3IQsmTzYWU6Jy5wYyHYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lE4nEs7D; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EqpU1dDfv52luCeshlsbukA0ydZPINR/isA921H1mmQ=; b=lE4nEs7DWW1SvEG7svM57AkYrG
	6LEFNuH44KDqZjiXJfs+Of/0k+ZyyiwpWwjMB0eigVMG2XCrgsreS0/uPaeaYUgnYlEHJTyrzzrqc
	UVKzO55B5udp0mwunEy0x/XfmXSm6DCpAgZbUcIjFn7ucwNWH3WwTtM9lUKqWy6zRHoIXavRwVW14
	szio9fCGSVupPPd9vL09/TrCV1naVBveecCMqNNBaEcDAa+wFY6BudJ1td/tu1w9oylFz7kjb2K25
	RtRGnmK/uDZ+BNErS+fWmjQDgkNpIYi1elZZl9PQ869MKSTJQCsjrsyaAIuctNKiUx3tVNRJQN9IO
	W+pf47EQ==;
Received: from [189.89.58.26] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w8f3W-00AtJL-6g; Fri, 03 Apr 2026 15:59:26 +0200
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
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
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
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/atomic: track colorop changes of a given plane
Date: Fri,  3 Apr 2026 10:58:24 -0300
Message-ID: <20260403135909.214378-1-mwen@igalia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 87DB4394EF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similar to what is done for tracking CRTC color mgmt property changes
with CRTC `color_mgmt_changed` flag, track colorop updates of a given
plane color pipeline by setting plane `color_mgmt_changed` flag. Also
true if setting a different color pipeline to a given plane. That way,
the driver can react accordingly and update their color blocks.

This small series fix shaper/3D LUT updates when changing night mode
settings on gamescope with a custom branch that supports
`COLOR_PIPELINE`[1].

This series doesn't cover 1D/3D LUT interpolation, since it's documented
as read-only properties.

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

Let me know your thoughts!

[1] https://github.com/ValveSoftware/gamescope/pull/2113

Melissa Wen

Alex Hung (1):
  drm/colorop: Remove read-only comments from interpolation fields

Melissa Wen (5):
  drm/atomic: only add colorop state from active color pipeline
  drm/atomic: don't set colorop properties of inactive color pipelines
  drm/colorop: make lut(1/3)d_interpolation mutable
  drm/atomic: track individual colorop updates
  drm/amd/display: use plane color_mgmt_changed to track colorop changes

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
 drivers/gpu/drm/drm_atomic.c                  | 43 +++++----
 drivers/gpu/drm/drm_atomic_helper.c           |  9 +-
 drivers/gpu/drm/drm_atomic_uapi.c             | 93 +++++++++++++++----
 drivers/gpu/drm/drm_colorop.c                 | 16 +++-
 include/drm/drm_atomic.h                      |  2 +-
 include/drm/drm_atomic_uapi.h                 |  4 +-
 include/drm/drm_colorop.h                     | 34 ++++---
 8 files changed, 136 insertions(+), 71 deletions(-)

-- 
2.53.0



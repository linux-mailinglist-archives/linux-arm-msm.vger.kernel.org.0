Return-Path: <linux-arm-msm+bounces-112158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z2ktGs0EKGqS7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA865FF96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:19:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=nVS5YfDY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112158-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112158-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 620983105147
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DAB40E8DB;
	Tue,  9 Jun 2026 12:13:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900A403E9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007205; cv=none; b=XPDuiXs4/6TWtimGb1/QCUjsus4FD+Lk0yYwnRtRKSoPlOXKn6SeAb1JBg7wbbHGciAyFD8dtqQZI62Bs2GF1IYdmHa+bssx+ct02dg5QrsL22HcWzwCgzi3Od5LkGz/KxyZ0R4917jGI0DPChWeH55gRLYeKSzhHwcxme0mPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007205; c=relaxed/simple;
	bh=dHxFOBVEP9d3EkcA+z3tWh7JAOJTnohrvfOws4UT5yE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YpT5lspuVBgG1lqFq3R6zLt0T/QNubsuBxBEbCkF2Lz/mrGdGHOfFCHRctRmNx6ucaYH7+OnFEFwy0br34ZWbnqDFe8tm2qllJjoQ/i+VORYoMQH3cJuV1hYJgfTxLsxaGrZI+YSce0FkkcrongPwc7muHmLalK4ug7SpK4dU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nVS5YfDY; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ys1hPQ1gZmUZza3nrdD0bkcP4BI8PKUWiJEI9ZB3dOU=; b=nVS5YfDYjSyqXIVhleK2qvhY/y
	4nlUHbAKQwkhwzFLDz+WTJYVhM3FvYmPZDCtD8/jHYOZ1DkessnKHM3jzQcVI2Pt4pU0I7Ud5b7Di
	H3lju1Nlmfh4nQAnKhbEYgMIkuzDEeUDmZGfIrLbL2qS1VBotmnQmYQvt1L6mm8xSv0WZd9Y+iKa2
	gMhYvmO8RME4godXjyPkYBPvQe1veWFZlbEBORNpBSwOi2LbnVqwup4i71wgQVk8SUBSHgkXiE57G
	VWx4OUONfb/t5rMCLx5Dz6Yl8/jzDrXypOiSGMegjOZ+McquE4ZvrxwaAwN9z9tNgcDm4+xML3Cg1
	BUzJAqtg==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wWvJw-00EvWP-Im; Tue, 09 Jun 2026 14:12:40 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	alex.hung@amd.com,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	contact@emersion.fr,
	daniels@collabora.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] don't allow changes to inactive colorops
Date: Tue,  9 Jun 2026 13:51:34 +0200
Message-ID: <20260609121230.1358786-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112158-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,emersion.fr,collabora.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AFA865FF96

This series is a follow-up of what was discussed in [1] and on #wayland
IRC channel regarding policy and userspace expectations on changes in
colorop properties and the current status of the color pipeline in which
the colorop is part of. In short, we agreed that userspace can change
properties of colorops that are currently part of an active color
pipeline or when the pipeline is switching status in the same commit.
However, userspace cannot change colorop properties of inactive color
pipeline in the expactation that it will be activated at some point in
the future.

Userspace also expects persistence of color pipeline already set, even
if it becomes inactive for a while, when activated, colorop settings
previouly set should be preserved.

In addition, I found some bugs on IGT tests when this policy is applied.
So I sent bug fixes to kms_colorop and kms_properties to behave
according to this contract [2]. The rest of the series in [1] was
detached in [3] since there is no dependency between them.

[v1] https://lore.kernel.org/dri-devel/20260526142940.504911-1-mwen@igalia.com/
Changes:
- define a macro to walk in the color pipeline (Alex H.)
- fix checkpatch warning (Alex H.)
[v2] https://lore.kernel.org/dri-devel/20260604180457.1110110-1-mwen@igalia.com/
Changes:
- [Drop] drm/atomic: duplicate state of all colorops
  If inactive colorops state are duplicated on resume, the commit will be
  rejected. 
- [New] Four new patches to make AMD driver match the policy of colorop
  updates only for colorops in active color pipelines plus individual
  colorop updates. It also tries to untangle COLOR_PIPELINE = Bypass from
  colorop BYPASS prop = true. I think patches 3-5 can be cherry-picked and
  applied if it looks correct for AMD, I just included them here for
  context (for example, Sashiko reported an issue in the previous version
  of this series).

[1] https://lore.kernel.org/dri-devel/20260519211111.228303-1-mwen@igalia.com/
[2] https://lore.kernel.org/igt-dev/20260602211259.898147-1-mwen@igalia.com
[3] https://lore.kernel.org/igt-dev/20260526140752.503380-1-mwen@igalia.com/


Melissa

Melissa Wen (7):
  drm/atomic: only add states of active or transient active colorops
  drm/atomic: reject colorop update from inactive color pipeline
  drm/amd/display: don't check colorop status if its in an inactive
    pipeline
  drm/amd/display: truly bypass plane colorop 3x4 matrix and hdr mult
  drm/amd/display: make shaper bypass mode cleaner
  drm/amd/display: fix bnld colorop bypass mode
  drm/amd/display: allow individual colorop changes

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  31 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 178 +++++++-----------
 drivers/gpu/drm/drm_atomic.c                  | 125 +++++++++++-
 include/drm/drm_colorop.h                     |   3 +
 4 files changed, 207 insertions(+), 130 deletions(-)

-- 
2.53.0



Return-Path: <linux-arm-msm+bounces-99263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJkqFNk/wWlnRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:27:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85A2F2E75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13D9E30053E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B52F3A960E;
	Mon, 23 Mar 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="A/Lwwk5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBCF3A9627
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272042; cv=none; b=BHyJAKq3UymEwQnyeYFr0TKfd5JInNxA2uAtfI2u4LBiVRCYNG2qYi3hAPe4otak5X+GKl2hmaBhmvVg78dVqHyrVncZs1cfEPEW+BPy6n5oVYyNtmEokIF3kEa/A6Y/PBc3mgfxC4QwoyfA8ydoVaWEQ2uvWusaEoIWtW4PCgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272042; c=relaxed/simple;
	bh=R2R0DEIpB1edNPLc/dnO38VvHiHfiFzXKlOQka7d1EE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5olVww6VTLwHo1oeQS987QbkD1GK6xQBflq/HSI9WN1EpEbh9TOBveuDfl2sp1Hen0RQxTr2w6+hZw3mUwhyuDIzUzD2XR4qcMU8SxBITj+FBqNrZf8i7/zp5cJiv15vT/OHTFJRVldRcez6cD3+WT1WctBY83VQI8YLsBz9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=A/Lwwk5g; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/GKvAASRZ2omGxdiTBreurCOsHR47HtXrjwHuOx3IJQ=; b=A/Lwwk5goCHSKKqECsxAyoSsZy
	bE0CU70IGyMW3E/iQYtuA364lSjIFMcxljytbY7L3dUlmZ3ikOJs6AlxgE5PPIUkiK7m8tl1MMvao
	FapIAqI5yyh9ZW1lOh3rc0tRtO2NAu1bviL6XCz+M09wOZRKhe4BulIkglG/aayFFebRwJZRq6NBr
	+7ykVk1FWHHdBhu3T/vYtDVvVYbXT1hbIP4vRZ5q1l1P7MTNxr5Ooyt2usq+sgyVG4teb5XiI56GT
	3YrHr1oWwrNuqPzghU7VVwQjiNZfnLSZGWSZlHCPRsKNcb5cOtTlNp9O6H52VTCf2TLedUY5z0hL3
	WRPaX/DQ==;
Received: from [186.208.74.38] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w4fCB-004rx9-Gx; Mon, 23 Mar 2026 14:19:52 +0100
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
Subject: [PATCH v2 0/2] drm/atomic: track colorop changes of a given plane
Date: Mon, 23 Mar 2026 10:15:12 -0300
Message-ID: <20260323131942.494217-1-mwen@igalia.com>
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
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	TAGGED_FROM(0.00)[bounces-99263-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,intel.com,emersion.fr,kde.org,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.371];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:mid]
X-Rspamd-Queue-Id: 6C85A2F2E75
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

Let me know your thoughts!

[1] https://github.com/ValveSoftware/gamescope/pull/2113

Melissa Wen

Melissa Wen (2):
  drm/atomic: track individual colorop updates
  drm/amd/display: use plane color_mgmt_changed to track colorop changes

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++-
 drivers/gpu/drm/drm_atomic_uapi.c             | 53 +++++++++++++++----
 include/drm/drm_atomic_uapi.h                 |  4 +-
 3 files changed, 50 insertions(+), 13 deletions(-)

-- 
2.53.0



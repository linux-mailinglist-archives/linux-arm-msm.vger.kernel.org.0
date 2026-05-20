Return-Path: <linux-arm-msm+bounces-108687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOqQLU6LDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914B58BA72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994E1303A240
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC8C36BCCC;
	Wed, 20 May 2026 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNGiTfrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C592BD0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272235; cv=none; b=GHvI0w+/Iyv2MWP42gmwu+imkPgu7b/qNGM1Xd9oj97Fh0FV0ZM4YlGQVFKD8cTQZQgS3OFlO1yjhtwAtGH0siaWlR3+Ig9CcRufrNkZXF32Su/aLssZcfFgPaWqRbb2kmUc4xnZzry5EJDnnDb7Agc9HhxcVYyPQm9IW4/X4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272235; c=relaxed/simple;
	bh=/O86NQw2ZHZgg2HOuAwUHd+oF9GAM2q8ee/hWvsbGIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MDWie65Q7TOop0OW8zQVS+/j1xnwh8VTsLkXpFhXbuaQaQ2egRVjzuIU1apkqyuueT7pbmiXx16SDT2yxhIQeqW+VPbFLVRcSJ59LGuU+ZGdRYRMvdxKcEyZDsP9SsBaecZNs4z5m9LJ4fFzVpta+iX+QpD+uEDwsdnl1PMsvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNGiTfrP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779272232; x=1810808232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/O86NQw2ZHZgg2HOuAwUHd+oF9GAM2q8ee/hWvsbGIE=;
  b=CNGiTfrPEU3vdCDvKHninnYCJef//2y8TUoPGh0Dh/LeNsdIMPRxVEYk
   uRGZcCKJVvt5hLrjtfpVqvI1fOiMO3OhKW+jGYApg7NJ0eXVBfG+/GJvt
   Gb04HnwnYZ5CovCv5IqCXjaAMqd2xBoS69PFMrjmtt6JN4fL6jsVc6ZOs
   D2odL+8sN8ZJzOLNrDoPN9UNaKDN6ZOj+eg/zj4ihzbI9oakBHBA3Txps
   5aWCdri8BcdEpQ+589bTg52UJixTp4TZKCU7fIdpJoViuaSJ6ONGIWpWD
   TaopKAvjAa4cTbVQJNe7DpF/Efp/fV420eAPOEreog78HRmjTr8UWi2Wd
   A==;
X-CSE-ConnectionGUID: wmUmMkdvSeyeHLi4vW+mDg==
X-CSE-MsgGUID: rWWAl0gCSuSZXqST81jyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102843254"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102843254"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:11 -0700
X-CSE-ConnectionGUID: Jvc1x63XQrim4Co5xHcQ2w==
X-CSE-MsgGUID: Pfxkdy+FTvShU3znPKlqvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244114040"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.175])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/exec: drm_exec polishing
Date: Wed, 20 May 2026 12:16:12 +0200
Message-ID: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108687-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,gmail.com,ffwll.ch,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 6914B58BA72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During the work towards enabling exhaustive eviction using full
ww locking in TTM, Christian indicated that the path for the
drm_exec moving forward was to be a full drm_exec helper with
things like userptr validation rather than a WW transaction
abstraction. The idea was then briefly discussed to craft a
WW transaction helper and then subclass that with drm_exec
with the idea that the WW transaction helper could be used in
TTM for eviction and for other uses that didn't mandate a full
exec sequence.

Regardless whether that actually happens or not, this series
aims to clean up abuses of drm_exec internals in drivers
so that future development of drm_exec isn't blocked by
such driver usage.

Except for patch 2 which is a small cleanup only.

v2:
- An drm/msm patch was already merged.
- Use a unique id for the loop variable (patch 1) (Christian)
- Move assignment to declaration (patch 2) (Christian)
- Declare the retry pointer as void *const. (patch 2)
- Only allow if the drm_exec context is newly initialized. (patch 3)
  (Christian)
- Fix amdgpu compile error (patch 4) (Intel CI)
- Update the commit message (patch 4)

Thomas Hellström (4):
  drm/exec: Remove the index parameter from
    drm_exec_for_each_locked_obj[_reverse]
  drm/exec: Make the drm_exec_until_all_locked() macro more readable
  drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
  drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct
    drm_exec::ticket

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 15 ++--
 .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  3 +-
 drivers/gpu/drm/drm_exec.c                    |  9 +--
 drivers/gpu/drm/drm_gpuvm.c                   |  3 +-
 drivers/gpu/drm/xe/xe_validation.c            |  4 +-
 drivers/gpu/drm/xe/xe_validation.h            |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  3 +-
 include/drm/drm_exec.h                        | 71 ++++++++++++++-----
 9 files changed, 70 insertions(+), 44 deletions(-)

-- 
2.54.0



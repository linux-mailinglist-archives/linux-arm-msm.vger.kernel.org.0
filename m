Return-Path: <linux-arm-msm+bounces-32978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B598E759
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 01:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8628E1C26101
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 23:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B779E19E99B;
	Wed,  2 Oct 2024 23:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="E52gQzv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD511991A9;
	Wed,  2 Oct 2024 23:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912782; cv=pass; b=oayaQEwxE023dp265pMbJ4WaeatZgCgUsuBRgcTBczIucw85JNS1RZ3WunqOgICr6QcSUbAAOek3MJiAFZs2OOkE+PgwrApJpvdoE/ujK27+a7PNJ3otIl8eB5bPmi0prxKU48mPYDRHZ+ldeg63Jyg5Lp/+7Eq/PLLTR0h0SJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912782; c=relaxed/simple;
	bh=a00ti4T/BzcBC9nD+l3FXcTsvxNWoKi2zpfFJfD3HeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gqLwQ3uISYo2u4YpwDw2nWHvyKF3hK+D0A8F59XOa/93QLwklRnxlMtse0bxC9NdM5vUG9AYZnrsGoZFh7negrvF4Xr7h7EclO/0nC2eX6SF7WDBG8z64QlWU54B1U6fg2oyqgVKkmkZHILPkHFkQLNnPp/9kIZonV9uD+dxt0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=E52gQzv4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727912746; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lnRxaE9C5ntkhbKfZFu7T+CDVNALbS0pWObKYrcfC/tKIiCmhuP+0JoqWyl1EQ6xe/mMQGEgyMTVmxfjsli0tJqWj/KrC2E4uTMOt/uTqTreHKUZwS3lZcqVhTAenJCU10Ai6G3u4Ni5cqgfX7OtSFxDArtF/xY11jp8bxFtqek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727912746; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AWY4hADE/Gn1eTfd9x/OOmqUqbsp9RNFlmDY3sZq0pQ=; 
	b=A0bEc6jF60JSnSScPSREBb5/az2f5JUxsiudM2wrHe5nnJEYtbz5KyVKsflJ/XKa6+EH/XX0vv8CKU0qxSQCIe70DzkzjokOkACtN1Zje7dcEFNHdEqVPBhEEbPw1CJyk1zRYXzG+JsSGyUNei1yUWHyHPGH+9tM7NLmKb/JaRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727912746;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AWY4hADE/Gn1eTfd9x/OOmqUqbsp9RNFlmDY3sZq0pQ=;
	b=E52gQzv4xbl+CcDmt2pEAwoTeYMq6mcNkzP16B4qhGEFjqOB1EKdljZwAmtErz7u
	9EduBM/zp0DlfB4GMWSUZXfQSf5N6Vs9gzQQZwWVI07DgjaZ5rVu114AkmXVyQf/M67
	v/9SWPP7QRpeaaViauxy9FTRUZdEvy089OmgaVwI=
Received: by mx.zohomail.com with SMTPS id 1727912744358994.3097024662918;
	Wed, 2 Oct 2024 16:45:44 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/2] Allow fdinfo to display size of internal BO's
Date: Thu,  3 Oct 2024 00:45:09 +0100
Message-ID: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series lets DRM fdinfo stats functions display an additional tag
that will reflect the amount of memory internal BOs of a DRM driver take
up.

The rationale for this is that some drivers, like Panthor, need quite a bit
of memory for things like queue ring buffers or tiler heap chunks, and
these will vary dynamically as new scheduler groups, queues or heap chunks
are created by one or more render contexts.

Because these are tied to an open DRM file that represents an ongoing
render context, then it makes sense to provide users with this information
in the DRM file fdinfo descriptor, even though they would never be exposed
to UM through a handle.

These two patches were originally part of a wider series, but broke it down
into two different submissions for ease of discussion.

The previous debate can be found at [1], in its latest two patches.

[1] https://lore.kernel.org/dri-devel/dqhnxhgho6spfh7xhw6yvs2iiqeqzeg63e6jqqpw2g7gkrfphn@dojsixyl4esv/

Adrián Larumbe (2):
  drm/drm_file: Add display of driver's internal memory size
  drm/panthor: register size of internal objects through fdinfo

 drivers/gpu/drm/drm_file.c               |  6 ++-
 drivers/gpu/drm/msm/msm_drv.c            |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c  |  2 +-
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  6 +++
 drivers/gpu/drm/panthor/panthor_drv.c    | 16 +++++--
 drivers/gpu/drm/panthor/panthor_fw.c     | 14 ++++--
 drivers/gpu/drm/panthor/panthor_fw.h     |  6 ++-
 drivers/gpu/drm/panthor/panthor_gem.c    | 55 ++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h    | 15 ++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   | 20 ++++++---
 drivers/gpu/drm/panthor/panthor_heap.h   |  6 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  7 ++-
 drivers/gpu/drm/panthor/panthor_mmu.h    |  3 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 19 ++++----
 drivers/gpu/drm/v3d/v3d_drv.c            |  2 +-
 include/drm/drm_file.h                   |  7 ++-
 17 files changed, 150 insertions(+), 38 deletions(-)

-- 
2.46.2



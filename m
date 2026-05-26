Return-Path: <linux-arm-msm+bounces-109848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNo5NYCwFWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:38:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 602095D7BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65F7E3247159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C733FFAD1;
	Tue, 26 May 2026 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="klmHdAEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEB3FFAC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805844; cv=none; b=RVETJZOiiBTutZ9sQEoWg8D/H9KfZsMdmkV3DURfVfPeqax7s+lgNJjoYyiAhiWrgfz4KpNHF8Lj14Xxwnxf57uqyGyLEmvY0sMOb8CL4jbs1BC98ekFpoPE7Cd8vDmZlUXmtwNzR/1cr7CILO0gxbxXg4YWHZ8ppqqPlpW3BpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805844; c=relaxed/simple;
	bh=Jt2SWEN0YCMu6VhrXePMDTo77NgRWYjWzTdxZdPtG8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uG7m/PBoWwc5apqL7gNzVqcDelVj1BjwEMqDTOJ48ZZany+ZQUBCNMVY29Qqw111K2SJCUmPQmHmXRcsV42NljCdnq/P2/N9m+Up/xTqFTLa44Uy2/pSHFc2wyC/IAWRerL0npWWAFrwl8ir8vbAky6WZdlYZgcHFox0rOK6Mk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=klmHdAEw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cSnwpH826zG+aCRPJzfw8hJJ/S+BJpSQ5BQzAsOm7wU=; b=klmHdAEwHjR6ulnkyMVa4AUqiN
	otpBub8LejGHtmC0Jkw6/4JEtK6385OchOoPDcubZtsEWN5OuJHT9ls4keURhZS+AjMk9PRvVAycl
	wv/l27PbNSbe2hTaDcish1A7jcHKT1mvtlnl8ifmjFpqPAnbG8mgQhVD2wUvAS1FQHspKv4IISEVL
	RzhEHUqnybE7jcbvtudAFkIbHbRJ1M6KZX++oPIMQFCGvE6RK5nGe6LovamjnO8pOw18oLYaImIdj
	iRbIl7JXHLPSN3zyEk5OQJwcq8HuJNIBsid/BdSbAwzwr2TnNCMiPSqP28kh0RuYZmpX2qjQIne3c
	7FczzxjQ==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wRsn0-008TUc-4Y; Tue, 26 May 2026 16:29:50 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>,
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	John Harrison <John.Harrison@Igalia.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
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
Subject: [PATCH 0/3] don't allow changes to inactive colorops
Date: Tue, 26 May 2026 16:17:07 +0200
Message-ID: <20260526142940.504911-1-mwen@igalia.com>
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
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	TAGGED_FROM(0.00)[bounces-109848-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,Igalia.com,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.909];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 602095D7BDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
So I sent some bug fixes [2]. The rest of the series in [1] was detached
in [3] since there is no dependecy between them.

[1] https://lore.kernel.org/dri-devel/20260519211111.228303-1-mwen@igalia.com/
[2] https://lore.kernel.org/dri-devel/20260525100524.304263-1-mwen@igalia.com/
[3] https://lore.kernel.org/igt-dev/20260526140752.503380-1-mwen@igalia.com/

Melissa Wen (3):
  drm/atomic: only add states of active or transient active colorops
  drm/atomic: duplicate state of all colorops
  drm/atomic: reject colorop update from inactive color pipeline

 drivers/gpu/drm/drm_atomic.c        | 126 ++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_atomic_helper.c |   9 +-
 2 files changed, 120 insertions(+), 15 deletions(-)

-- 
2.53.0



Return-Path: <linux-arm-msm+bounces-113393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9urmCUk6MWrleQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:58:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC068F056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:58:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=AlmLNhVU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113393-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113393-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C84333010F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E4E436379;
	Tue, 16 Jun 2026 11:54:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F03A59A3;
	Tue, 16 Jun 2026 11:54:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610869; cv=none; b=mHt9bygfJPfUgJjZsOb6gRi8cfEOGkMcCJ1e8XJbwOmaqOnG39uSufSzOBS7wkUgrZRIu3et5pTBHKnU5yEZeuKmg0jRw9MDyPZFY4BvAcmISO+0rHuC1KNkByv+uoeeeMvoLDymaSuoeGBPtuFQDaoHd63IASpE8k+HiZFmqw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610869; c=relaxed/simple;
	bh=SOF6AL+ysNAFhPdAeEiJ5NIVz/Sx/p3YX7B/NqB0stw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSZ0Ghauwgmvpcy29Ml1uCzcICyFQj/7c9Ra/gR7T8K7ZmJMLhNzjigactZ/hv3jenaNTxcZ3an6U5cl9CY1wMEZvGN1Tq2WvurEjnKa9h60x8S2IrouBPsHjH2yg/LVL+E8sNppanc0PZrbxwnHoi+PVrEaq7Uucsx/HZ4Z3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AlmLNhVU; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781610866;
	bh=SOF6AL+ysNAFhPdAeEiJ5NIVz/Sx/p3YX7B/NqB0stw=;
	h=From:To:Cc:Subject:Date:From;
	b=AlmLNhVUBm6Z37q0OUvgoLPDWh5jtTWB7mrGsKkI9kyjdprdLTmBgMJoeyKgYjxvY
	 Qi5wItnFA9b2XTW1Y2emqlFLKVdmK7rxwayklIcevli5UNa/1qWePljGjrUXkLihU2
	 9b+cvXiP3OiWqr34lBO/zDMrlHcwpvAbkpgtY7+wZExhYn01jKEeG0ll3LOHpcNFl9
	 qC+aanZzrkSht6iP7b1kDDz5lCPoBBatHHMQ69Ec2VUj1l5Rftw2ul/UWFR6UO96C/
	 dfJqcgPVpIpBZTpv1zbases5HCuY13rVt8UvjvL37ram4bAaAF4bDEPM+l/46+nxBO
	 PlB/pUrsi8fAw==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BE0917E0979;
	Tue, 16 Jun 2026 13:54:23 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	valentine.burley@collabora.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/ci: retire limozeen job and add wormdingler-rev1-boe
Date: Tue, 16 Jun 2026 17:24:03 +0530
Message-ID: <20260616115410.325837-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113393-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:daniels@collabora.com,m:helen.fornazier@gmail.com,m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:robdclark@gmail.com,m:robin.clark@oss.qualcomm.com,m:valentine.burley@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,collabora.com:dkim,collabora.com:mid,collabora.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DC068F056

This series updates CI coverage for trogdor-based sc7180 devices by,

- Removing sc7180-trogdor-lazor-limozeen job, as most devices in the LAVA lab
  have been experiencing stability issues.
- Adding a new sc7180-trogdor-wormdingler-rev1-boe job.

MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1687201

Vignesh Raman (2):
  drm/ci: Remove sc7180-trogdor-lazor-limozeen job
  drm/ci: add sc7180-trogdor-wormdingler-rev1-boe

 drivers/gpu/drm/ci/arm64.config               |  4 ++++
 drivers/gpu/drm/ci/build.sh                   |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 22 ++++++++++---------
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt | 20 -----------------
 ...80-trogdor-wormdingler-rev1-boe-fails.txt} |  5 +++--
 ...80-trogdor-wormdingler-rev1-boe-skips.txt} |  3 ---
 6 files changed, 20 insertions(+), 36 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 rename drivers/gpu/drm/ci/xfails/{msm-sc7180-trogdor-lazor-limozeen-fails.txt => msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt} (95%)
 rename drivers/gpu/drm/ci/xfails/{msm-sc7180-trogdor-lazor-limozeen-skips.txt => msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt} (91%)

-- 
2.47.3



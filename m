Return-Path: <linux-arm-msm+bounces-111250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v1XNNYq+IWrUMwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 20:06:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5B6427F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 20:06:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=WWGbAExE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111250-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111250-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F5A300D32C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 18:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7781A391513;
	Thu,  4 Jun 2026 18:05:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEB311C32
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 18:05:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780596358; cv=none; b=Dlx7vavdKEYrV9UbJD+WTblgvDrU14AGz9ZfttsFgpFaHORG3BS3cgh0mlQ63ok6NmuB9OW7ELzM2lqxJy9RfD5DAsJp8BGIlgshOYK5cK+2zvC17Ub9AVoQR4US/M6ZwjjN5hH0NQZ2tTbUYqmB+0lS7bwfujErVYGYF+XJ0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780596358; c=relaxed/simple;
	bh=4LxKLlS1xtsGbdJUTAv9fDwQiedS5nhN2SAmZ5HKwK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6n/G0btd2aW96kltqdMnsfrWEwBnkprwwBurF7D1g+KKEQFVNXa+m4P1dQsOPP3iswh95fvKK8U1ioVm+aZnpu+qZCCsT79oPJy12xHoaR98hVp3l3ft+w1DzUEATVI111NmihA04wYpbKj51d3QXhU9bquDpxpNdTjqKwCWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WWGbAExE; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I7DrWxmBzxPOglXuI1YiImqe0UP51nuTNj2kxaFtVkY=; b=WWGbAExE33530/+JJfDqjg/DJs
	kiJmIu88QWY6zuKZIbSa3ZUthlCMtif52cq2cCyjcJsD1rfMVWGPL6SjE27gae5mz7zELXQnTZR3A
	GW4okr9DGJoj57pTK7d6RzmsV+k43X/xQ5TqzFBlhHdqSu/fxXrBh5cJ/nZCi8t15c8wVO5pfrAai
	y/kPHYJLF02gvvqyAffS98JX0lkZyg8dPi86liMZCk/UrA4xrPkCpsPe5ZA4wAeVv2TieMVoQgHx8
	EtwJbqbknKIbZF2DbLCjc8X5EIuqjzhKipBx5G7kKlA8B/XBsJM5NTd/eZKlJDzdefvaU6rysRZF2
	QPLtRA1g==;
Received: from [79.117.146.159] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wVCRI-00Ckqs-9m; Thu, 04 Jun 2026 20:05:08 +0200
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
	Sebastian Wick <sebastian.wick@redhat.com>,
	John Harrison <John.Harrison@Igalia.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
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
Subject: [PATCH v2 2/3] drm/atomic: duplicate state of all colorops
Date: Thu,  4 Jun 2026 19:59:06 +0200
Message-ID: <20260604180457.1110110-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604180457.1110110-1-mwen@igalia.com>
References: <20260604180457.1110110-1-mwen@igalia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111250-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:alex.hung@amd.com,m:contact@emersion.fr,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:sebastian.wick@redhat.com,m:John.Harrison@Igalia.com,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:mid,igalia.com:from_mime,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58C5B6427F6

Userspace expects that colorop settings of an inactive color pipeline
persist, so that, when the color pipeline is activated again, colorops
previously set preserves their values when it was deactivated. Colorop
setup is expected to persist even during a suspend/resume. To snapshot
colorop settings correctly, duplicate state of all colorops in a given
plane, independent if color pipeline is active or not.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 51f39edc31ed..ea15e58518fd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3752,12 +3752,9 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 			goto free;
 		}
 
-		if (plane_state->color_pipeline) {
-			err = drm_atomic_add_affected_colorops(state, plane);
-			if (err)
-				goto free;
-		}
-
+		err = drm_atomic_add_affected_colorops(state, plane);
+		if (err)
+			goto free;
 	}
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
-- 
2.53.0



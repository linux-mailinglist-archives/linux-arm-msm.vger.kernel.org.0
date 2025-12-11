Return-Path: <linux-arm-msm+bounces-85016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA9CB561A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AA003004F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2902FA0E9;
	Thu, 11 Dec 2025 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="aob9AFqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from forwardcorp1d.mail.yandex.net (forwardcorp1d.mail.yandex.net [178.154.239.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB752F9DBD;
	Thu, 11 Dec 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446076; cv=none; b=AvrIRsuC/QCwkyzxcokGq56srBtjbXJ4iErohWhwCLh9z5euyC+qBuEp/of+r1UFCkEQVUCtkSB1OwX/2xpJJvub9FDKhIsvX4QcWF0MatpkGpblic2chzSuyVPO/THAApbS+EHfPbE1Fsf4shSU5Js2tjL/ONSUDIDtZBmT/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446076; c=relaxed/simple;
	bh=Xvy3QCQhVu05fWGElgRnH3OhmTmyPGrNQ+gHP/TBgyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TyrEZvTYmdGv4Xq1hEVpD4MzKXrkh+VKafavJck7U704JqCw4UPk6qVajqKhdmeh+fSWfOxRhcEDLWxgitUlTUujo2CE2NHI2XzqLyJtABeq/7hrBe4k1nmr/5O40RIwb1lvMeoo8Q19gEepve1h56x64x4m7S3g5rIOLKz40yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=aob9AFqO; arc=none smtp.client-ip=178.154.239.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Received: from mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:94a9:0:640:a3fa:0])
	by forwardcorp1d.mail.yandex.net (Yandex) with ESMTPS id 889C5807A3;
	Thu, 11 Dec 2025 12:39:49 +0300 (MSK)
Received: from kniv-nix.yandex-team.ru (unknown [2a02:6bf:8080:c5c::1:37])
	by mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id MdLltr0FqCg0-XKazNBt7;
	Thu, 11 Dec 2025 12:39:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1765445989;
	bh=gZ19bStIXK8ZTYeaIB4Wio3OCyGR20Y3eysM2vFARVU=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=aob9AFqOPibHIQfZ9z38+gzDHxMpxstejtPnTKQO/EzicSIfSGqNyRh6d5m/WF5Nm
	 oDW7M1xsayyjBm1k9hLOCAkQOIGS1Q0nJ/F3V+ME4C4kYye8VWMq7jRTZYlaC3f2wX
	 1vjFwfVpduMxoB8mv5sY5U5kF5EcH+VW2qYkNPFY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Nikolay Kuratov <kniv@yandex-team.ru>
To: linux-kernel@vger.kernel.org
Cc: freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Nikolay Kuratov <kniv@yandex-team.ru>,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong interface
Date: Thu, 11 Dec 2025 12:36:30 +0300
Message-Id: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
single place the check is missing.
Also use convenient locals instead of phys_enc->* where available.

Cc: stable@vger.kernel.org
Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 46f348972a97..6d28f2281c76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -247,14 +247,12 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 		if (hw_cdm)
 			intf_cfg.cdm = hw_cdm->idx;
 
-		if (phys_enc->hw_pp->merge_3d && phys_enc->hw_pp->merge_3d->ops.setup_3d_mode)
-			phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
-					mode_3d);
+		if (hw_pp && hw_pp->merge_3d && hw_pp->merge_3d->ops.setup_3d_mode)
+			hw_pp->merge_3d->ops.setup_3d_mode(hw_pp->merge_3d, mode_3d);
 
 		/* setup which pp blk will connect to this wb */
-		if (hw_pp && phys_enc->hw_wb->ops.bind_pingpong_blk)
-			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
-					phys_enc->hw_pp->idx);
+		if (hw_pp && hw_wb->ops.bind_pingpong_blk)
+			hw_wb->ops.bind_pingpong_blk(hw_wb, hw_pp->idx);
 
 		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 	} else if (phys_enc->hw_ctl && phys_enc->hw_ctl->ops.setup_intf_cfg) {
-- 
2.34.1



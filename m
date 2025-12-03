Return-Path: <linux-arm-msm+bounces-84246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7DEC9F893
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 16:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C244E30025A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 15:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01C22FFF90;
	Wed,  3 Dec 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f+C2SgK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6B244665;
	Wed,  3 Dec 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764776110; cv=none; b=ADO1qpKESWaxJeNmXKBSx32QH75qIazoO77RQcDpsob3ORZh+cal/CozVVWxlu4gjAf712ANrvTrDGDGiX/t5YwGSBKUFt5sC+Z/Y+NoH7aSrwqgkgpKDpDaiiYKcpd+fMBFNXz+njhTAQ1xERiKdIHdPD7D7TgzxLckvSO264s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764776110; c=relaxed/simple;
	bh=nSrqHJzvFEVreGab573qZBD786I05VPsdjLOjqQcHz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDXMyIg90gJPHMUmmQzegSnEmC+y4b0kmykDZB/6FWJQIE/XrmDWZP7f9hCuwh/FoCxo6IG9S29LEOYypqIVkZD7ULQObCRcUh7DRc+Wt7dvgPjPwQHzoxlhNjIaHz4YSbMw4Pl2aRubPMwr1ov6hZ2hBXFx6NwBCSNgm91821k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f+C2SgK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B5CC4CEF5;
	Wed,  3 Dec 2025 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764776110;
	bh=nSrqHJzvFEVreGab573qZBD786I05VPsdjLOjqQcHz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+C2SgK3bUdRStj/pkaLIZiJ7LJtZDx5dSfx6ykTA9oi7q2rWurCs8ZhMoMA6n3wB
	 ma2lYthM9HT7Xjf8OoTik5PANYb917CKX+QWBDSDDkWypuvuQJsbC12NlHUxLKlplD
	 lTLPxJbODaOUmAY7cFD7lxR3ZXHxNvdRXx75z154=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 083/300] drm/bridge: display-connector: dont set OP_DETECT for DisplayPorts
Date: Wed,  3 Dec 2025 16:24:47 +0100
Message-ID: <20251203152403.700340085@linuxfoundation.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203152400.447697997@linuxfoundation.org>
References: <20251203152400.447697997@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

[ Upstream commit cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19 ]

Detecting the monitor for DisplayPort targets is more complicated than
just reading the HPD pin level: it requires reading the DPCD in order to
check what kind of device is attached to the port and whether there is
an actual display attached.

In order to let DRM framework handle such configurations, disable
DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
it is valid for the bridge to report HPD events.

Currently inside the kernel there are only two targets which list
hpd-gpios for dp-connector devices: arm64/qcom/qcs6490-rb3gen2 and
arm64/qcom/sa8295p-adp. Both should be fine with this change.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Link: https://lore.kernel.org/r/20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 544a47335cac4..d34120eb5e674 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -229,7 +229,8 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;
-	if (conn->hpd_gpio)
+	/* Detecting the monitor requires reading DPCD */
+	if (conn->hpd_gpio && type != DRM_MODE_CONNECTOR_DisplayPort)
 		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	if (conn->hpd_irq >= 0)
 		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
-- 
2.51.0





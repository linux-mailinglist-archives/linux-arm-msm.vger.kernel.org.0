Return-Path: <linux-arm-msm+bounces-81156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CAC4A55D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 02:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAA6D34BF16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 01:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B03341AD7;
	Tue, 11 Nov 2025 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AcAeMwW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F33341AC7;
	Tue, 11 Nov 2025 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762823510; cv=none; b=LrXiSyBP9oKeTExBalcy/9QTXDOmj+69nRT3qY9uUbmgW2dB4XvRGY+GkEEUT+CaGBlxyZNDfhg9R/zkcNW/G0l/obyTibBUND8D0jvzAfgHTwIPUhlFIPqScXFMCr86hU3KekMdYKF1c6zkB0KDTedFKvZPxEjLe/qegnx7VgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762823510; c=relaxed/simple;
	bh=w62OGB6d91pbiylO8LycuB3Ke7bGhejqjK2oZGtQFQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ev9pJk1PDpt7NbVb019BGQlToST7HQYCSn7qnDToxxCNBILjKqwj/o5pqmdwYczRsI9eRlxD6uJ2AWNegWmvLIqVOTmU/0NoMhlFGR+ppJ9r59XXyia/pbAKl6bDkZxJGTPs1oMt0sx3XYZLkGz7ax2R2t39zTZUcwqh9GhgUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AcAeMwW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32F8C116B1;
	Tue, 11 Nov 2025 01:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762823510;
	bh=w62OGB6d91pbiylO8LycuB3Ke7bGhejqjK2oZGtQFQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AcAeMwW6v40zVIMk85aw/v6FQzTu2ppZ6fWz1ieLpLAYwG5MEplxY2yyH8m7ZxZy6
	 5O3Z95zHcmz3yL4jmOfd3dEuwndHXkHs0djXMZ3r+jXjV0wHtMbf/Ofqyi/zYfMOiF
	 nTUEtI0kClmgPyCTZ2tDcUbZxfjV37/btp6tRBVw=
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
Subject: [PATCH 6.17 314/849] drm/bridge: display-connector: dont set OP_DETECT for DisplayPorts
Date: Tue, 11 Nov 2025 09:38:04 +0900
Message-ID: <20251111004544.004144487@linuxfoundation.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111004536.460310036@linuxfoundation.org>
References: <20251111004536.460310036@linuxfoundation.org>
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

6.17-stable review patch.  If anyone has any objections, please let me know.

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
index 52b7b5889e6fe..4f0295efb8f68 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -373,7 +373,8 @@ static int display_connector_probe(struct platform_device *pdev)
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





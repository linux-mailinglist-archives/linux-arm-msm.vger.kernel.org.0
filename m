Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD38377CE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 09:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhEJHIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 03:08:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:39402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230023AbhEJHIg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 03:08:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7618D6101B;
        Mon, 10 May 2021 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620630452;
        bh=N23M13Ne0KNJ0ahWWAcmuUD4JrqoALKpnUjmFzapsKA=;
        h=From:To:Cc:Subject:Date:From;
        b=gCbf/R/FNsM42LJ//O1rhsQpXbJMCfF9myiGjZOVHM35sAuuH42hJ52Ia/1eFlicT
         zrtmtK4p8eN49mUXukdwS5s128xRZNgm+zS6YpFLaDppTTaHNB7iv13oSPFbJuD/2R
         bpw9CZRdhhgnm9lRHSk8BinUukuPKI5am22leW35j2nK2BL8Y6IsfG2Sh8PBcqwbH0
         VNGeST2QgRFeZ+dY4qp76dBngLdSiZv7dYuCVoIoXHL/xpG9FdNBf4nDQPWihe+4T2
         BRyI3tGIpps17eA0nuFfCI+WpSgmU+sFb4NIhFt0uYYtCq2AccrU4c+jxm4mkKqpri
         EXXskWHqtFhGQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: qcom: enable interconnect for SM8350
Date:   Mon, 10 May 2021 12:37:25 +0530
Message-Id: <20210510070725.3839459-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the interconnect for SM8350 as a module

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 08c6f769df9a..a382d85c9434 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1148,6 +1148,7 @@ CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=m
+CONFIG_INTERCONNECT_QCOM_SM8350=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.26.3


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C484C15E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFSTSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:18:37 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40286 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfFSTSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:18:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id k8so870617eds.7;
        Wed, 19 Jun 2019 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2bx2Y/hN4Cn5kEf9/eyTDQFYiuK9AF+r04fSjxWQhMk=;
        b=p4QDjw+Bv2jk955O2zyVMZTnM32O5HtfjIlCWhEuRixFfgSNTzxm3+9Db9HAM/EPC7
         tstzPBCbIXrF3RFtaB3HizOyM9SWWt5HWYQ1tbvRzXAGpWpEr+vN/lwN01wRxeSBoK9W
         bpQwqr1q1d1f9ppXB2he49kZel0QKKyW3o/HGDJHoFlPvbRsGP2jXnyhRVU6jG7uAoL1
         W2tfcNoZVssnqHgVl3JGM4wEF7bn+UznJ1M8rf23rTk4h0kfbgRrJEPYSN4e43Cwk0qk
         iYTnS7I/DRHzLihnqvb1zIqzOiPdryb4M+nAgN54VH8F8XwvS47EFgAOmNULEQvqm4f4
         9EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2bx2Y/hN4Cn5kEf9/eyTDQFYiuK9AF+r04fSjxWQhMk=;
        b=Zwi1PVFNgPhLD/O0ps03k8nWU0VPAC8/jTh71irI4QdQkte2r3DhE36arAo0VRwids
         XQGkgzEbIgQBtnVmJCcS4MnTmHAbT03Mq7yTWEIj3NdCUf+k0ebwFU4zIQStftD3+Q9E
         EibWoYh2ZTGzwjl2v6zBi0GgPQViFppaO7yw4qI6mdpXTVazB6nOOlzeDl9hyKWEjMWA
         5ztedhHJSvJX91bCoZCvYkhMTygI5+Op4s7yDz+RyUJ+HDMMNSYM4o4zCTfQdZQaWMQ8
         HeP7lukRISMIq7e63A8u10XxNxx6ro/F2+US2Sns9TOoAPdUn5CZdNPdp5II7doFxv2K
         ATqw==
X-Gm-Message-State: APjAAAW196fIHthhcaLp5w6mUxLFIMp+Th5rGtduXZW4zSTXeaJvQtkw
        avVmtg8kA5Nt2U1sCWt6dlvd0vOuzokQKA==
X-Google-Smtp-Source: APXvYqziPGp5grduRzW0xyDykY6Q2CiVE7PN5wKnvPzCIrZ9ZOacu6Eabu5qSgjYqicqN2+JvVA1GQ==
X-Received: by 2002:a17:906:d052:: with SMTP id bo18mr26656411ejb.311.1560971915091;
        Wed, 19 Jun 2019 12:18:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id j30sm3394270edb.8.2019.06.19.12.18.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 12:18:34 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        kbuild test robot <lkp@intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] drm/msm/dsi: Add parentheses to quirks check in dsi_phy_hw_v3_0_lane_settings
Date:   Wed, 19 Jun 2019 12:17:23 -0700
Message-Id: <20190619191722.25811-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619161913.102998-1-natechancellor@gmail.com>
References: <20190619161913.102998-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clang warns:

drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: warning: logical not is
only applied to the left hand side of this bitwise operator
[-Wlogical-not-parentheses]
        if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
            ^                 ~
drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
after the '!' to evaluate the bitwise operator first
        if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
            ^
             (                                               )
drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
around left hand side expression to silence this warning
        if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
            ^
            (                )
1 warning generated.

Add parentheses around the bitwise AND so it is evaluated first then
negated.

Fixes: 3dbbf8f09e83 ("drm/msm/dsi: Add old timings quirk for 10nm phy")
Link: https://github.com/ClangBuiltLinux/linux/issues/547
Reported-by: kbuild test robot <lkp@intel.com>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Sean Paul <sean@poorly.run>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Fix broken link (thanks to Sean for pointing it out)
* Add Sean's reviewed-by

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index eb28937f4b34..47403d4f2d28 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -77,7 +77,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 			      tx_dctrl[i]);
 	}
 
-	if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
+	if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
 		/* Toggle BIT 0 to release freeze I/0 */
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
-- 
2.22.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDAEE4BDE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 18:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfFSQTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 12:19:55 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43256 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfFSQTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 12:19:55 -0400
Received: by mail-ed1-f66.google.com with SMTP id e3so93850edr.10;
        Wed, 19 Jun 2019 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/70MdY/0tH5yuFXGbIsIIxbdNqF1Z4II/87UAeKzlM=;
        b=Qk3jX7/otMjoix9fIHajqFF0BwJRqjAztAwca/uaSoluZurh4NgFEo+SLrgsMmNRjc
         Svf9wOa0Gq++Wjo3My8zblJRzOM5HoLunWu4Vfgd6dt9/00FsuAEdmurnSiUW4BOGFg3
         sGb9dSZJGj7aoo5lA3VViZA7XDb9Ndw9LRqmFS/jfV19PZp1KfhWt/U7oAsPxtX5AsAo
         jmriVXFpA08JKYEjJ67oY6WcvVOBo/rz8BpbdJXIgbiIcbH4fWkiTXfqmfhFZcMubEtJ
         mp/LElN5RTR7bFJ0JsS/8DqbwYjCDsN8fvKC8uSkkmxPfW+4F3MfIbIm5Db8dtM4Icjb
         cgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/70MdY/0tH5yuFXGbIsIIxbdNqF1Z4II/87UAeKzlM=;
        b=frau4AIItrYo/HdbXt52FdrzAL8K01J3AnPZIT/aRwBOnMhA0/BuHwVqmNmWPyolng
         9EtARt1uljymSHUhfNBb1D4EBI2tk0emfKgDHgQYfjJlvvQzz5xc5vYXXm9p4OE2PQZI
         AVlP8DVPdgfS3H8A6I5l53Xh0UbTiHsMV5SXjuuG18edaM/VpacOYH5s7jP7c8O+LJu9
         Jr2TCEmtJC3xEy79rbxFqzTdqm2/CjvsGv8+RfKk32lzjhp113LxFYrYy42n3hcKuIh2
         hGBtY2BBQ9wlx356RuOA/dHo7ZQJX6qb8dS3XZm90P7hbILk6dPl6l/GCIUSSecUiTdQ
         4ybw==
X-Gm-Message-State: APjAAAU+NnmO0QMdtFlc9f66ERX1dk3gZLwgahn86i4AJ9k9TN+nvBVl
        79GmWdEVZXA9rgd0s9xg0Hg=
X-Google-Smtp-Source: APXvYqyloM3q+6YhVKxzh2feNRKyW+L9adi/61z6PVaPdtSijqAYhpJuHMoZWaZ44GgKaSYENXImkQ==
X-Received: by 2002:a50:8bfa:: with SMTP id n55mr100851735edn.9.1560961193617;
        Wed, 19 Jun 2019 09:19:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id o22sm5871437edc.37.2019.06.19.09.19.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 09:19:53 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        kbuild test robot <lkp@intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/dsi: Add parentheses to quirks check in dsi_phy_hw_v3_0_lane_settings
Date:   Wed, 19 Jun 2019 09:19:13 -0700
Message-Id: <20190619161913.102998-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Link: https://github.com/ClangBuiltLinux/linux/547
Reported-by: kbuild test robot <lkp@intel.com>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
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


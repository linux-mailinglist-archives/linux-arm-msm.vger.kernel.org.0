Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618542707A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 22:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgIRU4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 16:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIRU4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 16:56:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD962C0613D0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 13:56:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so6836575wmi.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JO/vRiLXpeB8VcV6Xg2lUUCdaWgeJtk26slYXjrIcM=;
        b=zvoxghYQslVrQ+2m2rrCayyNpkGE3RMBMd9NMpwB6Y2JPee5Pk5TvWnelghBEDocWk
         Tws8riwmydklWZnSZZYnU5jhqVUao5FWRLMJERbaRbiaX10jvOWgLTz9JtY3fyEacfTK
         Lgg1hHXv6RxyoVpKLls5EinU5h6t1xXpvYSvN3EAcPTwJUErgsq8XDnE+YO6zVqlOdsN
         bQRdgOPVC7PoG9cRjumvokFjNDTitrvyqxTod1azLi1yIxu3lI4K/tpZkcEIhTG+RJ2q
         vkO90C2EYEoOHC85RoMazxPrC2VG3VPebmIsh9vFUXfytfSzUMVEXD1tbVUe6yrdVTw9
         zHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JO/vRiLXpeB8VcV6Xg2lUUCdaWgeJtk26slYXjrIcM=;
        b=QUDumr4DJ44o3w3w17NG9HsgWPOrNOArBSm8USTKjBjXFzkHCkeP/EqakCrTNYBktZ
         nCvzIEJvOmRPhjgYSovN3AyNWStXJ8QCKuv/tFnF2fYL0dz7CbWV9SHfMDrMMjnjDbbE
         U2h1TR00uIxE46RQvynHMtQdRopJD1tSNghzIeXVfBxwhGu4d/v1jrjI48p44jIPpA+9
         arvMYPBRPWu3hhRsx5PUKwwEr20upVX/1g/KBNj6vx5v9JBooSada5t0Wx9875NqSe7i
         3vtI9/7pAEHitQCb7GnKXAxh+qtd+W+VsUd0vIih6tSjLfvGWVqeXofqAqek2qnkkkE/
         4Rhw==
X-Gm-Message-State: AOAM533l19vIXqAMPA06V/2YKOR7VNm++bGIPSC/ELwxjkX+nKT4alxa
        og5KKPtZkrKkhID2B+3pN5r2UK/uf8ht2Wq4
X-Google-Smtp-Source: ABdhPJzv2khvKX4wYt65ewwVvBHJMM6G8HlgU/HNKIgYAumYE02akEQfhlVD/fItQyAM6iY8j37blQ==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr17241284wmc.39.1600462601304;
        Fri, 18 Sep 2020 13:56:41 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-14.xnet.hr. [88.207.97.14])
        by smtp.googlemail.com with ESMTPSA id a17sm7661875wra.24.2020.09.18.13.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 13:56:40 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 1/2] net: mdio-ipq4019: change defines to upper case
Date:   Fri, 18 Sep 2020 22:56:32 +0200
Message-Id: <20200918205633.2698654-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918205633.2698654-1-robert.marko@sartura.hr>
References: <20200918205633.2698654-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the commit adding the IPQ4019 MDIO driver, defines for timeout and sleep partially used lower case.
Lets change it to upper case in line with the rest of driver defines.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/phy/mdio-ipq4019.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mdio-ipq4019.c b/drivers/net/phy/mdio-ipq4019.c
index 1ce81ff2f41d..64b169e5a699 100644
--- a/drivers/net/phy/mdio-ipq4019.c
+++ b/drivers/net/phy/mdio-ipq4019.c
@@ -21,8 +21,8 @@
 #define MDIO_CMD_ACCESS_CODE_READ	0
 #define MDIO_CMD_ACCESS_CODE_WRITE	1
 
-#define ipq4019_MDIO_TIMEOUT	10000
-#define ipq4019_MDIO_SLEEP		10
+#define IPQ4019_MDIO_TIMEOUT	10000
+#define IPQ4019_MDIO_SLEEP		10
 
 struct ipq4019_mdio_data {
 	void __iomem	*membase;
@@ -35,7 +35,7 @@ static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
 
 	return readl_poll_timeout(priv->membase + MDIO_CMD_REG, busy,
 				  (busy & MDIO_CMD_ACCESS_BUSY) == 0,
-				  ipq4019_MDIO_SLEEP, ipq4019_MDIO_TIMEOUT);
+				  IPQ4019_MDIO_SLEEP, IPQ4019_MDIO_TIMEOUT);
 }
 
 static int ipq4019_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
-- 
2.26.2


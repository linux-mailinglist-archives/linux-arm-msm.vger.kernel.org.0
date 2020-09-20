Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE502714E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgITORP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgITORN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:17:13 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE000C061755
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 07:17:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id z22so14198939ejl.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JO/vRiLXpeB8VcV6Xg2lUUCdaWgeJtk26slYXjrIcM=;
        b=kVPF78Lk6Cp5dE4yxE87CaAATTpMf17aqwpZaTTnmiLSX0XkfcIL9ku0G6wo8pc166
         DGt1S/I0bMCHEkimHAljEcD9pkcWumWyW8f+RTO2PIAoHuoU8HmKeLaCkS85z4DXIb51
         dz3WxxhdsSzcMCeFCfn4C02zrN9R1BG4joHupNJLMlKdjw1BdL826vw2qXRVJuvCHDTy
         26tCpafQffvGyRIw2fdZWeDjWi3gWBn/GhFhxLEVmZ7ZZo/qsQdOmZzcZjqXPFGNtaxw
         Mx2OJyups3Xvm9BWOobx1WmN9l9LFIzJ3x8jVGG1rKZXIsbLmO4cifR9u41li6yMOAau
         uwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JO/vRiLXpeB8VcV6Xg2lUUCdaWgeJtk26slYXjrIcM=;
        b=JR63y/+f+6Aqo11bMF5PP3xn5PQAJjMAPghlzQRANveNh3hprP4eOeY8GEE+l1bd1C
         i/VoGypAJT/HoJVez6hx5VWo8TeXKqrmpdKtl+ZrGnV7DecfsR+EyKy16H4qoDuaf1ER
         twG7EXsK9GZft6rFL7QBHohwU0NgUWSS72uQMPn1mFP52fNXyrtpC7frD4ajGjTUXCFJ
         WolqYZz6uPxfJb2eW7tG1160sQUtzMlA6vLtJt1/d6jTHC8YUN0FjWv7S+Ehwme7DeRl
         yrcIn/7ehEvciB25bg6UrJwRzL7C/GDrG2meJDx4Tm9BBoKtV1TPZgs6Mv7vxfjfWRn9
         H0iA==
X-Gm-Message-State: AOAM530Cv0PgIruuROWW3lEIl5bRWfMVs3BWaXLyiS4A3+JmY02Mbl22
        j0Bf0mDCSg7cf4EQWDpc/UndNQ==
X-Google-Smtp-Source: ABdhPJwe7XrfvJeQ3xYFqReAUWmjkfls9M9MEc+Z4rWAC/WljKmLvF8sx3ECxUnfsYw9CqLQpwelwQ==
X-Received: by 2002:a17:906:fb15:: with SMTP id lz21mr33165218ejb.185.1600611431475;
        Sun, 20 Sep 2020 07:17:11 -0700 (PDT)
Received: from localhost.localdomain ([88.207.4.31])
        by smtp.googlemail.com with ESMTPSA id g11sm6631594edt.88.2020.09.20.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:17:10 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v4 1/2] net: mdio-ipq4019: change defines to upper case
Date:   Sun, 20 Sep 2020 16:16:52 +0200
Message-Id: <20200920141653.357493-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920141653.357493-1-robert.marko@sartura.hr>
References: <20200920141653.357493-1-robert.marko@sartura.hr>
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


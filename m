Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9508E273F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 12:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIVKQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 06:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIVKQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 06:16:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29113C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 03:16:43 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z23so21970744ejr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H2zrh0T/aIHB5coIgfEht7vUXRrR/Y3M7r4qi6VXEaA=;
        b=UympiQXCt6fSNYJZEkM75bM6uu438A8LrRvvuV0VEK4dezP51mfXPLgU5RQOhOB22X
         XDxN2p3oHrEHqaHRYiR41TkRoI1jhS4h3CES20VdYQmPPgT62ARcqIO3I3n/pd0rw0mG
         Vw+/M37l87W9QW8uJKzAP9zQjRkjlpPt25zgfiIweFJN4Ltbpxk4NYG1v9VoCk5532mY
         hu2obc1tmMlAWTB5OlcwgJMvcqzICsPErQWt0eW9n+BwCRcPILiKLUF9NPTXTu0ECZV9
         R6EV+3A+AcajLcXVuHTeXot4uPNVUU8lvMZ0aonIHZL7bh9+QWUSPRpvFC0905DEfgZT
         AeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H2zrh0T/aIHB5coIgfEht7vUXRrR/Y3M7r4qi6VXEaA=;
        b=Bnr8BtXPDITbKmlZqCwVZhD9E8qOTdQbRrdEZtFPbHm1kQRpgBnm98GqOfgfhDUeG3
         zAUoWa/ajn2Eby81+xe/LiRKjGAgtHHcB2jl9OlBwLkvrAb0v2GD5U8TUz5akDmLbPNO
         c58h13xp/F69PayQKfJ0b46gKGW47dS/40nQWz+hgdxhzORDUMhTb7vmbu0Fbiji+mSk
         JB15gro4+yrAdPb/SnOMTg+qJF/ShG3U7lgvKgsjSLz2Oiu8rp4lPWMPrEOtP9Z0DcOS
         WZb66+pOdfWBEIwFm0bznUgLZKy8IppisEBhv5ky/G+FKopw70+CYqI1mZADRKlQPO59
         gghQ==
X-Gm-Message-State: AOAM530KMX5r4XLd4ULstN8Ax7wwvSNZ90Ji9Z61Ji8Dne0CX+RblwuR
        qOuaqtq5m3Ae9BWe1d+6u+bRNg==
X-Google-Smtp-Source: ABdhPJwjRDrTW32hpcyKevocJzPX9wpy+spdPh9kR2ZCuGoDnBVt/boBY3L8SR6IQqagqwm9zUQmqQ==
X-Received: by 2002:a17:906:4a51:: with SMTP id a17mr3992258ejv.381.1600769801791;
        Tue, 22 Sep 2020 03:16:41 -0700 (PDT)
Received: from localhost.localdomain ([88.207.4.22])
        by smtp.googlemail.com with ESMTPSA id p3sm10595368edp.28.2020.09.22.03.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 03:16:41 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v5 1/2] net: mdio-ipq4019: change defines to upper case
Date:   Tue, 22 Sep 2020 12:16:31 +0200
Message-Id: <20200922101632.54896-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200922101632.54896-1-robert.marko@sartura.hr>
References: <20200922101632.54896-1-robert.marko@sartura.hr>
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
Changes since v4:
* Rebase onto net-next.git

 drivers/net/mdio/mdio-ipq4019.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
index 1ce81ff2f41d..64b169e5a699 100644
--- a/drivers/net/mdio/mdio-ipq4019.c
+++ b/drivers/net/mdio/mdio-ipq4019.c
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


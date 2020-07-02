Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F57212144
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 12:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgGBKaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 06:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgGBKaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 06:30:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DFAC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 03:30:12 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s10so27494577wrw.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6XZ9Fy33ZwirWwW/Vm8IMd0bk/0qmM6jU4/hDefptfY=;
        b=t8zdM40kMqkARgd6F0Ua4AF2+6eveItiPhWAZ27n69HXAEY7SOiz3nLTUM/EQSqTgT
         Sp8rLn9VYI5w2IfK8pPGls2fWX1DbHOGLhyaba4IrC0HtkiTgBs5WDxsn66E8OxAzIoj
         cLGFwGLSUkxSbr79D9RpCTrqK00uW7xhmy5Z5y5ySPwppZbs+7fGOZm6JT3COCKEDEh+
         ZKNETJ175EariGXCSjKyUV3K7WS71eTMFt8m7CRzrudZEw/zCGoARAbQk3+MILLRMDqR
         s2DnMtS5pULehPVaYmwaEjclel38p8+r6LsGq40UKEwtOv2m2zNfWyLEndnCMa+piS+N
         mNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XZ9Fy33ZwirWwW/Vm8IMd0bk/0qmM6jU4/hDefptfY=;
        b=YWflKcm5BbD5vsrKaQv3uTaw4oAzD0KJKP2KJ6Ambo2CqMhdDzuTfftVdBGp/n8Zag
         t1d3mrssPr4boYCxRpd6QXZxvk8g7wMsj9tnIbg7tL1mQRW63aRZEphPAy2NMtTP34IG
         kbUOGFLGtjWc3phnfpdKowmCDYtyrtbMmCEzSozfsW6q+izAMcBz0VAyjEh+/V51PQO3
         y03O3NEsE4J8Uwg1cXtPfU9HbkS35HRcRF8o1Ab+L9MwI7hd/EHSk7KoKJRk1G58v4jY
         3Mm3ZW3gR2/00hIJx9E34WNT7mTbChGVPUpXr7QYvFLlsAcPJwrY/8VLlQY9xx2fxrFv
         JC2A==
X-Gm-Message-State: AOAM533aeGwCoPjLAlEIfrpm089nTtmqbqU09h2qA0v8QDEmYXAej62I
        pwO+s4TESNu/krDeo6vMGYur7A==
X-Google-Smtp-Source: ABdhPJyMKhWpSUBUZ3IdCFf0na/xQ08f0GX2RezpLtD1SE2YPNqmajDrSbFhTzxvCzK/zQjyw1V/DA==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr29792661wrq.425.1593685811200;
        Thu, 02 Jul 2020 03:30:11 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-59.xnet.hr. [88.207.99.59])
        by smtp.googlemail.com with ESMTPSA id 68sm10406912wmz.40.2020.07.02.03.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:30:10 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [net-next,PATCH 1/4] net: mdio-ipq4019: change defines to upper case
Date:   Thu,  2 Jul 2020 12:29:58 +0200
Message-Id: <20200702103001.233961-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200702103001.233961-1-robert.marko@sartura.hr>
References: <20200702103001.233961-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the commit adding the IPQ4019 MDIO driver, defines for timeout and sleep partially used lower case.
Lets change it to upper case in line with the rest of driver defines.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/phy/mdio-ipq4019.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mdio-ipq4019.c b/drivers/net/phy/mdio-ipq4019.c
index f1f25489e134..0e78830c070b 100644
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


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE66C290CCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 22:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407214AbgJPUoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 16:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407010AbgJPUoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 16:44:20 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA256C061755
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 13:44:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id b127so4354170wmb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlRPIPSe8n0r9rFqN/1/sYjGO15Mdrv0XIRdWHzEMU8=;
        b=P6VWidqEDHWECL3IKF2xDpDIrmCUVhz0kYhTqd7nHArveC+1LFTZp4bkeJ17baqBtU
         yZZDaQI6OoO1jK45U20jfJDUaVrBx7VXdBxwdStCU/Azjgs0IpjR590ndxE1RAFZlwnh
         IVdp2yfwrlc8k4S1e5V3JikMrvvFIIALylklMRaFgeUmo7fKSA04zDLnrZ4PIIXTjQLv
         bwOcGTxu6XT/7IFT8Xz1IOhesPbIWyIVT0MKdgDlDoKTKPq+deGEEJHCuouHjs9yhcki
         gP0/CfRZIt1DhVJRNHpj3VUesEv0twjQW20n/GX7eMOGxUZgemYoQGoXtXf2c6bIwCjq
         SClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlRPIPSe8n0r9rFqN/1/sYjGO15Mdrv0XIRdWHzEMU8=;
        b=Pa+Jv9SAJIiLGItOkI8kiP/c3fIiTBQJXZAEagPuUpXJhxX36T9TmwaU05Gr7Viv6H
         fPVTnE/+ZCwnabIZWqyEM0m2ndsO3zc2vOx4D5OJyUlf9llMx9+1kkTvBRKI1O8GTUL1
         Yzf3fAykVJWmslGbfQn3JkVnUK17qPG7GshlPRG45vsNRuT8fKOLpFtm2T4YoPHY0xlr
         mxKwQkoip/kDXbnEDtwG5F2eA5qfS5l6MSIboknjK7IrXVWm/mA69GikC00UCWcISTX2
         rH5jT92NncA3eGzdaBd8KWfCZ+ddFhVb5Pk76mv/V/VAbPckc5+3FGWINEAIuGkvlw6V
         +m2w==
X-Gm-Message-State: AOAM532LXvc2f7oZAlg7eqUPpAF1Pqs8Re7m+hF0kkAiE2nb72s4EieI
        s92yXbtlLIAO3eDyhECaPChQGA==
X-Google-Smtp-Source: ABdhPJw4dhX6D6+pgt3svPHoFXgsxuCHqytkpuo0aQaWlc4p0a+0l6nxzrqXprqFlKKOF44ApgmrQQ==
X-Received: by 2002:a1c:449:: with SMTP id 70mr5408513wme.40.1602881056352;
        Fri, 16 Oct 2020 13:44:16 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-181.xnet.hr. [88.207.98.181])
        by smtp.googlemail.com with ESMTPSA id y7sm4206623wmg.40.2020.10.16.13.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 13:44:15 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, robh+dt@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] MAINTAINERS: Add entry for Qualcomm IPQ4019 VQMMC regulator
Date:   Fri, 16 Oct 2020 22:44:04 +0200
Message-Id: <20201016204404.2405707-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add maintainers entry for the Qualcomm IPQ4019 VQMMC regulator driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc05bea8dda0..064908d7b39c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14419,6 +14419,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
 F:	drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
 
+QUALCOMM IPQ4019 VQMMC REGULATOR DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
+F:	drivers/regulator/vqmmc-ipq4019-regulator.c
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.28.0


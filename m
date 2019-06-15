Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA13C47107
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 17:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfFOPuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jun 2019 11:50:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56276 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfFOPuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jun 2019 11:50:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id a15so5209690wmj.5;
        Sat, 15 Jun 2019 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fCnxcuBISnCFMkS4CaXGr8LMwEuRq/IrT37Bl4TOGh4=;
        b=oDrN3FIrIFBF30pElj4VmuGcUjcw1qR0CtlyNdG/UJgVLADKFLAEqFg4CULrX1ewbd
         EiVaBluytK9RPLn1T31RfddunY5GK4eo/hOXxO0FWwO+Ri/vD46fRIV9aR8geI+i44jD
         BS1dI9M94WeUbYc1VGMokk8cJCtM0tcmNi/baThN7WemK7SNjUBeG300PlTbZ1WfYQM+
         c653nCj2E04+vyoji6W8zlxTrUyedcAVkKPD84HQN7Kr5a5wUUgeeJyLAkgkHlN1k3Fo
         2GJP6X8cwWQT5sLo23jSJONVVI4yGdrVadGyKMwb6mCT8tIMiDli2B+UOXbqngkpRiEn
         QTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fCnxcuBISnCFMkS4CaXGr8LMwEuRq/IrT37Bl4TOGh4=;
        b=K6K3H/8565YSRl297P7oCoZLca2YZQjao+dIhPP3n+oEELgzspeXiB6lIT+oqPKYLW
         +UBMpqlftvQeVeVI8q86nHRIlNcUC79b0ZfFFWdB7R62DBeO+9RN9FZ+Na1D8B6uF49H
         iHcuWCDby6zuNMH/cqeIyvINuuYsX50EgSt2vHhH6efxctORguR3KxEVbkSLS4X6VKWU
         fNr16PVzwy4wuYgpuOxnTxvr2cGeb+ry3bSLKowXhL+nM1szsoQBvLElp/4+sqEnAUcm
         oR4I9rllMHwSjzdOTo1WxzaDvCCbexdN/GMiHG1TgIN9LC72xKcBpNi+Q9n+apmBBCRP
         FmwA==
X-Gm-Message-State: APjAAAWz0mW6dTaoCbQYZ3UAKvKvFEk+E5OwJFIkJPgi7cJy2kQzxRrI
        hj5HITTTsyd/BqL4aySeI3Zv3WU2uvQ=
X-Google-Smtp-Source: APXvYqwgrDLe1sR+kqURXVgPIh6Qp7jjSpzcV0oQSqmHkgPfVLJQ40UYVwsVp75Iuxm60ew4zFl4ng==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr11916738wmc.91.1560613822175;
        Sat, 15 Jun 2019 08:50:22 -0700 (PDT)
Received: from debian64.daheim (pD9E2960F.dip0.t-ipconnect.de. [217.226.150.15])
        by smtp.gmail.com with ESMTPSA id 128sm8065848wme.12.2019.06.15.08.50.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 08:50:21 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hcAwe-00070w-Ua; Sat, 15 Jun 2019 17:50:20 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-kernel@vger.kernel.org, Pavel Kubelun <be.dissent@gmail.com>
Subject: [PATCH] ipq40xx: fix high resolution timer
Date:   Sat, 15 Jun 2019 17:50:20 +0200
Message-Id: <20190615155020.26922-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhishek Sahu <absahu@codeaurora.org>

Cherry-picked from CAF QSDK repo with Change-Id
I7c00b3c74d97c2a30ac9f05e18b511a0550fd459.

Original commit message:
The kernel is failing in switching the timer for high resolution
mode and clock source operates in 10ms resolution. The always-on
property needs to be given for timer device tree node to make
clock source working in 1ns resolution.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 83eb5c29274b..c7fa9f61e1f1 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -165,6 +165,7 @@
 			     <1 4 0xf08>,
 			     <1 1 0xf08>;
 		clock-frequency = <48000000>;
+		always-on;
 	};
 
 	soc {
-- 
2.20.1


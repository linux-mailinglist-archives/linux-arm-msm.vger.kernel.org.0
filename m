Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E72D1DF776
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2020 15:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387783AbgEWNU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 09:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731287AbgEWNUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 09:20:55 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89628C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 06:20:55 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id p4so6018478qvr.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jTWXBoIp5xP2z98SKXvxr1jwUQDv9G49Gs5gB7jAmQ=;
        b=Omo1S8aTK2Xnmb0ZKAitTpFmzlzazJ6IEpN8QlZupFp4jAG/z+ILAtQ22mh90r0Q6N
         H8VCvisko0Otqabe3s1i4RXIgtSlzjtuQzMixowLsADA6YrvoYzySOSEMolVTlmgl3BZ
         unmnh0KcrxdfbG0ZTMyZyjTqC/YzzYqiTUXBB91FWV1nXL18uthuwcjCxYHyEKs+QYd+
         KcmdtQlUnUOi4mpp2kJOX+qzILl15d4vCLA/7aYSnIwj2QfxbEWuR2tQse2pGSZtA7kp
         Ms81QtCOf07KkEkWmRrXf60EdjabUREqAmOGI1dUShhFZIDqIuUTGeZyxaN9O1xfVFGI
         +s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jTWXBoIp5xP2z98SKXvxr1jwUQDv9G49Gs5gB7jAmQ=;
        b=cYHCy1tic4peEPsR3od7aizQkkb5QwMmtJI7kz3Pizhwej8QbYpvb9SzPro0xFHwnn
         uEJaxJsEhSP2/i7JGtwGtndHjHeqlawJ/sFn6Zkx6vR13kV56Uz25/ezs7BnGDOkCbW1
         UmRap8RNFG7ZyTwzpDBezZ+mboehB9xJ+BS0cY1jb/BXvwOThyXlU8we7oJfaVIS7XnV
         zLqAnwzw2oC6PcagbiQE2us/lUEMyPz5X3AQKcC1yRfxC2bJsYb8/jtLDjBvjzBY4kGt
         4ZrSAUlqGYXS30DkeJnv2Vpol1CvFsl7TCI/F7n4oMyploOrndY0pD1ZUeC7Pl2qpYg9
         7MrA==
X-Gm-Message-State: AOAM531hNTG/EYYF7OjiBOsp4bKTGEkd9LBSBXJRyY5s0GrTQdszylBa
        bd1gI4lLHISY4e9kbcVswnuXCojeL58=
X-Google-Smtp-Source: ABdhPJzSiWtfHLcpMPsu3/OplQOPrW3WaqO9a9RL0m/spX6r63BLU7ZEGJoOWSQ+p6psVR32yyK4wg==
X-Received: by 2002:ad4:55ac:: with SMTP id f12mr227669qvx.51.1590240054557;
        Sat, 23 May 2020 06:20:54 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m33sm10349519qte.17.2020.05.23.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 06:20:54 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sm8250: rename spmi node to spmi_bus
Date:   Sat, 23 May 2020 09:21:04 -0400
Message-Id: <20200523132104.31046-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pm8150 dtsi files refer to it as spmi_bus, so change it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 04c9c215ffcd..a273b99bf1e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -578,7 +578,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		spmi: qcom,spmi@c440000 {
+		spmi_bus: qcom,spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x0001100>,
 			      <0x0 0x0c600000 0x0 0x2000000>,
-- 
2.26.1


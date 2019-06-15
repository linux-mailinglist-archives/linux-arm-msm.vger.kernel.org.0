Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0286D47114
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 17:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfFOP51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jun 2019 11:57:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36422 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfFOP50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jun 2019 11:57:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so5551054wrs.3;
        Sat, 15 Jun 2019 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LsiOjlgDmLa+QB05rEL4qfK5bqjrVIOC9hgWrUIeMro=;
        b=aHVihIhzqdzMmR/gddeF8fS6zDC5A8EKLpVlDct1+zP1FEAVNLU/dJrBcaG2msZ6g5
         YNu7qMTniF9yFDnANAD7bEa2iWSsNnhqS93yoIsDBUT/KUBaCa9tA4zAxau3SWHObqiz
         Gt9cmJznRQQPy8rxDX0BwaFz3Vtt5lq0K2xf8wS++2QBnlj/cuU8Wi/fVlgJn+OcX389
         5GV93L+YoLiJ/IDY2OH1SF3AR54JwtCJbhcHRbS7cOV8Va4iq2xxlzkHmHgEeiH2ms6f
         oyLR6uCZ+XHtKXSew8CIwDlbPezSQPZf4DMBGXitU+Q7V+V4NZ8bDwEtDbp0rTIrbyr3
         48ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LsiOjlgDmLa+QB05rEL4qfK5bqjrVIOC9hgWrUIeMro=;
        b=pNjBrp9yMUtodOQ60RzZFiAfUu5FJXlJ88yegtuCq/jDLCCE7fjulr7PFcTcScLswa
         RyRHW7g7vk7XuC4GgHX9/gQmftrJPV9k7PNrB1GJpmFJsY9IcV5pA1NxzT9xw9pM4O4V
         o+UK4u9F2TvdtOm45s6RmB5zZGSc1gGEZRxQ/DoQ3//+ph1RBdZxLriwpgIZ/mGNmAu6
         jhxXIdIfElbwXkmojFvenkd+Fp/Z5M+kN9GX7rBzo+hFARI7S4/xYnnjLr7vQmWpb5oR
         ASRoMkMlcFdoErg94n5F2ided2aNgovVGANqpntW2rNAVkkP1+x/BieGhvsY8URCeFrk
         SkNA==
X-Gm-Message-State: APjAAAXcyURBqM8Bi5oZFR/Y8S/LCzFV+xTMBYXuXosCdQtqqvqu71hY
        qQvS2yHU81UCN2JOwILyA4k=
X-Google-Smtp-Source: APXvYqwzqyaXqxXpvH6ctCVJfAtUWHk1nMzUGfF9ubB6MaP7lgRHx1ZiaxMo84HorvvnPycXc9qvSA==
X-Received: by 2002:adf:f28a:: with SMTP id k10mr1527906wro.343.1560614244587;
        Sat, 15 Jun 2019 08:57:24 -0700 (PDT)
Received: from debian64.daheim (pD9E2960F.dip0.t-ipconnect.de. [217.226.150.15])
        by smtp.gmail.com with ESMTPSA id g8sm4903485wmf.17.2019.06.15.08.57.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 08:57:24 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hcB3T-00077A-Dx; Sat, 15 Jun 2019 17:57:23 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Pavel Kubelun <be.dissent@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: ipq4019: directly define voltage per opp
Date:   Sat, 15 Jun 2019 17:57:23 +0200
Message-Id: <20190615155723.27308-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pavel Kubelun <be.dissent@gmail.com>

This should align opp table with what it was before converting to OPP v2.

Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index c7fa9f61e1f1..0e3e79442c50 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -111,20 +111,24 @@
 
 		opp-48000000 {
 			opp-hz = /bits/ 64 <48000000>;
+			opp-microvolt = <1100000>;
 			clock-latency-ns = <256000>;
 		};
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1100000>;
 			clock-latency-ns = <256000>;
 		};
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1100000>;
 			clock-latency-ns = <256000>;
 		};
 		opp-716000000 {
 			opp-hz = /bits/ 64 <716000000>;
+			opp-microvolt = <1100000>;
 			clock-latency-ns = <256000>;
- 		};
+		};
 	};
 
 	memory {
-- 
2.20.1


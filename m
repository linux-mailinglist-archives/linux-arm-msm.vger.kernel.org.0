Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB6A71A3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 16:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388170AbfGWOXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 10:23:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33442 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388180AbfGWOXx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 10:23:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so41266560ljg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kDpgs4kc8gBaUxp23KFk53vgDP4GMAmynScdrpg6lYE=;
        b=CoY3Oay8ZaCT128Y2bWNSSbFb3uMpDJ2Bp+xjt/YohQLcrV1u1a9uTiTS8KLFEj/af
         VmUOL2DVKqYo7RNf+Tj8dczI6Cc4YE/QvJ/SSsHETvkytka/uzESl88ZPHDTVrxoTNkP
         sypRf5NseH5LR/CBenpH1ZFUI6f4zhX360l/ALdYVBsYRWm5EoXxYarbvdWJdbwKtuEU
         g3UME1eyhgfz+3zpk3jAiTUxYWAvZ/eIcNACpR5LzZgHeePtDm6wu9UAGs9KPbF60yrN
         HaAHXG49MBpfq8ewv/Gc0Hj32JQgNmbRyfHUUt7v1okUiHRxkRgpUsZ/OiV/XYIl0de8
         7c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDpgs4kc8gBaUxp23KFk53vgDP4GMAmynScdrpg6lYE=;
        b=YBjJaUzWq8nkqm/hPs1xnUJvXLIdZiVdvVqyvSUZaG4nQ3nLH2B/oE8TBsoZy8y1/o
         Z18tngYlLu2q2ydPH3gnqWyRoiMFiEDb+Qo4Ys0EBu6AeLdYjvXj69mWmFfrhpTRJ1E5
         VE7pb4W5XBEvOheQbJPB/8cgwcP/KejYZuG2ulZE9DM/1FQojIM1jW/S6nLsl8iYnJ2W
         /xuHX5WwxfZkY8VDrxEu3zdZ23U2IiGBXR+nOZNxkrvj0Bn5Cz4g6rz9Yr7EHQqZcbAd
         6+5sNFpyAUYbldtc1C0+K0ECGk6tzZqq1CGRz6XuODIfqwwSnhohgWXyXKhrqP0StFmq
         Ot4A==
X-Gm-Message-State: APjAAAVwd0isTcVlJKneQ7bCe/FgVdQ5l9r0S7yrGo9KVfh2Q7W4Y4+a
        oGg/fwiUFMVfEwF1ZiQJDyyIkg==
X-Google-Smtp-Source: APXvYqyrbG0lK7NZ3pbUKygUSGqDL/p43+50/wl/9Gh/mhpvEQsXgY3NW7YETGp4lGQ5U2uMOtrWrw==
X-Received: by 2002:a2e:9b81:: with SMTP id z1mr40094137lji.101.1563891832070;
        Tue, 23 Jul 2019 07:23:52 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id z17sm8048519ljc.37.2019.07.23.07.23.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 07:23:51 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        georgi.djakov@linaro.org
Cc:     vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 5/5] arm64: dts: qcs404: Add interconnect provider DT nodes
Date:   Tue, 23 Jul 2019 17:23:39 +0300
Message-Id: <20190723142339.27772-6-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723142339.27772-1-georgi.djakov@linaro.org>
References: <20190723142339.27772-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the DT nodes for the network-on-chip interconnect buses found
on qcs404-based platforms.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

v5:
- Rebased to v5.3-rc1

v4:
- Insert the NoC DT nodes after rng@ to keep the nodes sorted by address.
- Pick Bjorn's r-b.

v3:
- Update according to the new binding: add reg property and moved under the
  "soc" node.

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009..8b9352347622 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018, Linaro Limited
 
+#include <dt-bindings/interconnect/qcom,qcs404.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/clock/qcom,turingcc-qcs404.h>
@@ -273,6 +274,15 @@
 			clock-names = "core";
 		};
 
+		bimc: interconnect@400000 {
+			reg = <0x00400000 0x80000>;
+			compatible = "qcom,qcs404-bimc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+				<&rpmcc RPM_SMD_BIMC_A_CLK>;
+		};
+
 		tsens: thermal-sensor@4a9000 {
 			compatible = "qcom,qcs404-tsens", "qcom,tsens-v1";
 			reg = <0x004a9000 0x1000>, /* TM */
@@ -283,6 +293,24 @@
 			#thermal-sensor-cells = <1>;
 		};
 
+		pcnoc: interconnect@500000 {
+			reg = <0x00500000 0x15080>;
+			compatible = "qcom,qcs404-pcnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
+				<&rpmcc RPM_SMD_PNOC_A_CLK>;
+		};
+
+		snoc: interconnect@580000 {
+			reg = <0x00580000 0x23080>;
+			compatible = "qcom,qcs404-snoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+				<&rpmcc RPM_SMD_SNOC_A_CLK>;
+		};
+
 		remoteproc_cdsp: remoteproc@b00000 {
 			compatible = "qcom,qcs404-cdsp-pas";
 			reg = <0x00b00000 0x4040>;

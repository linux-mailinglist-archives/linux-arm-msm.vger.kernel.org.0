Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A492B9D38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 11:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405234AbfIUJv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 05:51:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36789 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405440AbfIUJv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 05:51:28 -0400
Received: by mail-wr1-f65.google.com with SMTP id y19so9115090wrd.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vVJvBclMyuRvPJqXx7DYYb5mol1nE8l67gPoZ0nMZWw=;
        b=TaCP+vgCAscjViMEDysUrg01ykmCKZuGgxSRi2Da0Qn160L/Ov73TFAkgw5XT76m+H
         Y8CiF6aKSfIU4oPW5wofcYNDGDc8l+wxgBYdLSsuwTh7LcQ7fKC25d1hBHDZf8O1ubxy
         URLQa7LLjn1Tc+CZXf20wCKge3QYuE+bJn5bhKpHwJadIpsydVPhpbqvTDNRxah9GdVx
         I05XGJkEIACrq4hSsj1n7UUWxvoU5Q+mxya4PSjOM+mN7cJ/SL5I6/O/IZ61rMpXSMOv
         SWw30+3aEYRSttaqhklrorlqKNXMmtyyy/broHqkPtAdZcpbH8KENzB3rLoOPnusWD0a
         tXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vVJvBclMyuRvPJqXx7DYYb5mol1nE8l67gPoZ0nMZWw=;
        b=cQtOrPu2T5dXf2L6pOfFlJGoy8SB0UcgusL+Q7sxvQ0SkIPshdZPhqMUDMamfdua2B
         82aG+ETRgyIISEHopbVcA6V3NJnEr8Zz1r5VmP9eRYz/o01wgAITP9GRzypMdZyOTa7P
         CMVOrwAsbxJEHJnLgCWqvfkQb4706HNkjkhk5jl8oEwPQzS4SGOQ5OGqSWrACRIPVwjF
         7LZ8ncXDB4EjEErxgD3+2QLjB0uafCEsjhJLPbn5VZCy01V56ndIb0Xnnpg/x3jbkIRy
         /+uh60sAGvQ7c2LUZhnIqdbOntr7tMIxrDYSr/X1c8rKT6FV08U0NP+CS8mXah6NFYxP
         w6Kw==
X-Gm-Message-State: APjAAAXz1EuaFnnaF30sN51QXTSi9bjFaktoqBDygDQIgruCopJMUsyS
        cLHc4xtbmr7WAuE7FFIoQAAHTqBgjP0=
X-Google-Smtp-Source: APXvYqxeveJxUycvDgHZzB1sNuVURFfk/ZmWFIGSv5wcr1Dnn6zp9zaGVCbD1gIBx6JpcvYGALiB9A==
X-Received: by 2002:a05:6000:45:: with SMTP id k5mr15315340wrx.259.1569059485399;
        Sat, 21 Sep 2019 02:51:25 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c8sm4947094wrr.49.2019.09.21.02.51.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 02:51:24 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: [PATCH 5/5] regulator: qcom_spmi: Add support for PM8004 regulators
Date:   Sat, 21 Sep 2019 11:50:43 +0200
Message-Id: <20190921095043.62593-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921095043.62593-1-kholk11@gmail.com>
References: <20190921095043.62593-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

This Power IC is used in combination with various PMIC combos,
generally found on boards with MSM8992, MSM8994, MSM8996,
MSM8956, MSM8976 and others, usually at address 0x5 on the SPMI
bus, and its usual usage is to provide power to the GPU and/or
to the CPU clusters (APC0/APC1).

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.txt  | 4 ++++
 drivers/regulator/qcom_spmi-regulator.c                    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 76885fd8a3c9..f5cdac8b2847 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -4,6 +4,7 @@ Qualcomm SPMI Regulators
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
+			"qcom,pm8004-regulators"
 			"qcom,pm8005-regulators"
 			"qcom,pm8841-regulators"
 			"qcom,pm8916-regulators"
@@ -160,6 +161,9 @@ The regulator node houses sub-nodes for each regulator within the device. Each
 sub-node is identified using the node's name, with valid values listed for each
 of the PMICs below.
 
+pm8005:
+	s2, s5
+
 pm8005:
 	s1, s2, s3, s4
 
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 3504d9054df1..7433dc807bfb 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1962,6 +1962,12 @@ static const struct spmi_regulator_data pmi8994_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pm8004_regulators[] = {
+	{ "s2", 0x1700, "vdd_s2", },
+	{ "s5", 0x2000, "vdd_s5", },
+	{ }
+};
+
 static const struct spmi_regulator_data pm8005_regulators[] = {
 	{ "s1", 0x1400, "vdd_s1", },
 	{ "s2", 0x1700, "vdd_s2", },
@@ -1976,6 +1982,7 @@ static const struct spmi_regulator_data pms405_regulators[] = {
 };
 
 static const struct of_device_id qcom_spmi_regulator_match[] = {
+	{ .compatible = "qcom,pm8004-regulators", .data = &pm8004_regulators },
 	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
 	{ .compatible = "qcom,pm8916-regulators", .data = &pm8916_regulators },
-- 
2.21.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD0549FDAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 17:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbiA1QKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 11:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbiA1QKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 11:10:12 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB3FC06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 08:10:12 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id q5so5975097qkc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6Z+hYT1u5UZ26dl63lvlyPiTNCs69Y2+JHCq1qS3cQ=;
        b=MK7mrTpGrkTcTh6pcyG6s2WEkE5djiIcZDpBSYAFz1V+eU4ohxamgVf/LzAaaJkHCr
         1QlIOl6KJYVb919xVWC26dvDhFs+D5z/DwEJjuUWLJrXPnBrNZ/KfWWOUNeQ+5Vr20Hn
         rRjl2rXYqYfFUKLNjFicF6Bryhsk+yqVsjhXHdpYZEHSS/oCH9p9OYpTpUJHGMYv0vDd
         lWt7o1Dz+SHcd+vP7/cehITWmYMN973COJhzPgTiUMj+rY9jKcAMwDw61qwUvKjiJXRG
         xikldfqynAAfccLzH/z0FVnKO9K3tbNy/ck4w5MzvQxNGg90T+ZL3wxUAp45rDprtFhx
         sFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6Z+hYT1u5UZ26dl63lvlyPiTNCs69Y2+JHCq1qS3cQ=;
        b=0KKbLz2swocb+WYHzEGVjJ2346AtlQ0wCqtIsssNJ8vd7mvIJzkRgZbAfzxc2E3c7c
         4QyqO6IqUvwTcOo1ZuHQ+vhCgYe55bRLVTbsR149rV7Uu30FiN/b/lwS0xTeSi4tEzWy
         jXIez7ltrqJa38jS8hv9+eXoPdbIWWCsrGZ541YczLN+0RfbU6Xkzj3PpYmulA/KaIEa
         07n9JYmNUa3wYdO9PA7cJKQhk8td1zOfa4erm7elw69wJikvE2lHDAdjzPBoZXh56VZS
         0BIEH3jrCdQxNlWeKtq6Wemnh5XPKVnvWFqDe38Rhn+llfffFtXdp8wZh+Uhzlgt8bvK
         57DA==
X-Gm-Message-State: AOAM532bHpnfesa0J1fqhQmjb3jz+aGhu58EbjBe1WEdJxgbv0I8/AZr
        AfPjMriNGHTR6y3WHaJcfy2zzQ==
X-Google-Smtp-Source: ABdhPJwDXY0bPJD+HljavRzOmarkBqbFmjPs9dBryPB309LQkBN+UM5XNdoM4DT7g9teG49laMSeMg==
X-Received: by 2002:a05:620a:578:: with SMTP id p24mr6310556qkp.430.1643386211791;
        Fri, 28 Jan 2022 08:10:11 -0800 (PST)
Received: from sagittarius-a.sqcorp.co (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o21sm3339006qtv.68.2022.01.28.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 08:10:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     djakov@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     jun.nie@linaro.org, shawn.guo@linaro.org, benl@squareup.com,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/3] interconnect: qcom: msm8939: Merge snoc and snoc_mm into one
Date:   Fri, 28 Jan 2022 16:10:01 +0000
Message-Id: <20220128161002.2308563-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220128161002.2308563-1-bryan.odonoghue@linaro.org>
References: <20220128161002.2308563-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current msm8939 snoc and snoc_mm definitions are represented as
separate entities based on downstream definition which declares two
identical and therefore overlapping mmio regions.

Downstream:
reg = <0x580000 0x14080>,
      <0x580000 0x14080>;
reg-names = "snoc-base", "snoc-mm-base";

Upstream:
snoc: interconnect@580000 {
        compatible = "qcom,msm8939-snoc";
        #interconnect-cells = <1>;
        reg = <0x580000 0x14080>;
        clock-names = "bus", "bus_a";
        clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
                 <&rpmcc RPM_SMD_SNOC_A_CLK>;
        status = "okay";
};

snoc: interconnect@580000 {
        compatible = "qcom,msm8939-snoc_mm";
        #interconnect-cells = <1>;
        reg = <0x580000 0x14080>;
        clock-names = "bus", "bus_a",
        clocks = <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
                 <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
        status = "okay";
};

This overlapping declaration leads to the following failure on boot.

[    1.212340] qnoc-msm8939 580000.interconnect_mm: can't request region for resource [mem 0x00580000-0x0059407f]
[    1.212391] qnoc-msm8939 580000.interconnect_mm: Cannot ioremap interconnect bus resource
[    1.221524] qnoc-msm8939: probe of 580000.interconnect_mm failed with error -16

snoc_mm is a complete misnomer though, as there is no distinct register
space, simply an additional clock to drive higher frequences on snoc for
new multi-media 'mm' devices tacked on to the old msm8916 snoc.

The difference can be captured with

- A new clock
- Performance points/clock settings in the relevant multi-media devices.

Fix the above bug by representing snoc_mm as two new clocks to the existing
snoc, not a separate interconnect bus.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/interconnect/qcom/msm8939.c | 30 +++++------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index d188f3636e4c3..7030911e25adc 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1271,25 +1271,6 @@ static struct qcom_icc_node *msm8939_snoc_nodes[] = {
 	[SNOC_INT_BIMC] = &snoc_int_bimc,
 	[SNOC_PCNOC_MAS] = &snoc_pcnoc_mas,
 	[SNOC_QDSS_INT] = &qdss_int,
-};
-
-static const struct regmap_config msm8939_snoc_regmap_config = {
-	.reg_bits	= 32,
-	.reg_stride	= 4,
-	.val_bits	= 32,
-	.max_register	= 0x14080,
-	.fast_io	= true,
-};
-
-static struct qcom_icc_desc msm8939_snoc = {
-	.type = QCOM_ICC_NOC,
-	.nodes = msm8939_snoc_nodes,
-	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
-	.regmap_cfg = &msm8939_snoc_regmap_config,
-	.qos_offset = 0x7000,
-};
-
-static struct qcom_icc_node *msm8939_snoc_mm_nodes[] = {
 	[MASTER_VIDEO_P0] = &mas_video,
 	[MASTER_JPEG] = &mas_jpeg,
 	[MASTER_VFE] = &mas_vfe,
@@ -1301,7 +1282,7 @@ static struct qcom_icc_node *msm8939_snoc_mm_nodes[] = {
 	[SNOC_MM_INT_2] = &mm_int_2,
 };
 
-static const struct regmap_config msm8939_snoc_mm_regmap_config = {
+static const struct regmap_config msm8939_snoc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
@@ -1309,11 +1290,11 @@ static const struct regmap_config msm8939_snoc_mm_regmap_config = {
 	.fast_io	= true,
 };
 
-static struct qcom_icc_desc msm8939_snoc_mm = {
+static struct qcom_icc_desc msm8939_snoc = {
 	.type = QCOM_ICC_NOC,
-	.nodes = msm8939_snoc_mm_nodes,
-	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
-	.regmap_cfg = &msm8939_snoc_mm_regmap_config,
+	.nodes = msm8939_snoc_nodes,
+	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
 
@@ -1420,7 +1401,6 @@ static const struct of_device_id msm8939_noc_of_match[] = {
 	{ .compatible = "qcom,msm8939-bimc", .data = &msm8939_bimc },
 	{ .compatible = "qcom,msm8939-pcnoc", .data = &msm8939_pcnoc },
 	{ .compatible = "qcom,msm8939-snoc", .data = &msm8939_snoc },
-	{ .compatible = "qcom,msm8939-snoc-mm", .data = &msm8939_snoc_mm },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, msm8939_noc_of_match);
-- 
2.33.0


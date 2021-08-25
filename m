Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03CB3F7B17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242119AbhHYRDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241872AbhHYRDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:03:45 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C335C061757;
        Wed, 25 Aug 2021 10:02:59 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n12so3277676plk.10;
        Wed, 25 Aug 2021 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f8hWkye1VrT2Jr3shabyVt0RoAYFpLTM9/fRR/zCCHE=;
        b=de6kROInW+kDymP6JgUjpBbDWiqEFFkrJAPzZq32zCz6jEGiONLCSKNI38snXlEvXN
         Wc8cIC3wEgdOOa7LusNiKPI+G2ipshW9tUkKGsOqPUXYxofEJCp9r3ISRE0tCqw8BiCD
         gk26SU53fxhxF87nBQkahxDS2AL02+GxHaSutCFNkmG51zQelnQ8pvXo6gYOZaA/pcem
         gBJ+eN8D2GpAkXEC1M19jzY5DvzRg0Y2UdAmvDB2ZJUvDYcyiqhvwiQBcDYog8abeZ3k
         hfGq/JnmnPF6JWEESE5Du2/uC/gOOLCxvEnm2HXb8rkPUHE4INANlotSiP1hLhCohtvG
         pXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f8hWkye1VrT2Jr3shabyVt0RoAYFpLTM9/fRR/zCCHE=;
        b=j8W99RmRDJ+WF/tj1xnmIETfjgemqNRlEOsErsKQtexJYzgaza0p6tLaRhzdrguTP7
         ppG0/dTgk8vATBj+fHmp8okOAR9TIKLRNcY5RnS4pw8+8t5xFFDI+9yqGluUjTNWJOZy
         lnQ0A+Ldne3sTrSdIVZy/uHiET4jMxkptMygfM5riOrE3QkPkE/fI/9VtaC1o08/5ISi
         lQU2WMf884XqPu+X2KZ+3rFUVoSDhGKihr/K/FSqgCL55XZ3NpPdlI27uaf5Ks0MIdCr
         sWKNfVaxEfMvWUQDUElP69mxAkaX0gzMYcpDKb+94O6etBH7oV0kl97Au/GfeXh4VFIE
         6/Kg==
X-Gm-Message-State: AOAM532JcHicYlLDZSsWlkLdHCPGsW8PH8mgZmmmUOVEeVbm6bv6Wa9K
        K0Ce2/s5FKY7y/37JfGTHZE=
X-Google-Smtp-Source: ABdhPJwTphIk6/GQBKEBkqsUPUdX6FE8gxResfeLV0s4KLTQ+nZOHJzTAjyTkaAci5HX2QdjzMPNBA==
X-Received: by 2002:a17:902:bc84:b029:12c:f9b9:db98 with SMTP id bb4-20020a170902bc84b029012cf9b9db98mr39189718plb.19.1629910978973;
        Wed, 25 Aug 2021 10:02:58 -0700 (PDT)
Received: from skynet-linux.local ([106.201.63.141])
        by smtp.googlemail.com with ESMTPSA id y21sm331043pfm.52.2021.08.25.10.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:02:58 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     sireeshkodali1@gmail.com
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] soc: qcom: rpmpd: Add power domains for MSM8953
Date:   Wed, 25 Aug 2021 22:32:51 +0530
Message-Id: <20210825170252.20137-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210825165251.18358-1-sireeshkodali1@gmail.com>
References: <20210825165251.18358-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for MSM8953 power domains.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 drivers/soc/qcom/rpmpd.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index dbf494e92574..4f69fb9b2e0e 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -185,6 +185,29 @@ static const struct rpmpd_desc msm8916_desc = {
 	.max_state = MAX_CORNER_RPMPD_STATE,
 };
 
+/* msm8953 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8953, vddmd, vddmd_ao, SMPA, LEVEL, 1);
+DEFINE_RPMPD_PAIR(msm8953, vddcx, vddcx_ao, SMPA, LEVEL, 2);
+DEFINE_RPMPD_PAIR(msm8953, vddmx, vddmx_ao, SMPA, LEVEL, 7);
+
+DEFINE_RPMPD_VFL(msm8953, vddcx_vfl, SMPA, 2);
+
+static struct rpmpd *msm8953_rpmpds[] = {
+	[MSM8953_VDDMD] =	&msm8953_vddmd,
+	[MSM8953_VDDMD_AO] =	&msm8953_vddmd_ao,
+	[MSM8953_VDDCX] =	&msm8953_vddcx,
+	[MSM8953_VDDCX_AO] =	&msm8953_vddcx_ao,
+	[MSM8953_VDDCX_VFL] =	&msm8953_vddcx_vfl,
+	[MSM8953_VDDMX] =	&msm8953_vddmx,
+	[MSM8953_VDDMX_AO] =	&msm8953_vddmx_ao,
+};
+
+static const struct rpmpd_desc msm8953_desc = {
+	.rpmpds = msm8953_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8953_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO,
+};
+
 /* msm8976 RPM Power Domains */
 DEFINE_RPMPD_PAIR(msm8976, vddcx, vddcx_ao, SMPA, LEVEL, 2);
 DEFINE_RPMPD_PAIR(msm8976, vddmx, vddmx_ao, SMPA, LEVEL, 6);
@@ -377,6 +400,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
+	{ .compatible = "qcom,msm8953-rpmpd", .data = &msm8953_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8994-rpmpd", .data = &msm8994_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
-- 
2.33.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 402E21232FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 17:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfLQQyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 11:54:13 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39095 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfLQQyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 11:54:13 -0500
Received: by mail-pf1-f193.google.com with SMTP id q10so1011854pfs.6;
        Tue, 17 Dec 2019 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UqAALhbJUctlAt3Rayrh/HqASiW433RXhLjAxX/LchI=;
        b=CHeMb+GAK3Gs7iOFr2CN0dWpnuZNG1f514VN72zNLF7RdYkYTRzNVP5e8QnLocKguz
         nlMQl0OUGSSVPh/OKrl3TQoMlmrNqGnFFtXgqi+xMq5obRx/6zKjKEuviqAMaD7DnU5g
         c2325fu/9Wal14/7+j7KDtmAFKDYuvjACJOWfISQSNlOkKTJk6L93U+ZCycPELYsF/vY
         Xv1TGFUZizkza1ZfkdwE+zeajvlxIx6BbNBzRrHnL3wGv3n1VVcHLdLG0G9Moyb+rxvw
         xi4Hhr9irF0cmQUm9yreJ9mchqc7XKsjiQRf2KTUr0Sv2YHLCCARKhGdmP/c2XiIgzXP
         gjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UqAALhbJUctlAt3Rayrh/HqASiW433RXhLjAxX/LchI=;
        b=J92R6i07KiSGsD+uWb3QqYjVtkbtQQlRGhsujQZvOfMezKFEcsSDP+8D4+pRhZkC7W
         5YHy1fuwH2lDrMx07U/BGqTig9LZuuXfPtleaQSCb8NOXIjyd/0H1Dg7jjqLVLRSjKDS
         +E6AdcabUbv16lXlrsk2F5KdlnLeQgF9ZwBUmWhGQnXHn8T/Hhynr/rh7x7tQDuS1+LM
         5VZbeS2DwzyNbyTWRYbFhYCrOI2M5zErNeQS7AYqkXJVLxsBK1PTPSSIb3Dm1+1PVTNy
         XPZgz76sAl8N2CxNwLBiRDGIyho0eqxpFSD19SADMWPUneDUMuZ/2uWFvXX803AyesDd
         p4KQ==
X-Gm-Message-State: APjAAAXrDrD2NVJYCZdD/cavl1bWgE41OTabgSAUvTA6GLuq6xon/ISE
        p04eCtpoRlOHh0+E6p7UNLU=
X-Google-Smtp-Source: APXvYqyYabh+3GFRO9Qpf0Ga8UhH0LczUeqATaOub5FWvAvtoLRKCpBPsnvqVfvGdwlGhTm9esZngg==
X-Received: by 2002:a63:1106:: with SMTP id g6mr26017569pgl.13.1576601652689;
        Tue, 17 Dec 2019 08:54:12 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id v72sm4082803pjb.25.2019.12.17.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 08:54:12 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     andy.gross@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: smd: Add missing bimc clock
Date:   Tue, 17 Dec 2019 08:54:09 -0800
Message-Id: <20191217165409.4919-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It turns out booting the modem is dependent on a bimc vote from Linux on
msm8998.  To make the modem happy, add the bimc clock to rely on the
default vote from rpmcc.  Once we have interconnect support, bimc should
be controlled properly.

Fixes: 6131dc81211c ("clk: qcom: smd: Add support for MSM8998 rpm clocks")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 930fa4a4c52a..e5c3db11bf26 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -648,6 +648,7 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 /* msm8998 */
+DEFINE_CLK_SMD_RPM(msm8998, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8998, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
@@ -671,6 +672,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
 static struct clk_smd_rpm *msm8998_clks[] = {
+	[RPM_SMD_BIMC_CLK] = &msm8998_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8998_bimc_a_clk,
 	[RPM_SMD_PCNOC_CLK] = &msm8998_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK] = &msm8998_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
-- 
2.17.1


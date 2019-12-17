Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D8112335C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 18:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLQRTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 12:19:10 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36419 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfLQRTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 12:19:10 -0500
Received: by mail-pl1-f196.google.com with SMTP id d15so6401742pll.3;
        Tue, 17 Dec 2019 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0+bQNPLFRgrOnjruSTJiPHn1ioRUh4JUplPIt6H3zco=;
        b=Vi8EBTAoHCx//m8jY8MWHk9Vg8SHJeRdd1m0Ml2k+7DWhHfGxEcgfIHoOFlJ0NSx+D
         dc7BKSbdC8cMwVuhQbKtaU2EmJuc+tuu+WgWNZ2w6ZvnYbumIdEwDvxAHyEU7G73XvRJ
         okJv4BSKIxvJDi4Tu69sQam902T1DqYebrd79Tk0rTOEbB7ZHiVy8Ok7R4K5MHqk+3UM
         UcK+bj0waHefluq+SYUG/OKHNuFbvGtCSXgg9PPy0W6H7Od6PbNaHvST2K0lQjcF5QAv
         bKn3P6ImNT9rgus2QO0b+kD5zrUk+7VPMHuUqQOecrZcVTWN4Opyn5qOOhu/yA6uIl5z
         9LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0+bQNPLFRgrOnjruSTJiPHn1ioRUh4JUplPIt6H3zco=;
        b=rwesFq1yHY/GhXivC1DX4IkL0fYu7G170jNmUNyn/88UnBOfS43oThmtwQ7scPPMzG
         ALVBSaOyzsd7NmET3oZaRSTl4+wpnu5zF8CfyPtTDqBmw6YNlbuafpjxmugD9EXJ0JAQ
         Cf7zjhGVVtuwSQQo26zX8XEof68LaOCktKm9NMSI+pz37Y013cmHqqiV5B5NuiMYmqqG
         I0bxyC/SnWFCFCGdQ1Bvu0Bh2W8MSSJ4LAfhAshpvPnnDyus/d4f3RYdk9r00hSCl0Dm
         GuupyeKrsOvLnUoWzlJjwfDDUyQCF2bCnK/bLTX1OCZVmCq3TsBiFv4ygT17zPW+TXyF
         eH2A==
X-Gm-Message-State: APjAAAXriezdBCFuDKW/V282sZ3KLmloCVgKJkCOD9+rU9Mofxvuz273
        1ezai3kW6Duu+n2SMvqVbBk=
X-Google-Smtp-Source: APXvYqzU5Jj/4ldH9kbwaYhFB+jis5t+pdYif2vfndTq3mRrNah3880ddnF/9HXmy3biZkqqq4ZSkQ==
X-Received: by 2002:a17:902:bb8c:: with SMTP id m12mr24410091pls.320.1576603149784;
        Tue, 17 Dec 2019 09:19:09 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id w66sm27618721pfw.102.2019.12.17.09.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 09:19:09 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: Avoid SMMU/cx gdsc corner cases
Date:   Tue, 17 Dec 2019 09:19:05 -0800
Message-Id: <20191217171905.5619-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mark the msm8998 cpu CX gdsc as votable and use the hw control to avoid
corner cases with SMMU per hardware documentation.

Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/gpucc-msm8998.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index e5e2492b20c5..9b3923af02a1 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -242,10 +242,12 @@ static struct clk_branch gfx3d_isense_clk = {
 
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x1004,
+	.gds_hw_ctrl = 0x1008,
 	.pd = {
 		.name = "gpu_cx",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
-- 
2.17.1


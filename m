Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB2511361D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 21:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfLDUER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 15:04:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37069 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfLDUER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 15:04:17 -0500
Received: by mail-pl1-f194.google.com with SMTP id bb5so177103plb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2019 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELTAmH9zkiQxFiFkiHdPx6vGU7gbG/ie/I1ns5+Qwf0=;
        b=b7NmR+qF+vnxWm4yIdm9VpajCEJKepEQB55cnHNpOMHIokAoPr34EBknlvq7Rx4SIX
         HzzkF1H2mla69oKJZOjib3KdC1hLFVpPt6/JB3wIyoX+7CcRy7GXBX2cIo7YYAbL4QIm
         SkECYLq/nhBcSmvVpJtYpE5Y67vz0aRAWHz14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELTAmH9zkiQxFiFkiHdPx6vGU7gbG/ie/I1ns5+Qwf0=;
        b=AhJGpJR1vt8wT+OMA/WpV77TtiBxTgDM7+WA+AOVTVHWrYWEGtAw0fKHbrBZvFG5HC
         OryxJUCvotxztVdg1CmKbGSTTFGlkBudBeNxct+pw0D/T+xFXAwZ/Qe562YrEApXOY4H
         B8URgJKGNOhBDtHRHQnNrqFDOYKBTXkQPfChPX9i3ATTm35+BNseJ7T2q8CbTb2zmQ7P
         OPEFxnuHWP2+L+pd25olxTDlVRIM4H3DmZQPMHdJ8HRfkzwZBBYmgR/Ml8NZD6LX1RXO
         U7UwJUysNyaxJWkFEygxOQwDTCKEFK3OVEEACCkiq7xkCeySmiumXxVjU2zB2dotLmbd
         yTiw==
X-Gm-Message-State: APjAAAVj9O5jC9vzjU7awKp3x45DHv+N0IRrRDfjDpwG1LkKazA0eYWn
        tecfUUmwZ6phT7lhXTdRC4FAeg==
X-Google-Smtp-Source: APXvYqyvlVyp3wP4RGPm+o/Ndrxy5XeKmjPozpw3mhNrwwRc7fTWujDUcpkjGLkMlZTIn4J60g5EhA==
X-Received: by 2002:a17:90a:366e:: with SMTP id s101mr5231134pjb.18.1575489857123;
        Wed, 04 Dec 2019 12:04:17 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z23sm8423636pgj.43.2019.12.04.12.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 12:04:16 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] clk: qcom: gcc-sc7180: Fix setting flag for votable GDSCs
Date:   Wed,  4 Dec 2019 12:04:12 -0800
Message-Id: <20191204120341.1.I9971817e83ee890d1096c43c5a6ce6ced53d5bd3@changeid>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC)
driver for SC7180") sets the VOTABLE flag in .pwrsts, but it needs
to be set in .flags, fix this.

Fixes: 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/clk/qcom/gcc-sc7180.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 38424e63bcae2..7f59fb8da0337 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2186,7 +2186,8 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
 	.pd = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON | VOTABLE,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
@@ -2194,7 +2195,8 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
 	.pd = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON | VOTABLE,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc *gcc_sc7180_gdscs[] = {
-- 
2.24.0.393.g34dc348eaf-goog


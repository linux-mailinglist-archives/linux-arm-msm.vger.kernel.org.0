Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C2B10A140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2019 16:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfKZPel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Nov 2019 10:34:41 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55976 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfKZPel (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Nov 2019 10:34:41 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so3657482wmb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2019 07:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHpKE1+pRggjDZg3Vcgn+vzDPH0txuMe168rRQcCK68=;
        b=w864Jom6wGOmf6sK60smmKGgc+SuwnyTekrouut8YkgOdmKIfioXo3WWtSDucAjPNR
         WYKH+7MhO2oaQ9OqDIvgWkjg0gy/lDu2VqmCi1+47V3irPn/aerma/cNc+OgLkYbpTyH
         CK7aZ5jQxixxxlW8zjdxfFjho+2+qTp5vmCBmWo0zLC5A1qdhl2zdj8AnrzS/LUQjeJn
         d+DDxvSktWFPp/y1YVj/1M1uMqwu9eGg16S8p9ywtgFt4VUup4/ERB5fMdSXrSn88XF5
         uigHb9uV0hTG3cpI79vb1GnmTXZPwgXeyH3d0RvNJaMIS299a/Jqhh4kKigHioRL0uY5
         U9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHpKE1+pRggjDZg3Vcgn+vzDPH0txuMe168rRQcCK68=;
        b=ZLgAzACe+ar3EKkMu28qrj3LwryxuThnoQvU+HcYD7Yh8XLzuw4QCYcyHC8V4MUiVA
         8wIq3Z7q53C9ZXjHVMBdCYAOQIGWSFy8p/NtVibNMevvLLSqgHdr6g8wFxVH2nUkGdtq
         nc1iqm8p2SBWK3UGeL0TNCheI5g1N2hVw4J+Ju3OUm+1XeekKUZct2yqOMIRd8UoP8Rl
         aEzuXLXXinS48fyraqPDygl+PthOHiWz9D3Tmta1XWSMAwdapoMCiRzCCsnjiOyhHgf8
         Har/YtdY+7iGZdWRE5GvagS5sayYPlNtYY1zihllcRs1j7vHGfMUx+9j1BW8K4fd5jB3
         0fiA==
X-Gm-Message-State: APjAAAUMcQhnI8QayoTgdSpIpVnUy91KfpZ0eSnyoeLXJcEs2O3xaLNW
        1/FJb3uocyLFdxsiAHtIGO8VFw==
X-Google-Smtp-Source: APXvYqwdGDfHspdrOG2iQl8u6+NKrF41ljngXKadaalKOG2vajrUY33xi2U+YTG7fb3uci99JUykvw==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr5025056wmb.53.1574782479214;
        Tue, 26 Nov 2019 07:34:39 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id j10sm15210748wrx.30.2019.11.26.07.34.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 26 Nov 2019 07:34:38 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com
Cc:     mturquette@baylibre.com, agross@kernel.org, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH] clk: qcom: gcc-sdm845: Add missing flag to votable GDSCs
Date:   Tue, 26 Nov 2019 17:34:37 +0200
Message-Id: <20191126153437.11808-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sdm845 devices, during boot we see the following warnings (unless we
have added 'pd_ignore_unused' to the kernel command line):
	hlos1_vote_mmnoc_mmu_tbu_sf_gdsc status stuck at 'on'
	hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc status stuck at 'on'
	hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc status stuck at 'on'
	hlos1_vote_aggre_noc_mmu_tbu2_gdsc status stuck at 'on'
	hlos1_vote_aggre_noc_mmu_tbu1_gdsc status stuck at 'on'
	hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc status stuck at 'on'
	hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc status stuck at 'on'

As the name of these GDSCs suggests, they are "votable" and in downstream
DT, they all have the property "qcom,no-status-check-on-disable", which
means that we should not poll the status bit when we disable them.

Luckily the VOTABLE flag already exists and it does exactly what we need,
so let's make use of it to make the warnings disappear.

Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver for SDM845")
Reported-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 95be125c3bdd..56d22dd225c9 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3255,6 +3255,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc = {
 		.name = "hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc = {
@@ -3263,6 +3264,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc = {
 		.name = "hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_aggre_noc_mmu_tbu1_gdsc = {
@@ -3271,6 +3273,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_tbu1_gdsc = {
 		.name = "hlos1_vote_aggre_noc_mmu_tbu1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_aggre_noc_mmu_tbu2_gdsc = {
@@ -3279,6 +3282,7 @@ static struct gdsc hlos1_vote_aggre_noc_mmu_tbu2_gdsc = {
 		.name = "hlos1_vote_aggre_noc_mmu_tbu2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
@@ -3287,6 +3291,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
@@ -3295,6 +3300,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
@@ -3303,6 +3309,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct clk_regmap *gcc_sdm845_clocks[] = {

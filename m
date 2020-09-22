Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148E52741CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 14:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVMJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 08:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgIVMJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 08:09:16 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B449DC061755;
        Tue, 22 Sep 2020 05:09:15 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id r7so22451405ejs.11;
        Tue, 22 Sep 2020 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=steyxlT4LVPBsfe8IJH2NOc1f2Mr0MYY3HiC50X/c/0=;
        b=PqcBVJ7UteV28rSmL9CuvhOhID/Uowd4Vi5TEe7GA2bzJUzqbTmmZm7SWjiPB2GWLl
         Zl8QrP2PohhWHRpBtKC0fYkFrUo2P40E0n0SjX/zq5YKu7gSpNmgKTPEGxMy5yEeu8dB
         m1C4jOnOFn9Kdc1XxkKDBXNa+VCReqLMFADIZjD/gyAGo/I+3Ees8nlVC+00UJ+9KGi7
         6eVmzJV6g5GaH2rmaFYxhC56lyJt//9Ct3th439Vw0eY6AIwMrEVnCIHORO9e6pRPAvF
         2m6xbPbL8r35BI85U4lbUH9Z1LGOsHYHeWBQ/FOi1FopTp+Nlj8hqPSnDaAQHPLKN6SO
         HZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=steyxlT4LVPBsfe8IJH2NOc1f2Mr0MYY3HiC50X/c/0=;
        b=fTkiT/GVD5Z311TMhJZp3EbFLYyTuRlExLNsjRTQ0uh016p+ftRHcuUC04v0vKuV7r
         f9SvRMnBf00qMRuG0X6sS/06yaVUAtnZxtJIo6oQJi8jGf02fRUCCtx+VJOH0LbBVi5l
         mi+VBF7m4WLrSvOMJcjLB+2o6K310igUoBnnnU871k2pU7ohaTjNcl5Oqifx3y+NJCyv
         qNxlcchFwiPvQqpg05xOCj9SfrxiVYXye+FJkz2clYcnl9RcEGKC4GB7jOXYOLUGYoXJ
         23G2EONnPWchq1e4O60FEnwhtktXHY91acnAI4abrvDF5UXOJd/4/cJV1k0Nss7S2ivx
         aPKQ==
X-Gm-Message-State: AOAM533cDZq3TZsOfGbpE/fgEuubLV4+5bj8ZBSlpBoTAaEnJHOOt9t9
        +xkZ3zkjROwmoAkaE6V9A4Q=
X-Google-Smtp-Source: ABdhPJzlCM3Uyjl7gfhzf06ug/kOBwEhcs+oi+eQu3ZTZlZOD1QO+qA+foqWGCToItKWcrF5S8Bsgg==
X-Received: by 2002:a17:906:474f:: with SMTP id j15mr4786337ejs.468.1600776554474;
        Tue, 22 Sep 2020 05:09:14 -0700 (PDT)
Received: from localhost.localdomain (abab42.neoplus.adsl.tpnet.pl. [83.6.165.42])
        by smtp.googlemail.com with ESMTPSA id c25sm3575013ejd.88.2020.09.22.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 05:09:13 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sdm660: Fix wrong parent_map
Date:   Tue, 22 Sep 2020 14:09:09 +0200
Message-Id: <20200922120909.97203-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was likely overlooked while porting the driver upstream.

Reported-by: Pavel Dubrova <pashadubrova@gmail.com>
Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 3cffadc77bce..1a5e98e5c965 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -666,7 +666,7 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.cmd_rcgr = 0x48044,
 	.mnd_width = 0,
 	.hid_width = 5,
-	.parent_map = gcc_parent_map_xo_gpll0_gpll0_early_div,
+	.parent_map = gcc_parent_map_xo_gpll0,
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_rbcpr_clk_src",
-- 
2.28.0


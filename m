Return-Path: <linux-arm-msm+bounces-85776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7DACCE741
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73544304D226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7730929ACFC;
	Fri, 19 Dec 2025 04:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFrkCIrp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2425CC40
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118891; cv=none; b=ePsqK2iBD+xwYrrh9+65SxXjTa61b8pSUO6hol/xpg06y8f9KHiokKFra3SjMZWg35Hm4GBlz0y3+JBqaCa2/U0gc0fTH9f70TZRB9mapAld2xbqRInDkmCzLx1egjuzJzqv8CN9D56XfqgEzIVcCvoEbBDDtXC94u1rh4Ra7DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118891; c=relaxed/simple;
	bh=W+Ym9BwKVAgvE+GU5fNU+tY01VS2aGs7fB4odK3Uwn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8Y6R4S9URxCCFnfUpZiJw0Rg8i39f4cncy64KFJAjCQnXoBiHVgJSNbaeYf7MKowg/qreDC67fnU3fA4QjTzb77nYDcyAIKm2qmfBSA2ttVRtHYxJ8OFBKp53efYvOPG9pDJMMyjW2yW98LiLEoH4bg8ZkkaT4aD0MiwcChcHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFrkCIrp; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64472121ad5so1032202d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118887; x=1766723687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DWjzd7lB1ZvwMkSR5wsbL0YfoCyC9gajogbuJSaS6g=;
        b=kFrkCIrpzHOEw3EHIPzPbWhWiwyJhaxkRLhrC/mz4Jk9Bt5qayEUxjWolI/Lkg3+D/
         CjrFyf5TzDXG8yNecaGCKHw7bpKwuxupqZEYqn2J11tvEzqDqpH2BeMT/J9bbdbBONfT
         f094XnbD/fUpAwqE9RNLux9yq4fVaJ/IEgAkV8eCIrxEGGRVyKo8fqbEfOZ+d7rOcWX5
         rwR7DP5yXvh+U6ovQMfASU1gjks2t0Z5MdE5mArqaggvSwSc0fdKqny6owM+jNg3GQss
         YKnjdMLimIEn635QmV2M5FKJNLv9WhgiIWxP/DNGAaZCBjR1f0pb2w9Vnu4t1QivXA85
         mDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118887; x=1766723687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5DWjzd7lB1ZvwMkSR5wsbL0YfoCyC9gajogbuJSaS6g=;
        b=w7XtPl9ZDoqmZ/c5BUGMzlmJ4J/lCjzq0TLItuAbme2yyIvNwNRIWuKD/aX1mXJP8a
         uzrIDyT/BM0nTKIb+ZTNo3hEGxF0zANeDuXdUjx7vTyIps0szZ9TPq/1tCwVWqrS3Jyy
         DDF37CqIMZATadEzyO0cxA4P7Y51aQtj+zcahSnRWtOVeyYyhqV4FyQKeRRAsQG2Kt4I
         QTNo48K+6a2VeQqoUPQQRa+oeN9nG6t49BdRy5rxSXAEhF4pDpXd4hN4bJsrbbZ9BuTT
         9lC5/Irb/5pDXdS5DSGVOU4FZBU6Vt6eyg8TN1Pmxg2z2z880BpZa9cDU+X0Fh4EnbAZ
         3lnA==
X-Forwarded-Encrypted: i=1; AJvYcCU79OI7t9MQy0PB5CusL3xWKMZf48WQDO+/XgCS9GA8kGAF8rPWLf2OUgkth4z1oicyEI61BuM+TfODOktL@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHxwrMkk/ydIGfbW2i1TeZdjadnt27+b9T2UL8D3BYZ2+6sF6
	6Fvpwzhs4T3zBXpxJzK3mZTEVD6dw0U1HmjxDwpVm9Ul/sxNSn3Z9RUC
X-Gm-Gg: AY/fxX5UNt2BsYmwYb0qcIe4CJTPZoMcMd5sEdljVQUQ9m1yB7JdZPNp0ODYr3ZYCZX
	/l5b8gUgnLYqwBL+5XrNVIQhgTLhgDCQgBilCj/03GWPGPXOsMGhdGE3KzgMtRAjtGmYTti05sC
	QOF8rasDUor7PdurwgzEWbnoxy4vHPdP6c2B2GCkDLwAS0Qq/y2Ub1LfG8Nk1hapXVeABTIWZxX
	K+0WN42Grr5wCs1B+YEGEPYhTj59AirGZj1R3cug+JsOM2hp/64bj2P8ZbX/OboTpmDMPNob2Gk
	rwIMVOUfEf216YHsuOmSVtFHTChOfZi4ZZ51+Nqm98ZMkMNO6Q+tjPObK/fopl7gGJhv85fFtNr
	kccv8xiZ3xtvDJ9bBqGb2dtCyxTuZMhjolTnAsldX1Yukh1OAq+Gi+Fx+sIkEL6lQGng8CYwMqp
	tgLFFKFLxmmIMwNrimCtaCf1t6cAMakmIboWrdGMchWUcntmIqnabw699Eh87zUs6znNFn8/fsQ
	lC4kExGzLFh3woxmZs0yW09P0rn
X-Google-Smtp-Source: AGHT+IFrIBWXB2bXHe1+4R7Z+71FLciua4PtqTKrSkfV7kRAhsQ1iy96n4rmYXw/EaRBzDta+VB3iw==
X-Received: by 2002:a05:690e:bcc:b0:645:5b0e:c91b with SMTP id 956f58d0204a3-6466a8321bcmr1437733d50.14.1766118886872;
        Thu, 18 Dec 2025 20:34:46 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:45 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] remoteproc: qcom_q6v5_wcss: use bulk clk API for q6 clocks in QCS404
Date: Thu, 18 Dec 2025 22:34:17 -0600
Message-ID: <20251219043425.888585-9-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Five of the clocks on QCS404 are consistently enabled and disabled
together. Use the bulk clock API to get and enable them. They are
enabled after the Q6 reset is deasserted, implying they are required
by the Q6. Store them in q6_clks.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 99 ++++++++---------------------
 1 file changed, 28 insertions(+), 71 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index bcfd79b12fde9..d510769519966 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -126,14 +126,9 @@ struct q6v5_wcss {
 	u32 halt_nc;
 
 	struct clk *xo;
-	struct clk *ahbfabric_cbcr_clk;
 	struct clk *gcc_abhs_cbcr;
 	struct clk *gcc_axim_cbcr;
-	struct clk *lcc_csr_cbcr;
 	struct clk *ahbs_cbcr;
-	struct clk *tcm_slave_cbcr;
-	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_axim_cbcr;
 	struct clk *lcc_bcr_sleep;
 	struct clk_bulk_data *clks;
 	/* clocks that must be started before the Q6 is booted */
@@ -416,35 +411,16 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	/* Remove reset to the WCNSS QDSP6SS */
 	reset_control_deassert(wcss->wcss_q6_bcr_reset);
 
-	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
-	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
-	if (ret)
+	ret = clk_bulk_prepare_enable(wcss->num_q6_clks, wcss->q6_clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable q6 clocks, err=%d\n", ret);
 		goto disable_gcc_abhs_cbcr_clk;
-
-	/* Enable the LCCCSR CBC clock, Q6SSTOP_Q6SSTOP_LCC_CSR_CBCR clock */
-	ret = clk_prepare_enable(wcss->lcc_csr_cbcr);
-	if (ret)
-		goto disable_ahbfabric_cbcr_clk;
+	};
 
 	/* Enable the Q6AHBS CBC, Q6SSTOP_Q6SS_AHBS_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbs_cbcr);
 	if (ret)
-		goto disable_csr_cbcr_clk;
-
-	/* Enable the TCM slave CBC, Q6SSTOP_Q6SS_TCM_SLAVE_CBCR clock */
-	ret = clk_prepare_enable(wcss->tcm_slave_cbcr);
-	if (ret)
-		goto disable_ahbs_cbcr_clk;
-
-	/* Enable the Q6SS AHB master CBC, Q6SSTOP_Q6SS_AHBM_CBCR clock */
-	ret = clk_prepare_enable(wcss->qdsp6ss_abhm_cbcr);
-	if (ret)
-		goto disable_tcm_slave_cbcr_clk;
-
-	/* Enable the Q6SS AXI master CBC, Q6SSTOP_Q6SS_AXIM_CBCR clock */
-	ret = clk_prepare_enable(wcss->qdsp6ss_axim_cbcr);
-	if (ret)
-		goto disable_abhm_cbcr_clk;
+		goto disable_q6_clks;
 
 	/* Enable the Q6SS XO CBC */
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
@@ -527,17 +503,9 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
 	val &= ~Q6SS_CLK_ENABLE;
 	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
-	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
-disable_abhm_cbcr_clk:
-	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
-disable_tcm_slave_cbcr_clk:
-	clk_disable_unprepare(wcss->tcm_slave_cbcr);
-disable_ahbs_cbcr_clk:
 	clk_disable_unprepare(wcss->ahbs_cbcr);
-disable_csr_cbcr_clk:
-	clk_disable_unprepare(wcss->lcc_csr_cbcr);
-disable_ahbfabric_cbcr_clk:
-	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+disable_q6_clks:
+	clk_bulk_disable_unprepare(wcss->num_q6_clks, wcss->q6_clks);
 disable_gcc_abhs_cbcr_clk:
 	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
 
@@ -655,11 +623,7 @@ static int q6v5_qcs404_wcss_shutdown(struct q6v5_wcss *wcss)
 	val &= ~Q6SS_BHS_ON;
 	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
 
-	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
-	clk_disable_unprepare(wcss->lcc_csr_cbcr);
-	clk_disable_unprepare(wcss->tcm_slave_cbcr);
-	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
-	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+	clk_bulk_disable_unprepare(wcss->num_q6_clks, wcss->q6_clks);
 
 	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
 	val &= ~BIT(0);
@@ -1099,6 +1063,20 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 {
+	static const char *const q6_clks[] = {
+		"lcc_ahbfabric_cbc", "tcsr_lcc_cbc", "lcc_tcm_slave_cbc",
+		"lcc_abhm_cbc", "lcc_axim_cbc" };
+	int ret, i;
+
+	wcss->num_q6_clks = ARRAY_SIZE(q6_clks);
+	wcss->q6_clks = devm_kcalloc(wcss->dev, wcss->num_q6_clks,
+				       sizeof(*wcss->q6_clks), GFP_KERNEL);
+	if (!wcss->q6_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < wcss->num_q6_clks; i++)
+		wcss->q6_clks[i].id = q6_clks[i];
+
 	wcss->xo = devm_clk_get(wcss->dev, "xo");
 	if (IS_ERR(wcss->xo))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->xo),
@@ -1114,44 +1092,23 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->gcc_axim_cbcr),
 				     "failed to get gcc axim clock\n");
 
-	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
-						"lcc_ahbfabric_cbc");
-	if (IS_ERR(wcss->ahbfabric_cbcr_clk))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbfabric_cbcr_clk),
-				     "failed to get ahbfabric clock\n");
-
-	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "tcsr_lcc_cbc");
-	if (IS_ERR(wcss->lcc_csr_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_csr_cbcr),
-				     "failed to get csr cbcr clk\n");
-
 	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
 				       "lcc_abhs_cbc");
 	if (IS_ERR(wcss->ahbs_cbcr))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbs_cbcr),
 				     "failed to get ahbs_cbcr clk\n");
 
-	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
-					    "lcc_tcm_slave_cbc");
-	if (IS_ERR(wcss->tcm_slave_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->tcm_slave_cbcr),
-				     "failed to get tcm cbcr clk\n");
-
-	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "lcc_abhm_cbc");
-	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_abhm_cbcr),
-				     "failed to get abhm cbcr clk\n");
-
-	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "lcc_axim_cbc");
-	if (IS_ERR(wcss->qdsp6ss_axim_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_axim_cbcr),
-				     "failed to get axim cbcr clk\n");
-
 	wcss->lcc_bcr_sleep = devm_clk_get(wcss->dev, "lcc_bcr_sleep");
 	if (IS_ERR(wcss->lcc_bcr_sleep))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_bcr_sleep),
 				     "failed to get bcr cbcr clk\n");
 
+	ret = devm_clk_bulk_get(wcss->dev, wcss->num_q6_clks, wcss->q6_clks);
+	if (ret < 0) {
+		return dev_err_probe(wcss->dev, ret,
+				     "failed to bulk get q6 clocks\n");
+	}
+
 	return 0;
 }
 
-- 
2.45.1



Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CC67747CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbjHHTTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbjHHTTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:19:19 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0ED3F3B8
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:42:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe0eb0ca75so9254580e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512953; x=1692117753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiT0zdP9RcVMfv6FtcplHy2nGhazgGSIvo5WbDUA63E=;
        b=fzBnY0baY8lceXZYdxpfbqzc1Ub40DRvwbnL8eSyhmLjIkiJxgiNzkQlfmrjKIBRpY
         oALekVIlpX/4vt/rx5DnpeA7zYY4K62Pw/TnoDdpxDBH+1oQmOhcM8zRjY8Nzu5tbhGT
         8jS043QKZyH98w+hXi4idMS9p82KKSCQGTCJBM0oj21EqtS4zKJDUyHxYhYjdOhs5gAV
         QynaNJkY7mZvI9WTWFpDAvbPp/Pp5FJY/8lm3xni1D2qZn6pv4stDQQujW+jzkA2rEXx
         /49N9zMt+o/GmC6unvQaS7U30KPmLaXp77O6bFUt32mLLdBkrlRCTUFi4fKoUCWnlP/+
         JyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512953; x=1692117753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiT0zdP9RcVMfv6FtcplHy2nGhazgGSIvo5WbDUA63E=;
        b=Wn7Qw+5biuA+UlWuqvga/J3QPxuluOHukwW8fHD+XMBifpggWQp6dRb3++A17Tp+2h
         am21Gj59ly4i6/rS3MKC93Rcr1N+HILLa6IzrpaMdzplhNdcyz2Xa91sOSiua9a4OPRV
         z+9Dwjpm4yZ8FT+1gZX628cQIsDIafFh0VuECuStSLgkXKyscVdSaNnTa+uzFAMBUhiJ
         m9gYySfwnrDBNV7VoWXeJt6/kpq/atQ0gUVCWl854WlK17Jwv9IxgBbYgfsd0iQUKeIo
         EwdcqsTqC1mPs/yE8xJ29nAVviq4AXBZ9uNPl4T814nYY0cfSghcGKcAMufS9uHpNiOH
         JayQ==
X-Gm-Message-State: AOJu0YwWghl4W/3Trg1o4TNqf/st7DAK4BWGAQWxSQmdn64AQTumAgHr
        Q3vbBJ1oKWlAxDD2ZujcitRCkbW3o6RbU7F++hk=
X-Google-Smtp-Source: AGHT+IF7FsNW05tchzFLg08e24E0C6uLzAZLbxhdVKl8LRAWeyHXHm2QOMKSVvO0FNrWGNxEl3ClCQ==
X-Received: by 2002:ac2:4e88:0:b0:4fe:ecd:494f with SMTP id o8-20020ac24e88000000b004fe0ecd494fmr6969822lfr.33.1691495018085;
        Tue, 08 Aug 2023 04:43:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:33 +0200
Subject: [PATCH v3 02/10] interconnect: qcom: icc-rpm: Separate out clock
 rate calulcations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-2-dee684d6cdd2@linaro.org>
References: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=2930;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=s1ZE4XHCfs1j0oOrUS6GpKQLQgPUfnNi7YQdZMNs0uA=;
 b=BNLRtVUx+or/VTf6c67Fn8JQREAUM7KBMxBUw0bidTpwWnVF2uG46h/vQ7rWTJJxXrCyqlcrL
 IOWQVTe2E5gCEsjBZnt/i0WfG9lrZKz3P7zP5BydAdzwZBurxpKPb6a
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for also setting per-node clock rates, separate out the
logic that computes it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 53 +++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 8b02aa8aa96a..8c1bfd65d774 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -291,6 +291,32 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 	return 0;
 }
 
+static u64 qcom_icc_calc_rate(struct qcom_icc_provider *qp, struct qcom_icc_node *qn, int ctx)
+{
+	u64 agg_avg_rate, agg_peak_rate, agg_rate;
+
+	if (qn->channels)
+		agg_avg_rate = div_u64(qn->sum_avg[ctx], qn->channels);
+	else
+		agg_avg_rate = qn->sum_avg[ctx];
+
+	if (qp->ab_coeff) {
+		agg_avg_rate = agg_avg_rate * qp->ab_coeff;
+		agg_avg_rate = div_u64(agg_avg_rate, 100);
+	}
+
+	if (qp->ib_coeff) {
+		agg_peak_rate = qn->max_peak[ctx] * 100;
+		agg_peak_rate = div_u64(qn->max_peak[ctx], qp->ib_coeff);
+	} else {
+		agg_peak_rate = qn->max_peak[ctx];
+	}
+
+	agg_rate = max_t(u64, agg_avg_rate, agg_peak_rate);
+
+	return div_u64(agg_rate, qn->buswidth);
+}
+
 /**
  * qcom_icc_bus_aggregate - calculate bus clock rates by traversing all nodes
  * @provider: generic interconnect provider
@@ -299,10 +325,9 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_rate)
 {
 	struct qcom_icc_provider *qp = to_qcom_provider(provider);
-	u64 agg_avg_rate, agg_peak_rate, agg_rate;
 	struct qcom_icc_node *qn;
 	struct icc_node *node;
-	int i;
+	int ctx;
 
 	/*
 	 * Iterate nodes on the provider, aggregate bandwidth requests for
@@ -310,27 +335,9 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_r
 	 */
 	list_for_each_entry(node, &provider->nodes, node_list) {
 		qn = node->data;
-		for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
-			if (qn->channels)
-				agg_avg_rate = div_u64(qn->sum_avg[i], qn->channels);
-			else
-				agg_avg_rate = qn->sum_avg[i];
-
-			if (qp->ab_coeff) {
-				agg_avg_rate = agg_avg_rate * qp->ab_coeff;
-				agg_avg_rate = div_u64(agg_avg_rate, 100);
-			}
-
-			if (qp->ib_coeff) {
-				agg_peak_rate = qn->max_peak[i] * 100;
-				agg_peak_rate = div_u64(qn->max_peak[i], qp->ib_coeff);
-			} else {
-				agg_peak_rate = qn->max_peak[i];
-			}
-
-			agg_rate = max_t(u64, agg_avg_rate, agg_peak_rate);
-
-			agg_clk_rate[i] = max_t(u64, agg_clk_rate[i], agg_rate);
+		for (ctx = 0; ctx < QCOM_SMD_RPM_STATE_NUM; ctx++) {
+			agg_clk_rate[ctx] = max_t(u64, agg_clk_rate[ctx],
+						  qcom_icc_calc_rate(qp, qn, ctx));
 		}
 	}
 }

-- 
2.41.0


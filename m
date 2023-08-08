Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C4A774D35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 23:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjHHVnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 17:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjHHVnB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 17:43:01 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F16460EA
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:46:38 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5217ad95029so7604451a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513195; x=1692117995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eF8Rl4Nrv0n3qIaC6c+71IiCQoHSuRD0COK5QFMyP0=;
        b=c68jEkCNYfYXcgIwvREIXOKI/tpGiTPTIPWA+gg+KTQOTXijAoMwi+EKInL8eqAwuM
         Zz2U6TasT0nJgHH59vrbxYjnPx4Gs3NEFK6pL4EgVvBmKd3yhxFV4Hr9t1EXxAsPS3HT
         2uB5V+bjWAEBBKhm9DQCCUgVxKs0i5Fc3Z8k3skqDVIi9xbqwPwbuupUkrDkoHudVFgT
         j35D4kqF+0EvBrabmF87f4Q/fcpfieLhUE1lmKQMgRH8w6UDyjihkdlBM2eivZrRiaEY
         N/AesbrcmpsTpIWaQEHyP2VvzXRRzCxEqqMZgk2M89dJI8GzCDHt43fhGTK8FW6ssO+V
         bkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513195; x=1692117995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eF8Rl4Nrv0n3qIaC6c+71IiCQoHSuRD0COK5QFMyP0=;
        b=gKoOdSSvYJU/U9FqoIRybuWqKaw1KZDdoOTVI3b/SEBPpLbqHf1GfcTY5tjG7UMs6A
         IqSmuRadVr/u2fKTfZAGmiP3TlKxXk543oLxZ3VHCsJd8RggP4WqKUMCypHuqdIOInbj
         P/r8xoxGqsC1b23nPBQAuoY5hEsNZ1+H44C8HR/yp9en2H6Bb3Hv1LT8CSyqEXvvSCq6
         Qgw36DpkpkTlvdS+RaAUGbFtE1d531fJuuUaGukgmqz4TFBGwOaGy4XY6qF35GfiehXz
         FlFsEaAbelFRhsW5jfD5pjC2GsZ1AX2R2OHVdz+BvO+KKOKbir8NgR1nsDkFFJ1uXQnu
         s9JQ==
X-Gm-Message-State: AOJu0Yzk7b5LP02v6PfZpFDO6eP5waalDP5u7eYEcODSc1cWuEGgUL4Q
        VPE+qh9h2VwhRTbGvsqpltFAhlVaKiIc21g9cfI=
X-Google-Smtp-Source: AGHT+IEyDsRs/Zlk81B70tQzJ2VvCAwqqLNOe/n6dbEVxMV8oUWml9e5yDCmumsusfydc9mP+oYysw==
X-Received: by 2002:a05:6512:1103:b0:4fe:279b:8a02 with SMTP id l3-20020a056512110300b004fe279b8a02mr9262600lfg.67.1691495019651;
        Tue, 08 Aug 2023 04:43:39 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:34 +0200
Subject: [PATCH v3 03/10] interconnect: qcom: icc-rpm: Let nodes drive
 their own bus clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-3-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=3111;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=8JDjpAr7N9o+Ldc42lWfgA5mVZfE1TEXPiQOh91fLVQ=;
 b=YVAatYh7xnAWvBz8CbkBbjpEVXXX/ocZeGoh4gETy6ScPffEddtOjrccwL7B7bBTyuuFZ4fhm
 mJZhqrcP3X9CGIZcoGsq1+Yz4R+eRQNJc8oAC2ZeWOd3m7gnL20DT0x
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

If this hardware couldn't get messier, some nodes are supposed to drive
their own bus clock.. Presumably to connect to some intermediate
interface between the node itself and the bus it's (supposed to be)
connected to.

Expand the node struct with the necessary data and hook up the
allocations & calculations.

Note that the node-specific AB/IB coefficients contribute (by design)
to both the node-level and the bus-level aggregation.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 27 +++++++++++++++++++++++++++
 drivers/interconnect/qcom/icc-rpm.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 8c1bfd65d774..1d3af4e9ead8 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -414,6 +414,33 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 		qp->bus_clk_rate[QCOM_SMD_RPM_SLEEP_STATE] = sleep_rate;
 	}
 
+	/* Handle the node-specific clock */
+	if (!src_qn->bus_clk_desc)
+		return 0;
+
+	active_rate = qcom_icc_calc_rate(qp, src_qn, QCOM_SMD_RPM_ACTIVE_STATE);
+	sleep_rate = qcom_icc_calc_rate(qp, src_qn, QCOM_SMD_RPM_SLEEP_STATE);
+
+	if (active_rate != src_qn->bus_clk_rate[QCOM_SMD_RPM_ACTIVE_STATE]) {
+		ret = qcom_icc_rpm_set_bus_rate(src_qn->bus_clk_desc, QCOM_SMD_RPM_ACTIVE_STATE,
+						active_rate);
+		if (ret)
+			return ret;
+
+		/* Cache the rate after we've successfully committed it to RPM */
+		src_qn->bus_clk_rate[QCOM_SMD_RPM_ACTIVE_STATE] = active_rate;
+	}
+
+	if (sleep_rate != src_qn->bus_clk_rate[QCOM_SMD_RPM_SLEEP_STATE]) {
+		ret = qcom_icc_rpm_set_bus_rate(src_qn->bus_clk_desc, QCOM_SMD_RPM_SLEEP_STATE,
+						sleep_rate);
+		if (ret)
+			return ret;
+
+		/* Cache the rate after we've successfully committed it to RPM */
+		src_qn->bus_clk_rate[QCOM_SMD_RPM_SLEEP_STATE] = sleep_rate;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 5e7d6a4fd2f3..f9ef16f570be 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -97,6 +97,7 @@ struct qcom_icc_qos {
  * @num_links: the total number of @links
  * @channels: number of channels at this node (e.g. DDR channels)
  * @buswidth: width of the interconnect between a node and the bus (bytes)
+ * @bus_clk_desc: a pointer to a rpm_clk_resource description of bus clocks
  * @sum_avg: current sum aggregate value of all avg bw requests
  * @max_peak: current max aggregate value of all peak bw requests
  * @mas_rpm_id:	RPM id for devices that are bus masters
@@ -110,11 +111,13 @@ struct qcom_icc_node {
 	u16 num_links;
 	u16 channels;
 	u16 buswidth;
+	const struct rpm_clk_resource *bus_clk_desc;
 	u64 sum_avg[QCOM_SMD_RPM_STATE_NUM];
 	u64 max_peak[QCOM_SMD_RPM_STATE_NUM];
 	int mas_rpm_id;
 	int slv_rpm_id;
 	struct qcom_icc_qos qos;
+	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
 };
 
 struct qcom_icc_desc {

-- 
2.41.0


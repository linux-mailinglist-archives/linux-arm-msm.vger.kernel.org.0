Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DBA3B0E9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhFVUYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhFVUYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:24:30 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EBBC061756;
        Tue, 22 Jun 2021 13:22:13 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id s6so431324edu.10;
        Tue, 22 Jun 2021 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7CkQ5XI5lfr3Wk7mt2wQ2K0eeELgwrVd4jRvN44POk=;
        b=nd2d9l1UIRPIsdN4bMPP68cBw0VAu9BIdJpC9Z5ngGEamN1OZ5cIABcFtJH4Q6dvmL
         COOlkZZazbcb2bEQlbgP/WwVnlGTNvB1jAxU6YcnlHvY4boOaUpY+O1a67q9L/CIPpGv
         otRNecTFGZYbc6X+1cDrt5RnkjB+0vMUlvyVObAvPqe4qc9UobEBTuTXPLxTgiUPg05d
         ltSnWpZ50UVte6O2vAO0BBx6l7QNuGce8AfbnRqxPFDNg0Da8gMhRR3zKBnKpNG1RxFo
         U2+oaxJIPrODzQzmorhLbABz467H15aoZien4/+97rQS+dyEoUJGrZn4lEPj70v7Lr3/
         vZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7CkQ5XI5lfr3Wk7mt2wQ2K0eeELgwrVd4jRvN44POk=;
        b=SLb+u2swj9Rr18i3GD+1xRcrnUUuJhOcdZFc/2519WJRnv8PzAlhKgUAMZM/Ku0Sp5
         RuwOX/HgIBnVEcaVRE+zQc4WHG11DQOW39iNWg/riBTkwNhBNwmM0mT4qndqqUY0ggw8
         MLUJBkBqj2rj6BU+Bu0N7ZKbXAEU+HWjsVqyJR8ggJknb7g5rChn1lkvqhRuIsV22X8P
         l9ZKWUNpkZzXjjV0KoZubz/qZtcQs47wAmgqcCfQWFqUiwvTZh7Or8NshWwLULfO9N+H
         5Ut/UDcta+uaCcp4KLxicWmtBBKjHPOw9d4iyCLWhj3pCcylCosXxRxBt6/UaOtDycYU
         Xyvw==
X-Gm-Message-State: AOAM530V2csXEgqZ+P03XqB2YnDmYMNQXQPi7/EnRg7/9e4SLjAoQJ33
        zazlJaTE4xWNp0rv/o0km/o=
X-Google-Smtp-Source: ABdhPJxOfAYbf1ux/FSO9JWQ6cApIlSed1m93uOz6zt/VykfjCnyUgiSRflbHNdLc3mycRe9YKcU8g==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr7483737edq.22.1624393331667;
        Tue, 22 Jun 2021 13:22:11 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id jx9sm4087818ejc.110.2021.06.22.13.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:22:11 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 5/5] drivers: soc: qcom: rpmpd: Add SM6115 RPM Power Domains
Date:   Tue, 22 Jun 2021 23:21:56 +0300
Message-Id: <20210622202156.546718-6-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622202156.546718-1-iskren.chernev@gmail.com>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM6115 (and the compatible SM4250) have 4 rpm power domains, ported
from downstream DT.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/soc/qcom/rpmpd.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 0b532a892d60..290b2f9db4e4 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -346,6 +346,33 @@ static const struct rpmpd_desc sdm660_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO,
 };
 
+/* sm6115 and sm4250 RPM Power domains */
+DEFINE_RPMPD_PAIR(sm6115, vddcx, vddcx_ao, RWCX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sm6115, vddcx_vfl, RWCX, 0);
+
+DEFINE_RPMPD_PAIR(sm6115, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sm6115, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(sm6115, vdd_lpi_cx, RWLC, 0);
+DEFINE_RPMPD_LEVEL(sm6115, vdd_lpi_mx, RWLM, 0);
+
+static struct rpmpd *sm6115_rpmpds[] = {
+	[SM6115_VDDCX] =		&sm6115_vddcx,
+	[SM6115_VDDCX_AO] =		&sm6115_vddcx_ao,
+	[SM6115_VDDCX_VFL] =		&sm6115_vddcx_vfl,
+	[SM6115_VDDMX] =		&sm6115_vddmx,
+	[SM6115_VDDMX_AO] =		&sm6115_vddmx_ao,
+	[SM6115_VDDMX_VFL] =		&sm6115_vddmx_vfl,
+	[SM6115_VDD_LPI_CX] =		&sm6115_vdd_lpi_cx,
+	[SM6115_VDD_LPI_MX] =		&sm6115_vdd_lpi_mx,
+};
+
+static const struct rpmpd_desc sm6115_desc = {
+	.rpmpds = sm6115_rpmpds,
+	.num_pds = ARRAY_SIZE(sm6115_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
@@ -356,6 +383,8 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
+	{ .compatible = "qcom,sm4250-rpmpd", .data = &sm6115_desc },
+	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmpd_match_table);
-- 
2.31.1


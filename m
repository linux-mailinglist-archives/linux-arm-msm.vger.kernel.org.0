Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692D97740D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbjHHRLM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbjHHRKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:10:44 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1437C1B534
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:04:25 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so4376276f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510660; x=1692115460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FqN2Sq9j6IVseScqHZxUGnTrukPTjl33EKA90GBaFU=;
        b=vSCrTXMty5il0OzXv/Nii/Tyx7mgADF/jRXDqHrwdgdKSEaRHvAzlYafuW56kVnHBJ
         0ybcRZENfWJX6EF7+lj3aKdadQWFK7CgiPphhWt+1SrWc5faoaLnwhdnhQapbuSv+gtF
         9Vhd0j6vINKenxfruoGjQkn55fLmKMcFvmZZLjCZk/OLTvbNcLagX5X7yxmrEVsMWttS
         OpYpWpSOMwHv+krBf0jc1unml1KboQWBLRKxBSdEK7tUjbf0QyyOvlFREH+pKacS5+KW
         Faqk4es3gT+MAONk0eIYOm9GYjvZXyQnif6Ro/gBM/iUH93JHOsoLKuREEvT/A2dFIox
         HG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510660; x=1692115460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FqN2Sq9j6IVseScqHZxUGnTrukPTjl33EKA90GBaFU=;
        b=M3z7kIVgXcZqrrmIFTkvXJR8VbJoPK29i45Tv9Nei3kKFvC6eCXwEF2WdXBBVAql64
         C8AKl0uwn65nzk3KPPIOrKrq+G3SoSL23qH9LEuSg0zL+CmrfO9ZZ1WG4LvFaPkhT2ne
         fhP9FVtT5NSITD9oyZzAyiJ+tF/z9rHxxAH3ucjSEIzc7cbdmPCIDuR/sSvMY9rNX/l1
         N+28P7K2LE30zpG4EVDKuQyXScarrp3B3+KX+Erztp/NLEyG8CXc3Be335/5/NBeEpeW
         Of8sjX6uRn1iE9kGAPO7cdR2VTrVDr2og1qDvUPH43444efewi6LHLJD3npIaVAJSP5s
         cTlg==
X-Gm-Message-State: AOJu0Yw4kucC8MeXHwSzSPTDkKynsaLHMkNWmdZa67ptA/aoZcagE64d
        4ccMR+jY5wJ60d4LUk+6GYkD2cEdcENU1DKApZg=
X-Google-Smtp-Source: AGHT+IFjkaP4oTfJ0Ri8v7HT5s6bsxs5Tqj1AvIF9Kb+lyIVxIbcmy/tMf8ddbWT77OvdXJajWXRUA==
X-Received: by 2002:a05:6512:1598:b0:4fb:8bea:f5f6 with SMTP id bp24-20020a056512159800b004fb8beaf5f6mr10188044lfb.34.1691495024243;
        Tue, 08 Aug 2023 04:43:44 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:43 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:38 +0200
Subject: [PATCH v3 07/10] interconnect: qcom: qcm2290: Update EBI channel
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-7-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1320;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+JCeGo0Q7sjfDzWjkGg+7ykqgtb42uWuVVMLb5STXRI=;
 b=kP/Ep84xH1Hu5VyTi/X5EdDQntTJIZBSHWF06vlxwCDpZi0bIpkqQ5Da38SWKULLxX6Ar2wu5
 ZB0IYGCkYwDBC4GBGBIEMmpmnalm/DCz4COpfhANKRfGNaIkAba4j/2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 can support two memory configurations: single-channel, 32-bit
wide LPDDR3 @ up to 933MHz (bus clock) or dual-channel, 16-bit wide
LPDDR4X @ up to 1804 MHz. The interconnect driver in its current form
seems to gravitate towards the first one, however there are no LPDDR3-
equipped boards upstream and we still don't have a great way to discern
the DDR generations on the kernel side.

To make DDR scaling possible on the only currently-supported 2290
board, stick with the LPDDR4X config by default. The side effect on any
potential LPDDR3 board would be that the requested bus clock rate is
too high (but still capped to the firmware-configured FMAX).

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index 42fa01c66e73..3bd7ad67c569 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -678,7 +678,8 @@ static struct qcom_icc_node mas_gfx3d = {
 static struct qcom_icc_node slv_ebi1 = {
 	.name = "slv_ebi1",
 	.id = QCM2290_SLAVE_EBI1,
-	.buswidth = 8,
+	.buswidth = 4,
+	.channels = 2,
 	.mas_rpm_id = -1,
 	.slv_rpm_id = 0,
 };

-- 
2.41.0


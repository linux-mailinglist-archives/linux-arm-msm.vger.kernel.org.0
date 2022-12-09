Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 536EE6486CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiLIQtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiLIQtC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:02 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F295093A76
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:00 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id q7so5498688ljp.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AinftmkjJQ8pNGBIFGCctCkBud1cs1e176Qi1VgGv64=;
        b=rmtLigaHqRrsptldNKLKJhZZad/0KL5hyBh9Dwn8ABNEvYHtf/WcEo2XGi73ko5X2a
         EJlE11UWwS24AUn1rgwEBSo95tsxGFm6lMirqDUlQYDg9Z23djQCYozvws9bVP/J8BQr
         9FxmnSuu0EeSiw0TDSQ2vVvt7FKt6QIzrbuZCvYr/29JYEAVeGNdiMBkMNZ8++neKpTV
         4fFLronD+3B7tFFC82IPaXGNeIc2Mc7hVWydglzJK6ErG4vNVdV4OqTCuNSI+hirneJi
         YgK3sxGoxDB7mwIar6gpOEcsDJlUY5UdynllVIfTqFSyd6M1HLlVCuj9Nmz93KGdNIYZ
         2OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AinftmkjJQ8pNGBIFGCctCkBud1cs1e176Qi1VgGv64=;
        b=5+sCmfT520MPIUVQ4v8rfTKV18Zj7vX8pxTjk4mIlP9D4DSAxfZPesHzP1eCEumLa4
         XDceYo2krzHOhAeHAzK+iA902rE3enGUG7DSiJYz1f9Dq79Q1Iy3hBPwvQ8WPDAjgYFJ
         tDB8ABygX0Oi//XbJIEq7kQXyxMYezTpaKLAcR+tdXgMW2ZpBUpCZLfaFr5R02Hkch/1
         ApAjx00XvIOGGioyo6eR9dvVDzHRuyVPArV186mcJWqhBwqBZ7L/sITrLUpR6pcy5YKh
         qvjeu9HJXrtWyi6/3cQqjxwEg9Y0odgNbCmaw/yIS7BhGsT2YatmFdjZiez06ym3Iu4t
         nMQQ==
X-Gm-Message-State: ANoB5pnHq6TTTpQe8Lp5b8GpgmJcfz+7AMZLos5i5evKvYxImLP9lsj0
        Ky0vipIoYlYi/10WA7oxlBOWTQ==
X-Google-Smtp-Source: AA0mqf4MBVfufrMHJUd4sAi/vyfTz3GKd2f6yoNS42PrGa+EWsAoW1YjWYLbSi63k4phpMEQsw8f6Q==
X-Received: by 2002:a2e:9197:0:b0:279:dc21:7e4e with SMTP id f23-20020a2e9197000000b00279dc217e4emr1810961ljg.46.1670604539334;
        Fri, 09 Dec 2022 08:48:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:48:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 04/19] clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290 clocks
Date:   Fri,  9 Dec 2022 18:48:40 +0200
Message-Id: <20221209164855.128798-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.

Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index ccc54913eca5..31ef6345ff01 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1168,11 +1168,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
 
-DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
 		   QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
-		   QCOM_SMD_RPM_MEM_CLK, 2);
 
 static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
@@ -1203,14 +1200,14 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
+	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
 	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
 	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
 	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
 	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
-	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
 	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
 	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
 };
-- 
2.35.1


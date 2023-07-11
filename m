Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8FE74EF10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbjGKMgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjGKMgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:36:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CE0E69
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:35:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso9071496e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689078897; x=1691670897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qEI9ih7CsEfqqcZVsPdCla2s3zGk1zpIvdrNZp7GUo=;
        b=T30oeJJnY8GGrZ07x8RHOSPrhT1eZRGx64kcqw3Kx1AUnb36d9wqfF2qQ6xaJDnCFW
         hiXgdEW/RAJmwEISTvTNf7lz9FSrpV8Nty6t4oe42p+6UEKfroojNXBGbbNuRIN0Rb/m
         b0p7QcnEF6nZB/AfCJccqg7sFZca7bV0Pl/WhBqVn+bptVksmdTttA8/CAZ9YbXTubXR
         WrWYeGIw0edxDy9szkGSTunuluw8mG2wsvyQDv6y3U1WxH++s7c1P1uM2UX7yaVZ/q42
         Enbkj/pTIrXdyHUScmgZv85/zKWHw2dDhpRSckh8Kcyejrp6SZtA9y7Ktu0Y2ezVfa9Z
         gS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689078897; x=1691670897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qEI9ih7CsEfqqcZVsPdCla2s3zGk1zpIvdrNZp7GUo=;
        b=hErZ8AmvjjDQh2+OslKZRtV/TZMEK2EErQgzkvJQevJfRUU1Ki0LC3mo40v13FUN6z
         shU9Msm3X6klL4fOfQXAK/AdZBhZ2W9bBldLm7i7nyNrR7Ozml4/COvWjHg2yH9agjD8
         hKiNjKiGElraKJNb530XR38o94ugFn5BFQP0gBllx6Z0chyaq4tiIzmHMEdhLIWPqXG4
         eeCtKhT90UhCPOc3R+1+bjEKDaGRcUvBpSYeAP8/DA+6xKIdmAj5ZK7C0RYfGFzyWGL3
         OxsSu31r+q1DIsBpbB21fQiU9NwQURe31QW85ThpnM/CZxBygHblQBTM1uj3suQsrgwq
         Ydew==
X-Gm-Message-State: ABy/qLYS3q00xsqhKWRKtQbrkGrvfQqUVCSk48N9X7+mYUK4mGRFaNFs
        8gjGbXHgS4W0udDtqtyFhcmGrlzwNwlk+WUw/brpfQ==
X-Google-Smtp-Source: APBJJlERwY5Ah/kFYLm9KWUQ1ixR3SDh15gYAU7TZOHqrhoESjYXLBqCwASCR5Xt40UjYu3EHMbB/A==
X-Received: by 2002:a2e:9f4d:0:b0:2b6:e151:791e with SMTP id v13-20020a2e9f4d000000b002b6e151791emr13433971ljk.43.1689077973594;
        Tue, 11 Jul 2023 05:19:33 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:33 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:50 +0200
Subject: [PATCH 51/53] interconnect: qcom: sm8450: Point display paths to
 the display RSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-51-b223bd2ac8dd@linaro.org>
References: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
In-Reply-To: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=2103;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GAWOUV4QJe60q6M3sv3YLGxilMGxFFgLlCxXc4BU++I=;
 b=n6mHwI5Knlo8QwAZ9UuQJZ5TSMk5uicF8dPrneNhYlmJUFzK9gguKI0KQoyfgn83kx8zxL6qu
 BLXqqqUvr/lAd5PsnBNC3JILtU6yS5lpYZClOMClAFtFiipSLnQ2MVw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The _DISP paths are expected to go through the DISP RSC. Point them to the
correct place.

Fixes: fafc114a468e ("interconnect: qcom: Add SM8450 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm8450.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8450.c b/drivers/interconnect/qcom/sm8450.c
index 989ae24f2be9..6f42b1d693b4 100644
--- a/drivers/interconnect/qcom/sm8450.c
+++ b/drivers/interconnect/qcom/sm8450.c
@@ -1517,21 +1517,21 @@ static struct qcom_icc_bcm bcm_sn7 = {
 static struct qcom_icc_bcm bcm_acv_disp = {
 	.name = "ACV",
 	.enable_mask = 0x1,
-	.voter_idx = ICC_BCM_VOTER_APPS,
+	.voter_idx = ICC_BCM_VOTER_DISP,
 	.num_nodes = 1,
 	.nodes = { &ebi_disp },
 };
 
 static struct qcom_icc_bcm bcm_mc0_disp = {
 	.name = "MC0",
-	.voter_idx = ICC_BCM_VOTER_APPS,
+	.voter_idx = ICC_BCM_VOTER_DISP,
 	.num_nodes = 1,
 	.nodes = { &ebi_disp },
 };
 
 static struct qcom_icc_bcm bcm_mm0_disp = {
 	.name = "MM0",
-	.voter_idx = ICC_BCM_VOTER_APPS,
+	.voter_idx = ICC_BCM_VOTER_DISP,
 	.num_nodes = 1,
 	.nodes = { &qns_mem_noc_hf_disp },
 };
@@ -1539,7 +1539,7 @@ static struct qcom_icc_bcm bcm_mm0_disp = {
 static struct qcom_icc_bcm bcm_mm1_disp = {
 	.name = "MM1",
 	.enable_mask = 0x1,
-	.voter_idx = ICC_BCM_VOTER_APPS,
+	.voter_idx = ICC_BCM_VOTER_DISP,
 	.num_nodes = 3,
 	.nodes = { &qnm_mdp_disp, &qnm_rot_disp,
 		   &qns_mem_noc_sf_disp },
@@ -1547,7 +1547,7 @@ static struct qcom_icc_bcm bcm_mm1_disp = {
 
 static struct qcom_icc_bcm bcm_sh0_disp = {
 	.name = "SH0",
-	.voter_idx = ICC_BCM_VOTER_APPS,
+	.voter_idx = ICC_BCM_VOTER_DISP,
 	.num_nodes = 1,
 	.nodes = { &qns_llcc_disp },
 };
@@ -1555,7 +1555,7 @@ static struct qcom_icc_bcm bcm_sh0_disp = {
 static struct qcom_icc_bcm bcm_sh1_disp = {
 	.name = "SH1",
 	.enable_mask = 0x1,
-	.voter_idx = ICC_BCM_VOTER_APPS,
+	.voter_idx = ICC_BCM_VOTER_DISP,
 	.num_nodes = 1,
 	.nodes = { &qnm_pcie_disp },
 };

-- 
2.41.0


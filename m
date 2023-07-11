Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC0874EEAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjGKMXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbjGKMUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:20:41 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4C3269A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:19:43 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b703a0453fso88414751fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077946; x=1691669946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK07m+Djn174DUPJPplXpsu1OXiZ7L96FtwK8YSctD4=;
        b=RndoOTho6YEB3iMNgnliSUNhAM7VVsSNXk6jqjuX1DSbT7zGwDEOH5IgOu+Z6nNC1H
         0Vj5AnBnpEEurGlyenw4q7FjgNjTvcL8xdXnjZ3nZYvMPRMkD2xO926unFbniQHtmO4S
         +9hAmX+djt1CMYLSc3GAfCpbv06c3XVoYsE1/Ac/oOEa0Wp6TcGMYdKLF39KPwBau8wF
         8rokBWkp1XoEYqmgLyB8cxvIi88EuCcnG3kVKmuAYjnHwo90IsSLeQhKk+tfbmDWRk3j
         82BQvsRRwhCH81vjkc64os9HzHn3JF3V/vHiJ6GdakgZhogoEXzqMWIhbmRFqQjAecYV
         BbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077946; x=1691669946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK07m+Djn174DUPJPplXpsu1OXiZ7L96FtwK8YSctD4=;
        b=QrQyr81IUAfG3DW6j69r4/bXhrlNu5hUFdi50Qp6TIJvIIldOShaJBMNgMjyuRtzY7
         1IovVsaOry6WqFG4qbV3A70tDoRfss46l7y+bpj6g72kTOPKtyH88pqE7JXlz1TZDLjR
         DqwFkYb5ytM2y9vlhdGwfEK1UR6erS5T3sVOBm+2b7zaDFdWbYKexvw+9P7mDd6Ck3j8
         7IH7f1u87dXor1yYIctE7tNGl8vJiArhfJBh+DfcYWoDwDJORLJhh7PetmBI+AY84on4
         OLuWhHSAHp30bgA0Ln4D8vIxXhCi8Rw/4ZthwJ/95bCujcfGTcn3IlFgGbj80h7E0/eC
         MfMw==
X-Gm-Message-State: ABy/qLYujbX7RZcRDr1rntG6iiqwaZGwXZ0p12vArm1bfoM9MzcBfB9J
        yQZ019rGHKXJ29yZGqPmzrLs+w==
X-Google-Smtp-Source: APBJJlHYNWdrgjndxhx3TldEqpORJI6FLAtiqSIinqnxp/OLeRRQi1taEKOmlGt/yZwCyusgTdUOkg==
X-Received: by 2002:a2e:950c:0:b0:2b6:effc:8ee1 with SMTP id f12-20020a2e950c000000b002b6effc8ee1mr11436378ljh.5.1689077946706;
        Tue, 11 Jul 2023 05:19:06 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:06 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:29 +0200
Subject: [PATCH 30/53] interconnect: qcom: sc8280xp: Explicitly assign
 voter_idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-30-b223bd2ac8dd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=6261;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1S7DwAbbmJRlgdB0jUv8vg/oE5s08GOdcA66t7/JhZc=;
 b=vqcyWjtV/JprX614HAMpkTlFUQLjDMQQv8R0aAu5IsNbPK8j8+eSx7TI5kYXRFXHwdUaPAWMc
 Gdjwnz/iYQiATKZK2DH//eiLoYEHkOvpvT8Aw55TgVtLqg5AooIMaOQ
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

To avoid confusion, explicitly assign the BCM voter index.

Note the assignment may be incorrect, but this commit brings no
functional change.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sc8280xp.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index e56df893ec3e..2f595b78e2bc 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -1711,12 +1711,14 @@ static struct qcom_icc_node srvc_snoc = {
 
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &ebi },
 };
 
 static struct qcom_icc_bcm bcm_ce0 = {
 	.name = "CE0",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qxm_crypto },
 };
@@ -1724,6 +1726,7 @@ static struct qcom_icc_bcm bcm_ce0 = {
 static struct qcom_icc_bcm bcm_cn0 = {
 	.name = "CN0",
 	.keepalive = true,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 9,
 	.nodes = { &qnm_gemnoc_cnoc,
 		   &qnm_gemnoc_pcie,
@@ -1739,6 +1742,7 @@ static struct qcom_icc_bcm bcm_cn0 = {
 
 static struct qcom_icc_bcm bcm_cn1 = {
 	.name = "CN1",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 67,
 	.nodes = { &qhs_ahb2phy0,
 		   &qhs_ahb2phy1,
@@ -1812,6 +1816,7 @@ static struct qcom_icc_bcm bcm_cn1 = {
 
 static struct qcom_icc_bcm bcm_cn2 = {
 	.name = "CN2",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 4,
 	.nodes = { &qhs_qspi,
 		   &qhs_qup0,
@@ -1822,6 +1827,7 @@ static struct qcom_icc_bcm bcm_cn2 = {
 
 static struct qcom_icc_bcm bcm_cn3 = {
 	.name = "CN3",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 3,
 	.nodes = { &qxs_imem,
 		   &xs_smss,
@@ -1832,6 +1838,7 @@ static struct qcom_icc_bcm bcm_cn3 = {
 static struct qcom_icc_bcm bcm_mc0 = {
 	.name = "MC0",
 	.keepalive = true,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &ebi },
 };
@@ -1839,6 +1846,7 @@ static struct qcom_icc_bcm bcm_mc0 = {
 static struct qcom_icc_bcm bcm_mm0 = {
 	.name = "MM0",
 	.keepalive = true,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 5,
 	.nodes = { &qnm_camnoc_hf,
 		   &qnm_mdp0_0,
@@ -1850,6 +1858,7 @@ static struct qcom_icc_bcm bcm_mm0 = {
 
 static struct qcom_icc_bcm bcm_mm1 = {
 	.name = "MM1",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 8,
 	.nodes = { &qnm_rot_0,
 		   &qnm_rot_1,
@@ -1864,6 +1873,7 @@ static struct qcom_icc_bcm bcm_mm1 = {
 
 static struct qcom_icc_bcm bcm_nsa0 = {
 	.name = "NSA0",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 2,
 	.nodes = { &qns_nsp_gemnoc,
 		   &qxs_nsp_xfr
@@ -1872,12 +1882,14 @@ static struct qcom_icc_bcm bcm_nsa0 = {
 
 static struct qcom_icc_bcm bcm_nsa1 = {
 	.name = "NSA1",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qxm_nsp },
 };
 
 static struct qcom_icc_bcm bcm_nsb0 = {
 	.name = "NSB0",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 2,
 	.nodes = { &qns_nspb_gemnoc,
 		   &qxs_nspb_xfr
@@ -1886,12 +1898,14 @@ static struct qcom_icc_bcm bcm_nsb0 = {
 
 static struct qcom_icc_bcm bcm_nsb1 = {
 	.name = "NSB1",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qxm_nspb },
 };
 
 static struct qcom_icc_bcm bcm_pci0 = {
 	.name = "PCI0",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qns_pcie_gem_noc },
 };
@@ -1899,6 +1913,7 @@ static struct qcom_icc_bcm bcm_pci0 = {
 static struct qcom_icc_bcm bcm_qup0 = {
 	.name = "QUP0",
 	.vote_scale = 1,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qup0_core_slave },
 };
@@ -1906,6 +1921,7 @@ static struct qcom_icc_bcm bcm_qup0 = {
 static struct qcom_icc_bcm bcm_qup1 = {
 	.name = "QUP1",
 	.vote_scale = 1,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qup1_core_slave },
 };
@@ -1913,6 +1929,7 @@ static struct qcom_icc_bcm bcm_qup1 = {
 static struct qcom_icc_bcm bcm_qup2 = {
 	.name = "QUP2",
 	.vote_scale = 1,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qup2_core_slave },
 };
@@ -1920,12 +1937,14 @@ static struct qcom_icc_bcm bcm_qup2 = {
 static struct qcom_icc_bcm bcm_sh0 = {
 	.name = "SH0",
 	.keepalive = true,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qns_llcc },
 };
 
 static struct qcom_icc_bcm bcm_sh2 = {
 	.name = "SH2",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &chm_apps },
 };
@@ -1933,24 +1952,28 @@ static struct qcom_icc_bcm bcm_sh2 = {
 static struct qcom_icc_bcm bcm_sn0 = {
 	.name = "SN0",
 	.keepalive = true,
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qns_gemnoc_sf },
 };
 
 static struct qcom_icc_bcm bcm_sn1 = {
 	.name = "SN1",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qns_gemnoc_gc },
 };
 
 static struct qcom_icc_bcm bcm_sn2 = {
 	.name = "SN2",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &qxs_pimem },
 };
 
 static struct qcom_icc_bcm bcm_sn3 = {
 	.name = "SN3",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 2,
 	.nodes = { &qns_a1noc_snoc,
 		   &qnm_aggre1_noc
@@ -1959,6 +1982,7 @@ static struct qcom_icc_bcm bcm_sn3 = {
 
 static struct qcom_icc_bcm bcm_sn4 = {
 	.name = "SN4",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 2,
 	.nodes = { &qns_a2noc_snoc,
 		   &qnm_aggre2_noc
@@ -1967,6 +1991,7 @@ static struct qcom_icc_bcm bcm_sn4 = {
 
 static struct qcom_icc_bcm bcm_sn5 = {
 	.name = "SN5",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 2,
 	.nodes = { &qns_aggre_usb_snoc,
 		   &qnm_aggre_usb_noc
@@ -1975,6 +2000,7 @@ static struct qcom_icc_bcm bcm_sn5 = {
 
 static struct qcom_icc_bcm bcm_sn9 = {
 	.name = "SN9",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 2,
 	.nodes = { &qns_sysnoc,
 		   &qnm_lpass_noc
@@ -1983,6 +2009,7 @@ static struct qcom_icc_bcm bcm_sn9 = {
 
 static struct qcom_icc_bcm bcm_sn10 = {
 	.name = "SN10",
+	.voter_idx = ICC_BCM_VOTER_APPS,
 	.num_nodes = 1,
 	.nodes = { &xs_qdss_stm },
 };

-- 
2.41.0


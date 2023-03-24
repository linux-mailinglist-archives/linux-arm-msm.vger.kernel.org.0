Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C08976C759F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjCXCZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjCXCZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A922A9B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:25 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c29so416721lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=089AM1u0MCseHN7qh2kP48jUDiiKcGADCSThnwjmor4=;
        b=bvpWuwUdg3IW05UwBxAhOHookaUVklXcW5wEbA/V6IvJ+9SgUmyKPiNFAo/dp6e1c1
         TbglwFYJUQPuJzh62uTyoAIjcxNvc4Gyyyh/2FKZKHlbPQ3FFKv8CKHTP3kzHXdvodAt
         9WgmVdIuNLF4aK61DeJBCkgT2ou6slazpiyzMjaLr1rgqxrRkCwgHvfuzgn5d3cpWPCN
         qX5hpHuqFp9cZezqpp1ALv4rI50459Y1x2ESdklEucnENkdfEjW6I9m3G0/RJqLO40WF
         lo7rv3VIjgQrmK6CuhX8vPM4VseoOtW8NTXoUs0n6J3xxzDJzmr7qB/+QNYOU52cAoA6
         uvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=089AM1u0MCseHN7qh2kP48jUDiiKcGADCSThnwjmor4=;
        b=KlmK3Uo0ToRqsSyvV8MH33D0BuwJTG+V+CekbDMfHkt9OKqRJ+qIbcwic7EuZHph6U
         gGsO5amOPOjJnfVfmTXma96GT5aeJoGqHxBEWbZ9zhk6yHRDSc+eEHh2XuP7h8Y4oUV6
         eUlzqZfvIYOuTues4vAuNqKkazdbYC7lGhnI0I785kuJd1i64HR1j5rGZw3WT/bzi67a
         shpSN3AC+GrV06F7PGJv+2ZtOw3g+WogaGrItLEUmRbwoPYg3sfhaH0P7EMGggVLwar8
         dPxhly7/1+DePWT8ciE7VWPjSiF4Y/FxA4d6J938M0pGDDfnDAweVNJATvUwK5SpRygC
         hTyQ==
X-Gm-Message-State: AAQBX9fiKfw1CJDm2TDmWgxboKGmKweLauEy1v4ubAW9BLptla5zxSM9
        TO8Up7bWpbD8fLtyWdCazNu8IQ==
X-Google-Smtp-Source: AKy350Zwp9IcExxE4Z8jiUBymRgWuG28ll1AGs6oAPb6T6Oc0xXP1NCouKr1b8IN8iTVVrcMgtNyrw==
X-Received: by 2002:ac2:4c22:0:b0:4df:7cc4:d1f3 with SMTP id u2-20020ac24c22000000b004df7cc4d1f3mr218625lfq.20.1679624723506;
        Thu, 23 Mar 2023 19:25:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 08/41] phy: qcom-qmp-ufs: populate offsets configuration
Date:   Fri, 24 Mar 2023 05:24:41 +0300
Message-Id: <20230324022514.1800382-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate offsets configuration for the rest of UFS PHYs to make it
possible to switch them to the new (single-node) bindings style.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 994ddd5d4a81..55f7b3b74501 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -803,6 +803,8 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
 static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= msm8996_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(msm8996_ufsphy_serdes),
@@ -860,6 +862,8 @@ static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
 static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sdm845_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_serdes),
@@ -946,6 +950,8 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8150_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8150_ufsphy_serdes),
@@ -978,6 +984,8 @@ static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8350_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_serdes),
@@ -1010,6 +1018,8 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8350_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_serdes),
-- 
2.30.2


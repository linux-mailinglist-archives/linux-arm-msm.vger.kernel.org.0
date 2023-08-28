Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8173278B466
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 17:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjH1PZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 11:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjH1PY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 11:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F29124
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693236253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gGjsmz9FeJn7Lh+gqCn/qI6bNBonhQitpcnm9Wxk4NA=;
        b=gFg1MCZgcQUtt3w30s6bz213nrjG8qKyjX5KihvmDf6/sahdiT4hEKTH3QfT5zxMaUgTnz
        /MKmIGCOVCc+BwI0RI6oQBd5Xqw4LJgu1+ORx2/GvbELpxLGG3GvTidw7JrPhbtCr6uN2H
        DpJ2SzWjbolUacK1Kr+p+6doXR+pq9A=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-EXavMO98PS26kDXG_v5s0g-1; Mon, 28 Aug 2023 11:24:12 -0400
X-MC-Unique: EXavMO98PS26kDXG_v5s0g-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7a01ecba96fso1148203241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693236251; x=1693841051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGjsmz9FeJn7Lh+gqCn/qI6bNBonhQitpcnm9Wxk4NA=;
        b=g476zQTRmZtAQWZtXw/lGq2r1RxNoeo6iJUeMZkcvTpJWnSZfsuGfqiNBbuNrXpmpK
         xdu7ZxiDL3DKPuJEcutzoloLSmEpB0i5pI9ARekpulUV6BUClkxPibNbfLdTb2giSL1S
         RNNCXswg4v41HB3kXMOLk3HlqXSB+1f6JG8SAXILrclhrTXYTJAkBM9M3sdMTTZOLNyj
         pvYdn/Pyjta75qsif3G5sqnWuj9Mp23NI2UEe98J6qWQVXXjDdf0xMGooM59VeWCfn1k
         Zx2b79xJrsjaFCKM3yDlbEvZCRJkisXUZNHDkGrsl/X0sr6X3gTv5pycieG2mmgDE9D9
         nBkg==
X-Gm-Message-State: AOJu0Yy6aHU/mOqvGLu2C0ZVYkKgQ6VuLOmvlzKXuHyUIaoZZVLNUoPr
        yqaFrc5ftjDIHuqMQJZufLAAj8790aiWHUMSoqQrJcJdVuWalqNfnE0jJc61bdcMXf3hRXOaiVy
        0zid/UgejEb128pXqRXnfGcqUrA==
X-Received: by 2002:a05:6102:3c98:b0:44e:b30a:c0da with SMTP id c24-20020a0561023c9800b0044eb30ac0damr6369700vsv.26.1693236251537;
        Mon, 28 Aug 2023 08:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE46nl2H5ijjpTxL1zWNSiHKrFxpuLVW0280mawb3vUShdNvbLQaBwNDj8vgMWZdlwimMCEzQ==
X-Received: by 2002:a05:6102:3c98:b0:44e:b30a:c0da with SMTP id c24-20020a0561023c9800b0044eb30ac0damr6369680vsv.26.1693236251267;
        Mon, 28 Aug 2023 08:24:11 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id m9-20020a0cf189000000b0063fbfbde4adsm2632860qvl.129.2023.08.28.08.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:24:10 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 2/2] phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p
Date:   Mon, 28 Aug 2023 11:23:51 -0400
Message-ID: <20230828152353.16529-3-athierry@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828152353.16529-1-athierry@redhat.com>
References: <20230828152353.16529-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For sc8280xp and sa8775p, PCS and PCS_USB initialization data is
described in the same table, thus the pcs_usb offset is not being
applied during initialization of PCS_USB registers. Fix this by adding
the appropriate pcs_usb_tbl tables.

Fixes: 8bd2d6e11c99 ("phy: qcom-qmp: Add SA8775P USB3 UNI phy")
Fixes: c0c7769cdae2 ("phy: qcom-qmp: Add SC8280XP USB3 UNI phy")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index f9cb60f12575..575329004b90 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1480,8 +1480,6 @@ static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0xaa),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_CDR_RESET_TIME, 0x0a),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG1, 0x88),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG2, 0x13),
@@ -1490,6 +1488,11 @@ static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x21),
 };
 
+static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+};
+
 static const struct qmp_phy_init_tbl sa8775p_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG1, 0xc4),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_LOCK_DETECT_CONFIG2, 0x89),
@@ -1499,9 +1502,6 @@ static const struct qmp_phy_init_tbl sa8775p_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_RX_SIGDET_LVL, 0xaa),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1, 0x6f),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_CDR_RESET_TIME, 0x0a),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG1, 0x88),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_ALIGN_DETECT_CONFIG2, 0x13),
@@ -1510,6 +1510,12 @@ static const struct qmp_phy_init_tbl sa8775p_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_REFGEN_REQ_CONFIG1, 0x21),
 };
 
+static const struct qmp_phy_init_tbl sa8775p_usb3_uniphy_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1, 0x6f),
+};
+
 struct qmp_usb_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -1788,6 +1794,8 @@ static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_rx_tbl),
 	.pcs_tbl		= sa8775p_usb3_uniphy_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_tbl),
+	.pcs_usb_tbl		= sa8775p_usb3_uniphy_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_usb_tbl),
 	.clk_list		= qmp_v4_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= qcm2290_usb3phy_reset_l,
@@ -1833,6 +1841,8 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_rx_tbl),
 	.pcs_tbl		= sc8280xp_usb3_uniphy_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_pcs_tbl),
+	.pcs_usb_tbl		= sc8280xp_usb3_uniphy_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sc8280xp_usb3_uniphy_pcs_usb_tbl),
 	.clk_list		= qmp_v4_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= qcm2290_usb3phy_reset_l,
-- 
2.41.0


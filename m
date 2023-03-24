Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A7C6C8527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 19:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjCXSdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 14:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjCXScv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 14:32:51 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AC021A0D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 11:32:21 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z42so2647274ljq.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679682738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/86O1MbmGCJdvFlHuHo3HdFjlg/eI+hy2Lcom2hFQ8=;
        b=VlcQFaXjAi9KoZy6Or4Mb9YGwRrK6RMZnz08CvawZj9r/zOiCL0o+jGkZc7PZeaQQw
         UmxniPpw+G5VMoCcBRpBYKtP4vFD6zSO7ypviqlWUuGRf4vwDdofCeplFRAlYV4Blz5w
         IeiZTaweDMcsCB8nBRlds4WpetbaBCU/MZbmri79W946q+cK3KuHNeSNEiE9BOPM8TQy
         YkP1b673/Bqzz1jnvZNeKMBsorWlSMSnDxtjxd1U44m9whQb/Qx4FwAMraZtSHLRZWQv
         z9FtTyXTGWeWCQq3AkFDixnzgzedvelSV0JkH5mc0F7IthMqPW3BzAKQ5ul1p+n92+co
         MIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679682738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/86O1MbmGCJdvFlHuHo3HdFjlg/eI+hy2Lcom2hFQ8=;
        b=k4dIdsAFfZ3px1oSSXmZtbWQOFq3no1pTiQVy7uYD/IrK6gHQsBFcpJ0QT2d0pN+fK
         DzjBZAlvGl1lu7DMF/f2u1XfbwgLzHmkUi1ZoBhvJYHeVM+xuNFtWMMV8aKXwHEWjhPe
         6b0UxG9du4OzFLq4iO1M/DNDY2GHpF5+OHNJj9+HHQaEa8eNjPX2hOTzibombl/jjrjF
         Xtyl5cM9FaJ+Q4vt5gvcp+ahArcFDmYuFzlM4EfyoFDO7Los/BO1twIv/W4ZI7rJAQmD
         HmM69Tw+Vq4qYA43ENTr8Qa3R/+8t14vtiQobjqylbhaEpqslkdDkirzRxiItALAr1bL
         hKcw==
X-Gm-Message-State: AAQBX9eI+IuVunIbqkuXNfhRqBatyWGQCsZi4p4p5RAzjWZ49hhp4wWU
        J9UQUKzRkC6CUy/fV1bFyLjgtg==
X-Google-Smtp-Source: AKy350bMmzv1vnR70k0+DwLp34ULiyEuy8WBp0koMeP+R1Us7hImLuGQhLlVU5OhGSYMwJyjhs92jA==
X-Received: by 2002:a2e:a3d0:0:b0:2a1:d8e:a2b4 with SMTP id w16-20020a2ea3d0000000b002a10d8ea2b4mr1183647lje.17.1679682737961;
        Fri, 24 Mar 2023 11:32:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a2e8805000000b0029c0918867bsm2558458ljh.62.2023.03.24.11.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 11:32:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 2/2] phy: qcom-qmp-pcie: drop sdm845_qhp_pcie_rx_tbl
Date:   Fri, 24 Mar 2023 21:32:15 +0300
Message-Id: <20230324183215.1880655-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324183215.1880655-1-dmitry.baryshkov@linaro.org>
References: <20230324183215.1880655-1-dmitry.baryshkov@linaro.org>
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

The SDM845 QHP PHY doesn't have designated RX region. Corresponding RX
table is empty, so we can drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Dropped the Fixes tag (thanks Johan for the note)

---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index c39c8a680166..c95bf7ec2abe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -725,9 +725,6 @@ static const struct qmp_phy_init_tbl sdm845_qhp_pcie_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_L0_RSM_START, 0x01),
 };
 
-static const struct qmp_phy_init_tbl sdm845_qhp_pcie_rx_tbl[] = {
-};
-
 static const struct qmp_phy_init_tbl sdm845_qhp_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG, 0x3f),
 	QMP_PHY_INIT_CFG(PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG, 0x50),
@@ -2079,8 +2076,6 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 		.serdes_num	= ARRAY_SIZE(sdm845_qhp_pcie_serdes_tbl),
 		.tx		= sdm845_qhp_pcie_tx_tbl,
 		.tx_num		= ARRAY_SIZE(sdm845_qhp_pcie_tx_tbl),
-		.rx		= sdm845_qhp_pcie_rx_tbl,
-		.rx_num		= ARRAY_SIZE(sdm845_qhp_pcie_rx_tbl),
 		.pcs		= sdm845_qhp_pcie_pcs_tbl,
 		.pcs_num	= ARRAY_SIZE(sdm845_qhp_pcie_pcs_tbl),
 	},
-- 
2.30.2


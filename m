Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9A2624A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiKJTWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiKJTWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:53 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D1E42F52
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:52 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so5058295lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RMtdZhkk+ztyiCLSmuVF+ElSnJAeFYTXcjwnzPRjZ0=;
        b=cWMHuyDA/qwtm8EWpfyP9QYItdNvpIvyg3sFIzFsaRBWhYuhzwNrZZhE86mUsIBN8g
         2+bgF3WsxamUIE+4VcnVQaU0UQFRYATZxap4jqnwBosT3kZFOCy3oJYYxP09satidw/N
         bi0PUt9o2XEpXjKsIvTYbYQpjjSV3eAyOiodZk/yegMFnPNv/4HPLR58/huhAWT1tV2u
         qnOIS9QvMkVap5JTMWS1KmdaDCdYAR+/gJ+zWn+VZ4mNvqVtFKmgJ5xYlEcBEgniMLwA
         KhSaORdwbYtNEdnN4bqosjfPb+8KvFIRmJ2z+0hCX6XdZ39AcuQgx7NUYYx56A/mnJdI
         sMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RMtdZhkk+ztyiCLSmuVF+ElSnJAeFYTXcjwnzPRjZ0=;
        b=DiKfDFNTtssRWu3M6Zr4jPfX9AVQmbvOhL3uon9+Na9nndDjGzgRk7NTcBQWtc583r
         ++872RD3B62TEyfq+bvt6YyCllyQTO8x7DHqNeP3jaLLKxZKuL5lNBwQ1Nw1BNfFs68m
         b3l0d2Pb8JKHbJ6CylBZgBS0Ilc71Giq3Rru+rEBz5irkgtS+Pxs8ARu8y9swZPQ/GId
         NWf03BPp/iqFxXZCH5qLO0rLZKzS84IrQFD5Xl9BFS0VlQK8FY2WOHpYsPYYBpn0z2RL
         yPJcFH+lL/iVVuBNJD1f2h9p4EogNjdotJziANbyUP8swTkP5dfdGj6mdVyD6ElvOLCY
         fPPw==
X-Gm-Message-State: ANoB5pkVGgQ2ej+w6WiiGqAByYPTTJn3VYngeTqNDIjfzhCJnzk5IISk
        m5RGx2GWSqQkxnCbQMRB1pXN1BXGDASYtg==
X-Google-Smtp-Source: AA0mqf5m0ZGVwFMNyMwnJFmLVyCpsIPhcj3jLBM/J4ALssptcYeBWyLcyDThWMN3bewH+7bE2qMOcw==
X-Received: by 2002:ac2:548a:0:b0:4b3:ab7a:96a6 with SMTP id t10-20020ac2548a000000b004b3ab7a96a6mr1705908lfk.475.1668108170732;
        Thu, 10 Nov 2022 11:22:50 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 02/13] phy: qcom-qmp: remove duplicate v5_5nm register definitions
Date:   Thu, 10 Nov 2022 22:22:37 +0300
Message-Id: <20221110192248.873973-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
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

Remove duplicate defines from phy-qcom-qmp-qserdes-txrx-v5_5nm.h

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_5nm.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_5nm.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_5nm.h
index a1c088bd5158..a4a4e251348d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_5nm.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_5nm.h
@@ -7,11 +7,6 @@
 #define QCOM_PHY_QMP_QSERDES_TXRX_V5_5NM_H_
 
 /* Only for QMP V5 5NM PHY - TX registers */
-#define QSERDES_V5_5NM_TX_RES_CODE_LANE_OFFSET_TX		0x30
-#define QSERDES_V5_5NM_TX_RES_CODE_LANE_OFFSET_RX		0x34
-#define QSERDES_V5_5NM_TX_LANE_MODE_1				0x78
-#define QSERDES_V5_5NM_TX_LANE_MODE_2				0x7c
-#define QSERDES_V5_5NM_TX_LANE_MODE_3				0x80
 #define QSERDES_V5_5NM_TX_BIST_MODE_LANENO			0x00
 #define QSERDES_V5_5NM_TX_BIST_INVERT				0x04
 #define QSERDES_V5_5NM_TX_CLKBUF_ENABLE				0x08
-- 
2.35.1


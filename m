Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B09624A8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiKJTWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKJTWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:53 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81C8218A
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:51 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id r12so5078168lfp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UIsc+krPU1fGDfYe329apj6IkVzAs3KMEB9BP123HE=;
        b=xGsM2EAqwLZkorkLw2taqh3SSEK5T9RvT5LE0v8o0+f3q3wm/g9txVkNQ+hZp5/dXD
         BN9Hi2CUksCV8LCOLWpBnn9pgKhNa44Gt2JPutTERmbMPjvqWaNwrsLNQKsv5Qo2nCnK
         gOaXzc5qWhs5avgmf7V87AaXwEGEGkwnd+FkMVBMb8TivH0qJmIKzpF8vYf+4ParW1t2
         ABAHJDpyzWVzgIhvRcr1DVc/H5WgYogLvlf77gmlRF5tVfl5q+WHNeHjNtKlFjrAzkNI
         wHl6GoxlKOwLctZdtN1zFne428sshFayuGcrloj5FxBmG9h2UvJ4fhyS/r9GDi2YNaCr
         4SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UIsc+krPU1fGDfYe329apj6IkVzAs3KMEB9BP123HE=;
        b=q5XxUpsPWhOp1eZ939qk7NsgY+U6xK6sdIxvSIMKUbk1WWnUnlda8msTXRUkN8ZCof
         U4YMW7fgFgrvsq5l+60rs+31gfPxFxos43q3NfmC4FRxDoiEQz4w73mgL3M2vxPMZeLO
         Ur4UxkW3cRFN3iEX6ez6jJUX6DYLtiNaMPZwsMNXYLztd+Z+vhNWAE5/t88pwklSuWhl
         r6BGxq7gBiGXLuBLh2vEGvMhaBXWdsDXejdHukltPht/k1Gqz/T+B69PFT+hoKR1+0Er
         i/EUy7X0zDp7Fsy8EpDAs6dNt5DgJiyIINxkRxN6et+NLbbPckfV9mRoJtvXkjOKEYKg
         49cQ==
X-Gm-Message-State: ACrzQf2Yqkh8gOkcjpjz0cCjDvsAT9nf4CXQTAMuJqZau1FyvBKFL3bD
        Hu4MIO32yL5Uxf0uLvmdIhKqig==
X-Google-Smtp-Source: AMsMyM7NS4nGToVkCC13upgnbeWT7NN05gXMSURAxNNTIE9HTHL4AQQDp0nTw2DXzJzoCihtZmd0kA==
X-Received: by 2002:ac2:58e3:0:b0:4b0:fa45:9423 with SMTP id v3-20020ac258e3000000b004b0fa459423mr1892081lfo.154.1668108170073;
        Thu, 10 Nov 2022 11:22:50 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 01/13] phy: qcom-qmp: fix typo in QSERDES_COM_CMN_RSVD5 value
Date:   Thu, 10 Nov 2022 22:22:36 +0300
Message-Id: <20221110192248.873973-2-dmitry.baryshkov@linaro.org>
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

Fix typo in QSERDES_COM_CMN_RSVD5 register definition.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
index fbaf6ef467f8..7fa5363feeb9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
@@ -135,6 +135,6 @@
 #define QSERDES_COM_CMN_MISC2				0x1b8
 #define QSERDES_COM_CORECLK_DIV_MODE1			0x1bc
 #define QSERDES_COM_CORECLK_DIV_MODE2			0x1c0
-#define QSERDES_COM_CMN_RSVD5				0x1c0
+#define QSERDES_COM_CMN_RSVD5				0x1c4
 
 #endif
-- 
2.35.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF3B53B40C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiFBHJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbiFBHJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C52565DE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u26so5679750lfd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9SLSVyqi9/N5tDHEFCAI/rQ8c3OlxrZIw2O4q0HsEYg=;
        b=igS2/dWwDjQNnxiYHR5FCVlJnwhmO1JecPJ++SMNAhRyMJH2StVDrDXL6hIuvadFXT
         bZkvqhQ71X3iGbLsey9DbVLbM1hE9GXnFizg8sxsNa+Z7ivgTnD8BkUjWxXXhbOnBIAQ
         52wZsgCa5UE+AZ4EQznBYseVqYYadtHPoj9xcpmQPCAWKeP5Wbrz65C/0U98pV5P8sb8
         oAIp+Z3gU5QfW6mPwv3LL8KnASitmAA7jzoACoInOPUTnHwcu/iabdx9ilJKHURZxHEM
         2DuHoRXrtYpGLJTVb4pGXs0Xr8GiYTw0LxSFCqjkWSDPX7tVvECFapjSy2Qq++B8QDr2
         Rbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9SLSVyqi9/N5tDHEFCAI/rQ8c3OlxrZIw2O4q0HsEYg=;
        b=bpVy+FBAYvV+RCWiL4DCWK+w42ZKi9Vwgl0COua+Vll6AfCNMXauRtquRMOtObxQYk
         sZsfoaArgievWoYp4zDWgszX+/DXNc56pngUZYR4UrD+A1PDAJdJfh+8GKhaPc0GJn63
         Q2Yhzx49C1Ymsf+8xNSdMUJDympUNMjRxBtQHj194/ZWbSBmrv4brZ2y1fspBQddyFj7
         rgtebFteyXD7gXD1X/9rs+Rnk3yY0MFPYVSmyElqvufkiqhAZPxrFg/snWsFSVxNPuXo
         TgXtqqnCMCnaI00oydsduu0DXGSpZVVGaAoKM133iQke6VrCEQsQKhxgz+R3srVLSuyG
         fY7g==
X-Gm-Message-State: AOAM533Zb0DQilW1uW1Q6hKQ9zZ1gwwMn4xMMq4QEFVnizSJxj7nIyV3
        SniIb8ympTOpB2Jqx+1K2F39Fg==
X-Google-Smtp-Source: ABdhPJzRBurnVHOrVfZKx1AtRu0sqJ8cmMbZlZNnaqOR9ZAroNoyZhICQN8g/3IaFsWiio2AY0gOmg==
X-Received: by 2002:a05:6512:3b8a:b0:479:9ce:fe8e with SMTP id g10-20020a0565123b8a00b0047909cefe8emr3141895lfv.475.1654153751750;
        Thu, 02 Jun 2022 00:09:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 01/30] phy: qcom-qmp: create copies of QMP PHY driver
Date:   Thu,  2 Jun 2022 10:08:40 +0300
Message-Id: <20220602070909.1666068-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to split and cleanup the single monstrous QMP PHY driver,
create blind copies of the current file. They will be used for:
- PCIe (and a separate msm8996 PCIe PHY driver)
- UFS
- USB
- Combo DP + USB

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-combo.c}     | 0
 .../phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie-msm8996.c}  | 0
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie.c}      | 0
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-ufs.c}       | 0
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-usb.c}       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-combo.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie-msm8996.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-ufs.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-usb.c} (100%)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-combo.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-usb.c
-- 
2.35.1


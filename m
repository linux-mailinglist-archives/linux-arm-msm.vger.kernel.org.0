Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DE920439D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 00:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730928AbgFVW2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 18:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731081AbgFVW1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 18:27:47 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA89C0617BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 15:27:45 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id s13so14586716otd.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 15:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+juBxJkHGKzzKKvIVu7gHfkhqodYtvY6iJYcZHkOhCc=;
        b=y41so2TCCnlvbDE+KJrDyfB6UPI6hcbuYXAEZjoDONYl/f7tF2Y3Tc0KHevx/97i+/
         XnVL449Msiltwz4Mcp9I6pdCo6O7w4RyxH54lz1DoZzm9SREMfG1x4ub1BinKJ4kGJa1
         ijQFzPzDF77aN+rfnft5wLoDXEiZ15dVBt/NBcn6CzQoC77yPsQHXdm5l5ALG1hr27SX
         UUQd25MVCtOnc1HawsKpPIA9ntV6xWoIS+/gbFOuKC55dJA8DJ+xZQEylm7jq3jfJFXx
         fjk3/bq9z91ALoqLA7HYwYCIicA60bw+WsK2rqTEHuptB87nrJFiWqUFvo4SieH66Ux0
         bgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+juBxJkHGKzzKKvIVu7gHfkhqodYtvY6iJYcZHkOhCc=;
        b=qjEKmL7SS4ZOxNNnjTOX20y6u9CP1OKuVod2sA4onnYyB0mON8g1uw+AbpUjerJFLG
         6q1bB2rESU0Zd7ZRRWIDd7PR1leZBrypBBNH/EXcSVsWCDADDhf7zCNI5Cr91tp3r1Iu
         D3NUDtFuDgrumpF8jLj5ULzQhwcHj7/U4zRYBgeReP0LHfauNGJKnUug4qlNYXIqXR2A
         6T1vwmpey9nSNoUSf/3aeuhLSg3mx/RRj84jTR97UXNgPaRB+kuLEa4nBwXM0G4//xqw
         3TJkqWwbzptkIU2xaq6XRLQtsRE0b8C0k5XWluQfM2664reT7igHgJNiebvsTKPfX+OF
         46+w==
X-Gm-Message-State: AOAM530OrnlAoeGCW/ku7CrOH5UuMB7u+8GqtMDQrE4d+mD5u1de3Yy0
        nFZ2NlVJ1tcJTdeTIq36LtLf5w==
X-Google-Smtp-Source: ABdhPJzGgP62muNTyA44IB7D3xkRwJUqX16W9zjWiUZgOSB7gVom5EmeKYmkBce9IQOufHUmRXJ9xg==
X-Received: by 2002:a9d:664e:: with SMTP id q14mr16811881otm.49.1592864865002;
        Mon, 22 Jun 2020 15:27:45 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h36sm3589304oth.37.2020.06.22.15.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:27:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: defconfig: Enable Qualcomm IPCC driver
Date:   Mon, 22 Jun 2020 15:27:47 -0700
Message-Id: <20200622222747.717306-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622222747.717306-1-bjorn.andersson@linaro.org>
References: <20200622222747.717306-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IPCC hardware block provides a mechanism for triggering interrupts
between co-processors in recent Qualcomm SoCs. This is used as basis for
most form of communication between co-processors, so enable this
support.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5848799dcad0..b3d13e1a052a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -834,6 +834,7 @@ CONFIG_IMX_MBOX=y
 CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
+CONFIG_QCOM_IPCC=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARM_SMMU=y
-- 
2.26.2


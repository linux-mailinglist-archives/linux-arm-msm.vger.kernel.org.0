Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A232C4F88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 08:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388548AbgKZH3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 02:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388549AbgKZH3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 02:29:51 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED1BC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 23:29:50 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w6so884412pfu.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 23:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DrIF8npwlrqxLr6Igah5Ek/omJmCk/eZLSe1ULAbqaY=;
        b=vwjnecL7+HRvNcp2/QtOXgiS5f1StvfUiYod01dCOQllzXdtF9MY2EUZdSOnOd0zjg
         rcyRDx080Fua0RfOcotAkNLHVETyneFv5Z4d2HiA48uJ46O09h5uJjkFPb4NvY5rsjoG
         r15qsySIVo6wFxU/ZGZQ60SRKayEup6ZBr5J91mBimojS6VMXJmJWvor8lViSrW//ukZ
         jKWtC1LLR+XrssnKeYTbKao98VHkmCCmVS0Mocb6jVtlnUqQkRG+CYnrsTcmfBoJ3ics
         m37I0olDtj15mp9oW6G9/nROfyL9YA/G1a2cSZP46W6K4+iMMxTugZa66smHM+y1U33K
         frzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DrIF8npwlrqxLr6Igah5Ek/omJmCk/eZLSe1ULAbqaY=;
        b=XfFF8J35NY6hmY0M09neQyHUNk5A+RNSMI8mbJDnlaBR+WmheqGqZd/cjN4Y5wcUTg
         RRcIhXNl65dMVCfTniqKAnmCXx0RL7cjXgJwbfJrwJZDXbRUfyk7CZ0NYdQZD9KZfm0V
         KcU0TKX5enNwXR94lbLD4hXBUv1myS9pgHvXcTSmJgySrNONvLhJTqSIV2l1YONN00TW
         ODYmu1HsEkIZNBGuOo0tTbtE+CwJQcr4nDgvVd9EgjXPheVra8ejPH0RxwqpURwFjXAI
         caAEp1kGkyqOoz0p0zF0oyTPwAEL6a+LUOxCUBM2v7Uo25mexD4mRiuf06AbRZh+H51j
         Slrw==
X-Gm-Message-State: AOAM532aSEhLfGPLkU8fu1RGAXggChRbtuRLUYf9Si9H9VyaBj6a5QMx
        rJOlgwLwAAdFQAPoX0vxdkNd
X-Google-Smtp-Source: ABdhPJxnW6Di3Yy8aHSj3rGQbdFEbp6WxXhA9CofeXAnnQgscmsA6ITioMijAb8veJ08ST2oH7Ghjw==
X-Received: by 2002:a17:90a:4a0f:: with SMTP id e15mr2162901pjh.182.1606375789668;
        Wed, 25 Nov 2020 23:29:49 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id t9sm5508097pjq.46.2020.11.25.23.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 23:29:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v4 5/6] dt-bindings: clock: Add GDSC in SDX55 GCC
Date:   Thu, 26 Nov 2020 12:58:43 +0530
Message-Id: <20201126072844.35370-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add GDSC instances in SDX55 GCC block.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sdx55.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-bindings/clock/qcom,gcc-sdx55.h
index c372451b3461..fb9a5942f793 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdx55.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
@@ -109,4 +109,9 @@
 #define GCC_USB3PHY_PHY_BCR					13
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
 
+/* GCC power domains */
+#define USB30_GDSC						0
+#define PCIE_GDSC						1
+#define EMAC_GDSC						2
+
 #endif
-- 
2.25.1


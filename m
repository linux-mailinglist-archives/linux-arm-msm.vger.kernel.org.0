Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1752E2EA7ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbhAEJs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbhAEJsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:25 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A7EC0617BD
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:20 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id z21so20936105pgj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxQ9bQtIikQWDcNYhJoOP9WcMBp1b/WtsV26IjiPkCU=;
        b=gLXWwVpAnYxvov2kPbHgZtAHMA3p59g9Y6v0tXubptmNeMnCj+zuprjC7HmBmatMsA
         T3yf816j1QjUXeOOao2eei11r3Akr1drR9i7BY3pjLflZQ8VzjFqk4r7yT6Ac3PEuA9N
         q2+K0WmC/4z0BFrD60+1bITRSHdpmp0FLBFduMdAevOeAhhn9+++AsYl0DSG0tYdHH+X
         yvzotXZuxmU1vB0z/3YZ+a3i1BQCuOeJgBDt4JudVlQkg1iRWOBMWVBK6o6ZxXsHmjyd
         3haxVw7RLkD9PEIe5+wwClxRY7scdiuKyOim4tvVXcO436ureiQSlc7w5qwKtW1NHLh2
         arPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxQ9bQtIikQWDcNYhJoOP9WcMBp1b/WtsV26IjiPkCU=;
        b=efCO/w5GY6XqzwD2ptp/y/IZb4UKc/mtJndaPVFWnG5Y6CZuLam1gg81QTZ1K2Fv3O
         NYQA+Bt0APWVY9ft5NnQ6YsozX2k4+RBx3hAPnQ7BTfSjF2L+P7Y/7tZIGqmuHEt7BnA
         mredamtG1z1DKKRUnQ6Pf0v4h6+ak5aYNV25TqZfzUXFX/sthUy60Kj4u/Kk2nxXj+Va
         ihVHiDHtJTbIyBoA3KQRepNjJ9RLr8mhKJtUdrwHIk+BExwA3YdCNmKhDoM+jQ9yqyMq
         MvZYLNmxIu30tzDIElhg5e4aGnOb71zhZVUFBo2vB6hwzoUbxqC3uNKW9EM5sZ0X/e9g
         7F7g==
X-Gm-Message-State: AOAM531awE1xOQxePtPDUSoesbpxL5H3XFBV/8Py4tutQc2Y9WKxoIzW
        pzkeWi/dom5Bqr0Aj3hR9wh2
X-Google-Smtp-Source: ABdhPJxuc9ytNQsc6qkTxILJXSxmBDkjFv8XPfeJmkfqhnEal6PtErUQbPncLdwePSjkOMv4bBhH4w==
X-Received: by 2002:a63:c80e:: with SMTP id z14mr74728657pgg.435.1609840039656;
        Tue, 05 Jan 2021 01:47:19 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:19 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/18] ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
Date:   Tue,  5 Jan 2021 15:16:29 +0530
Message-Id: <20210105094636.10301-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable BAM DMA on SDX55-MTP board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 262660e6dd11..74ea6f425c77 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -25,3 +25,7 @@ chosen {
 &blsp1_uart3 {
 	status = "ok";
 };
+
+&qpic_bam {
+	status = "ok";
+};
-- 
2.25.1


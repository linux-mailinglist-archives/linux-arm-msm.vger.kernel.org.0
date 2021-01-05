Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27332EA7EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbhAEJs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbhAEJs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:26 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C10C0617BF
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:23 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so20931759pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQ4Xyw+lomP5U3AJy8SgFcN3M+pTYg7eIxIz6Xs0pzE=;
        b=FxAZd1YlBC7lGRTKnF8Ryo/EZhj7m/J6ZneN0qbtGCJVci9a3hNIPEuQ6mitQOytm+
         23uAyZRPnn11dFgbeD8uAHzb+uSAd38cv9+K3BotG8PUPNye1V4stcP+G5zzoVjMIKpP
         MIKFGoavXACto2lCytsSI/dqV+aUyTYkH8CWY78+rnGUQBM/4ta7tKRe4Asanjb4UOli
         kBYthoLIIuNMInWGlw0ftHJxipcyfLdG/qCW/tU9yFeUlURCLkox+lOnCMhOH00YF13u
         3HEen24dbtNgwrWHb1XkrwdgClmUDixfltcGwdBRDv+atoT184qOcTVoA/AyWS6DM469
         ysOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQ4Xyw+lomP5U3AJy8SgFcN3M+pTYg7eIxIz6Xs0pzE=;
        b=U9UYrsqdBlqdNdWyvouylmDTd2Pqu8bS7JV2a1pnAPHa7fNOAqFETf70zg81xOW3Cv
         wXjTg2rCFF7vJguPLmLwR6mMfwQGROBUsBvrXH1bi8Dq8TDzgbFFcepdNlcg72JOVzgD
         KQE37Rvw8XpnBXqnWK3PVlPci6JBnHXZrI5i5lTdpDV/bPdGwS7/wzGvtxYFEDxUlYqS
         txoW1X9+ZJKSLiU/C1VTC6EsHkFU5Vzm6NZRsiqg0kQHmlg06mWFs7T5f7wlhc7g75VG
         1UXpvbgJ6mzYh2/6tTsLHtWe8LDpT8zZOj9XMUoHGpM34O1iNnmiML5cuQADr299bXpy
         Lq+g==
X-Gm-Message-State: AOAM532IcOCS+ivXc4IYjbXTxbo2w8W5CsQ5eDn+k6EJsVrpVnAKc9Bf
        STK8sYx4bt/upK+2VvgS97elL3uO/Xhn
X-Google-Smtp-Source: ABdhPJyapVxBwTzJaNn6ScMB6O1NC7wXtLjcEL2ID3FCcZyAvN4tfMHJ88HqVtvg/tR+Qi/VNeru9w==
X-Received: by 2002:a63:fd10:: with SMTP id d16mr61414130pgh.333.1609840042727;
        Tue, 05 Jan 2021 01:47:22 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:22 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 12/18] ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
Date:   Tue,  5 Jan 2021 15:16:30 +0530
Message-Id: <20210105094636.10301-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable QPIC NAND on SDX55-MTP board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 74ea6f425c77..b8d432a4324c 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -29,3 +29,15 @@ &blsp1_uart3 {
 &qpic_bam {
 	status = "ok";
 };
+
+&qpic_nand {
+	status = "ok";
+
+	nand@0 {
+		reg = <0>;
+
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+	};
+};
-- 
2.25.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5DC387F6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 20:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245566AbhERSRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 14:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbhERSRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 14:17:46 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9982EC061573;
        Tue, 18 May 2021 11:16:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id c20so16088515ejm.3;
        Tue, 18 May 2021 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NGqV4Xu3Ra2v1f3J2XY6oCYA2hVcPqhjvch9qSMDdIc=;
        b=C5sNyxP48U8ETKM6xIOl80A3W07rIY3Xk+ug64dFj+h+f96AG5nzacHyBY8wouDovQ
         10swg9gNw1xC4b37NSg4p4eVJRanxDY7dXl7c2NnbI5Zwb5d4paO902wHAqYY0WojeSX
         xEc9XBCzG8laFQ0U8lDeBMRb0OSlnRVRzfuBQDGWa+zejn0LzhvQNTooQsW39+7GMrUC
         6tfnddaGVOdq2S2fiVt6yHg3P8XDW9hxC4a0zqdNdaM1kH56Vy1OMCBqwAa58hi1Qhtg
         KqAVdQUKSUa0UPZrzPSsbPNovnrLPRdOhe5TlPAOnmQOLk6rRVAuO7l93am/yUkJtAXn
         +fzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NGqV4Xu3Ra2v1f3J2XY6oCYA2hVcPqhjvch9qSMDdIc=;
        b=CMKBvL4ERPkunUB+XKDEx9RUJumHC3KsilDMsyVgxywQn0g2n7x2ZtZGWyvj5cshjl
         FG6joG9TXW8Og21JVt+k15WXqWmEnRIj+x7yCiRofti1+KboOhQzUeg/dEOnby16A4iY
         nNdpvkr18rxHcj61RC45CU0af002buq5XrZGuK8ecDjAqVXYqSTddcsjL9UNPP/TVgkp
         CC5d3Loz39vlga++kgAhGtZ9haPt14xkS0hJ9Q0AAbUYrT7WND0B7KIcJUo3EfyTMa9T
         UdcuCk3rkAUDo/UkVE35fAUbWVfXjfRohx1aWvJP6tvI5w4pI6b9LP/OkUvjhw1Yqeqq
         N7Lg==
X-Gm-Message-State: AOAM532eGN64Q0xImldPnyAbCQSsLxFexVaFXBtZmERbY9P4xm7HsH3u
        u9QApQRkLWYV5mRFROzQAL4=
X-Google-Smtp-Source: ABdhPJx2BUHOnAU6/shPsIepkQPA3/FKXJ1Nc0RO7X1tmvIDYtNyCrribRZuqojOPt9a3mAhtanZcQ==
X-Received: by 2002:a17:906:b104:: with SMTP id u4mr7210776ejy.211.1621361786322;
        Tue, 18 May 2021 11:16:26 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-66.xnet.hr. [88.207.99.66])
        by smtp.googlemail.com with ESMTPSA id e23sm12258594edr.80.2021.05.18.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:16:25 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] arm64: dts: ipq8074: add PRNG node
Date:   Tue, 18 May 2021 20:16:18 +0200
Message-Id: <20210518181618.3238386-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518181618.3238386-1-robimarko@gmail.com>
References: <20210518181618.3238386-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PRNG insinde of IPQ8074 is already supported,
so simply add the node for it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 194930374bc5..aec7ced72a89 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -197,6 +197,14 @@ pcie_phy1: phy@8e000 {
 			status = "disabled";
 		};
 
+		prng: rng@e3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0x000e3000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		cryptobam: dma@704000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x00704000 0x20000>;
-- 
2.31.1


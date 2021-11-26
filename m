Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F06F45E83F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 08:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359199AbhKZHMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 02:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359102AbhKZHKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 02:10:43 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A3FC06175C
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 23:05:40 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id b13so6108468plg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 23:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0N7UO8CeuJhPieX5knORTkoq9/tga9etAaS3dWDj23U=;
        b=d3gn3MB/4Rv7myCgRiYgGAP446xaJKlZwozu7pT951/xw/e5BVIgcT9OScSFmHAW6P
         6vBg6Ln9glPZ3WrhrlLWuga3UlOS++q9nzju9eLKSSsyKhpe7a/tnKb28hfjwrU7uY12
         bV7tcdkXu1qdfkTxV+7poFQyrd5+1o2e1f4ZkfUQE7hMshuCvPcBXbPzfB7vEj1dFyhm
         FiftmKSZDfoyF3dB8bjhk2S95vC4W4E1lqT57kI16xSZg6SeQYLilJz6Aisvu6ZjuEb0
         hWUPO18D+eGIHwOIvr83QJws8i3RyMv3+VmbhZquACam6wYwxOCCklp/dwugjOx6eTGc
         uQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0N7UO8CeuJhPieX5knORTkoq9/tga9etAaS3dWDj23U=;
        b=yQklP065nbXDcHKvSKNTf9NXM8ilgQztVFQ9xrZyImTBWpjKY+t0AwDvfdKXSPBo4j
         xAFs+dnjcUvYpPGBVlkk0W0yaQpnmeeOX+zxk2zkWWln1tPfosa5adoFKsIpLjCwWuD7
         CtPq2APhB3f1Ea/jp7zQshVt2AqowVjJvEzsM8BgEi4rb9PX95u7sGcrV98r+jqkOzEU
         Huoqevo8NPT23P09F0+ee54Q5NU0bCgAaaMpY9gvFyc0q6sJIQNWlKS8UXDXGS5qU0k/
         ZwuPeaLK2qs3bmuhOv6VM8TVIvCYg+5ZA8vse5v3bgABUpcYKTiFu8MpT1kJBmC6kYC9
         HoYg==
X-Gm-Message-State: AOAM531mixrg6tSuAg3bhSUy9kvqAtoVgTMXeNrjVM9hZ2r6Xn9gJ7+x
        RsgmuYcX9AWw5AqwuTcPM0UMGOblxJ2r
X-Google-Smtp-Source: ABdhPJzAYRx2rXAlpXuMoFLHcNSQw3ww1iVcBo1TQ8ug+yL2rjyj9dipqX7LkAvTHSUq/4mKUpcHCA==
X-Received: by 2002:a17:902:b28b:b0:142:4abc:ac20 with SMTP id u11-20020a170902b28b00b001424abcac20mr36973279plr.88.1637910339970;
        Thu, 25 Nov 2021 23:05:39 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id d12sm4042104pgf.19.2021.11.25.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 23:05:39 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/6] ARM: dts: qcom: sdx55-fn980: Enable IPA
Date:   Fri, 26 Nov 2021 12:35:19 +0530
Message-Id: <20211126070520.28979-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126070520.28979-1-manivannan.sadhasivam@linaro.org>
References: <20211126070520.28979-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable IP Accelerator (IPA) on Telit FN980 TLB for getting data
connectivity from modem.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index 01ac91738f34..a4fa468a095f 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -236,6 +236,12 @@ &blsp1_uart3 {
 	status = "ok";
 };
 
+&ipa {
+	status = "okay";
+
+	memory-region = <&ipa_fw_mem>;
+};
+
 &pcie0_phy {
 	status = "okay";
 
-- 
2.25.1


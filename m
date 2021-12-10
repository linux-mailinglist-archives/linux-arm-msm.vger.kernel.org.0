Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CFE470DE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 23:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243505AbhLJWfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 17:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243282AbhLJWfE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 17:35:04 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42412C0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 14:31:29 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id 14so11976349ioe.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 14:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3CDcI54wXBndnATfaMcGfwDIMzZa57DanUaHDpclF8=;
        b=o8M4SZ7mWsYVn86WRR22X4eQ9uxP4xAWg8haWDPgrSCHziuBNVj1wsRLcdsA7n3t1r
         Dq5eFx5BKVOYa2qVIQOX1Pl8gjasvbZ2FhKvPnJvcWyTWDwa7sYArYRpAB69Nj9yb0Pl
         3+AKieNBzo52YzD8gL04HlJPyPCTPgDnJs1zrQ2Tr4ngkW3tW61jVgM2r4eHx6h5yeH3
         1lYb+Lo7+pgRSnGWm3ReLtLj6ru2rjoNKaBv+aSIAm+CmhFWKUWDerRYOJhVZCLKNmwO
         lYupo4f9BWBSvjisjKxFD5rFczMwK4a6bXkHhqVylKs8XEA3fwLUnkP/PAvTQ7OTUg+i
         fWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3CDcI54wXBndnATfaMcGfwDIMzZa57DanUaHDpclF8=;
        b=mjE96Jueezmd+Fby5fqk1dfwt5Bl0kjEMvEV1COTBPfzw9TLWQDz9NLk4dsa/4KOrT
         xxomQ1pkyrxoalJpltRY2irHTIjo+/AAAWnwsNaPotEQ2ubn4ikU9hqr7TL1tnTOTGKS
         V22l32emK49xI5Hbbe+jUSIzKHRKBkGmEz8ycSXc4CJeKHm9FTMwWVJVH1ehoIIAV5QL
         20Mvki/udsvYImwisX7Of6P+RdGgrBwuQy/cuv6w4yLgNW3zObyqgJKquuLlNqAzISTU
         L5c3utXmR4FSjL2hAHe/EyInzJSQu0XndztHXS9SxkSQCiqsu7C9KXhSmlwD1mJbpId8
         SKXQ==
X-Gm-Message-State: AOAM531qKmm/YgyFCEy9Jp1wn0guS+BY4QLHk8QFVCxcngBvmpT3OjTn
        B/8PiO52JJsWLEHj3TsBLIQ2NA==
X-Google-Smtp-Source: ABdhPJyyLLSCekIZe3yICmuby9smBp5YObETfN2s6lRD6b2dMQUnWR38JKhM79s3xeRHZV4vCnHg+Q==
X-Received: by 2002:a05:6638:190f:: with SMTP id p15mr20310863jal.82.1639175488661;
        Fri, 10 Dec 2021 14:31:28 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id q4sm1279879ilv.56.2021.12.10.14.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 14:31:28 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org
Cc:     david@ixit.cz, manivannan.sadhasivam@linaro.org,
        jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org, mka@chromium.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] ARM: dts: qcom: sdx55: fix IPA interconnect definitions
Date:   Fri, 10 Dec 2021 16:31:22 -0600
Message-Id: <20211210223123.98586-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211210223123.98586-1-elder@linaro.org>
References: <20211210223123.98586-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first two interconnects defined for IPA on the SDX55 SoC are
really two parts of what should be represented as a single path
between IPA and system memory.

Fix this by combining the "memory-a" and "memory-b" interconnects
into a single "memory" interconnect.

Reported-by: David Heidelberg <david@ixit.cz>
Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 44526ad9d210b..eee2f63b9bbab 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -333,12 +333,10 @@ ipa: ipa@1e40000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 			clock-names = "core";
 
-			interconnects = <&system_noc MASTER_IPA &system_noc SLAVE_SNOC_MEM_NOC_GC>,
-					<&mem_noc MASTER_SNOC_GC_MEM_NOC &mc_virt SLAVE_EBI_CH0>,
+			interconnects = <&system_noc MASTER_IPA &mc_virt SLAVE_EBI_CH0>,
 					<&system_noc MASTER_IPA &system_noc SLAVE_OCIMEM>,
 					<&mem_noc MASTER_AMPSS_M0 &system_noc SLAVE_IPA_CFG>;
-			interconnect-names = "memory-a",
-					     "memory-b",
+			interconnect-names = "memory",
 					     "imem",
 					     "config";
 
-- 
2.32.0


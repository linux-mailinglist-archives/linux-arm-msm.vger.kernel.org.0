Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B812EBDF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbhAFMzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbhAFMzR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:17 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7D8C061368
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:13 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id s21so1637846pfu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+1brOZ/QkKBkYoCUBItg4EDZ/jZVAfzXyKHdM8JfODc=;
        b=rEkvBpqkBqjG/BjYtvLcvuieckDMqtYZGNrSWTBTitknOeVkFyw0GkvB7wazdWnpta
         yTOgnDBMci0OibkE3eLYWEG59HBDCFScG17169gQuCUBVn6q+E2F/3s5lTkoyt8OcC/7
         WAj/AB3HFIpU7aLI4kVyjcGvfUtZqGqQAroFzd0gddF3f/Yhg4NTD+k94UMJFY1G8Qb6
         mUPy5JIvi4kEZUMevANo3LvOJ0hBLMJ+2XJTqf4AzbR6hGKYR2nxCg1RwJH75k1mPN5J
         jUfoAYQ6nbuOc778RXFzKIuYp0USE1wtcQF+krEiwvHuRTQ1L+QF4iPSh4hJ/H2c36G7
         iQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+1brOZ/QkKBkYoCUBItg4EDZ/jZVAfzXyKHdM8JfODc=;
        b=QgWUMjbKv3NRvxBHCPcqWGG/B7kheLy7I1d8wzRuvTYo42LBR+QXaIGWhC/cvdogbf
         JNwUyYBtqq3lsDMCmHBzvmhpXE3NX1algCmC5Q/pEofrvnLgqS1O8hwCmJseoqoKZz8N
         BTPCLyCmlSjQ+fhEe7k/xa2ytd6MuZUdXlrWnccvkfwwbuGL6vN5Bgh+PLqykWkarTd1
         N0o3ETavYihXQVMjk05LgSqEjBhpsMCfS/nPIPTInWHNr0CMaYWA8IFrZhr16uoDXzME
         Kfo9NHAskNbuziPux3QebcOo9EYNmDt6w5f8PviOQalaSdpuYEmKzIYwxJM0XgUr1T2r
         EkwA==
X-Gm-Message-State: AOAM530qRMjWq/7DZIwD6HarrwOcGRIQv23pm2uQwXslJlnsHWmRJHmw
        b58N5nX74hV+2fGolorl1dG5
X-Google-Smtp-Source: ABdhPJzhQfLC+T8VacszQjULvoQ8NJh1lU2HEZ8BV4rB9trr0SVQhxEBGu/l/7Rz/NJudZeMj4IFMw==
X-Received: by 2002:a63:8f4c:: with SMTP id r12mr4337589pgn.311.1609937652549;
        Wed, 06 Jan 2021 04:54:12 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:54:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 08/18] ARM: dts: qcom: sdx55: Add Shared memory manager support
Date:   Wed,  6 Jan 2021 18:23:12 +0530
Message-Id: <20210106125322.61840-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add smem node to support shared memory manager on SDX55 platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index b752b150a5e7..5c091787c458 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -157,6 +157,12 @@ sdhc_1: sdhci@8804000 {
 			status = "disabled";
 		};
 
+		smem {
+			compatible = "qcom,smem";
+			memory-region = <&smem_mem>;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx55-pdc", "qcom,pdc";
 			reg = <0x0b210000 0x30000>;
-- 
2.25.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9A32EBE08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbhAFMzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbhAFMzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:45 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6303FC06134D
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:25 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 30so2171285pgr.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uWoafl4HdJvgeAc17msN+I0L90Xer2yDqSKIV45NtHg=;
        b=Z17fO8prgjapWFSaKIRxajso0hVyJgcuT6Y/B/6yh5xOT2APGAnZR6SAu1F5JmTi06
         MVAMPsu80dfPOCDXuZLkaG/K0fLMepzm6pzdsKTRVsg6n7PVWCjgCeeVlFlOemK/gy9W
         G4QwNzdzXO29Lz9PJgJlHeTMeBBfx7KEQCD56WXv7ZlW1H1p7rL+ZkXHsHTMW6rEaLPa
         f6daaNFmsEH4ILxfA9OPEJl62p/99bVvP5oh7JJGhOQ9kLhzsfHBYwvuQEEDYbn3zra8
         ql8xQ7mwlbPvZVtOw8Q/RfxrX+3xmKU4BCMcywAIV2k15jdDrAWoO/6Hdt13S1zqobtW
         AqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWoafl4HdJvgeAc17msN+I0L90Xer2yDqSKIV45NtHg=;
        b=EcW62fj2eeLxr0Bspm0Z/HBR8GA5JSwGnTbDudwCPtGwByrM3VdS/X98RmA0+SlU61
         oYSpzus1XCCzFbikAAp+uAKpmOr9zNHgjo49PcvK2aIjbFg87EsQqpn//asFCQwz8Imy
         6tEAIw2iD8ARPf9L22Yp6xzrAGoq2DVJTaebCRS7bmLHwalQhaKz2qteLBDum5WvgO1i
         ZBc7gd6ezv1Hj5XmC4fWoTwqJLrlpoLBwVfbfzB00/E2JObRTy+Z9vNX25p8eXFUci6K
         4xxgDR8FmOpPLbEeGp/wDH3Zqa/+ch3l8IVmk/5CxQsetz17TD8D8fesQzNxJrw/596u
         9F1Q==
X-Gm-Message-State: AOAM5313VVBYoRyytYrdOARVliee/ccf+yHTsA9pR4Uj3H8lO6+mjGEA
        /8tvOQGUUvIiqGBFnYf4T4Z+
X-Google-Smtp-Source: ABdhPJwAaARfZOuKG9d7VfU4DR9Cybsi/JlC76awaRMrnnXTkNlOBzjntXls2rH3EMRAUil1cv1YiQ==
X-Received: by 2002:aa7:8eda:0:b029:19e:c8c3:ed74 with SMTP id b26-20020aa78eda0000b029019ec8c3ed74mr3681445pfr.66.1609937664936;
        Wed, 06 Jan 2021 04:54:24 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:54:24 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 11/18] ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
Date:   Wed,  6 Jan 2021 18:23:15 +0530
Message-Id: <20210106125322.61840-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable BAM DMA on SDX55-MTP board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index a5d2e4a3a796..177886e168aa 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -46,3 +46,7 @@ mpss_adsp_mem: memory@90c00000 {
 &blsp1_uart3 {
 	status = "ok";
 };
+
+&qpic_bam {
+	status = "ok";
+};
-- 
2.25.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DC32C8138
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgK3JlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgK3JlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:41:02 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAF5C0617A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:47 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w187so10043480pfd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jLxCd/F4fxI6lLKUfeAQgTwipZuT/u/XIJSTRbWtMDg=;
        b=aiVk39RlImBWFTMKuODN3ftmmmuWoy1VwkbteJ0JyNawut652rgM+TyTCmZ+I7o5H8
         zwK4ssBk5PQHdySZ+wxpSzilZaBUPleickaKTW9OHEEQtzrElXl6OBAQjryhlxhbDmPp
         DkVijQ/74rV/1JNos9sj1QHiHhyEUe5hK1+N6XtpO55alaeI4rvJp9n7kfB1HP0LQfR5
         qfiJotOAjspEAaWFPkJl6tT1Pd7KZ+Mgx1dZ25osxdHuctEx4S5x0gMBMMPZByOegiOb
         t4LXIGVg63piNiWHrslp8qRUxtFBl3C8nIdRE5HDTPIQJPvZHyxWs8/gn7zOp1UpUyn3
         MQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jLxCd/F4fxI6lLKUfeAQgTwipZuT/u/XIJSTRbWtMDg=;
        b=gUdMLkZD1sDynxM5boxSJmca0kUZbT9Lz9SAjrqehxos+90NW0+Q/Uq7EvMWVfQTA1
         tBhz/alqPmKUsFSJxCbUjToCKkwkBNFN24bTTtrb2wYQ16svzC4DHFX6UtMXCmlEtE+W
         gj5JTMiEr5NX/GjOvHDCqlR2ORRC+zDhdcIgpI9Zy86nnOqp4jeqRT3L93uGZmdvDlBE
         KzO94CcCrycjp+0moDxwN+HhmlE6CZxgSTdfxUVrppGhH2mQWUePgUdrB8v3In2U0sdj
         MBRVN0C0/ZfLKmFC/x2HTqiNA0f2GXq3QIr75wlGUG1JQ+BldhdytCaRSqhVzdmDcAJN
         BjYg==
X-Gm-Message-State: AOAM530QUyyXnSdhMLViZZ1z1NOHJAMBywf699SNqI7XMIxZiRf/J9aQ
        wlW58qdnXlPvwEMiCwTAoOmf
X-Google-Smtp-Source: ABdhPJzYIWz+ETyPU8t7ZJKWzHBjfRm+kZmbxBl4JhjLNxa8o8quxc90e95iqDEWoraSPozlIWRs4Q==
X-Received: by 2002:aa7:8744:0:b029:18b:a9e1:803d with SMTP id g4-20020aa787440000b029018ba9e1803dmr17737033pfo.50.1606729187111;
        Mon, 30 Nov 2020 01:39:47 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6c0d:98b:4016:605b:102d:cbb8])
        by smtp.gmail.com with ESMTPSA id u14sm16348429pfc.87.2020.11.30.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:39:46 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, saiprakash.ranjan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8250: Add support for LLCC block
Date:   Mon, 30 Nov 2020 15:09:22 +0530
Message-Id: <20201130093924.45057-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Last Level Cache Controller (LLCC) in SM8250 SoC.
This LLCC is used to provide common cache memory pool for the cores in
the SM8250 SoC thereby minimizing the percore caches.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 65acd1f381eb..118b6bb29ebc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1758,6 +1758,12 @@ usb_1_dwc3: dwc3@a600000 {
 			};
 		};
 
+		system-cache-controller@9200000 {
+			compatible = "qcom,sm8250-llcc";
+			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+		};
+
 		usb_2: usb@a8f8800 {
 			compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
 			reg = <0 0x0a8f8800 0 0x400>;
-- 
2.25.1


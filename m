Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B04203703
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 14:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgFVMlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 08:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgFVMlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 08:41:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6609EC061797
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 05:41:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id j1so8368768pfe.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gVIUeXQMCzWAcTP6WaAZI7/yPZyluiCjZUpguitY3Jw=;
        b=ZOojp91Pido+aL3yZ7zrmjtfRZ8Rj0b57hyjeHOQp6DeGl5HWGlCbn6CRDcFZ6x2TQ
         OGjgXQAYk9vb5Z6Pns/GOLInjxC0/4F9IVjUZpuj15j7HlFCH5reerk6T/pN0KRwU9Bb
         u0IQ2vcQpjjAP0z87Lus7w/xu7CknL7VSWrti80qeROkDVNoS2gM/1P7lJEnzGJzzQM9
         LBbyXm4aUXqYMGPsMUFksBvsmj1K3Rcs4ic+kxJypBQ3w16Q6rm7xi0l9Ul4OM168xVh
         PjeK/Shfu4r4EkO4Yt9B0Jb4KqSMnjckWITV77AdmF5ymk/DolM516H29m3oan9c6RWv
         +jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVIUeXQMCzWAcTP6WaAZI7/yPZyluiCjZUpguitY3Jw=;
        b=N9y0l1jrE/LP2MgKzmSRkr3cl1zubswZVjvb7NVVZkUhJg82JoXtcIu9dudY0ttReO
         Nez8EV9/3AY5YQUhISJE4aeOweCq8loDIWEagQRbPjHZkM+4tjv+DlUjhk09raCRBd+1
         9o+CRqtiASc7jg/ykVTgt92dYVxbLRRLPCUPtqbQNfhfBgmUCkZNvD1cOEKbj8+xOI1n
         BXEZkIDtaWqqIAHSte8SsMpSK2tgJPUMrc4jJHE1tC2UqbnD4L0ni4FkTuww+hAF1TBr
         fPbvF+0tWaLJBkNNkaojAFB38/K7PmqWv89bhHdGpHg6pjJlNpKsVbRSYI98J97TbyX8
         mw/g==
X-Gm-Message-State: AOAM532gnVilI+xjljUaEBnJEMMmwFPeWpcgwCe/XJg1MZ132J7yuBsI
        adBbC7Yb7hsNwczue7fD0uXeUrIvO72pBS16
X-Google-Smtp-Source: ABdhPJyKEJiZz5eiUolIb6ebzSomKmKeC2lbQasGljaZr3D0E5NLOjUhinZlJgNU+qTJaWl0NaR8gQ==
X-Received: by 2002:aa7:96b0:: with SMTP id g16mr20562410pfk.126.1592829691927;
        Mon, 22 Jun 2020 05:41:31 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id i62sm14590581pfg.90.2020.06.22.05.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 05:41:31 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v5 3/4] arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
Date:   Mon, 22 Jun 2020 18:11:09 +0530
Message-Id: <20200622124110.20971-4-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622124110.20971-1-sumit.semwal@linaro.org>
References: <20200622124110.20971-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

This patch adds devicetree nodes for LAB and IBB regulators.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
  [sumits: Updated for better compatible strings and names]

---
v5: sumits: removed interrupt-names, since there is only one
            interrupt per node
v4: sumits: removed labibb label which is not needed
v3: sumits: updated interrupt-names as per review comments
v2: sumits: updated for better compatible string and names
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 23f9146a161e..d016b12967eb 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -25,5 +25,17 @@ pmi8998_lsid1: pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		labibb {
+			compatible = "qcom,pmi8998-lab-ibb";
+
+			ibb: ibb {
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			lab: lab {
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+			};
+		};
 	};
 };
-- 
2.27.0


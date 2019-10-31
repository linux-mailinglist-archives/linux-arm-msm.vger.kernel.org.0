Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5D2EADBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfJaKoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42878 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfJaKoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id a15so5655045wrf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
        b=CHPNCazfEYq7wKypwLSmtIQYejllhGhcc5ukmAGRLvp8A3ZzB7tTN0FFVfuE/3IX9a
         woZM7nHqopnw0yQW34jMu0BrJ64+J7+ZOAZ76mcoKnJrHn25diQyx5uAVvgQO/fAx0rp
         O939uxFJcp6s4vQu3VgVKIWDjCYZUXYse9U2zZIzh8Ymel3IrRPLRv1uC32TmrTi4Y8p
         9JJjrosUpXkHCRj6HV8odcf95sLdD5ShTHbDvclgyFnbBvNAbgzyKYDZoH2KS9GxczE6
         IHqioUXyVxty4OYnbslEdt9/Pqe1Aots5k1u8Ca4IsDRdthHYpTj9m99fWXjPE3pzz2U
         An4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
        b=uj0XBFoCEkbUpz2vQtX/Ge7PTKxURFPVgcOW83bCPXC+AfNeVJVomS+o6vHq1d2VN+
         HnU5B5XW5VcGWmlftDJx8G6wvNCaEnYjmMkYLCsSfHr4Evw1dJoqhig5o6u7iCfS9+DQ
         ef0ptUUANpj4j3rrJFujSiomlZTHHS2dfi9SpcNikpfzsfB8b6ZnKSwlp3ZW1nUoE5nj
         EGKstBfdIWOFJ5tfcCa0h7oOcAmuzjDGjeHTt4s0C40ntE/vV7ejQr97dzJlH0mFlDHd
         uVtB5kcd3vYxsKU8d2GKPJtUAoxOi9cslcWhMqB9ZnIABZoAzukB2hktDzttVTmRrYpT
         jOPg==
X-Gm-Message-State: APjAAAXFIhnE8D7ZCwdENEIpoTWzEekEv3BRZ4yFQY2qm20z7PL74qEa
        4wDm7XqhDq5aksONSLN8qyhzpePUL0w=
X-Google-Smtp-Source: APXvYqwgV7N/8acv9uSD5DCqYy73YyUOoG7pEZ5Ul7G02SbyDFbzKHeu0KIBlrX37UUT/5wybg70Sw==
X-Received: by 2002:a5d:574d:: with SMTP id q13mr3663556wrw.263.1572518653849;
        Thu, 31 Oct 2019 03:44:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B compatible
Date:   Thu, 31 Oct 2019 11:44:00 +0100
Message-Id: <20191031104402.31813-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

On family B SoCs, the 28nm PLL has a different iospace address
and that required a new compatible in the driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index af95586c898f..d3ba9ee22f38 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -83,6 +83,7 @@ DSI PHY:
 Required properties:
 - compatible: Could be the following
   * "qcom,dsi-phy-28nm-hpm"
+  * "qcom,dsi-phy-28nm-hpm-fam-b"
   * "qcom,dsi-phy-28nm-lp"
   * "qcom,dsi-phy-20nm"
   * "qcom,dsi-phy-28nm-8960"
-- 
2.21.0


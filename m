Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 825F8CC968
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 12:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfJEKlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 06:41:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50413 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfJEKlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 06:41:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so8097865wmg.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2019 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdQqnIRetGhmX5t5KUNz0D/PW18I35dBAgGn5+TVGHo=;
        b=lqy7bkGbpgpXOiYREGcRT60+tz1bKA5j8IVaJXkOgrZYFH+W0NhYnqVxxlFO0y5/Id
         5iIyK03+r26SR2/cfDZgNN94sjrlBPQBOd1ljUvtCrN8RrBVgXLuuqK9U20Edv3dUg4u
         Oc4QQAeTDanrlzBqcGgYbseynZvPIYagVCj9XYDiYD7CNVOgkzvBXBeHHI8Qsk0pr3NS
         lvdfcZ/ES9itFh2UuQxHZw6c+tNGYSh4gKVxYZZs6jcjPvdiFQ978NMxnIvvW4xU8Oqc
         l2AehHMsFcnlDZdr4ihBmOuBwFGM1Xh+0rtfrRkAYlFJiMKG3rd8r2bzNbLWho57bKWK
         ANUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdQqnIRetGhmX5t5KUNz0D/PW18I35dBAgGn5+TVGHo=;
        b=frAlRWnGthCfg1u9Ze3jH8l7JqZeSgI+47AyMnybMXpWQLa0g/oEM9JpZyatUY+zS/
         +mCQEiEaNVm9TXFKQunYOdb5gGNQgfjF6spsah6+GEY0HdijHqr6ggM81lHxmzvQmms/
         V0MkL2UAgY2AHP4IDBkOScIS6CjG6K3xVZuZuy/zlJnMZK89TKfItVsXQRUui+0u5Ys9
         2ASsU0pWmJ8Kd1xcwtqAPZV76I/LREdQ+rSxfpqgShFw1ciNqAu1fUFOiCTiKIHtp3aP
         hAAuqBjcmQdX82lCp5MNwiOklpWPYV8iQKeQ4R4ryBmZmpxmEtsUDW3GlZieRIUrWYID
         iimg==
X-Gm-Message-State: APjAAAVYCMUREvPVyq1dU7yhhNvbvT1a6y1VRkABHRyRIhqzCqs+plVw
        22mpF3eh8a4WxJumsdGTLMVCYJoXhHfrdA==
X-Google-Smtp-Source: APXvYqxMyNKDlIzjIsYxZ+OkpiZLnf4oHCgI8kV4JmcHIQaAIqVo1YFU90qOYYXtdQ64xrKrlzBNyw==
X-Received: by 2002:a05:600c:118a:: with SMTP id i10mr13894681wmf.80.1570272110488;
        Sat, 05 Oct 2019 03:41:50 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u4sm16471674wmg.41.2019.10.05.03.41.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 03:41:50 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH v3 2/3] dt: thermal: tsens: Document compatible for MSM8976/56
Date:   Sat,  5 Oct 2019 12:41:32 +0200
Message-Id: <20191005104133.30297-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191005104133.30297-1-kholk11@gmail.com>
References: <20191005104133.30297-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Support for MSM8976 and MSM8956 (having tsens ip version 1) has
been added to the qcom tsens driver: document the addition here.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 23afc7bf5a44..eef13b9446a8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -29,6 +29,7 @@ properties:
       - description: v1 of TSENS
         items:
           - enum:
+              - qcom,msm8976-tsens
               - qcom,qcs404-tsens
           - const: qcom,tsens-v1
 
@@ -82,6 +83,7 @@ allOf:
             enum:
               - qcom,msm8916-tsens
               - qcom,msm8974-tsens
+              - qcom,msm8976-tsens
               - qcom,qcs404-tsens
               - qcom,tsens-v0_1
               - qcom,tsens-v1
-- 
2.21.0


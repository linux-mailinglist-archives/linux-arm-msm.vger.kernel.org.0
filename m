Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A93FC2F64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 10:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733238AbfJAI5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 04:57:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36084 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733185AbfJAI5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 04:57:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so14457240wrd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdQqnIRetGhmX5t5KUNz0D/PW18I35dBAgGn5+TVGHo=;
        b=UtODBx2HnS7k4A0GsfJKVqAKfE5096QcSo11mtR5Z6ipZCDcWTwIcdDhF4Z4Fk4qBa
         HXj6s3TzupPT4bB54WfpIBVn3HGHGWMS1FxiStLdXcjbgNSxWjoKi1BILumyUyuSbyAw
         Ackyr8YKVN6TYPeruM89l7yRaELXfCrK6fxSDje5UEgcuZ47I2KHj0Wg4JyjinJzaQoj
         3Kv3uAAFsMb4QK0kAMtQR3Jq7j0A2pdkuYCsDjvsawd9anzpUtEdhinqwIRY2h0kbGmK
         qHx1aAim8oerfaBmStMLZRFU4WjFK1Ll8BKltZdBOJmLtSpy5RnyizO0vDMEsiH396MV
         SyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdQqnIRetGhmX5t5KUNz0D/PW18I35dBAgGn5+TVGHo=;
        b=GmD34588CblSzXmz6iZpXwb+Gpsjlt0wdvnZtEWxHllt1INdPN5xp7KFx6Jl6vBcOy
         hrHT/aL5YY/05XzLhoPnRTTVVV96Zq9v3kOLsiELga1KM3JB/7Aid6ybdvcoNhFEAhGo
         NxdzTo31ZdMjwl6e9Kt5xdsPTAmMYlIUJ/FyhMWV5PYbEk8zfvmd9X6B1lFPC0Pq7kjq
         RhS7OTtkNfITThyTNM5e7HSwGNAgEdxvvl3lePUEDmdpT9nqfaLJyZSeR0lj6U1SsJwM
         gDP3I+145jA3/3oBlgIPB3iDaR0sksPH3WfG1I4Eq1ir466iDAxJzuYy5kr0fRxnhmFn
         jMhA==
X-Gm-Message-State: APjAAAXz4TmXTIOatifRshiMVwM6/9MFBGjA7tmxMafKZKXI9BkscZbe
        oLRQoT8P+7MFtFklmDHn2S1PRHlLtuk=
X-Google-Smtp-Source: APXvYqy7b4jLqxbUxm2RLSyA6GHEm+sw+WqhkZ33SsCp/PbHkoJ/fiibUnBgQUFiT6bM0iWO1pXZwQ==
X-Received: by 2002:a5d:5384:: with SMTP id d4mr16020685wrv.255.1569920240066;
        Tue, 01 Oct 2019 01:57:20 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u68sm4600611wmu.12.2019.10.01.01.57.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:57:19 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH v2 2/2] dt: thermal: tsens: Document compatible for MSM8976/56
Date:   Tue,  1 Oct 2019 10:57:07 +0200
Message-Id: <20191001085707.8424-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001085707.8424-1-kholk11@gmail.com>
References: <20191001085707.8424-1-kholk11@gmail.com>
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


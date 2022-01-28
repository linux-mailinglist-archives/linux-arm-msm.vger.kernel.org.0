Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925DF49F16C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345651AbiA1CzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345669AbiA1Cy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:58 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34ACC061753
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:57 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id b12-20020a9d754c000000b0059eb935359eso4476820otl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jvyAlPuQLjDdZLcj7p6QFtf0FjfXtzi+Y0Us9VRKiM0=;
        b=E7k21iuYkvwNY9EgUiHtX8hLoKuZBLbuTQJdspNG99+2J0EkHYnMWxFamULmvuQdCL
         Wl/jfr3c8lPWT86Ux3cd7yQva7DFh2Am08BieDC8g2kWRB8+wm86k2z9ARAEBZARM7xG
         hCqy4/eyTVDn0nyKLL0S089IqKLRXDILnhvWiGgZ6vBwUS2Mi42E7cAEqMh+klGPEaDv
         pEYik4Kj5Wn2GMXTDto1pZy8uopicYEUcvb6vjbhX4Fx/oXww+ssPFGLRKm9/o3u3dhy
         6ujaMCzAQbq7yboZaZ1q2Hs3dDynKFukq91/lUZtOC9wo5Y9vEunb5sPEdINfx0XrYFM
         gkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jvyAlPuQLjDdZLcj7p6QFtf0FjfXtzi+Y0Us9VRKiM0=;
        b=up9lmXtNqcEVr7R+U2F5C5Msr4eo2YbR3imMG7cIn8hoBcF5LZMrlHUvf65KHq5t+Y
         Nkprcsbz4l1Sz2Px2LyuFfzixemTIkvql5sgeOYgJYKzAYhODBJ5n8OWxdWsoe1Q3CJa
         XwDy8/1/taNfU4zc7r9gTeqQYEAj3uEgq6uTenl/9XftN5kXNBtNWmdbssp3OoYw6qX1
         AE4xyc45pINxDR1F5LLdAtYjb+J5jJJY7z+nlp1JrnWWfzLLhwSarSIpqZxzq1qTuqfX
         T/wq6STjZrCJ8w1/ESkF5DdFyS8dEBwlHWWDklIWVD2QBeU+i+W0zyOTNkjdhj4yALhY
         xZiQ==
X-Gm-Message-State: AOAM530fS89hXhJ7chRQrnPGsoFs6hQ0jvIc7aLoKIM1vvvKICJ+FUu0
        bBz7NCdjaPm//9sOu/XjlmMbXg==
X-Google-Smtp-Source: ABdhPJyPI/sgFBgVQ4LTtliO4KXFpFCDhwFTY34TGsGwJtWLuDhbmqUDE0PoIINV5ajao+APWk8Ctw==
X-Received: by 2002:a05:6830:30ba:: with SMTP id g26mr3762705ots.231.1643338496987;
        Thu, 27 Jan 2022 18:54:56 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
Date:   Thu, 27 Jan 2022 18:55:10 -0800
Message-Id: <20220128025513.97188-11-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM8450 has the usual audio, compute, sensor and modem
remoteprocs, add compatibles to the documentation for these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/remoteproc/qcom,adsp.yaml           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index c635c181d2c2..64c182428e94 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -47,6 +47,10 @@ properties:
       - qcom,sm8350-cdsp-pas
       - qcom,sm8350-slpi-pas
       - qcom,sm8350-mpss-pas
+      - qcom,sm8450-adsp-pas
+      - qcom,sm8450-cdsp-pas
+      - qcom,sm8450-mpss-pas
+      - qcom,sm8450-slpi-pas
 
   reg:
     maxItems: 1
@@ -175,6 +179,10 @@ allOf:
               - qcom,sm8350-cdsp-pas
               - qcom,sm8350-slpi-pas
               - qcom,sm8350-mpss-pas
+              - qcom,sm8450-adsp-pas
+              - qcom,sm8450-cdsp-pas
+              - qcom,sm8450-slpi-pas
+              - qcom,sm8450-mpss-pas
     then:
       properties:
         clocks:
@@ -283,6 +291,9 @@ allOf:
               - qcom,sm8350-adsp-pas
               - qcom,sm8350-cdsp-pas
               - qcom,sm8350-slpi-pas
+              - qcom,sm8450-adsp-pas
+              - qcom,sm8450-cdsp-pas
+              - qcom,sm8450-slpi-pas
     then:
       properties:
         interrupts:
@@ -312,6 +323,7 @@ allOf:
               - qcom,sm6350-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
+              - qcom,sm8450-mpss-pas
     then:
       properties:
         interrupts:
@@ -434,6 +446,7 @@ allOf:
               - qcom,sm6350-mpss-pas
               - qcom,sm8150-mpss-pas
               - qcom,sm8350-mpss-pas
+              - qcom,sm8450-mpss-pas
     then:
       properties:
         power-domains:
@@ -458,6 +471,8 @@ allOf:
               - qcom,sm8250-slpi-pas
               - qcom,sm8350-adsp-pas
               - qcom,sm8350-slpi-pas
+              - qcom,sm8450-adsp-pas
+              - qcom,sm8450-slpi-pas
     then:
       properties:
         power-domains:
@@ -475,6 +490,7 @@ allOf:
           contains:
             enum:
               - qcom,sm8350-cdsp-pas
+              - qcom,sm8450-cdsp-pas
     then:
       properties:
         power-domains:
-- 
2.33.1


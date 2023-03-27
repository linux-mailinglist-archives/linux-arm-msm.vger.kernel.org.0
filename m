Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389546CA4DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbjC0MyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbjC0Mxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:53:36 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F73196
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so5227957wms.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9npCLmQ8LaWtspD8UZ4KoAFNC0Jc8S6E7xh8osazoGo=;
        b=QtXPJ5iMrOcLeqYEcOmMnaQMyScsZHENRY5fzWiMKlxTD/w5dDb4BUWKRGuoStVTRM
         kgKYHl9nQxRz6g+wgTeXgtzofaMx409KejFzWYu3ZSV9n8S37iw7r84K9kgHSbEhUjRP
         FgfJoT8sePZr6+lfXHNqnFNd1FkPgDKgHUoGbq6o7u7CJVe02YOcV5jAEJmD2ANmHRMJ
         sRpEYw65Hs+5FqGZAZw75QhDAdbkPvhbUsTxZxHBu0qMDQugdBiuc1KVXP690pKK63dQ
         mgccQMABwKyaqOChVOIVtBDN9+vXMnfOcmal0J42bOROdEavODVyzAo7iFgQ+3xnCKbc
         J3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9npCLmQ8LaWtspD8UZ4KoAFNC0Jc8S6E7xh8osazoGo=;
        b=4SCQc9i3WjqwVq4jNC/ibGyxebi90t4Dm6d0DLZKWF8b4CWqi+66pGsN/gVSrYlDcW
         3TBS7F65qB3NyC9tsuAhbV0nzqTW27Kyhz+oHJNgdnsmtNZatnytG1oP4oOrGkbXAhmu
         B+2gO9f9/AVj1nXFommnyAiN+20nZKKZukFGftjwauCXY4dz/jsSuzoMPHy6XxjXmlOl
         +5eUHIi3/LCXduw8KwEsBMAIm0XA3tAg5EBZdENNsAwY72yMlsNZSQdrcbt4MYkDiV6v
         yR1LZm/rW1/TBL0hrrmrj9cMhaESCSnBWdAxEKtsTHa6TudYz5Pn63/Zb3MupotbbWHP
         QBdA==
X-Gm-Message-State: AAQBX9eLp/d2CYnVID/u4MhVtcQgLDwzu0Sxk2j1P0uZBXZXXW5gufCp
        cxE1HWXoGJAPutVM+G3rc5UyBA==
X-Google-Smtp-Source: AKy350ZHJddUXpQv3WTOTH8DjJ89og2fEzr7ZFsHmn8yZUeX7fLAATjhjfVWxlgiBKohkoqSX5ABaA==
X-Received: by 2002:a1c:e90a:0:b0:3ed:29f7:5b43 with SMTP id q10-20020a1ce90a000000b003ed29f75b43mr5934618wmc.27.1679921614273;
        Mon, 27 Mar 2023 05:53:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 16/18] dt-bindings: regulator: qcom,rpmh: add compatible for pmm8654au RPMH
Date:   Mon, 27 Mar 2023 14:53:14 +0200
Message-Id: <20230327125316.210812-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the compatible for the pmm8654au RPMH regulators present on the
sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index a765837dc069..91054ed04c66 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -78,6 +78,7 @@ properties:
       - qcom,pmg1110-rpmh-regulators
       - qcom,pmi8998-rpmh-regulators
       - qcom,pmm8155au-rpmh-regulators
+      - qcom,pmm8654au-rpmh-regulators
       - qcom,pmr735a-rpmh-regulators
       - qcom,pmx55-rpmh-regulators
       - qcom,pmx65-rpmh-regulators
@@ -244,6 +245,19 @@ allOf:
       patternProperties:
         "^vdd-s([1-9]|10)-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmm8654au-rpmh-regulators
+    then:
+      properties:
+        vdd-l2-l3-supply: true
+        vdd-l6-l7-supply: true
+        vdd-l8-l9-supply: true
+      patternProperties:
+        "^vdd-s[1-9]-supply$": true
+
   - if:
       properties:
         compatible:
-- 
2.37.2


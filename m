Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FA9421CA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 04:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhJECsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 22:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhJECsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 22:48:20 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD459C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 19:46:30 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id o27-20020a9d411b000000b0054e0e86020aso1283520ote.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AlHcJXGx7k58IE4mFbGzVS2lVm0f4bwrg+VfLM3kp4E=;
        b=oF+xqpaS8g00lOOgtZBxQy3wiprnjQFXXP2QrggQFMh3Mb8Hwr39GNA2EOf+BoDVO4
         ITPFDVGfCiv+tR64V0OcYbBqrFx9kUNp1Nnbs0o3xHrrBBeki9qdgs/M5sDLVfiTJHv6
         gWeW/J7y0vqKVxmCNuccVVK87S3yqfM9w/6DBDK4QP9bMd+8Y4RMrBscYisKG4p04Cdq
         WdHg4uRgoVsjAoGAbzb9OOewlCW7y2PqE6wDcDSV1cXvuUNw9wlgXrZL7XQVsqCN9qWe
         sMMLids//J1NWLz7tUyvSqajZLhfGYrGMiN7N1YNELN4btrdOIohyLP1mFNTfnR3RD2h
         00IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AlHcJXGx7k58IE4mFbGzVS2lVm0f4bwrg+VfLM3kp4E=;
        b=olGRZ1te74xRH5buqEBsz0GGRBcMpO0haPOUdsi+KFlJw/zU9WoHMkT/l5mevQBzC9
         hSbWMoN+FEZp5CvEgyiQ/NfiKsSL4W/n/F1IdxVZJuQQq8O0Ore9/84pSxlXpjwGQoi1
         CvMyGU0YP7RlGzXmijyvS0aG5SlcvRsz3wileQJiOCy2zvGzSqfxCzYWtdb/6Mjj8Xgh
         1H3MbwhK5tzi30bwoLqnDXNT1lzKpyoS1u6L2AI1POXyPXkU5lro+Orw2kDigxlj9XUI
         0AuawmN7ucGg4piAeqwXA3A98g50ZiP5N1jO4h71pKATYnnlrh4pJFbg+c4ADD9PO6sD
         Yrwg==
X-Gm-Message-State: AOAM533mww85ndUGh/0e1XGt9aSbLt+0Ix/n76pFWf5lCKYBluw6F4MH
        m7EOqgwMRdwuvHCwbmiC/28h3g==
X-Google-Smtp-Source: ABdhPJy4flvrK63jzAu3301Ox1RzZmMJiRODFfDZSDmtvh1Uicy0VQ2pMoRjUDHtd3hR2zQKMiH+mw==
X-Received: by 2002:a05:6830:4110:: with SMTP id w16mr11746513ott.258.1633401990285;
        Mon, 04 Oct 2021 19:46:30 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l25sm3034712oic.54.2021.10.04.19.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 19:46:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mfd: qcom-spmi-pmic: Document eight more PMICs to binding
Date:   Mon,  4 Oct 2021 19:48:11 -0700
Message-Id: <20211005024812.2038249-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the binding with eitght more SPMI PMIC compatibles found in the
PMIC info list in the Qualcomm socinfo driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
index 5ef79bf3d035..1d2b5f067556 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
@@ -29,6 +29,8 @@ Required properties:
                    "qcom,pm8916",
                    "qcom,pm8004",
                    "qcom,pm8909",
+                   "qcom,pm8028",
+                   "qcom,pm8901",
                    "qcom,pm8950",
                    "qcom,pmi8950",
                    "qcom,pm8998",
@@ -38,6 +40,12 @@ Required properties:
                    "qcom,pmk8350",
                    "qcom,pm7325",
                    "qcom,pmr735a",
+                   "qcom,pm8150",
+                   "qcom,pm8150l",
+                   "qcom,pm8150b",
+                   "qcom,pmk8002",
+                   "qcom,pm8150c",
+                   "qcom,smb2351",
                    or generalized "qcom,spmi-pmic".
 - reg:             Specifies the SPMI USID slave address for this device.
                    For more information see:
-- 
2.29.2


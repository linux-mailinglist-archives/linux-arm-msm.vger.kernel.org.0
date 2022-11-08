Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A875A620FBA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbiKHMDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:03:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbiKHMDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:03:03 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96212248CD
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:03:00 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso8913107wmp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCCT8tgaqG5OldHtlkklSVmkDx8WUdXNiCaVQRja2yA=;
        b=U7WGio8V1prSmN3Mln9Ld/PbUtMtK4E3C/I7QfP9z+GltDmjDNFwK6sGRVhnYuN3nE
         tjsf44EHUhh6ZN8skkDpgWLw6Ombd4+M1+71FpTCp9L/BmJ096VP1RsZVjruvbUJgsaj
         uZz3X+nnSu7hY658FwKwMmmn+PqNTcu/lCtwD6+QgRYwpBfC8lSDKSdVDxjrK8V9DhQq
         S63vTnkE0uEI7ii3pM95+VpzrI2S+ltbMLOk4M0Vg01QdiJpmvPU/F+jQNGSrgZVMRPP
         ST1wRarcRgV0fF4Qf/bTBSctKDh1gO/Y/NZTbCnhYpty7Rei6rihU5MoAC1JLbLgCj/5
         600A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCCT8tgaqG5OldHtlkklSVmkDx8WUdXNiCaVQRja2yA=;
        b=hNZYcFxKXmu34ojjQlntciQqEdPmC36/iA1hrVn+dLoC622yMk2OTYS4qigcGeba8n
         BAyhzRNbHNY6IBUAj0iI2UffXckIqEX05UsIgZz/G6gqKZJnJaLlQIF+8oPy6wYjl73L
         lC6q8gtZihaFjNLGwfginERaHaNv6tHSNwalWCV6JDZCvgrvEerNF7KyNUo4AbXySdFg
         Xhy8BqgchimOFHhwnvzJV0qbh5QOIg+LI093iT5JT02V7nxoft2WY/EXMEInXj1n5+SM
         ZTipZbdr0IxTaTGZgLpu4lDCSdPwsLmyCxSlluaa/t1lV95QwkzZCvF/BrEbE9wi5F6Y
         huGg==
X-Gm-Message-State: ACrzQf1X/84feXNMcN8oeH8H9bY9lPNPb2XsxEANVOhjT5MV6K3+X0eJ
        iqxeZJK5ItMvH4COsuAE5Y65Zg==
X-Google-Smtp-Source: AMsMyM7V66Sx1uuIUNwAZdTcklqiRvYcgNuFIuC0qulmR6/MvfqNgkKfUB/Lx5hjVEJoOBoCq4E6Ug==
X-Received: by 2002:a7b:c5d6:0:b0:3c6:f970:e755 with SMTP id n22-20020a7bc5d6000000b003c6f970e755mr36584276wmk.132.1667908979158;
        Tue, 08 Nov 2022 04:02:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b0023662245d3csm10056034wru.95.2022.11.08.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 04:02:58 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 08 Nov 2022 13:02:53 +0100
Subject: [PATCH v5 1/2] dt-bindings: rtc: qcom-pm8xxx: document qcom,pm8921-rtc as
 fallback of qcom,pm8018-rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v5-1-bbb120c6766a@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v5-0-bbb120c6766a@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v5-0-bbb120c6766a@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8018 RTC is used as compatible with PM8921 RTC on the MDM9615,
document this situation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml         | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 23ab5bb4f395..0a7aa29563c1 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8058-rtc
-      - qcom,pm8921-rtc
-      - qcom,pm8941-rtc
-      - qcom,pm8018-rtc
-      - qcom,pmk8350-rtc
+    oneOf:
+      - enum:
+          - qcom,pm8058-rtc
+          - qcom,pm8921-rtc
+          - qcom,pm8941-rtc
+          - qcom,pmk8350-rtc
+      - items:
+          - enum:
+              - qcom,pm8018-rtc
+          - const: qcom,pm8921-rtc
 
   reg:
     minItems: 1

-- 
b4 0.10.1

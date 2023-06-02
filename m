Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF9F6720730
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 18:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbjFBQOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 12:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236770AbjFBQOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 12:14:10 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58500E52
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 09:13:51 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-652dd220d67so1043664b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685722373; x=1688314373;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhmHRyToIEmAAHnN/IwEZChyqNOsrqiKFOCxgESTvfk=;
        b=QNqMgXaW84FsS8Ck/A01cCxyIWV84qC3tILHwN+hr/GzQjLA0wd4t3wXIVaxYnnxel
         QsT4pQmmRs/82EGyBEjvl94cgJTi3sOXjQB2iLGWt1WQs1TBs9j4LwGPQXzSjhslTuvP
         XQro5oj1YkzyXdWiiMjhuiDZXpvOAW/kQZZQMF40e/RV3z0hfv5SviuOyehzWw1v9ukb
         7UhpStmtLpjLFSg0Qm8wyYbYAhRqsipubfh6crqw4nMyRS4VGrnugWgxzJJM7EvaWFm0
         x2GSwpX8E/GVTQSbsWMMeE8g5CnvJ8IwbvzumguJQMI7Ut2qSuoWkWa27rtR5myWANlB
         fWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722373; x=1688314373;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhmHRyToIEmAAHnN/IwEZChyqNOsrqiKFOCxgESTvfk=;
        b=cPAoAIkkTXFDYloTGCuD4o8VjPWO8AO7EpguYfz8b3X4KONq+aYRmJ5xOL7tYIJaih
         NPwNTeeRX2ip59CSgWrtVL4njKnEWHk39Cl+I7V7W/2Fn8P/w9N9Ss9HjWrMa4zp3laA
         6TbmemA/MxdLPDLnp4rk+UQyjCo1iofFng/3k/Q4OH8KVj5Ceno62503AjpVoz8W+765
         skebIHYDUNi9s4qXe1+wLfWkAIUsRARofCUYILfhzWbMLwglBXcWsrtu6UJIdeAjgfWP
         wCUwOU6NSgi94OsllZhh1wKZXtPPwisWfj70hTj0I1T1SjQ/n5lLQ3RH7J0+wVcl1Y7D
         JQTA==
X-Gm-Message-State: AC+VfDzkAgAvLro2oYaas+wytYfKgYGM66lIn05WYoyPfQPZnzu+/+ba
        QTq54LZeKYpR8xENQo6pIja2kw==
X-Google-Smtp-Source: ACHHUZ6oiEWSgd6EGNqsh+9/KWnn2XOtzx0RThiCm670UWl9NCNn/53nT/5blXc9/ZCXPcNFLV+mLg==
X-Received: by 2002:a05:6a00:15c7:b0:646:6cc3:4a52 with SMTP id o7-20020a056a0015c700b006466cc34a52mr16570169pfu.3.1685722373382;
        Fri, 02 Jun 2023 09:12:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.50.231])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79149000000b00652a72b89d1sm1197014pfi.170.2023.06.02.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:12:52 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     regressions <regressions@lists.linux.dev>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
Date:   Fri,  2 Jun 2023 21:42:46 +0530
Message-Id: <20230602161246.1855448-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
list to workaround a boot regression uncovered by the upstream
commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").

Without this fix DB845c fail to boot at times because one of the
lvs1 or lvs2 regulators fail to turn ON in time.

Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e14fe9bbb386..df2fde9063dc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -301,6 +301,18 @@ regulators-0 {
 		vdd-l26-supply = <&vreg_s3a_1p35>;
 		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
 
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
 		vreg_s3a_1p35: smps3 {
 			regulator-min-microvolt = <1352000>;
 			regulator-max-microvolt = <1352000>;
@@ -381,18 +393,6 @@ vreg_l26a_1p2: ldo26 {
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
-
-		vreg_lvs1a_1p8: lvs1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
-
-		vreg_lvs2a_1p8: lvs2 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
 	};
 
 	regulators-1 {
-- 
2.25.1


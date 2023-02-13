Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A28694E92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 19:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjBMR7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 12:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjBMR7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 12:59:39 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EED2004F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 09:59:34 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id rp23so33881814ejb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HD5L0OzAE4T1VnHQ4734G2vgLjw/5WBq54Z8hcfCrhE=;
        b=ZA7IiFd34saI3SzeE2KVXbK1Puclk9kUuZOSWK8vlqd/O6QUgLEIngbVXek2dPaTaI
         k0pLVz642K8D+NwhplatifYkZ8T82r1Jc3kbF8PUfhEZ9y3PhtrVVt3ETpomyk0MQdm3
         etJs8SyboBFRXuFkUFUR5oD1L5z6cAJt17538zSvHLuFOp9+Qe10hRNJMFTPSYr1/7Dk
         N4FcMbklrQ4mt7Dko8B7XwZEBhO81Ed7blg5ltLbS9wyyY0iGGtRckvCgVDnSr2rwFp/
         oWgMwdhCKBgkVrBgAshevcsik3B9pP043EW+IvBBf/r+i22qK1JmwOuDwDn1HFx0cNu9
         iGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HD5L0OzAE4T1VnHQ4734G2vgLjw/5WBq54Z8hcfCrhE=;
        b=ryrzoKymJLMl0ezqdbpypZKkzLp4noj7aWUDTs+NNoHcCu80m/M7snIBG6p8qfw5+m
         JFJbemjZx395wTt7JinK0/Eyn0MG4JXnx6OD3ZNf0MiylE9PDlCC3/HwqpZbFjahwCTu
         xQCPTUrg6c9oHFMN6PngCV9lEG246Z7Si4ch4Gf5IQH/i96oyCOOhdpyoVfeNgm5Ast5
         hLEaAPii84CvepPZ/aee0xMs+1DCOA2XLrO3BWC7NHy3dKR6hHogTPtCEnTAhXkL1/QZ
         n3pfesj/Q1qsMO4Nc7MwXu4FYxWJBq5MexSkTsXi7Mg/r+C4ry47d7524U8x0NhgNr/j
         S/JQ==
X-Gm-Message-State: AO0yUKW9KKOGQkwsuY92PHGlyIOQyZ5Z5OIU6dvUqRzxr8weBVGbQ4G+
        BzWqToZ+aQmRIqQGkm+RqjiLIRcZPBbeHIZo
X-Google-Smtp-Source: AK7set+aEw/jx9c3aPqnoOKU5elwDHNeGgjIExg/5B0AjW8znvgeCOVyS+e0pR5Q0byixiaAS/H0pw==
X-Received: by 2002:a17:907:80e:b0:8af:447a:ff8e with SMTP id wv14-20020a170907080e00b008af447aff8emr17167815ejb.20.1676311173155;
        Mon, 13 Feb 2023 09:59:33 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id kq15-20020a170906abcf00b0086ffe8a00fdsm7074309ejb.84.2023.02.13.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:59:32 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6375: Add RMTFS
Date:   Mon, 13 Feb 2023 18:59:28 +0100
Message-Id: <20230213175928.1979637-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for RMTFS on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 5795c6cb7364..404aeae0033f 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,sm6375-dispcc.h>
 #include <dt-bindings/clock/qcom,sm6375-gcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,sm6375.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -426,6 +427,15 @@ removed_mem: removed@c0000000 {
 			no-map;
 		};
 
+		rmtfs_mem: rmtfs@f3900000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xf3900000 0 0x280000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
+		};
+
 		debug_mem: debug@ffb00000 {
 			reg = <0 0xffb00000 0 0xc0000>;
 			no-map;
-- 
2.39.1


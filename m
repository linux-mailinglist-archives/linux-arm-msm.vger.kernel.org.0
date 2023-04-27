Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439606F0958
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244173AbjD0QMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 12:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244131AbjD0QMc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 12:12:32 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4701FD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 09:12:30 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9536df4b907so1644023266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1682611948; x=1685203948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMqYIMvxQzMeNZyvXScd0d9ZjZQUVmBHnaHMVur7PZI=;
        b=47g0X7BSbMbvv9L/Q9QUepC51/0/TQau9ztKHNIjZPRAu18BfSZwcYUZVenNlbaewp
         NiPe9w4TDMscaoknOdvTZvqMxgBuUlKkNmelAbA/YIopx4I29Mfd1897kyLRP88TVqmc
         8TFGrit4A0yflaIwe9JWcFsSul9heo5Du7IOoDFp+xVjVcCrm2Re6YVcjNu3brkYiqUb
         ZitjrlWKTlpSCbK0VTC6LjRaG8a16ADuC4RtEungg1SLxdCt8myxiqRtn82yGIavrB4Y
         mPjJo85tc81DLj8iZiLNJbtICwphoW9xH3sS7FsuxGd2WSaiRd8iICINbz1zs0LioeNr
         Vhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682611948; x=1685203948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMqYIMvxQzMeNZyvXScd0d9ZjZQUVmBHnaHMVur7PZI=;
        b=AF6PQa5qFW+9GFM8dShXBkxJyhfAnlyoplDeUVbF+ilON3ys2KUXRygQ1WqLtcib4r
         6kkC3gz6jPPhtKfdXLLcqfAusz9wPbJqNNeLzK8qR94XmdxWR07z/AQ1e7PBrfRMv63T
         63DSyjaDBGw50z2Dc2ORNcZYnlGHX+cbpWBUc1vBICAZ+5qeYeMPqmcpIF51B2TGOzBt
         N+o7av5DCji0167uRZQX7O3F2b23Vw9VfROM/tj++BXRb9+zFQzkeDrv77MSaOu/PdkP
         wxy3MljXF4KqPvKSncX+4/OBBasVyhJlX/rl73BVS0bZbKy3bhRxc+fxYXdRw7qpY6BG
         ZmTg==
X-Gm-Message-State: AC+VfDxSPrJuAypXO8u2yZP9UzK5UGR7rN+QZ2Cs4f0stW9kKFM79/Io
        7FunjmdKNyIOB95yWlDlFF0XnQ==
X-Google-Smtp-Source: ACHHUZ7WBBja5Lx65Estj/dqaAZRltQnKHCN4a4WPD9RhhPeRBS3LNkizwx+3dPAR0i1nU1Vxk1z0Q==
X-Received: by 2002:a17:907:3e1a:b0:957:db05:a35d with SMTP id hp26-20020a1709073e1a00b00957db05a35dmr2670020ejc.48.1682611948580;
        Thu, 27 Apr 2023 09:12:28 -0700 (PDT)
Received: from brgl-uxlite.. ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060e1200b0094f3338129asm10144096eji.141.2023.04.27.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 09:12:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sa8775p: add the watchdog node
Date:   Thu, 27 Apr 2023 18:12:18 +0200
Message-Id: <20230427161218.201828-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that the hypervisor issue is fixed, we can add the watchdog node
for sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index badabf79c6ef..0737ba38fefe 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1008,6 +1008,13 @@ intc: interrupt-controller@17a00000 {
 			redistributor-stride = <0x0 0x20000>;
 		};
 
+		watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-sa8775p", "qcom,kpss-wdt";
+			reg = <0x0 0x17c10000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		memtimer: timer@17c20000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17c20000 0x0 0x1000>;
-- 
2.39.2


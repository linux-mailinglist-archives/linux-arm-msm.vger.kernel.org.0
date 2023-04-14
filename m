Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC116E2344
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 14:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjDNMaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 08:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjDNMaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 08:30:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FBFE42
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 05:30:20 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o29so6250945wro.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681475418; x=1684067418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5p5zrwl2WQXOnUUisPBeLl08Jtuc1NCFU0/h5BWWLI=;
        b=zagk+st1RgmkWCMhNfeaB45ZV/36iQF2X6XMdMQip42wpqyPKYG/CRRwsrjMKp8ufK
         4QGwcCQyCI5rXQiRk5vFnjGThyagDNXViwzFtlloL2gMEZEzGTeBe67dIWa7ES3dvPxO
         Lc3VWiKSAs9NUf4LyheoU87Bz9SNseMuYoHAkbCciHzpCspYQX26l6mBhm9zW6CVl7Nv
         sQnwfNJDdLqUsb84o9AqQofx1Y1Uh5dkjoSweRynaurUkxpPnxNd7TLD5KIEeDKtblh0
         p7YzU918PMiRLcLQ8i/0xHERFLeyEY8HntaCeoHHqnlYF/CQN1q9/4feaqJVesawNyU/
         FngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681475418; x=1684067418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5p5zrwl2WQXOnUUisPBeLl08Jtuc1NCFU0/h5BWWLI=;
        b=AaZSkcTIQI1v9j2G/OmOe5B4oEs+N9q2n3tjNd0W0u0w24ams7bfjnhJsEAaAFqEil
         1mYu5PbiUlp+v3J40qutq+M99UdjD28K1CZf9Lxb587g8PKMpZXizP9O+UHqu+WRj23I
         Vu/+AAETEaXAsoyfIkkaIxbkAx2bZ5JF/3fBgr8LAxQeA9ddajqAqVxC6MIiyouOeCQT
         FCIg+4LbbRUIw10ihPXcqSAcbvViHAmiWVRVYzQffKbZJbDglaw7QVRFUsjBskybr2Jg
         NjnAS7hcHd1ABeiacYQUF4WLKeybYYIMYZ9wBRveXl78gmzWEoopy8dQsMsaMxg/A6pg
         n9xA==
X-Gm-Message-State: AAQBX9ccj8IQjAnDgWoruSGYE+Ay8wf/pQTwbwXwH/NkCBLBQG9fJ3RI
        SVadG2FJuYwexFF4C6tlpDc8xQ==
X-Google-Smtp-Source: AKy350ZL7qna3cxe0Nk9AIb98uYEDOIUzxms9PrG8rS912+LIpZKLX8u4pE2QadcIqq0pGxv8GzyYA==
X-Received: by 2002:a5d:5386:0:b0:2f7:a2b7:86a6 with SMTP id d6-20020a5d5386000000b002f7a2b786a6mr629196wrv.35.1681475418501;
        Fri, 14 Apr 2023 05:30:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6b0:9ea2:8124:b254])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc34a000000b003eeb1d6a470sm4192950wmj.13.2023.04.14.05.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 05:30:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sa8775p: add the PMU node
Date:   Fri, 14 Apr 2023 14:30:16 +0200
Message-Id: <20230414123016.176457-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

Add the PMU node for sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 4ef6d575ce60..3ea9138e602c 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -289,6 +289,11 @@ opp-100000000 {
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.37.2


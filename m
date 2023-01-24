Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA54767A126
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 19:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbjAXS3X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 13:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbjAXS3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 13:29:23 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E29527B
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 10:29:22 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id lp10so12491409pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBHseKN0Bq0k6eUJ7ZDfzyEJ949/USgpBKl0B/3SSNQ=;
        b=JWqsr7Akzao/lsTKjg2U6ruHJdMiZ3ug/GPcGvrhm05a0M9LLy0Gj3BogRPUGCR2CJ
         Js+T8uqcU9tr1rsMsh8zPNLbODN0PgnQ5uWE/LFFjOy3U0KvQCDqJnwbUJLMLeQx8IS6
         rsukqzLD+H86Ay9SX9EbCuY9rtxPCfheIHIwwVflUBNJeE9+XoFqg9x2Foe215PXLqHP
         U5v7N7nExYtjSImr5x9sV8LEtU9d4SZaoQXoLy2L3Hqm9T6Mqu/6WPl7XvmCQukLELdT
         eB7h+RLM/1tOTrh+eV36YLwF0jsbZjGFcQdIMeTQIvGnCNHO80fVLsWDJhJSXr3wVjex
         2Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBHseKN0Bq0k6eUJ7ZDfzyEJ949/USgpBKl0B/3SSNQ=;
        b=KwH0IsUkMuJCaOCThAOf6/cl42+//IgoqBnMMyn3ersxWcLR5VhOzwSCvJmzppdbCK
         A5Tu+nEzn1nebOmVMAPy5qX4DUn6fcgajt0khI5AVB3AUWmpoM/Gb7clA2jU+ApPQG4k
         v7LGkqTC/gkMbeabro7WK7Y9VEB/pd7xFDw+xtKMwfbMNVTQZWlGeIS+PE1EMjg1x1bs
         h9F/nEOP4hO7IrLIOlRc6Mv5lUmQekTfQCkxP9IyhDpOreIsjhKLffJyVR8UUYef5OYH
         kNlchrCldbO1klHKTce0zhdHI+Pj1PXhbxVM17wCXkb8yqFgtA56YO3Y4aqlvz3R8o5N
         p+jA==
X-Gm-Message-State: AFqh2krKmEb1ts4RLT7vHPU9RT/rfwwUhXo5RAquHUYYHjz/PyX4Ylk6
        Ls65gS9kJA1wXuDwimMD1EqAhg==
X-Google-Smtp-Source: AMrXdXuCskyy+nSPqTNseddegZr28RLxBvQHQSD+32FaNvNc5nKqLClcmHVE9GMtYD4FylmhqAAoIg==
X-Received: by 2002:a17:90b:1e10:b0:229:f562:896e with SMTP id pg16-20020a17090b1e1000b00229f562896emr20675692pjb.36.1674584961632;
        Tue, 24 Jan 2023 10:29:21 -0800 (PST)
Received: from localhost.localdomain ([122.171.17.192])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090a1c8800b0020aacde1964sm8647056pjt.32.2023.01.24.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:29:21 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved
Date:   Tue, 24 Jan 2023 23:58:57 +0530
Message-Id: <20230124182857.1524912-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put cont splash memory region under the reserved-memory
as confirmed by the downstream code as well.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index f41c6d600ea8..2ae59432cbda 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -100,6 +100,14 @@ hdmi_con: endpoint {
 		};
 	};
 
+	reserved-memory {
+		/* Cont splash region set up by the bootloader */
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+	};
+
 	lt9611_1v8: lt9611-vdd18-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V8";
-- 
2.25.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367546A5D9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjB1Qtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjB1Qtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:49:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D26C2BEC4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:51 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id kb15so10488275pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvVb9HJYFQbn7yHRn9yj9W99uSe4LLme2syu2gv/yok=;
        b=VvjLgfQ7vFsFQ/vj3DrqICaX5TT+Kxccgx1iR9NnuHBO3+TBXnSGbzXfHuSD+9oVqF
         d9IUVE4UwlNkkPB8/QpUhs+w0yxwtkqZZqiU1BCkMq6OsuKvmqUWKN6EPygi1ilGEu0b
         xq8IJS0ghRrZjRWX7bcbcLP0b3k+gq/I0WQCHAv09rpMs0kD5sdOkPQHZEZYbrHpNYFM
         MrFCJJGR67qeyQl22UMRir3x4tW9F9zb4TY1TH0iqypUgRT0WUzVRWrX4v8wETZChTTS
         aWuSRU2lTAdbHxMLmUwj/oQstVRLFSW3/WuYM1beqGqo/fdH+PZTa4sDTagsLOeUc03Q
         BhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvVb9HJYFQbn7yHRn9yj9W99uSe4LLme2syu2gv/yok=;
        b=j2hJXhKvB+q0yZ5K+yGf3ZVZxnjMjdNYThW4xQcW1te9gVjNxUL3BjRWsYY12+BnKM
         2ZH/uk8I4W6NpAkMLLSzeKOKP+n8+g9ih6KuWVOSaQ5TQ0Cv3E/I2xGDtv69N7DEAEVV
         Lps4yC6SYISNxoECTcivewz+dEzoZya5Od4SL+LYxXweOgm8V6Z47RCXKtNRNQ96eg8j
         e5Dxg31lbkksYWv7sBVsz7ec6Z34z2k/Nx0vtKhTlNMVfSYIuI8A6sH2SH/2MjtJ9HZV
         V0wadxr8rsw0+wD2N8v7hxKoq1qGpt74tH7au7HbPY/3Dup5DWgxF7zb0sje3JWcTJGi
         2Q+g==
X-Gm-Message-State: AO0yUKVhaC9MjJq/YWtCHkR3Ch5wjzf4RdfW3alYI2avC8YYZnJRWaxJ
        KjfN6od3Tj/O8HdJzRygbh3B
X-Google-Smtp-Source: AK7set/jnbF9Gi9XsQrTa3rmDnxOBdQazZlR0vdWfoF1J3p6J9fDclkDWtEZBGSs813xGZHHqx1Hkw==
X-Received: by 2002:a17:902:9a47:b0:19a:ac09:757b with SMTP id x7-20020a1709029a4700b0019aac09757bmr2897365plv.10.1677602930822;
        Tue, 28 Feb 2023 08:48:50 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:50 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 12/16] arm64: dts: qcom: sm8450: Fix the PCI I/O port range
Date:   Tue, 28 Feb 2023 22:17:48 +0530
Message-Id: <20230228164752.55682-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
References: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
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

For 1MiB of the I/O region, the I/O ports of the legacy PCI devices are
located in the range of 0x0 to 0x100000. Hence, fix the bogus PCI addresses
(0x60200000, 0x40200000) specified in the ranges property for I/O region.

While at it, let's use the missing 0x prefix for the addresses.

Fixes: bc6588bc25fb ("arm64: dts: qcom: sm8450: add PCIe1 root device")
Fixes: 7b09b1b47335 ("arm64: dts: qcom: sm8450: add PCIe0 RC device")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1a744a33bcf4..3c9b9425da12 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1746,8 +1746,8 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
 
 			/*
 			 * MSIs for BDF (1:0.0) only works with Device ID 0x5980.
@@ -1862,8 +1862,8 @@ pcie1: pci@1c08000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x01000000 0x0 0x40200000 0 0x40200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x40300000 0 0x40300000 0x0 0x1fd00000>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
 			/*
 			 * MSIs for BDF (1:0.0) only works with Device ID 0x5a00.
-- 
2.25.1


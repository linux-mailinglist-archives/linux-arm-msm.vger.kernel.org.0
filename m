Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51B278B848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjH1T15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233419AbjH1T1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:34 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB761A2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:14 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so35202915e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250833; x=1693855633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAFaAAYoXtYBwsZEB5803CfYwT2H5kOVyLG4imLw9Ng=;
        b=sbvAYBnYvMtQ5zHvNb+ucyUQxsfswVBcZM/ar2F0dRfS4ewDAUJjw03AVtS1PWnf/G
         cqu+nYSS1d4AXk2m0hv8+daSi8iZwzboeUAqMjANlPobyJ4Ql3UmF0YL32U3XIiFpyA8
         1DIW9fQFJ5Ip/1DW8HInCGLwdtV4tkc7IRqHHz6jtRn3J21+kMY4qQm/ggf61IbB6uPl
         oVX11YhXXQLkqHs7C5sR4eZEYLCZMXwEv/mW4idSCkyic1oUUc/H8kIO/YY4dw+mKkah
         Cs9YlbV6RRiwIYMsXxTH5lNlOFWngcE9JgNT68DaeWEY1CNd2XFQW+FNQxmWbmelwyTK
         E/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250833; x=1693855633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAFaAAYoXtYBwsZEB5803CfYwT2H5kOVyLG4imLw9Ng=;
        b=fndoItmC05CSK0oay+K5M8Yb7MUbswurjpnSaTRjlUXq2zHoMuYwzrnUva4q/NDYx8
         V4QA6+Q7acez0ZtjrRzaviVJ6r2RonFO+X4JqrhnCEnKGLoPKR4RZPBo7VYyDvHkUcSk
         8h7o4UNuyH5kHagDVD2G5oKKQ2IekicIZ8rPxg/B5NtsiJeN8V6T3Fm/aYedjUBBU0zY
         8eJPeWMiL9k5GtRm8kTdjaOH1lh94qEkmDSppMC3ffFyArzcqqeUpi2MF6dNLSHnJrgR
         wf3N3EdEnjBOLUTpHKQetJBB9i1LtS5ybK8vly79NoPi4gpwErKaLAHIsi1fpahkfRf3
         d+lQ==
X-Gm-Message-State: AOJu0YyZVxjcH44pm02qShGAT8Zck6yP2sHtB+aLeWj1Tac/OVn7VKbG
        ncdwvGgh4rJEkL/XzRA901Kv/Q==
X-Google-Smtp-Source: AGHT+IERZ8Tk7ITAPI5IRbPu9geaRPRqJ6/1sXAiQvTPNpFfS2XTgFIfNp/PGkXNe/7dmFA1ZZGAcg==
X-Received: by 2002:a1c:7908:0:b0:3fe:22a9:907 with SMTP id l8-20020a1c7908000000b003fe22a90907mr19589642wme.20.1693250833266;
        Mon, 28 Aug 2023 12:27:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:12 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 09/11] arm64: dts: qcom: sm8450: enable SHM bridge
Date:   Mon, 28 Aug 2023 21:25:05 +0200
Message-Id: <20230828192507.117334-10-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable SHM bridge on sm8450 platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 5cd7296c7660..eacb2658e3ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -289,6 +289,10 @@ scm: scm {
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
 			#reset-cells = <1>;
 		};
+
+		shm-bridge {
+			compatible = "qcom,shm-bridge-sm8450", "qcom,shm-bridge";
+		};
 	};
 
 	clk_virt: interconnect-0 {
-- 
2.39.2


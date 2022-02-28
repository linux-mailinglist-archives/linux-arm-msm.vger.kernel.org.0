Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541684C6FE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 15:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbiB1Or3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 09:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237325AbiB1Or1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 09:47:27 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9C780208
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 06:46:47 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id m22so11382959pja.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OvbikKoAKho7Bpj5HDlLF47y32hMSGJasX39JrNGXFI=;
        b=URmkyZsvYVruw8oMATM/SU6nj7nbkltFjJM1BBt12+QxuYj28G8pzr/DCx95mMbxil
         IsWRSETMV0B0ur/ZPTJbDPgtN+hzn9G7wg1Q5VU9ZbjgasHSGttuSuo3kzzXZJADZUaY
         gRTuNLWWiqLls8Dp0qjACh3WYIWLC8XWOj+q6e1e4nkK9G6EIfOyhQtMb0GwyaAJZo41
         gwZvWMlA2pu1ZkGjaNbyBVHEfGf6vqobsT+suj6aFF8hH1va3f17S2nXgia7yea2dr1L
         rvq8/VyU8+dYLJKFDjiW9NEx5OOhnb3idVwuScQPAs3/hkOJ/zfl5DKJD9XZxAIKXGz7
         cFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OvbikKoAKho7Bpj5HDlLF47y32hMSGJasX39JrNGXFI=;
        b=t2oP7/ZYgIanvuc8X/ZQ7c7Uj+0d9u0wdVxyyXxQUZAKRf6zwV3V6z5tfw25DKAk/J
         ab+tWNMUnDyKQ0y4IP0CF3qiCV6HU+ARFNuV9W5iJ7cDxZpPN5YGtAznhCvF8B3iU0tg
         yFyd0pyE+wr8LSx3ncSIcUGqysbWCb5jDL25XSoP56A0QkmN8o8xvF8co6qKo2OAf+/v
         vrFWRyqwwP9zGXpvuGR5d7OAarzsoe2HgXCF+bXtMEmWAtS0ohoq1da7nIHnpPAPlqax
         KzGb7GRvx8FXnHyVVf70KIJdNDBvypCpvGeGfKYWLGassrLUqgWzBEKz21UF9e14zc7r
         avDQ==
X-Gm-Message-State: AOAM531HxzbEcduHxDQPqdQVBg+rjvOPWPaofKPhfUQe5GzYeR2uFdHo
        tcGP3btyJwanS2bdkIJNAvsnsa2lhBIeyg==
X-Google-Smtp-Source: ABdhPJw1ppE/mHpMlz5oM76uYs/NB7A7jUShPr/59O8tKUhyzttPd5wuf2RPmpSNKSQvOqiZZvEmgA==
X-Received: by 2002:a17:902:f242:b0:14f:e2d3:e251 with SMTP id j2-20020a170902f24200b0014fe2d3e251mr20581720plc.19.1646059606688;
        Mon, 28 Feb 2022 06:46:46 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id lr2-20020a17090b4b8200b001bd6b5cce1dsm1736713pjb.36.2022.02.28.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 06:46:46 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Add ufs power-domain entries
Date:   Mon, 28 Feb 2022 20:16:07 +0530
Message-Id: <20220228144607.456194-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228144607.456194-1-bhupesh.sharma@linaro.org>
References: <20220228144607.456194-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add power-domain entries for UFS controller & phy nodes
in sm8150 dts.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 6012322a5984..7aa879eb24d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1637,6 +1637,8 @@ ufs_mem_hc: ufshc@1d84000 {
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
 
@@ -1687,6 +1689,9 @@ ufs_mem_phy: phy@1d87000 {
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 
+			power-domains = <&gcc UFS_CARD_GDSC>,
+					<&gcc UFS_PHY_GDSC>;
+			power-domain-names = "ufs_card_gdsc", "ufs_phy_gdsc";
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 			status = "disabled";
-- 
2.35.1


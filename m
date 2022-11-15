Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C6662994B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbiKOMxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237169AbiKOMxV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:53:21 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3532227FD5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:53:20 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b3so24264267lfv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5UwppQzNSEVKKmCNAy4gJeoujszl/Jk2qfjcyRy+IM=;
        b=MsB9AsCa/sd8I7/62v6UCvzF1xIbj8MxtsKhezVxbCC/LnvvNgOt/pvU+mUvmz/7g8
         TTh+fQiF8E4xsQ7vPy+lk1DaVME5kkfZLImPhwg9qPpkZqE0Ey04+QqMFVXvRCunROuI
         3teTjnJOzeOQEP1M5RAMxsyZeeiLF5lZhnDsMeKfbl2xjgt7JqNvTcqHI9Cf1xEYlaHJ
         Nq+JQ+6cw/wBiPOZE+Qep1ZuXVoSgYlSStAG7HgLqp0XKdPRgQAlQjJNiO7dISC0d29T
         5F62Zmy7tEijF1oUBZmnMkJFOXsEbHA8S8rJ0mw7cDP8OFgXg7ocM+DXfHqlD+rbtIHr
         uEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5UwppQzNSEVKKmCNAy4gJeoujszl/Jk2qfjcyRy+IM=;
        b=mcZToVZ65yt6ZZBdwDZNtn5h3XkDEhOIsI0BLCWpTmd2OJWYcUgw3Cza1dvQUMkUR0
         9v4cmaKUU5eHA5AqcCg55WLVqneuUZDdefy4rp4lXR56PsLoqeljJyxAaYch95xoUUS8
         MEfnxzHxMpVuxLeZFQPWZARQer9KScX3KckoOj4xHKnxAcQTZ5/ESCVmH6QR43YPRo/g
         49pkP3cvHOdQn3xVhij2zjNUf+w+10FyOi/zdReyWfTS6v2r7YpgxCHhvr2Yu7wFpdU6
         cHGu431vf/qDCTfxHfSD5tatq59NYO49UJ24Ra03BbuZt8ER02QrrqMlMB9N5kB/8NQV
         GnWw==
X-Gm-Message-State: ANoB5pkIvy0nPQwWhb2RN8NogBqSqdz4KMK4mfumfEl/LIai1tUZdE8y
        bVMV74AoHVh8PG2PwpjhSQjxeg==
X-Google-Smtp-Source: AA0mqf6uAkyoQgNM086tURqg97P1KuaThc/HXEgKMiVq3Fzrq4lDB/c5TP/DiAM4OQfBOuAZ43z5zw==
X-Received: by 2002:a19:4f43:0:b0:4a0:44bb:d1a8 with SMTP id a3-20020a194f43000000b004a044bbd1a8mr6530800lfk.556.1668516798602;
        Tue, 15 Nov 2022 04:53:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d8-20020a056512368800b0049110ba325asm2177224lfs.158.2022.11.15.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:53:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: msm8998: unify PCIe clock order withMSM8996
Date:   Tue, 15 Nov 2022 13:53:10 +0100
Message-Id: <20221115125310.184012-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115125310.184012-1-krzysztof.kozlowski@linaro.org>
References: <20221115125310.184012-1-krzysztof.kozlowski@linaro.org>
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

PCIe on MSM8996 and MSM8998 use the same clocks, so use one order to
make the binding simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 320a28232a32..539382dab0ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -929,11 +929,11 @@ pcie0: pci@1c00000 {
 					<0 0 0 4 &intc 0 0 139 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
-				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_0_AUX_CLK>;
-			clock-names = "pipe", "bus_master", "bus_slave", "cfg", "aux";
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
+			clock-names = "pipe", "aux", "cfg", "bus_master", "bus_slave";
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-- 
2.34.1


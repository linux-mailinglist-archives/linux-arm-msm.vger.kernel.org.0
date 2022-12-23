Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436876552A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 17:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiLWQSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 11:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbiLWQSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 11:18:44 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ADD1C137
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 08:18:43 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p36so7592864lfa.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 08:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwrKrqGTLRy1JAzULXAgefih55u4tM0/VdC3aQtyB9E=;
        b=XV2F+VqvBRILuf+Sbv0pDg7V5bHcp8CV7VKHmAyzXwt5ahPnvZ2okP7+G4tqXs3fWK
         kY3rk4L34CqJrHFj7C2s2qyifzb2/NS2MLQOtPBxOIRIMYpAVValm6tky1H6832v+vbx
         0UbK7+W8Av0n4141SGyjg1PZn6NEWaoa76OdXWQUSNc3Koj+pPFO4+3terKHC/8lfM3j
         DVYmHuWkcf8DBMjtkHqnR/Mx1cRsF7dZxl5TZByRb9LZWYI8c4A+UHfbc9ppxdn5t6+a
         8nuUK6piZqjfiJdSpmprankLzM6iWgesw289OdQlb/P5OPHO0LUuVZmrhFAm1GOVDbB2
         S9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwrKrqGTLRy1JAzULXAgefih55u4tM0/VdC3aQtyB9E=;
        b=jS/j5wFAFsPQGsuaUV304QRxo2MtIzGbLNKn7L+AHKHCczPrhtSV05XK1NWtEr5DAL
         SUwQFWqIXuBPQfv9i8C4piEs4/Sh5QRaf9ArOyMxicV9NSu0/qNsZYGfgUfiQOMtuHAF
         TZ5NlK/5Vt10oZ18kM95bMPxJqgIE2qKQpDuDIZ9xZIogFlU0t5M4JBIaj/wH13yUy8D
         H1fmoqr56cOqZLb2dMgCl1LY0ygoc5OxKnLPDP8h7lZL2hhXXT+aTQsnNKhc0Q/A1A/Y
         PD7gmEt5Rf8z7x0tF+2d0wecNyXJLiO79kLGQbq45o8Z6gDv2yRWFYFGtosd2zc3CXMv
         UecQ==
X-Gm-Message-State: AFqh2krmxI/TXDbSL2Jh+Bl95kE9T/LxR+EyiiazrNChWHNakXx3yZjv
        5zK5jhSE6qQueHmJeKJL9+/ByQ==
X-Google-Smtp-Source: AMrXdXvwlFabJMcseKE0yS93G7KKhPCBbBrPLJ6TgV4pPa5MPdvkvNA3u5kYWLqvrowGCDJunk4Pyw==
X-Received: by 2002:a05:6512:2804:b0:4c0:91d0:e7ad with SMTP id cf4-20020a056512280400b004c091d0e7admr3763341lfb.26.1671812322211;
        Fri, 23 Dec 2022 08:18:42 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n18-20020a05651203f200b004b4f2a30e6csm581360lfq.0.2022.12.23.08.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 08:18:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ARM: dts: qcom: sdx55: add specific compatible for USB HS PHY
Date:   Fri, 23 Dec 2022 17:18:33 +0100
Message-Id: <20221223161835.112079-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221223161835.112079-1-krzysztof.kozlowski@linaro.org>
References: <20221223161835.112079-1-krzysztof.kozlowski@linaro.org>
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

Add SoC-specific compatible to the USB HS PHY to match other devices and
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index f1c0dab40992..5408ff715fbf 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -214,7 +214,8 @@ blsp1_uart3: serial@831000 {
 		};
 
 		usb_hsphy: phy@ff4000 {
-			compatible = "qcom,usb-snps-hs-7nm-phy";
+			compatible = "qcom,sdx55-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
 			reg = <0x00ff4000 0x114>;
 			status = "disabled";
 			#phy-cells = <0>;
-- 
2.34.1


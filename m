Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9875A9DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 19:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbiIARRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 13:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbiIARRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 13:17:11 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB3E647FF
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 10:17:09 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id w2so17719574pld.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2Jj25UZyRhgqyO+BR+KMQnX1ckBvZ3LEt9xJbNLqsdQ=;
        b=NtrhabWO2jozpsnAy/Ruq2/NfdDJHKxikJKm8wdSLqDN32pt2+nqlQlyhe3+fUX5Wl
         NkaM3hUact0+NWIQ6dMDZYPDHczxKuBr62GoZJxnD8bK3VKLkuMoBA/8K3U6Ibxrm0ZE
         HEs7X47UKVgId3jiBeG06Q49Jjyo0EtjEydko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2Jj25UZyRhgqyO+BR+KMQnX1ckBvZ3LEt9xJbNLqsdQ=;
        b=Rb7p5BXzEUoKXGa/TrqM8C/AOMf8mT8ODM9S+1Oi9MZ/OZqEsOb/zPRHyWPlnf4z/z
         wDMtw+9+Dy++wx8+aP0tnSHEi5Wq5/amSLR5wvev1X9p7886Z76qo2nlj8BhCaPa1QWA
         8R93H2akO05MGQYUoNSktTRUhhdg2ocLRRALYSU+PDqcHV0QTiyujxM2j+QZvzLZ+q7u
         galyGCkDpe24DuQRlCtYXwvJn3jRBWRsyG+unvMLzF/u/PhA2/542XegVk6Kz3sO/Odj
         ziv6w9JFsj4lAm9i+UrteHDG/zLRdYFQ06pP9qpcib/6sP1+OHSPhmoSpeZ+Zgp24AOt
         y10Q==
X-Gm-Message-State: ACgBeo23BVo8v1g1rY4Q5DClfD65LRH6uocDwmcKu7m+AJPSlmgn7+a6
        /S9jicM08UyjixEsJsrYIGlWhw==
X-Google-Smtp-Source: AA6agR44lXt6Z51IuJvoY5+8O3mc5yc7egYdzoZygLx9D4XWj60XvG6mM3eZhHmnToy0nHzqH0KOUw==
X-Received: by 2002:a17:902:ee42:b0:174:88f1:20d7 with SMTP id 2-20020a170902ee4200b0017488f120d7mr24152047plo.32.1662052629335;
        Thu, 01 Sep 2022 10:17:09 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:34cd:3659:c11f:5d05])
        by smtp.gmail.com with UTF8SMTPSA id d9-20020a655ac9000000b0041c45d76b6bsm5593032pgt.38.2022.09.01.10.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 10:17:09 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Configure USB as wakeup source
Date:   Thu,  1 Sep 2022 10:17:03 -0700
Message-Id: <20220901101658.1.I347ea409ee3134bd32a29e33fecd1a6ef32085a0@changeid>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dwc3 USB controller of the sc7180 supports USB remote
wakeup, configure it as a wakeup source.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2d1f38342858..507718f309e1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2780,7 +2780,9 @@ usb_1: usb@a6f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_1_dwc3: dwc3@a600000 {
+			wakeup-source;
+
+			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xe000>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.37.2.789.g6183377224-goog


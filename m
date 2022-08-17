Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A6C596F2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbiHQNFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239623AbiHQNEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F5331ECE
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w5so18925355lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DL4opHqld4qCjVSblJBLt63Edv/Ob11xgTM5Drh1lj4=;
        b=mNTk2jWW7BPZjsiEHfFstCuM03Z30YRzcwqNDvf/vgliYt5PJjHCdjedZ+SToXIRi1
         sMUhVGl5i3ltCiHJ4kGNgmqP7Cqp3AdkLTMGt/3LKf1trh0Ony5/9dH9XTKlupZg1eiI
         UFC9Xsg9KnPjRxygmsSH8m68tLKFF8sY2coFuxxluWZ590HSpEfOJYBsIEcgd8yFfO21
         nRcN3f786/KZ15r8BiuM6AxltTSECW1FuYLJuNUW9CHDZYLRFkEs7wqjOb5EeDEKKmut
         dytda06RcSu8K8/p98yeSQIt7MCtton95J1mk38ntwftc+RjJIvHe58ZQF+OxDj/4Yqh
         Vnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DL4opHqld4qCjVSblJBLt63Edv/Ob11xgTM5Drh1lj4=;
        b=GwUfFbAZfzG9nCI+ruyR0KhKPsqEDkCNVV6yO9HCmQ2rWYJTkxXl5mFhjg51s/KVVE
         0daNPJKDzvnmYFXEO45weKX4MIO2dfOrZAJL2i4I0U4XiBz25jG29OlivUUBuV4HZv5x
         If7nV0k4a0lfNj07i8AFGi6WFeEYK6NGmQX61ij620BPLIWUmttWi4H1EMF8zQkhJj9Q
         5VU3MsdtH9uBqdZrr3hY15J0sd1aTiXrpkPUcjTY36hASvpDlGmxR7ZL94dzmrADtqFe
         09O4S5ROmKA+oAms8W9IpqngG66yH/eef/T+oRyzNvz9pGtUdMa8b2DuR3wuYAWvEsmA
         itDw==
X-Gm-Message-State: ACgBeo0KSG9sBZreMKSZnkuZE9zoSZkbBbCHh5mgxR4JbQdESC+Y/TXj
        RQPpJGAweGv7RMkkBnwWuDVCfw==
X-Google-Smtp-Source: AA6agR6+V//N5hqRVIChR7d/APwjJuKhzsEbiuHog+4LSACfqRJoz/zZzCw0gJU//JJ6cDsz8a/CSQ==
X-Received: by 2002:a05:6512:3501:b0:48b:205f:91a2 with SMTP id h1-20020a056512350100b0048b205f91a2mr8569143lfs.83.1660741440168;
        Wed, 17 Aug 2022 06:04:00 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:03:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 07/14] arm64: dts: qcom: sc7180: split TCSR halt regs out of mutex
Date:   Wed, 17 Aug 2022 16:03:35 +0300
Message-Id: <20220817130342.568396-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR halt regs are next to TCSR mutex, so before converting the TCSR
mutex into device with address space, we need to split the halt regs to
its own syscon device.  This also describes more accurately the devices
and their IO address space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 49f28cb531f6..5d2dd21da79c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1464,10 +1464,15 @@ ipa: ipa@1e40000 {
 
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
-			reg = <0 0x01f40000 0 0x40000>;
+			reg = <0 0x01f40000 0 0x20000>;
 		};
 
-		tcsr_regs: syscon@1fc0000 {
+		tcsr_regs_1: sycon@1f60000 {
+			compatible = "qcom,sc7180-tcsr", "syscon";
+			reg = <0 0x01f60000 0 0x20000>;
+		};
+
+		tcsr_regs_2: syscon@1fc0000 {
 			compatible = "qcom,sc7180-tcsr", "syscon";
 			reg = <0 0x01fc0000 0 0x40000>;
 		};
@@ -1932,8 +1937,8 @@ remoteproc_mpss: remoteproc@4080000 {
 				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
 			reset-names = "mss_restart", "pdc_reset";
 
-			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
-			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
+			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
+			qcom,spare-regs = <&tcsr_regs_2 0xb3e4>;
 
 			status = "disabled";
 
-- 
2.34.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F9264D8E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 10:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiLOJqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 04:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiLOJqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 04:46:01 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AAEE0E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 01:45:56 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso2149627pjh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXo7ON+W+HqSzfMLSf0nu5/9om0aVHW6nmyC6DVkBmI=;
        b=dZA28vUGIdi/CiCSP2VYFhfx23LWLuegyKCalwVTHGro5WZFLR17OKfUhcbXGA5Ioi
         7RSjXdP1A2r9Owi30lSohWAyKNuPGn7omsSCW6fF8atrOEubFTCJ0NQaBqG4e+gE2OiT
         BIowE0P946MCGwn9AMw9B4VeLtgqjKeSY66zc2exXj/Dd4jlLT4o9IhJbhQLXDUVp8U/
         cylC0FgvcipHZiGtXJXbKR5KyiJawqQZ/Ech4REWzjDj8XuvNIZxJVLwZmrC6DQnutnq
         bLnhfj78gsuuXbltmyi7cAYEKDYQERYzuOGkUvsxjcEUeemepDmZ8BzBCdLHDOGSUGEU
         8N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXo7ON+W+HqSzfMLSf0nu5/9om0aVHW6nmyC6DVkBmI=;
        b=unfY4uz1WYNwbXGAE+UVTHuiKC811Bu4RC7Jbvy2pwpN21QYZ8OOtYNLRR+DAkCyJ4
         xVEvRE/0/OVlNrAc0LKwDcmFpOwwiSqvf2EdjAkjGdtAEJtpvGn6Yu+6QSB73xKrSJhZ
         TvpKEhRVoqStHCnCRWZOnZLAldufYZlQznMfmMj4smaTg/0h7/68IijJdQl3RTslP1bK
         nmbo+vyAx4o4QBr4UR1KYEz7SF1N6KHHejYF0+gvwdO1gxf16bQgGP3W+UxUbAKDR5M+
         DwZROTbchXIXV47T+iuu/Kz4k2ugQhhAX5hHds7wWhh+pqtxeCh5TwpLKXQ6mXe45ftD
         RZ3A==
X-Gm-Message-State: ANoB5pkL3M0513kVebAL/8XQFD/Q7RrsrGoHl75W65WOJciJBfFc7fLI
        8lu4nQQST2m1jQaWBztlCi64m9gAOUJPBynpu+8=
X-Google-Smtp-Source: AA0mqf4HrL2HAz0eDVrE2pNSe4QzWZ/dBNMC9Q1rYp30JcAFV9nbdE4U6guklHYjEnmhjQ28grVBsg==
X-Received: by 2002:a17:902:ce04:b0:189:323d:df17 with SMTP id k4-20020a170902ce0400b00189323ddf17mr31042344plg.67.1671097555587;
        Thu, 15 Dec 2022 01:45:55 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5f:4e45:ae49:8018:6d22:e5b4])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b0018971fba556sm3342646plk.139.2022.12.15.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:45:55 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm6115: Move USB node's 'maximum-speed' and 'dr_mode' properties to dts
Date:   Thu, 15 Dec 2022 15:15:31 +0530
Message-Id: <20221215094532.589291-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221215094532.589291-1-bhupesh.sharma@linaro.org>
References: <20221215094532.589291-1-bhupesh.sharma@linaro.org>
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

Normally the 'maximum-speed' and 'dr_mode' properties
of a USB controller + port is dependent on the type of
the ports, regulators and mode change interrupt routing
available on the board(s).

So, move the same from the sm6115 dtsi file to respective
board file(s).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi                | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
index fa57f4bf58256..3f39f25e0721e 100644
--- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
+++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
@@ -229,6 +229,11 @@ &usb {
 	status = "okay";
 };
 
+&usb_dwc3 {
+	maximum-speed = "high-speed";
+	dr_mode = "peripheral";
+};
+
 &usb_hsphy {
 	vdd-supply = <&vreg_l4a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index b5f7480c2e713..e4ce135264f3d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1031,8 +1031,6 @@ usb_dwc3: usb@4e00000 {
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				snps,usb3_lpm_capable;
-				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
 			};
 		};
 
-- 
2.38.1


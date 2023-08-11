Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA66779B8A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbjHKXro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237275AbjHKXro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:47:44 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08D11736
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:43 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so21673585e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691797662; x=1692402462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHGfWV+9QYz1ZluMg0KwkQmO1VYdRcir3I0219Nt63M=;
        b=R77oOfmaOVMc5ZRwiM0cJjeD2l8Qx7gtK334KQBTcKFdG593s/a9D9ibwztciCDgAf
         rZ5xK8v7zHOb61rTnxTfPi9+WAD4aQq9DZdE7oOE+NZATAS7DNWXptbKksypB/6g2Enl
         K6CFF6K/Ktt7OdMrE1S696j9fVni9yNmOXP/u8KgLArNpjOQ4DpHjT2bzliAbO86WhHW
         Jabd2y9/e3Rr/LJNAVUOeMTHfPT2xrDteUgf/rECyBE83wp0+QxvXAUVmlUrJVBFZ2/d
         dYz+CMVEv1+YFEmrmpHZyOdhbs7I5wa/WHUnXs5ingANTFamZyZuwrp0pFGxhKamMAXi
         UTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691797662; x=1692402462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHGfWV+9QYz1ZluMg0KwkQmO1VYdRcir3I0219Nt63M=;
        b=NlIvmWKNL/pYJBeFtYk7zQxQK3xuTuUSAKhkvUIrengLgI6B40rjJTn/x6CG/skw/1
         G5GZOJuwchPW6eBKH/j2m1koQujFEsAzKSzOSykl9X30O4buRbv/uOKBSi62UlBv3wbh
         Q9bXNFXWPI1D+MXqCIJKf/zdzSRykpfwYoB6yZ9WJ9NzcmYon0SzMGhXBcTAzs1oFjZp
         pfC4NNdMj2w5bcizMUvg2QZvfcsV68icHUU/1FQH9jzATsckdPjx1mrVyj9Q5ersjCrO
         piB18fioPljtUpQ+ktNncuBCuGbTeH2UKozHkkTGYg9EPf9v+hyqi+e9vRez616FJ1Gg
         JvTA==
X-Gm-Message-State: AOJu0YwojZ7sdgfGYYhT3EHuXDK2bMp12WGIoFJQu1eXdsodVNNdEbQ0
        9HtbonSMcA+ukADRidP1hNRmlQ==
X-Google-Smtp-Source: AGHT+IGGCWLhIYOfsIThIV2XDkcdi70+uuHtqYkWhHnDBt21Lm8hszEDqfr/OEamHCT+znTnY4l47A==
X-Received: by 2002:adf:fcce:0:b0:316:fc63:dfed with SMTP id f14-20020adffcce000000b00316fc63dfedmr2368442wrs.39.1691797662158;
        Fri, 11 Aug 2023 16:47:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c025400b003fa98908014sm9599051wmj.8.2023.08.11.16.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:47:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/7] arm64: dts: qcom: msm8916: Define CAMSS ports in core dtsi
Date:   Sat, 12 Aug 2023 00:47:32 +0100
Message-ID: <20230811234738.2859417-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
References: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each CSIPHY in CAMMS maps to a port here in the dtsi, since the number of
CSIPHYs is fixed per SoC define the 8916 ports for both available PHYs.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c4d6739046989..33fb65d731046 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1712,6 +1712,14 @@ camss: camss@1b0ac00 {
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
 			};
 		};
 
-- 
2.41.0


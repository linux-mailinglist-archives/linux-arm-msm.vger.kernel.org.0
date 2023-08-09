Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3CB27769D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 22:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbjHIUX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 16:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbjHIUX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 16:23:56 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961272108
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 13:23:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe4cdb724cso1486105e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691612634; x=1692217434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFvAA/v39L86qjDqi6cHkK3yiYvvs9Qa9ISV4luSpBA=;
        b=D5lKChg76AagnVgsfaYJZE7O/gH+nJVjPaq+sObb1dLYZhN/zLeOTBN8VhYrzaVicP
         FwqfPgn16teTnj+No4Xm2RklaBKqzZ3kFDvZSjkDKL/FTNjv/D/z/APWG/BZ7heO4y/6
         FpfLsW7A4u8YX4wC6kDI1okckHJvAsFkvzQB6sbzI89qErFH/u2y6SubcAAYxLBIBVnw
         j3EWqEAac8sBL7qapy8j8N3hB+QhWGsGC47ejClZfm7wNXZffilGSW5nGyjILJjxFEHb
         kZwf0BDsuljRGUF87oDa37nzu0X19HlgOcwra4WJ1lNfkkDmyAyjzAMJ3CWWH1Sf2AT+
         +mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691612634; x=1692217434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFvAA/v39L86qjDqi6cHkK3yiYvvs9Qa9ISV4luSpBA=;
        b=BccdW0GbnScka5k9NgVzwLEW+FUJL+yG2bnQsW247gijOINKBEmKaiUTxVAZC5QdD7
         D79lmlzpqVN02sf7CUjMcE4V2gCj36431qGEbyTzZa/elgGEzPddmrzDM8nu1rOZ2g6v
         KLSsAtUL22faGzAeHrBIFxNGshjyGckkfk3juiOYg8LpuL8yvkXlP9BEJuKAY4lj3IRm
         DZg/DeTGMJvd7MLfa3EhhYmuBKE8WZ3V0diajhaCXJmjRDDWzAiaXuT0ShdKQd6AAB+E
         2qdD0nlD2Yp4kYIQ49PfF6oT2qCRH+qVcs1alX/liDlxOMtP2Wf3lgS41KfXqlyab9Fx
         IpbQ==
X-Gm-Message-State: AOJu0Yx2BLSkNTkunwb+ycGHkgbaYJy7kO/UtIzVNxri3rwFQj/1w+bG
        dhJAX9sdZS1BWgPjKZIpe3Segw==
X-Google-Smtp-Source: AGHT+IG3+Ou0kmNriubgr3+Ks3+xBODrP58fenVUq6bQMVGoDh3kP+GiHat/iKu11KM1Fy/ohjgxmQ==
X-Received: by 2002:a7b:c4c5:0:b0:3fd:2d33:6a9c with SMTP id g5-20020a7bc4c5000000b003fd2d336a9cmr167849wmk.27.1691612634046;
        Wed, 09 Aug 2023 13:23:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c22ce00b003fba2734f1esm2927509wmg.1.2023.08.09.13.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:23:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: apq8016-sbc: Fix ov5640 data-lanes declaration
Date:   Wed,  9 Aug 2023 21:23:39 +0100
Message-Id: <20230809202343.1098425-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
References: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The yaml constraint for data-lanes is [1, 2] not [0, 2]. The driver itself
doesn't do anything with the data-lanes declaration save count the number
of specified data-lanes and calculate the link rate so, this change doesn't
have any functional side-effects.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 75b4e5ff7c95c..0481a4a82090a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -291,7 +291,7 @@ camera_rear@3b {
 
 		port {
 			ov5640_ep: endpoint {
-				data-lanes = <0 2>;
+				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
 		};
-- 
2.39.2


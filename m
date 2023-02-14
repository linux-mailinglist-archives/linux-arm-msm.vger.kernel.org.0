Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB8786968DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 17:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjBNQMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 11:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBNQMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 11:12:19 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4D346B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 08:12:18 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id jg8so41372168ejc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 08:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoFprvw0esXR9T/oy/C18QmLGugMs18DWBdKBHAG2rw=;
        b=OKirlgqq4D0Ms98OLQSfnSp3h7CG8JOy27e3g1babPH7aNuSpbH3ZYG5MncS5IVsCS
         Im9Im8r9QnbGMqbIvEKctFWzT8BSTJHGrPZRkTtIX2TkJdP1GG9KUdkGRrdEy3XaN1Wq
         mocpiFRc3N3OGGMhIpxebl8cTqZ7ehzHqC1k9Kpyja20mFJP/iIJkxnoXHU1P+jtDYfr
         A8N2o7yYGKNgA/jjSDrKYg5/C7tl7xZYu4o3f0hJ1mYJ2crwH0VpGOU02vc4Kqi9hZEK
         l4KNZvt7PCbWBxo2WIeLGKR/A7lM4Nh1PExhQNpSR+MMqHNcbgZC147P8w8cqE340Fa4
         aYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoFprvw0esXR9T/oy/C18QmLGugMs18DWBdKBHAG2rw=;
        b=FjjvuePCBG9N7KUjWybnTLMexBcbEHsJwJ67IIk0WAYgfdqm3w9QCS06xlBsDGacOt
         aEfDU+xlWyNWGGn08f1M3vS1sTJR4BLfwOv/xtc4DmBDH44F/WwXETXoCSGFuvwBegvM
         8jYJj4dRPjd/vr5O4DxULd0zRV2MMWKMpQwoXcbbeVQDCBwEkghfQ+zUDRW/yXWotmeT
         A4x7k5JIBcC/DgNsqxp4mNlr07iBBSgHJRcfWVmzI36ICg1dMlcRSK1deuVpgW676W6z
         U7V1k47I5r9HwSsp3UN6tcbBJrVKzMBStnrwBQFWlh9mSE8jxh8mWxcoAaIcSqb0Q29Z
         v9sQ==
X-Gm-Message-State: AO0yUKWDFne88fKDt3Rh6iozaqwxyHf1VTzdVifU7l9qDJC4mD+M996v
        WKM2WC9QpBSEnUZf01pczfIIpw==
X-Google-Smtp-Source: AK7set+l7/awNleC5TDYRG+ZuD7rI0xqYlFbVW4627GHaP9mscFk71BN21zczWA9Um1U0Gb/CT36CA==
X-Received: by 2002:a17:906:f8c3:b0:8a4:e2aa:6cd9 with SMTP id lh3-20020a170906f8c300b008a4e2aa6cd9mr3582528ejb.19.1676391137232;
        Tue, 14 Feb 2023 08:12:17 -0800 (PST)
Received: from fedora.. (cpezg-94-253-130-165-cbl.xnet.hr. [94.253.130.165])
        by smtp.googlemail.com with ESMTPSA id de56-20020a1709069bf800b00878530f5324sm8564376ejc.90.2023.02.14.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:12:16 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] ARM: dts: qcom: ipq4018-ap120c-ac: align GPIO hog with DT schema
Date:   Tue, 14 Feb 2023 17:12:09 +0100
Message-Id: <20230214161211.306462-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214161211.306462-1-robert.marko@sartura.hr>
References: <20230214161211.306462-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Align USB power GPIO hog node to DT schema.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
index 38efd45433da5..cd2a32d0d5548 100644
--- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
@@ -76,7 +76,7 @@ mux_cs {
 		};
 	};
 
-	usb-power {
+	usb-power-hog {
 		line-name = "USB-power";
 		gpios = <1 GPIO_ACTIVE_HIGH>;
 		gpio-hog;
-- 
2.39.1


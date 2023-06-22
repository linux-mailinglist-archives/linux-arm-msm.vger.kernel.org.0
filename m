Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3E873A06B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 14:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjFVMCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 08:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbjFVMCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 08:02:22 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EF21FF1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 05:02:02 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fa71e253f2so5652415e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687435315; x=1690027315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVlJCvybdeYjvv8ryzmcQEkNwtr78sKz5e8xX8tuWYs=;
        b=C8BowXKmNG6ia2Wm3UtQT/5cWilxo2PodO7vNltAYIv52xh7T8IDrvCpJLHhLuw8Gl
         8qgtNfK3Rx3OZ9ggP2XkDDrJzmwbJpE/IPMx6mvtrCkQQDJg7m/AFmu4VgUb3/vHDCwO
         m0VVA3PnOWbZqSvStMGdItjm7lVYHVz5TPCDolF7MIED5mXRUn7VHgiXHYKzUwX8zN81
         TjKxoObpL0gtfkBwC4ffzWpyU87onzD3xwUcqQL5HW3hqM2chihrSGRl5Xe+nYIei4NX
         seYiC8DOGWFzTt5tNKY+bTHm6LnuP5vRVArtFdKT9oY+2fo3ttcsMxd2Hw4wSZiEl0IG
         Gn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435315; x=1690027315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVlJCvybdeYjvv8ryzmcQEkNwtr78sKz5e8xX8tuWYs=;
        b=PjFQ59+9KzUR2DLgcY0FA87yxr/3O5x14CygOt8UjP1QAdU8eL8b7qZ1T6HrrwZ5t/
         skrHfOMfKhWFRTN2kmt7X4n7dXMEW2hxD4q1+HNt7sfxCK9+BXuINEz4EhETKYhZ086c
         7Ecz9Hs/wi6rccl96nBJ0pLCBFWz34cyohEFIiuruhUk5pqFDqCWkfGQ6mpiy/S2k203
         S8JlBXLLRhP+kUN4pc56ULASxvjhNO4lSEvomUWsCF5nMRUBF0dmfP+AOcTjEk6YaJfc
         e/Q/SYgtDdZCUUEunwL89Dn2Sp0mw4BkRty4D1GO6JOWnWTU/XS8AomCMgx/Z2AJr4eE
         A22w==
X-Gm-Message-State: AC+VfDxJj3lFodXUJI7ROPJalwI3V6IBV0Mf0iJaDAlHi5tK1oe3gTHQ
        gMN7+QsrsCjKbOBOpqYB6oGxyw==
X-Google-Smtp-Source: ACHHUZ6g2/qEcVS4UCzFHdCuPd1cab6E0b6lt6uXUOmWx9zVx49N7XM28BkCdrJ23x/f4uyw3i0m9g==
X-Received: by 2002:a05:600c:4f96:b0:3f7:f302:161 with SMTP id n22-20020a05600c4f9600b003f7f3020161mr22362886wmq.8.1687435314389;
        Thu, 22 Jun 2023 05:01:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d785:af3e:3bf5:7f36])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003f8ec58995fsm7594296wmo.6.2023.06.22.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 05:01:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v2 3/5] arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
Date:   Thu, 22 Jun 2023 14:01:40 +0200
Message-Id: <20230622120142.218055-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622120142.218055-1-brgl@bgdev.pl>
References: <20230622120142.218055-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the internal PHY on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index ab767cfa51ff..9f39ab59c283 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -355,6 +355,11 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.39.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2340A7D56C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 17:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbjJXPoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 11:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbjJXPoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 11:44:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2CABA;
        Tue, 24 Oct 2023 08:43:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507bd64814fso6732231e87.1;
        Tue, 24 Oct 2023 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698162238; x=1698767038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gRQ3eaBzR9jPgqcO4EW2/3ELFHI0veMtRW8DtdUdBQ=;
        b=J3Lo9DcZdVNT/nh4Gd/TBbUKk/uyuH6C1ahcspBwv0g1ho3KVYGNQowIQidSU8POev
         QBxO1Ykq/q4+pqI1GIUGIoLPXZo8Qh0KDBZX7IHGJSmvIKW/3HhCC2r7s69G+wz7qNkE
         Cj8XYyBtsSAu0wHNFAXhl89aRRa27z6j32D5CZWb7Xox4P+0Eu3AGT2q0cK136Ikkxqm
         5I2c7xZKBkI6XHilET+6eIKtFpRO2MWwyq4WgQr6kUn5oIt5lNZx1edbL3ZYrDqeU924
         ow2XxVi2KRbYCgDNlhqwgooMqXJfSzeEwUmiRaZ/TgMZYCuxGe287dm1Oo4JnY4dXLgg
         mfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162238; x=1698767038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gRQ3eaBzR9jPgqcO4EW2/3ELFHI0veMtRW8DtdUdBQ=;
        b=Lwueqk4vMGp3yAxczxnNqh3vt1cNvp+1ymckuXr635iuCZ/VtMf+3cWZCqvpzF6dn9
         MrfQJsAaJ+kid7YsuqIcQz2LXXKaj81Zg7Cm/1sBe67rVNgh6eN4Slz5tjwRrmppbcfX
         WBBQ+Vz7VAyTUL2y/UFLpAtu6MSvdQZwTBFTn8QIE05pmchARbcVL68Lh7M97dDPrtPG
         JK9ZCupsnLy/JfU74EWJcSz4aCayOXCxMfUroyK+TW2A42fINOWPYX35n8MqDr9oW2gU
         hDHPLUDT67CY1usAvHgu6X3ljuVjXgImDCiHCJ8PTHkPO5OhnVtnyHd2aL55Jnr/Dzna
         YaJA==
X-Gm-Message-State: AOJu0Ywv3PnKyt6dXckrgRIM0yEHfgYb99vO9If+4DclKLeSQPFBoC6u
        emISnNuDCcFwOUyoSdEVv7s=
X-Google-Smtp-Source: AGHT+IGrHmxLcWj0LzMCjg20n5VMnPSxGVGwB3cP3JHM9EjwwlCi0kFVrF8WgOfs7KbGjB5QBvjwkg==
X-Received: by 2002:a05:6512:ba9:b0:503:19d8:8dc3 with SMTP id b41-20020a0565120ba900b0050319d88dc3mr10212201lfv.31.1698162237800;
        Tue, 24 Oct 2023 08:43:57 -0700 (PDT)
Received: from debian.lan ([37.45.216.172])
        by smtp.googlemail.com with ESMTPSA id m1-20020ac24ac1000000b0050810b02cffsm102420lfp.22.2023.10.24.08.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 08:43:57 -0700 (PDT)
From:   Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Dzmitry Sankouski <dsankouski@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: dts: qcom: starqltechn: remove wifi
Date:   Tue, 24 Oct 2023 18:43:35 +0300
Message-Id: <20231024154338.407191-4-dsankouski@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231024154338.407191-1-dsankouski@gmail.com>
References: <20231024154338.407191-1-dsankouski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---

Changes in v2:
- none

 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 
-- 
2.30.2


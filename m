Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D6F694717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 14:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjBMNdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 08:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjBMNdE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 08:33:04 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C5F1ABD0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 05:33:01 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qb15so29819126ejc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 05:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70OvqASv0mjZllhMqhkKWtUGVSAnAQUMLpze65KxTCo=;
        b=Ufl0lz+8F8Gv68rGLtMmMpLGiOD4XsDVpokfoh54YtWrD1I3E5ID3zwxHISNMtvnSG
         7f4w7Q/14y/OoJWeCcQVAqO2sG7qHSLroGKk0QB9fCiciT1+Ik7IJfuug5j5HRK7139c
         3L+vrW4qKEA7NO6x1gI5kIDAMYL2khBaDfnwiZGxqnRQ+6dn7fqmZ+eGUJYPZWPiYUtm
         EaGn0nzdsrnOu5pXxw0XJUwYmCPS6ZW1FzFNoryGCtwvhpNS4hb2YYQ7kqXy1vl9Ab+I
         n+Gz/oKbWEvZP8b0LDlzhqh6BSP4rV/i7x1F8gmNdq9ZhNsr2+btyvZRx0ygZNIc+qXi
         R+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70OvqASv0mjZllhMqhkKWtUGVSAnAQUMLpze65KxTCo=;
        b=a4r9Hr6fo+Jlsri/skn6k8kh6VD417HrP78KqgzQ+H38uVrmFdxTF8Gxk9SWnWHNAt
         Se6vy0Aj4iNr5iO3LPgo7wxntkblbJ+Ibo4xIWuSzukkDJjYMxhhueLniqgOwka1b7EG
         LGY1N/KwFA37K0BvdxAnB+5LoeGy07aJrRe+jZaUQpZGaq0AlFx5928HhmxHMyjrBioF
         LvH6hQ95YJDFRAdUwQeTr/PiO2SLc4hAz2u1HAnFRhN2GaJvi3t0fVJfJoZYdtnRvKXz
         nnmBsKL/f9hOu4i65eIJeqejtsLBmVlO/3J1rQd6Ws4Z5UskusTgLkk/8mQxeMRQFdV+
         A/ow==
X-Gm-Message-State: AO0yUKUg5Y3CLoLxteZIo8j+aRvz7RMZoRmMgJ/2cq9JLA14IP4Fe2+R
        31kPd2fjW8AcQps2EV3Oji4+6w==
X-Google-Smtp-Source: AK7set+nssou59xHVmaH/Q4nYYZy5U3YjvGk2efyx7dTUsVP2Q+dP5FCZEMqrN2EgxHoC3ZiaboTcQ==
X-Received: by 2002:a17:906:2a0b:b0:887:d0e6:fa24 with SMTP id j11-20020a1709062a0b00b00887d0e6fa24mr23836713eje.76.1676295179311;
        Mon, 13 Feb 2023 05:32:59 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id h24-20020a170906829800b008aa0305dbe8sm6661180ejx.80.2023.02.13.05.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:32:59 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 13 Feb 2023 14:26:50 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: enable
 remaining i2c busses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-fp4-more-i2c-v1-2-5be09dbb5ce6@fairphone.com>
References: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
In-Reply-To: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable all i2c busses where something is connected on this phone. Add
comments as placeholders for which components are still missing.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 86114dd2c0c4..d0f08b42592f 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -359,10 +359,31 @@ &cdsp {
 	status = "okay";
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* ST21NFCD NFC @ 8 */
+	/* VL53L3 ToF @ 29 */
+	/* AW88264A amplifier @ 34 */
+	/* AW88264A amplifier @ 35 */
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* HX83112A touchscreen @ 48 */
+};
+
 &i2c10 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	/* PM8008 PMIC @ 8 and 9 */
+	/* PX8618 @ 26 */
+	/* SMB1395 PMIC @ 34 */
+
 	haptics@5a {
 		compatible = "awinic,aw8695";
 		reg = <0x5a>;
@@ -495,6 +516,10 @@ adc-chan@644 {
 	};
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.39.1


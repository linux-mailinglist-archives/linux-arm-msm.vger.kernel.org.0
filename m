Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4B68CCC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 03:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjBGCtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 21:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjBGCtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 21:49:00 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE1835240
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 18:48:48 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k13so14311232plg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 18:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtYd96w13o2OREzHMRA9bmLEb9XbyiE/swWiI2WGNPk=;
        b=alBdbTs4aYTpqvsvp5qXhFdhnTI2epGijKZElaHhBcVXZvnCcyMKZgCAcxYLjgqh87
         oQNA7vnnvFTkbN1ys+txiF+FEZ2cDXgAK6tqUBRrNy8loJXv7iETNjXb/20vr5U+waJY
         cHQyz7Lsrf1udFnBDmpP5HMe1t8mqJNef+3Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtYd96w13o2OREzHMRA9bmLEb9XbyiE/swWiI2WGNPk=;
        b=IsziEroWSqsWhNzmaidvz2eCS0MILIo73P5Jc46m3t97bLpS6j5ovFRwszky/flK5X
         bWczABLM9FpqXoYkRlUeEJOk+qts0VQisy6E7JGngvGex1qymrKbo9WpU8Zuv5MuDxrJ
         mL05zZItcooQkF+IXDMTuJ69d1455NbKlFiv5PGCVgukURUy++R+2JElnu44O0PE+UkV
         j/Oj8Wv8/tt9T9fJnXBIoFtOo+A6rU/wKF5V4WZ6Xlbd8ddGjzKgT+S8RMdQ64pcsmUV
         m4dlGEFNO0+CAmqfjQQApSBj+9ApkWaVtp9ALkCPwhw4ZNefvQaVA6sOulOGsZdT9vom
         ffPQ==
X-Gm-Message-State: AO0yUKUxG27vYWK16C5MvIjXQS/zmo2f1kQarXPR+Uc+jQmH5QRC8/ct
        Ua6+HwKJVnY25u/0RUg5UOR+5g==
X-Google-Smtp-Source: AK7set8PakDpMdNYhbsDvMwLSodhrID1iJMRgN8+eGZpebp8JNWDDM9jPhQCsAOeKLomtmsV1bF78w==
X-Received: by 2002:a05:6a21:6713:b0:bf:1769:347f with SMTP id wh19-20020a056a21671300b000bf1769347fmr1304873pzb.47.1675738127561;
        Mon, 06 Feb 2023 18:48:47 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:47 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: sc7280: On QCard, regulator L3C should be 1.8V
Date:   Mon,  6 Feb 2023 18:48:10 -0800
Message-Id: <20230206184744.1.I784f4b3d7e4a06edafff4a3129f52e749889bc05@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230207024816.525938-1-dianders@chromium.org>
References: <20230207024816.525938-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the first sc7280 QCards the L3C rail was never really used for
anything. Stuffing options on the QCard meant that the QCard itself
didn't use this rail for anything. This rail did get sent to the
mainboard, but no existing mainboards ever did anything with it other
that route it to a testpoint.

On later sc7280 QCards, the L3C rail was repurposed. Instead of being
a (nominally) 3.3V rail, it was decided to make it a 1.8V rail. It is
now provided to the display connector (which might route it to the
touchscreen) and also used to power some buffers relating to
touchscreen IO. This rail is getting the additional tag "ts_avccio",
though some places still refer to it as "vreg_l3c_3p0" despite the
fact that the name now specifies the wrong voltage.

Since it never hurts for this rail to be 1.8V (even on old QCards /
old boards), let's just change it to 1.8V across the board and add the
extra "ts_avccio" moniker as a label in the device tree.

Future patches will start using this rail in their touchscreens.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index df49564ae6dc..50d963957303 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -230,9 +230,15 @@ vreg_l2c_1p8: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/*
+		 * The initial design of this regulator was to use it as 3.3V,
+		 * but due to later changes in design it was changed to 1.8V.
+		 * The original name is kept due to same schematic.
+		 */
+		ts_avccio:
 		vreg_l3c_3p0: ldo3 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3540000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.39.1.519.gcb327c4b5f-goog


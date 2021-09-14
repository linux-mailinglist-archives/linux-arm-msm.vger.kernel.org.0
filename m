Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F320840B697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 20:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhINSQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhINSQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:16:03 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA09C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 11:14:46 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso19817826otu.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 11:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sYTvZJAxHGhzzHy9MbB9JE2/ATEqAjDDP6ye5nyr/vE=;
        b=DTgCe1uEB8ugrI4Uve6EgB8s+22KurxbPhxGKDbFnRkAUiIzTUFljDAf2cGtCQOzxx
         zW4sOSF2cJzsyTSoSWzdHz7qWGeQbLEnLF2GuUuFOQqBbvzlrWNc2VhZpJCWYdyPHgFy
         U03jpb3rz9UIy3fvEsXfLc5KX2gQtU4idIv2VkqONw5jVK5/6wUDAGJxawKcYT0f1eDt
         xzdqKieOo+hCnNYJTKJTag2s127zSH+HxddoipCe3JVXRgPelbVEcruBXIFLkhXBKhFQ
         AQJEe8aqh2CnTk9u77jHdGjoO+Fdx6lvME6aTFy/eWU9DNpFrU1lyQzuvdqN1xlRfyKY
         vmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sYTvZJAxHGhzzHy9MbB9JE2/ATEqAjDDP6ye5nyr/vE=;
        b=bBXqcA5RSPFopCi7QpfPh4CBIP3tgZH8Zl56X+hysXL9EiA52PiVpTvlR4WwPJIEdZ
         yTTY7e7ojVAdWoZhc6asezUbQ0v3KWDNNoBPmgQZgwLPukzDVDDIRE+Yj0HXO5+C5U14
         pYX8PuL8O+ghOeHskB99SONicC1gTv32PQRGWzN5nkLGVnxwKnNPk8VYq6eZm9fOZTv1
         CMSSjAgcHSzMGZA+DaoXoix+kNFCGN6Sex2oP7k1FtKADRUkzGY2JSJvUAzdQyZuA2tV
         MQp/7cMlR9P4wh7/pok78ZLwhw/yXeuuQTSjv25M2+eWWpUHbqM3H6R9mqMLE9/aAWlv
         xJ5Q==
X-Gm-Message-State: AOAM532VIK6SBa5py2lu+3daCMxdcn9DhK3Kp3u7qJmloy9FcDIlf++I
        0AlCOUwB3vRI/douFGfk1HNz4Q==
X-Google-Smtp-Source: ABdhPJzAapFP1GYfQM+h+eExDIQ09L8TCYZprsclHv54zKcSa9rwQ66as5TbcALddgz9QnkppHaYuA==
X-Received: by 2002:a05:6830:2093:: with SMTP id y19mr16018501otq.349.1631643285404;
        Tue, 14 Sep 2021 11:14:45 -0700 (PDT)
Received: from DESKTOP-UL9N8HT.localdomain (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id w15sm2578954oiw.19.2021.09.14.11.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 11:14:45 -0700 (PDT)
From:   Steev Klimaszewski <steev@kali.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: c630: add second channel for wifi
Date:   Tue, 14 Sep 2021 13:16:03 -0500
Message-Id: <20210914181603.32708-1-steev@kali.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914162439.31113-1-steev@kali.org>
References: <20210914162439.31113-1-steev@kali.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the Lenovo Yoga C630, the WiFi/BT chip can use both RF
channels/antennas, so add the regulator for it.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index d7591a4621a2..531b88d4a1a2 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -230,6 +230,9 @@ vreg_l22a_2p85: ldo22 {
 		};
 
 		vreg_l23a_3p3: ldo23 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vdda_qusb_hs0_3p1:
@@ -610,6 +613,7 @@ bluetooth {
 		vddxo-supply = <&vreg_l7a_1p8>;
 		vddrf-supply = <&vreg_l17a_1p3>;
 		vddch0-supply = <&vreg_l25a_3p3>;
+		vddch1-supply = <&vreg_l23a_3p3>;
 		max-speed = <3200000>;
 	};
 };
@@ -724,6 +728,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 };
-- 
2.33.0


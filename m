Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B243228C9B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 10:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390695AbgJMIBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 04:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390627AbgJMIBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 04:01:34 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDD4C0613D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 01:01:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id j8so1666906pjy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 01:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tsWTpurAuv/vlEeR04dTlVeLk9jDAutyxmmT9x78Hg4=;
        b=VHXuf5PSGufIuEVtxw7oi/WheNmXY+Z+WfaKAzvMOxnjZwgkxR1OmEB4T8sZQewEtg
         e1c+/oALAlAF0tmbAPm4p0htrPBmga/hDHq3dCm764yD1Y8h89UBPvIgeOxhpUkmzd9y
         YzRv8baPNKQB6EzJLbfAejrsl+2fGLM9ZtOCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tsWTpurAuv/vlEeR04dTlVeLk9jDAutyxmmT9x78Hg4=;
        b=RdI6Dl+pMwXmQ6vJAOm9SyRJf5seW43R8y5KXkXi907HZJQABifS95Ld8UV+79TXfh
         id2J3m6jOMITSf3p9fuPDVqoEZ907dJXVq6/Rtt91RfFY1f1h3dFYSEwi6JzWL1drhFf
         pcvMPpqpZgo+n1gjtA8Sov7kEOMy1CUJ2wCNQbTOJkMI42BOBLq6uz5v8+DsDab8Mybv
         4sAtY4gXJ7veqc7h9QVAU5ns8ypzget+mSngyM+VnFzpI0BBr6AXp1fpJczjZfqD67SS
         5i6CkwtcSZqRpcPhzilYpCiebcgQkktr3LqOiuH8momEZvJjLJoKrWB6ivmzweuIr/ko
         HP1Q==
X-Gm-Message-State: AOAM532t6uLCxKO5OiYLlogl0HUFG0Ftea2E3SMVyx8SC2Jd2evCQYGB
        tNe/9HKgOYNyQthrKUyWWy4eXA==
X-Google-Smtp-Source: ABdhPJzSKtqGpIzDGHTlIfXQtiyAnZNTdOdilKUyo1dojj/V/fNN8+sHQZsbPzxjkylibFLyW4WseA==
X-Received: by 2002:a17:90a:7d16:: with SMTP id g22mr24517159pjl.135.1602576094443;
        Tue, 13 Oct 2020 01:01:34 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net. [73.63.253.164])
        by smtp.gmail.com with ESMTPSA id y124sm14956924pfy.28.2020.10.13.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:01:33 -0700 (PDT)
From:   Alexandru Stan <amstan@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru Stan <amstan@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: trogdor: Add brightness-levels
Date:   Tue, 13 Oct 2020 01:01:03 -0700
Message-Id: <20201013010056.v2.3.Ie4d84af5a85e8dcb8f575845518fa39f324a827d@changeid>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013080103.410133-1-amstan@chromium.org>
References: <20201013080103.410133-1-amstan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we have better interpolation for the backlight
("backlight: pwm_bl: Fix interpolation"), we can now add the curve to
the trogdor boards, being careful to crop the low end.

Signed-off-by: Alexandru Stan <amstan@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf875589d364..ccdabc6c4994 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -179,6 +179,15 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
 	backlight: backlight {
 		compatible = "pwm-backlight";
 
+		/* The panels don't seem to like anything below ~ 5% */
+		brightness-levels = <
+			196 256 324 400 484 576 676 784 900 1024 1156 1296
+			1444 1600 1764 1936 2116 2304 2500 2704 2916 3136
+			3364 3600 3844 4096
+		>;
+		num-interpolated-steps = <64>;
+		default-brightness-level = <951>;
+
 		pwms = <&cros_ec_pwm 1>;
 		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
 		power-supply = <&ppvar_sys>;
-- 
2.28.0


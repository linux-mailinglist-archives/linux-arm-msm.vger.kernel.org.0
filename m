Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A483E66C22B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 15:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbjAPO0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 09:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjAPO0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 09:26:30 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ED83FF31
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 06:10:30 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id mp20so21779512ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 06:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95zlwr3oGbEH4PtnU1plJbud3bl8LR5sDmOAyZuPGAY=;
        b=lWkSxU8i7btY02uxvssR9Id6g+LefUZXI7exjtOGQJzPKF9xYVmP+xn+I5cSI3RN3c
         Q/9iW9szRIc+I4f80WmGjO6HKhGCRbfvhvpfO2V0xcnzMWEyGCLVW9/utcb2Ed8ZNi7J
         5kRKBYYbAyER6Q64L0Uo8hqJ5dLN8ImaL203BGmOy7brk1jqACxsRtdQQa3pHsGNlw+3
         pYaGYAHU+LqDREXxBoZvzgdZBC02zm+rkOGLuY4dIgoP62mPRMgnXdt/iJArkJ7gHD4v
         N6aYHmNoI8tBuT25ckH1F5siOxmw07CFU+pvE4j9fRgnJHtDhHwQ6OJgRIBY1ZWxsiuZ
         vmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95zlwr3oGbEH4PtnU1plJbud3bl8LR5sDmOAyZuPGAY=;
        b=3Aub9c1LqLsPVX+iWvQrEKlOus45EdX+Uhw1udbW6jKgMKmBhluxHVJ9Ck0Fj5l5Uc
         fuPYDkhMXnTdiw6UUy9l/bNugkmNAqycSTGbQ819RPm3g+sFBSGoeo1HtiJ2qVlexTDn
         eo0jhCtUxV/0MvKlOLuSG1OkNani4HW0s1rIhyT+AFrChyyjPMZ6txRk9T3tndVf7CDL
         wBIwE9cdc6FHV2DQdWR9+hvB/SERCG0Q2zrooRXE8/0EvjWTclxZ68QuMnzeWgYRXsc8
         6XRR5cvxiVs258XXsYh7YsFlv9WEZFQ0J3onqjdaaLCoMZKLEu4EhJn/MYk4yiESmKfW
         x2/g==
X-Gm-Message-State: AFqh2koR1ybX9t6Cc0RtuhHq03qgf/jO4M8TLfEKqR+K+aSzJe/Pftqp
        JWEsVUQmok0J54l0NKlwkcfUNw==
X-Google-Smtp-Source: AMrXdXs84SameYiqULBGYEB5mu8dxG4BBb8wK8cvfQD6pbxMuOECa85lsE69i5TGbXo3Z94apKUUXg==
X-Received: by 2002:a17:906:8e0a:b0:7c1:1444:da41 with SMTP id rx10-20020a1709068e0a00b007c11444da41mr14602479ejc.40.1673878210955;
        Mon, 16 Jan 2023 06:10:10 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm10704150ejc.40.2023.01.16.06.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 06:10:10 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8550-mtp: Add UFS host controller and PHY node
Date:   Mon, 16 Jan 2023 16:10:00 +0200
Message-Id: <20230116141000.1831351-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116141000.1831351-1-abel.vesa@linaro.org>
References: <20230116141000.1831351-1-abel.vesa@linaro.org>
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

Enable UFS host controller and PHY node on SM8550 MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 8586e16d6079..81fcbdc6bdc4 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -399,6 +399,25 @@ &uart7 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+	vccq2-supply = <&vreg_l3g_1p2>;
+	vccq2-max-microamp = <100>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <76800000>;
 };
-- 
2.34.1


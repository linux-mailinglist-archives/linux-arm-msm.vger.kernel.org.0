Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D792F70AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 03:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731986AbhAOCml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 21:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbhAOCmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 21:42:40 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0678C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 18:41:59 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o19so11083776lfo.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 18:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vs1r0AZs3ldhjf+gof6Gcqu5JtaJeiVqg0aeRPk9Wek=;
        b=MchTCeL43TPv0d8h5+AAY2iwuueROyDAj3xcC1b1MvdLLuBmK6WZ7Pu8/g3daVL565
         tJG1hOhZoTb0UEoHUdzUlyjy/1SEKPPL3R5F7irvwkRf5uGBYACJIGZRTUhVHNBA0PAk
         4EYT0YexEHFndthChwJkZVtWaz/9342z9HVXgMnyR7TOhVkryqGfTYmtY9SgaJamSYFO
         IK1PMDp1kJS9elWA+XpP7/zDkQiFNwTI4oX8oki/l7Gzio4hWDIxP9C10M2a51WC8kiU
         c57PzoxRPxGer4Ai/reKAWfQGLgaQreHyG+dy2q37+OuHHjIPpqp52EiCFGDsrc37TqU
         LMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vs1r0AZs3ldhjf+gof6Gcqu5JtaJeiVqg0aeRPk9Wek=;
        b=GMSnnoRA7pCudgdRIg0dDqHeVD3BxWVBlZh7k8gdGVfR13EY3GtEhb+6zWFCq11+nD
         5CpVTtuu6TzC66uy+Npk43vSGJ8wR9DqE7aGiln/JerpaPYKrDb8DKJRF96TZ3m703S7
         YrAg0qjlk7r2URHd3yJlXb9hCUqcjvNP0qYmmISmTtereAqu7sCrkEc71AvNdBVHLBoL
         aE87BH0q2I7zrnJU+iK1qW3e+TCpinO5iYesquk8dmgDA4wIY3281l+YGg/eZ8Kld6nn
         Xsa9W3s2YF2aM8jNON3mXgy+l/cRd7bb4kKalhWWrb6H3QQT7oJbYbypRADL5Y+8eMvd
         mx7w==
X-Gm-Message-State: AOAM53250U+qiI1zwuBx+iwOswZ0XkcWDxLOuB8W2GTPAsQRvHhN6T20
        SW84n0aTooC7DBLCd9lx2QZsNg==
X-Google-Smtp-Source: ABdhPJyGmf4gq71vElZ4iwpirRhVnXO+k3CfWmSz8yBzhQtLbbWgM64ChjHqb60un0c19l/66XQRVQ==
X-Received: by 2002:a05:6512:10c9:: with SMTP id k9mr4994841lfg.532.1610678518253;
        Thu, 14 Jan 2021 18:41:58 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id c14sm729219lfd.186.2021.01.14.18.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:41:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: enable cdsp device
Date:   Fri, 15 Jan 2021 05:41:56 +0300
Message-Id: <20210115024156.92265-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Compute DSP (cdsp) on QRB5165-RB5 platform and provide firmware
filename used to boot the cdsp.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d7799a6fb489..89a1d60e93ad 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -451,6 +451,11 @@ vreg_s8c_1p3: smps8 {
 	};
 };
 
+&cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/cdsp.mbn";
+};
+
 &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
-- 
2.29.2


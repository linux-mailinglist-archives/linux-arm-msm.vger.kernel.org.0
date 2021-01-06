Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186172EC6E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 00:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbhAFX3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 18:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbhAFX3g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 18:29:36 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C59C061799
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 15:28:55 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id j1so2352295pld.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 15:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mplvAp8whw34LAYnqeklV/5vxdb+fGvzxnYtKABvplo=;
        b=FT4+sdO5OvqVz04X9n8jVLvb/B56M4PZkQraMSPep8YVlihjlVOOdRrwRlp58wT0rR
         j2XvfT/Xs5M/3OxP2D9Hszw6n9Y8/W7hREbETL+VaOZA4wj/KFHjHDp9BHbujJuqYSXD
         AZ0BXhC3CA8KWz1gGIFMh+fTDTZHXckIPYglU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mplvAp8whw34LAYnqeklV/5vxdb+fGvzxnYtKABvplo=;
        b=UzuJRgGgAzRScmzBtO5Sl/aQBZcnK4wErp2iRt/cwdgjgU8gR664+hitl9On+/ud2k
         QuttZ555CTY31PraLc38+XCA26pht7g8mtzeBu+eqOIf69tPdWXHj+zvE9Xz2AFnnNTK
         9dtxmnNP9XhvQBuogFIRP08iaDUEPe5o3MijgT8QgjFba0mF4VDnhPT6Ef0OVsg7/Vaf
         Hmij/1G2jbQlUX8xUE0YYjr9r6QQ4Yl/6qjOmN7h/PwKkqV1D9Hiijb/t5VoBjMiDFrd
         fJcOFkbQwzUVPgq0sAlmsyYFoxeHB2XwB9NYQe2165B0kQzqxEzOhXOTfCzoCMq2xudp
         vLrQ==
X-Gm-Message-State: AOAM5309O4FnljxVs0K/iUiTG6ytWp7RIe+AiuhIULa2YOtdkGGQozvf
        x/Q24FVkTHIKmRpgiuXhkF4u1A==
X-Google-Smtp-Source: ABdhPJxVSvw3Gj/2eOyJ6wAlHtuPkcaee+9YCZ0VJbk/bY+sCD54K0MoV2ieN/FeCRk9e+vlA0Ap5g==
X-Received: by 2002:a17:90a:6f01:: with SMTP id d1mr6539613pjk.155.1609975735433;
        Wed, 06 Jan 2021 15:28:55 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id a18sm3686047pfg.107.2021.01.06.15.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 15:28:54 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Add "dp_hot_plug_det" pinconf for trogdor
Date:   Wed,  6 Jan 2021 15:25:49 -0800
Message-Id: <20210106152537.1.Ib4b5b0e88fdc825c0e2662bab982dda8af2297b2@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have an external pull on this line, so disable the internal pull.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d76200d2b373..e3a3d809448f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -936,6 +936,13 @@ wifi-firmware {
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&dp_hot_plug_det {
+	pinconf {
+		pins = "gpio117";
+		bias-disable;
+	};
+};
+
 &qspi_cs0 {
 	pinconf {
 		pins = "gpio68";
-- 
2.29.2.729.g45daf8777d-goog


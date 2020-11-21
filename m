Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1DC2BBD76
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 06:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgKUF6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 00:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgKUF6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 00:58:07 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4DCC061A49
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 21:58:07 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id y22so10894114oti.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 21:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vU8xvk9aReUjtQz0NsQ8GBx5f4Pt92u5iiwK3L8Acw=;
        b=r+qMNz9tB+sl7RB1Tb1qqEjso8wf4QYzeQr3apNL99Do/doYnXBscFrc6ZSTPky9wS
         6Cg5VuvL8lzotoER1U65WqRm5ayyyrKgiZUQdBA6CdS+bak8152kbZTh9svQzo4AC6QQ
         E+8XqPCE5GsCIXz5Ci05cVhE1CNpp4L87f1ReXup/3/9xED/oU4yPlYP0qOQUNZleerD
         yUyUqWtE1jBE9ZCllPLlX3i3SimQGQW4ZOul2ntkxf4salidluaxgv8yjZYsLZQavDpJ
         sgBvH/nASZ2yNlCDkoD9EwrCvdAmjFrVhxk6H7IfE1qeYm5Z/BzDfvx0rNnDZELIcTWS
         iAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vU8xvk9aReUjtQz0NsQ8GBx5f4Pt92u5iiwK3L8Acw=;
        b=oVlZI7pUiA/LSFQfugUrq7VSFB1DDybc6RkQv17JsG0yu7a0gAbfK5yHt4CrbIZi+Q
         E9zhtUUoz+hW5fWQt4D1vBDdo/BsRRs8kSuiMX1WQl0i8iVcl1UBeeWplX1GWw0voGpr
         X5U3FzOp5qmUDaDfYScTD1Xy9BxShZ0VsweiqzQKphxlPq9c8UIdjR7HyEFfj37H1aIn
         u7iNuVUrQQ7xypEiEpKRnc4sKN7tE2ALS0aEK3a4CiLG1jlIhvnqCJ29cq8G8D7Wy7lT
         ZBxWi/fu0FWqoyDNcqVuKQ5hvm+gPdX6Mzrp/8VlH1T+8RgBjG3vYhGgHPeY49idTUkB
         /Img==
X-Gm-Message-State: AOAM531mmRdxLU68fjT4w9sS8qnvvfTDqN9fH35TtdSocwInn8DGlDaP
        6ldjv1FhJJhKfwhh7w7IlbbdnQ==
X-Google-Smtp-Source: ABdhPJxdMFu6KH8ai3kdQ6KbA9g+1gJ25gAqRooUkh6EECc8ZIO29v+qbQZdqi0WbCla20z4GIri1w==
X-Received: by 2002:a9d:6212:: with SMTP id g18mr6993796otj.89.1605938286796;
        Fri, 20 Nov 2020 21:58:06 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k20sm2634352ots.53.2020.11.20.21.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 21:58:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150-mtp: Enable WiFi node
Date:   Fri, 20 Nov 2020 21:58:08 -0800
Message-Id: <20201121055808.582401-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201121055808.582401-1-bjorn.andersson@linaro.org>
References: <20201121055808.582401-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Enable the WiFi node and specify its supply regulators.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[bjorn: Extracted patch from larger HDK patch]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 6c6325c3af59..7a64a2ed78c3 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -429,3 +429,12 @@ &usb_1 {
 &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vdda_wcss_pll>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vdda_wcss_adcdac_1>;
+	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
+};
-- 
2.28.0


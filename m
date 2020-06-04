Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BF71EDA14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 02:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgFDAni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 20:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgFDAnh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 20:43:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F680C03E96D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 17:43:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n23so5096313ljh.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jK4gLNB0iAkstlca7qoP4zJlhYvGOTtNahstZSraRpg=;
        b=cCwwAKq08vlmsQEaK2dSt46t4VXNA2dZ+afSQLj43FfFMNgP5oshgzO4bPqLHTfWrO
         cReCcNsaLKMiz2Vu7bL66S67G2C9lsVn5ymXO63P6d6Si7EnmuDux8zLrfluHh5Bewf5
         j/CTjcJXuy3kRqATbcruSyZuIxlvPSUNmEfFnjh8pjXAikvwDZTUvOMzuEiL/B6f2AeQ
         MWsiT7AbPywwgyfLWPApInfWucQGv+ZK5X0xUlyCxcak9XsrcD+rhjlCWfy7/ESWQ6as
         qlbwW8Uowh/otcJQNpjtQkWETxrpg89d0K1YOJULEWDjUwY43xrZsGHm3rvD8Q2R8WC+
         6oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jK4gLNB0iAkstlca7qoP4zJlhYvGOTtNahstZSraRpg=;
        b=fi346xxm0xJsnOZJBpGxwtOCFM5AKKRqpVTqSkz9G+zYfa3aByTsLQjSVck4lRKkRO
         eCE65XcCsQ/DuCalChcZ869Tt4zxJUh0lyX1Fxlpg424Py+fc2KTEmMI5h1xCrA/nK2W
         kJVvoil2me+yyOSa98dgcFMAmFOQujFPlPgIp6Yg0J9qB1Uv/2JTqtJMpu5CiduB/jkH
         KaNfsyOfnP5gpZ0lEt/I1tNvS7Oi2nC+szJsEYwcuugHW6WD7UyOu668TQR/Oj/tC4rU
         9hA3VjDfsxmG17xQx0JG4D9KlkPrh5EP8Z7FQ/LRH1A2Ztptvb3vBJMxnUFe2mwQrL6V
         qnOA==
X-Gm-Message-State: AOAM532kxxRhaAO5GZ0X0EuhBfMpNywJ/SrfGUXjZtD+Z1RGmNVkDomu
        s12jMZqJYPK7i7n4elddIPQl/Q==
X-Google-Smtp-Source: ABdhPJzGQH/1wlwxWBwOnsU2Po1UuVjpSQkfwVV0LUI8KJh2OlSnivi8UeOwMY0Y2msbWHKE8UmB/A==
X-Received: by 2002:a2e:83c9:: with SMTP id s9mr281773ljh.166.1591231415709;
        Wed, 03 Jun 2020 17:43:35 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 2/7] arm64: dts: qcom: sm8250: change spmi node label
Date:   Thu,  4 Jun 2020 03:43:26 +0300
Message-Id: <20200604004331.669936-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMIC dtsi files (pm8150*.dtsi) expect to have spmi_bus label, rather
than just spmi. Rename spmi label accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1e2862bbfb11..9dd27aecdfda 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -991,7 +991,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		spmi: qcom,spmi@c440000 {
+		spmi_bus: qcom,spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x0001100>,
 			      <0x0 0x0c600000 0x0 0x2000000>,
-- 
2.26.2


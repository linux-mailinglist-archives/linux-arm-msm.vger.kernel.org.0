Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FC62CD8E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgLCOVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgLCOVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:21:54 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBADEC061A53
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 06:21:13 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id r24so2943003lfm.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 06:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMTS91sfscTPRpwWSTsqCv0r1hZt5OeBn5nDnQ2JISQ=;
        b=d8fbz2hrHzFfP2hNIIjHaoIH4WmqYKuq85q1tioHutUN0BLng/puuAy/4XLVy2/BBx
         duuLScOhGGpfAJNARuDzZtnk8aXq6wSsoLZAYfCtBlj9Z/3uxwNWphTN5gj1T3FMLdgH
         OChvvpbXuxnDsbE54St/3c8Z8ntNWyLIpS0cxd3hAtES3Yt/Oc/YiwgHau63BixzVIfG
         V0HsymJ0Tim4vGXT7WuMPN87fkBDE6rXBtKZMyAqwfA9GLV98j/hhLKBbomTWTNfs0in
         YCrHg4d2NMEDYLsvZs+MMN4JAYXiW4Sp4SrzrNekkKh6pycfLfK6eTxLHs6y3z68TmQ+
         27jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMTS91sfscTPRpwWSTsqCv0r1hZt5OeBn5nDnQ2JISQ=;
        b=t3RGWAUuf8ZJFLrGWujgTRmdbqKyXBa0vbpNdlu05g2vHMUjdnxt22CvU8sDFWy9DU
         nK0JEtbCpVmcS3NNhzmwtsc9pSyD6AYIa6De+WWHekXuUuZdO34O8nW1/KuJlQoDfsuT
         p9xEyJmZ2MQW7NdoHsupb2pnxMgPmIXh098qPsKyFQOPrOmJzuD4KHFh6/xI3TKABI+S
         TEHHJMlWbESVPbj7XukyyKuRjypPq+zD6Wr+QCS10G3PgH+ZUev08wjqksja3m31V/yp
         Si5xD4vkur/G2s9F5JQee4mAXYikh7IuKcLz9gPJ+AiQ6VwsoUWqmKK33bSwsej+5mjp
         qTNQ==
X-Gm-Message-State: AOAM533DlDPcnlXU81F0j+k9t2UZJQh5nsOU5M8qmvGDqSBlJI40Z5eH
        WOhouhpsEn+zooEQip2Ne7nMb6WPDzk30w==
X-Google-Smtp-Source: ABdhPJy8efoDOEXnqZhr27IT+lAaeMFj4sqQJYuCwjf7qqtY05yeWs/PUu6LN1OKvyJJjRCDCgRv8A==
X-Received: by 2002:a19:8182:: with SMTP id c124mr1336768lfd.106.1607005272338;
        Thu, 03 Dec 2020 06:21:12 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id k185sm575716lfd.294.2020.12.03.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:21:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] arm64: dts: qrb5165-rb5: add mdss/mdp/dsi nodes
Date:   Thu,  3 Dec 2020 17:21:00 +0300
Message-Id: <20201203142105.841666-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
References: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index ce22d4fa383e..ce9d98e2d856 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -406,6 +406,30 @@ vreg_s8c_1p3: smps8 {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l9a_1p2>;
+
+#if 0
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+#endif
+
+	ports {
+		port@1 {
+			endpoint {
+				//remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p88>;
+};
+
 /* LS-I2C0 */
 &i2c4 {
 	status = "okay";
@@ -420,6 +444,14 @@ &i2c15 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pm8150_gpios {
 	gpio-reserved-ranges = <1 1>, <3 2>, <7 1>;
 	gpio-line-names =
-- 
2.29.2


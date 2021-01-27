Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A872F30609A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 17:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237041AbhA0QJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 11:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbhA0PAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 10:00:14 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E16C0698D8
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:51:03 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a10so3009563ejg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UlBA+jrFoLLefklW/JXu8ZcQb+a+i4EuznUW8mxqVQQ=;
        b=CGMbTvS2lf8nsCaX9+bOJcf6KhPhbUKzlDQEG61YVY7AcLoWfIUfq9Cojl+IKn1C0F
         Cjnlg2EExpubmuFUTExuGUv3wbQUb97g/TWTGov3zwjwl0aM49TgymuB+f8MUX6EvOHU
         zRMSOV31PKgM7RzTtLVTz5iWThOjNfBzWlumITfcY60EKnSW3XquKpvyhN2hjRRdA/1H
         Y+QvUZfsva3jBHUFiPdsEShRkcTuDxQyXbBfT1g02oVAeLHyNJPwNy/qdRsxbia6dtzq
         9skOLk8kd9JTsGiesZY3PZXRRGwITJnuFPxkq9gRG42eAGJtwC3pzqgdeeg596meSv3s
         WUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UlBA+jrFoLLefklW/JXu8ZcQb+a+i4EuznUW8mxqVQQ=;
        b=LYAPXz8GV6+lXBhE+Hmym6Q9lWrDjXUafOYpM21zSgOO5VtZzFB4bWrmFCOVuYucrv
         1Vz396lPw56slAWLs+n1DRhn4WCaVbJ5P39TSIYZcnkT61er7r1FFvalWEbEx3R+NAYB
         Y6dJ86Ey4wM8VwYj0Rm+uc8fjwmtu7nooCgutahWHnUa5yYGjn52kgYZDomhG68RNkdS
         H07fcduqVz6I7Ow54+uFwW/Hdkg53i1YaykJ+yPtcEkoI0idJr81KvbuExl3i+i2gQRW
         OR1q16s2aQUDMYEntPryS1yEUsP44nR4tUhRJP4r+KZowLV5lQcpn0SioEIa+lpCgxJt
         TgsQ==
X-Gm-Message-State: AOAM531DbYutyQlA7iIqzeSzsXTPcm1mroe3bgilcf0cWLWi9ZE+/JOE
        VKg5Bhq6llL3TXZnVQRXdEBTjQ==
X-Google-Smtp-Source: ABdhPJw1E4YDaad25yfHAwhuZQcLCWcY0d5ypClcjxJQpYr/VHJPUtT5w/pyIaDY5osGm++76eyj4g==
X-Received: by 2002:a17:906:3792:: with SMTP id n18mr7002048ejc.47.1611759062601;
        Wed, 27 Jan 2021 06:51:02 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:51:01 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Wed, 27 Jan 2021 15:49:30 +0100
Message-Id: <20210127144930.2158242-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 5842ab65789c..d89286f6aacb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1108,6 +1108,21 @@ &cci {
 
 &camss {
 	vdda-supply = <&vreg_l1a_0p875>;
+
+	status = "ok";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&ov8856_ep>;
+			};
+		};
+	};
 };
 
 &cci_i2c0 {
@@ -1139,7 +1154,7 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "disable";
+		status = "ok";
 
 		port {
 			ov8856_ep: endpoint {
@@ -1147,7 +1162,7 @@ ov8856_ep: endpoint {
 				link-frequencies = /bits/ 64
 					<360000000 180000000>;
 				data-lanes = <1 2 3 4>;
-//				remote-endpoint = <&csiphy0_ep>;
+				remote-endpoint = <&csiphy0_ep>;
 			};
 		};
 	};
-- 
2.27.0


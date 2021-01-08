Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6302EF1FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAHMHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbhAHMHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:07:19 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D25FC0611C5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:05:30 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id y24so10913720edt.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Va61gtlE6uxlap+HqL4vMBtDSl5k8JpvKXjXKVjwAk=;
        b=byPa3xtdvQ0i/tmlCxZ7vv2VnjzkRMO1OrnooifKgMBgo7QH3NG6ATLM9Pqa74puBo
         jBuqWezz9NjPjDw5gXB9H5SsQy5QjHKMfjAPRljHoTQF2Dd+M8IQeiIWySe35UiVbfc9
         ZA+DgRFb4e/0zFzH+YsUpKCX9UxO+Bn+/S5JZ99hWwgQuu71h5Um8XFae8dc/Kd4qoSP
         SobPCh1eBngUMXvUoVP/JJg78m3i8Ffot9pTnPMr623iOmZhRUT/Hpd8sVYeU9fLGlkn
         l2OU/XZmGErwvVx/dOlxXwNjdgIdPg7dr54HlH1iVq/H/hbjBlGPXdRc40ikrbsFfobn
         lF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Va61gtlE6uxlap+HqL4vMBtDSl5k8JpvKXjXKVjwAk=;
        b=caW0nJ9HzyI3H1IVkQwdhZ7s3Cm/t6IUaVek1PPEbwymcGJuU8U1rKvEYblrSFE0U8
         C6cPr1NEsG2Dxm0gnQkbV9nOgLrRtdgSWdRympjTwlsOiuLD/Q7hlstjvWJoJqvUUzIb
         sKxaz0BF7zZQ2VHv/l5b75E/pVzdo5+If8iyc6nzk3QI3dwypjjw6f/dk+WQ0p1mEVz5
         +80FuGIZ4QuV/xLYSfaCvpO4c4FWyQknm3oQm3u6ODqZYDohiPpfOSRI1NHbJG7ts+nB
         Qy/YcPpb5Lyn1YiEeNpV9DXr6sEyRaOxMwVBpc/K14z7jfMaPHjcSEbvnbR6S2KnLP/h
         jNqQ==
X-Gm-Message-State: AOAM533M1hID06IEWvg8VxcKVsPN3f0rfBzVw7ZXi68qL2cUwF26fsml
        yIOy1TzwEH9NRdnvyts2MWsB9Q==
X-Google-Smtp-Source: ABdhPJyK1Tt9/zHH2O1rW8RB+C1F4stz5RCecfAXLBEwdQzpQdfrTSXScY3UpNwXL+H3vrXxWpCgRQ==
X-Received: by 2002:aa7:c3cf:: with SMTP id l15mr5192444edr.282.1610107528821;
        Fri, 08 Jan 2021 04:05:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:28 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 17/17] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Fri,  8 Jan 2021 13:04:29 +0100
Message-Id: <20210108120429.895046-18-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7bad0515345e..94a15d4bd05d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1114,8 +1114,20 @@ &camss {
 	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
 	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
 
-	status = "disabled";
+	status = "ok";
 
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
@@ -1147,7 +1159,7 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "disable";
+		status = "ok";
 
 		port {
 			ov8856_ep: endpoint {
@@ -1155,7 +1167,7 @@ ov8856_ep: endpoint {
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


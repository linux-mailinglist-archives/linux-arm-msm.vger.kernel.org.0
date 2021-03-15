Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA56533C10C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhCOQDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbhCOQDC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:03:02 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC1FC061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:03:02 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id mj10so67147605ejb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VIkFmC8zL3nBFAyP2xM+evUK65sXcVPt8xmmOI32A/E=;
        b=AUMYjxKb0SzBdeREj1ZPjSdamj1+cF1YoKeL/JnJiNqzy63W2BCcGxv3MEUqD1n2tl
         9pHigDfdQkZcU8Ic+zdjb/KejrNKp2RcFAT8XL4KtEbxtLxicYgadZXUYWyex7rXreMn
         XactuxnB5YfbDi2AvrR/qlcs42K09X3SV9jg3STuoFrQFSbPG+lgvhVAAiLHAkLp3oRb
         M6aH/zFaoHmiJ//4MNWajFa1FJrKcH6y2z3hBfxxqSvHliRVLUfPQtFtkdEKGJbG5qDO
         IaZqMdfVfiGFG98Q1MSJkxu67ioIrwmL1MjyIeBAV1mnL0JFEETQmnYu3HtKaT1MQvJY
         qIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIkFmC8zL3nBFAyP2xM+evUK65sXcVPt8xmmOI32A/E=;
        b=RSoJ57iG5jICtRm3c98xTSWa2/+h/Q1sQIUQ7uYp3hmfOzqkOSaGdV4CxKk4hEBGsi
         PTzlNWAu1AImiNkSO3hfEmDEK4qwG0ahUq7Kkuwv+/09BeqUnkTeRMgoIDgkzdCSAke8
         aTWccpOQH0r+S5C+9pRULOtALds+P3JJvN8QhRPfO3IUqWRnq6QgnoU+0lKpAosuuz3j
         MhNY4oSSuPm77NZ+39ocrDsWEH5Yau7m21sS/+3ZOSKXfv0b4MtZ2EtjdGLROVSV5RaN
         B+N91/Jq0/7juGUPi/YF76lfSl/CW/j00VP9whCSdGQ1RcX6rW9uysDzefpq0F3kowt8
         R09Q==
X-Gm-Message-State: AOAM530EW1DlpBMJfzAkahS13hKrLuiWHy/tbuF5q/ZTMIIfXjgA6VHc
        RYq6Gtqeb/CPHIPPbpgAnUtCkg==
X-Google-Smtp-Source: ABdhPJzgNihT4ZiFny0+P+smID+6wHIUjE9sfKPOlsipibpUYZ/CFdYWfYB5NEqDQ5Ykl3hx79kXGg==
X-Received: by 2002:a17:906:3f88:: with SMTP id b8mr14023861ejj.36.1615824180880;
        Mon, 15 Mar 2021 09:03:00 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:03:00 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 22/22] arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
Date:   Mon, 15 Mar 2021 16:59:49 +0100
Message-Id: <20210315155942.640889-23-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable camss & ov8856 DT nodes.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
 - Andrey: Add r-b
 - Change CSI clock & data pins


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7e3c9fe4955d..e5a693c8dc42 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1110,6 +1110,21 @@ &cci {
 
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
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov8856_ep>;
+			};
+		};
+	};
 };
 
 &cci_i2c0 {
@@ -1141,7 +1156,7 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "disable";
+		status = "ok";
 
 		port {
 			ov8856_ep: endpoint {
@@ -1149,7 +1164,7 @@ ov8856_ep: endpoint {
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


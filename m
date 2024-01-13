Return-Path: <linux-arm-msm+bounces-7175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925382C9B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECC691F22B62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CC61D69F;
	Sat, 13 Jan 2024 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5iXCdN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40E19456
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so88890951fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124571; x=1705729371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt1Fx2eXQZUxhHw8olyy9wzj6/smMSugyfFHU2p7CSk=;
        b=J5iXCdN/SOz8HT0bUB+ZiwqW78SVWukXdxHrNMrfmXFvvsE34Xr1aARi2Y9g1ADM5A
         i3cgM+P8lXETFaIjL25Q65EVxWuU+3W7LKeP2iESKriQncfDnDNx+C5Y0s+vWvf0QxrY
         wRm6Pp4urGtLbCqnoHaWS/fcB02Daeg1tjZHOQj2dBcjozN3baOKWJlv2galSlth6zcA
         hhJkxUAer48ZNpkQ8aztCZei38xnRscVw8q0qmnBsym0BSiaHoEa3EMZ6bGGUEs5OOBa
         nJDRWihD7W42Id6a1mwlGWWP27gBL5oJ7YDS84E85MCA+Rc3PQAfoqEb2jVeAZkEQpkG
         GPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124571; x=1705729371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt1Fx2eXQZUxhHw8olyy9wzj6/smMSugyfFHU2p7CSk=;
        b=jHAaPUJASKNYauuO3ORIORZabtEALy5NHghYfqqek9Mquk3mIqVHAegChy6x0tVMcj
         ViCquwft5AIrjyrTskqfhAmJNaSI9xkv4ACrPaN4K1xghXORuvTYPOQoicQINII+oHSz
         osEGPIE2zlz0txjy+L10bsLBuPxTOYufFMH0H7WuRRRcaGmfDzFV5G3KgYeoz2XxOHeg
         wjI4Ayk8r1hZgm+agnqHFqLKhhrp6aEJMh3FbgzjkkQFh/NV4SJ4TYgBl+cC+yXHJt3f
         HfdQ8ietQ6JXjVjazVUG3NvoGDKyukHlteVNRwmlk+ujZllx9RkT0MLPGWXoHPUEA9AW
         87sA==
X-Gm-Message-State: AOJu0YyfywMNnXcUHZL/nzBGolJWWpU1HwsbYeEXe7nuwcFLt9Ripq2T
	UXHAg8Gqb866p9dhnm//MxWB1ALBbvHm+g==
X-Google-Smtp-Source: AGHT+IFYL7r0H7cOwUhVd8updc6YFb5OB2cs2sH8xDnwWH/pCAT17TOk/6BBLFhB72M2J7+rrNndjQ==
X-Received: by 2002:a2e:8906:0:b0:2cc:932e:6bc8 with SMTP id d6-20020a2e8906000000b002cc932e6bc8mr1154677lji.6.1705124571279;
        Fri, 12 Jan 2024 21:42:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:48 +0200
Subject: [PATCH 11/13] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-11-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b+2xLC1HSDWyK7NfHL7Qb4D4Cu0c6AyLWzMpnVJ2Bkw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLREn5R2vwCLilh0Ije+tbpYax/p/jUu0bF7
 p0wrWOrQaOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0QAKCRCLPIo+Aiko
 1ecTCACcoT9cfmlWMLg7FWQiVgL+vtSXFyl8GY+TiV22QRdlsM0tocTnhHu0JSgfzbuuvPiMvUb
 hSVUr56DA1TauYDZa+dGPwkdEcxp0UvguzxOuy2Do6eW3Hlm4gIMAuRDzoBP0eVsSEmgascPf0l
 fWZpUiZkBPgdDWoyWHEM93ggm+Y5evMgSLUZfk3/rV8KyxhIEnuZGYDMCWGg7WpLA8tbclnE7g7
 l3Vb8YDQM2ZKUxmH4AiAuxGCx3GvjBMmFqcnGs9scaSavroMrH74upYoHMvQ6Xym68WTnaHfATe
 xdVOOWg1BFJAj2jJvKzJSPkeZBY2frZqHRl90ZL0X6MaeyuR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define VBUS regulator and the Type-C handling block as present on the
Quacomm PMI632 PMIC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 4eb79e0ce40a..ccf288ddc987 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -45,6 +45,35 @@ pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi632_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
+		pmi632_typec: typec@1500 {
+			compatible = "qcom,pmi632-typec";
+			status = "disabled";
+			reg = <0x1500>;
+			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect";
+			vdd-vbus-supply = <&pmi632_vbus>;
+		};
+
 		pmi632_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.39.2



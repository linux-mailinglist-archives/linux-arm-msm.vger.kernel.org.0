Return-Path: <linux-arm-msm+bounces-15695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209748918AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 13:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E0B1F24A21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 12:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C3885C66;
	Fri, 29 Mar 2024 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Rh/5OMKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2AD7D086
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715186; cv=none; b=P1UAzFejiSo23wlbXkEB3Rsg4cQPr79BHgX4SD74M7omPrl0X2TjgS8Z3xLAeGzk0Ov6PSYCcMN/Ky2Inz3DqDZUi5oUQMX5elywx68ikZSerkKyxtQZP+fuhAR3u8U0k2V/OoBo0EmAFpbR8mMTcLFN5FQmQvMH4RRX3Khms6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715186; c=relaxed/simple;
	bh=CO7iFRLXuNJN0ODjWE1Sca9kd08SmHPibAbkSnnLPTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CI9OgklJ+OLJq5nIFszJA15xCmhywNWsI1azadzNcHYwmVi+BB643BtJV/S4niEsvj02ibWRJstwK2Iw7P+D8wyjUQTA8eODvSjkPbLoNgF2fP4LeEwB5c+5LJBwJE61SeoAOUdLpGlcndmQX+R219PzFed9dzT7c8GEyxa0iNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Rh/5OMKY; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso2531028a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711715183; x=1712319983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGKBeVO2nyh3+Ap/hXwBhTTxhIwQlZ0U8hKP2bY+0Ow=;
        b=Rh/5OMKYCskGZ5bgNV8TMBntxJ2mdjdnuSMqJnZZduPj7mPJCoVeDA0SKHI4q0LCol
         FSxcGXoM/OqQhu22clDxUXdCI0NeTfaAov83DPKZjdVU191NIX27J9+1wv6oihFu6WNd
         EMPoe7tECok+YsI0Cm7EVwdvDdKGYWONSEPbMnO2Y2RQviAbF5o/As4JvDmMvh+YHKWh
         /ex/qxegFIPoy065J+PVKCgJHjF0t/P1b96M/jSV5IBKP3QB7TpuVZ4dKmttQP6qgSC3
         5qPbdMhdXeIz4kPwriU5T1NgGgGFrFoG62/1UM96fxpwGtsRfwyQROi3LKjGQ6sQjetC
         oWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711715183; x=1712319983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGKBeVO2nyh3+Ap/hXwBhTTxhIwQlZ0U8hKP2bY+0Ow=;
        b=gxSCfeo9M7qoJxaobY1CAI6tXp7pElgfcV9XWP4f9s/G+iJkP3YcnDkw/ynMuwGzms
         nBoq2MTgVvwKX64UzCmvS1RMXSK3ikrKZmFHygLyvoqy59e6YIzBwiWC933LoucYi0sP
         jICvCDExMdSfnmK/jV0s+iEQgEbZiSWw8d67sHwZOLn7Um2D5tSpKr7D8Y6/1mqq9VN3
         KAjWTL5TztqN7Kk9CI1LfVudIX3Ef0j8gbc12ozNdL/4k6c3inLulsLji6WeuVdbBbPo
         u/09zs8frTISxTjHH52nebmfgkPkhEoJrxL92CYf+cW8qPU/QmAuRncq/ZgcF15PR6JP
         6pkg==
X-Forwarded-Encrypted: i=1; AJvYcCUJeftYam+6gWqFnkuZUo38xIEI8kXoAPGv7Ck5TSLUjyEnfD4OP0wVk4C4R3d2BRy3dKc6OULmeq0DgTBACwWyHWIJb7jXTWBEwFqgCw==
X-Gm-Message-State: AOJu0YxG8FqdlVeC9qM9+Cjo4BFrorlmeIcciXH+lDZm1gOcPLDAC2F1
	rzSA1J3TVTBMxdW4WKOGp35c90AtUqB5Ll/LxjyfdlV8km56lhwFghv5QDoqaEg=
X-Google-Smtp-Source: AGHT+IFEE27q4B+XksSVFszccNQd8JRIrW5x9djah1vWi9Ji9S0Z8DWEa5cQ8ikzTPzRPEXvnAmFTA==
X-Received: by 2002:a05:6402:2349:b0:56b:ee71:9660 with SMTP id r9-20020a056402234900b0056bee719660mr1501118eda.27.1711715183177;
        Fri, 29 Mar 2024 05:26:23 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m7-20020aa7c487000000b0056bf2e2c898sm1961925edq.1.2024.03.29.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 05:26:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Mar 2024 13:26:20 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: pm7250b: Add a TCPM description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-fp4-tcpm-v2-2-d7f8cd165355@fairphone.com>
References: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
In-Reply-To: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0

Type-C port management functionality lives inside of the PMIC block on
pm7250b.

The Type-C port management logic controls orientation detection,
vbus/vconn sense and to send/receive Type-C Power Domain messages.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 4faed25a787f..0205c2669093 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -51,6 +51,45 @@ pm7250b_vbus: usb-vbus-regulator@1100 {
 			status = "disabled";
 		};
 
+		pm7250b_typec: typec@1500 {
+			compatible = "qcom,pm7250b-typec", "qcom,pm8150b-typec";
+			reg = <0x1500>,
+			      <0x1700>;
+			interrupts = <PM7250B_SID 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect",
+					  "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+			vdd-vbus-supply = <&pm7250b_vbus>;
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.44.0



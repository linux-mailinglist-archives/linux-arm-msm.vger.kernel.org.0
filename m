Return-Path: <linux-arm-msm+bounces-12967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73F86C9BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34AD71F23343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3F412A177;
	Thu, 29 Feb 2024 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLOAv2qf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6047E564
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212038; cv=none; b=WnNbPAzdXp/H41siQd0upO2ymq9Im658eAeBUn9Kp5V5oyRgcufk6UrgIx9mayYOMymNyA7AJmB15652R2e1auzLwsa6iPCOlIMZDmxBR5w9+f43bKfRodhVNCP90/M/y5XjMAe5P5CyNFzl9JRP1n7oPsuEMRy0S10dNIDIw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212038; c=relaxed/simple;
	bh=58NUV9okk92amQIHcmrvyddywNRiyxMSOvtlK9kind0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ryBm90duVS+p2q6FCKyU3lU0+NE0fE1oXjVlE3kF/hsosdvI4MzYTGRP1X8YBjQoWxbaAA+JyJ2HjGDHO8mDMlOb47bb88S8qBZLSSkTTIMoI51CHc6eoPrjN+3d+hyqku1R1tOJIEYcIqoxE5ZWvMTVqgKVoS37RsFbeYLBqKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BLOAv2qf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412b83cfac4so6179465e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212035; x=1709816835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djTK4QWx2RqxzGqF8Cq4ZaFcpyWxxa+r0xmgHQrJJjM=;
        b=BLOAv2qfeD6scwH6+ydTurbASp0o8598kLpGpv2hqeUHNGKI/Rny3Vmwx0S0BmChTE
         pyv/dnOanbA7voZwDZh60oh0zz9XNgGc27t+UZpz3+Smn5BRmFAEJ0uZGirpgapiT5LG
         C9l+MJUw8cmtvCd9GAth7T8zG9jw/gbDGDAK4SUpq574RBVYkbBpG2CzgJ4K8rK3TDUh
         GXyNnfXSbaEFe2ptluKjha99H+MIvRvHXOZao427xH5kgKAO1mQ2ewq9q3sOA3aT+xAe
         KyK3tbypmY7TPpDlqkwjEBitazdFjs0+Gy/mpibH5kSD8jdULjMt4AwJBLpCubfpSyRR
         612w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212035; x=1709816835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djTK4QWx2RqxzGqF8Cq4ZaFcpyWxxa+r0xmgHQrJJjM=;
        b=XmFDAoNhYurmLXjp1u0bJfqgmuA4JqY/ZyhMhQxW97tnMQY3EuFlHvAnl4PrZmu4Jo
         EQ+gOHXP4VYi2f0Fvl5BleSxKxJQO/BOoT6IBdL9iWW+RmtU5NCP3Rcg2c3izg1J4vM6
         HoTb0bC6mTmJX7S3aOXiQrvW0t5KFtjer8s86H7zwIerdIdW+SJcZELRNF+70s/iKDF7
         9eqSlSPDRNc8XVmspsCTuYGaCPACvPZvGlbpH+h7DFsnCi62GstrmsrPe5IHJd8CBgsK
         igutpcK2dLhc1WKxu1dRgo8RKCkL/PkBHze0f44yB3LQpmrAl7WLGcUn7cMtGEaFmqsv
         rwCw==
X-Gm-Message-State: AOJu0Yy39oyP8JlgUejpygAaxGgkv3hvN6d+1GV+WQAQdkORjGjFqqMX
	clVVEy9lFpfsGYSDwpnFlZN1JoZNcHj3uMsHvzpkwZjNcM0nnZ93B0cpb+3TPusOdiW4mJ132FY
	9YIo=
X-Google-Smtp-Source: AGHT+IFsLBUQujeobwIe+PBXF8p9tO8MDxUnuJMHt7vo2bYz6hqUMOeD8rjeD66N7xF8fiNb7HaPxQ==
X-Received: by 2002:a05:600c:1c15:b0:412:b2fe:6e46 with SMTP id j21-20020a05600c1c1500b00412b2fe6e46mr1883397wms.27.1709212035213;
        Thu, 29 Feb 2024 05:07:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b00412a38e732csm2071473wmq.35.2024.02.29.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:07:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Feb 2024 14:07:05 +0100
Subject: [PATCH RFT 5/7] arm64: dts: qcom-sm8550: allow 4 lanes for
 DisplayPort and enable QMP PHY mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-5-07e24a231840@linaro.org>
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=58NUV9okk92amQIHcmrvyddywNRiyxMSOvtlK9kind0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl4IF8UDzf8qs6mL+cMusxdeoc3fQAwLA0KUeC2ovw
 E+lkVHyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZeCBfAAKCRB33NvayMhJ0YrKD/
 4m2Kis3LNB77dZB8vYp62njN8b2m/hqcE4OG8BzKDNwroowc1vKqWlvzjhknEKJQOF5oZX3iRLJ556
 gB7oNGWgcrA1bHQqiOXEGIRXiHfrc9Potve9hyBNS1XaiftpnMbrQ5gdAhUQ8+2SocAssdXYjp76TZ
 vmU3lEQeo5nObYKlT7QAzxd7GdobWi1no2PmgJ9+SX9SbJBw7Tm+qsqXnSFJ+oZUOee2tEBMpVHYRH
 54EMJDa+5KxnG+1NkbbDgNGiFajVRxgszB8+R446IB8CO7Z+DPmUj/whiB/iKoP19tpnMzzOX+nWVl
 +H4o6r7ihQKPXlnREoWvpZ14SdBwPooMrbl0fLG5T2YPDF+d0V8ntAe8CENos4UwcT4qe7T1gKjsuc
 KicVy2iEj5Ico2k7p5PjJZBgwnss3EY3UeTaYhw29rzq+bV88S/x0OIDd1PnGu1+truO75zE9Se/fQ
 GpP3EW5x+2xpo0C8sgNdlQT3ApgAO3aOyYvuWBxnloZEWyjHl3Dbaf1JSGVzm6afRFNzm48FdmWaA3
 G/bZA95MZngsBvzmZlx2DArbQhXskVmiC+NZJWAmoX8bXtkCrTBt3qpC2HUcV0yZgGR92b6CUTeshF
 lZ5821eZyd7/ObrNZz3ZaniVEz0Q3pbGEIIjYiktwvlN3oCbGBXVwmpyzlqw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHY to the Controller
and allow mode-switch events to the QMP Combo PHY.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 12d60a0ee095..86d6f993acd5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -941,7 +941,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {
@@ -1284,6 +1284,7 @@ &usb_dp_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l3f_0p88>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 92f015017418..2f6c76c9a135 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -806,7 +806,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
@@ -1161,6 +1161,7 @@ &usb_dp_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l3f_0p88>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.34.1



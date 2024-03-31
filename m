Return-Path: <linux-arm-msm+bounces-15858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938C892E72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 05:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F60282438
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AFB6FB2;
	Sun, 31 Mar 2024 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pO3DIasW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A11FA2
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 03:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711856939; cv=none; b=l0wibjTyE6NGbZWsHyj4zrCy8Rx3IOMZl867JsGDVNEB16P0M9sApOuPuMWez7wjCyf1bpQZkGXKMcwIPPEZocb8VZGY6fo+8lxG1l+LyAplvTtcgWx82Yc2udFi9qNpFaLb1JpcqnAJ8oB3oZHN2e9rf0jA+XQuuAyAS1hCdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711856939; c=relaxed/simple;
	bh=6si3gBmbo9hW2Dn7hkIjEsjv5s2gkDHJdnkmLUy/Hlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HotKjZxd8EpkPn8+Jk+i53+HJiD/C912/+ckTdHAM4pjTsSBs7G6BQVLva6DNKhXuo7+J0/F76qS93XmrEpgHCwmqhTSYt8j4KXNTHunez7DrWFx/czjtZ9FZYnPYzdr/UWKSTGpIxLF8V0K0GmPudUh/Gd7jSCklXmML3wcgkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pO3DIasW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-515a68d45faso3137733e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 20:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711856936; x=1712461736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrjDE8MiuiJdDcIyM4PBx9cbplmfRZdA0Hz/5oAovCY=;
        b=pO3DIasWjolX5LR+nb+sauHqmqMVOWK9WHRYZ187ESYNxu2DK2pc0c/rzugJBRDZJT
         9j132+m2/IE1qFil8IwJ53lBkg0ztrTTOt6p/ziuok7uf5MUVH+bGnl/JDEKHNYswYK/
         6YhRKu0jxbSMod7/t0Wl/mNZXUX/O1Nc6l011xQdIAVUjIbFodESrQsI9W+IYER00c4/
         AZLAs8Ez6X1YDzEhHe3Pk6uVrQuUnikTdAeQIfR0mnE4UL3/KOv9yJXCkbLXkoLt4kuu
         HlBEHgN0EdwPCy7A/Tm+X147Nenoqccw0CTZ8RkEdlLed0rJFFiXAhl/KVjQ89dynKoY
         juxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711856936; x=1712461736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrjDE8MiuiJdDcIyM4PBx9cbplmfRZdA0Hz/5oAovCY=;
        b=aA1uh3/9DJzkmP9gSqMDTJ1MoF+FOxFHQN+8o2XnqWUBMUSN6uzRswYgDOu1F2Rlx5
         OcIaACeanWFTG9HW9UHWQo1EJnl5WATY6BLu3E16y67E6H+DXHNvyUNY2gjyseizK3RI
         ABtQBdtuHU43J/SR/K0whQIQ2arQn5nTVaCj3vtqcTltR5Cbe8tJ4VZXfSLAGBlbdYw9
         4yubQuTyfkEnSwbakbiAFZh2l53zZ5MhVcXdG2aESidEOjLRxYp7NG0z/NQ+UJYSho0q
         cwrDpApDRDJFLoZ/QyalntF2cYTzD8RAggSblI4lJV5dmqwdWEO1NWE/mbSbEZUhYg6v
         wwYw==
X-Gm-Message-State: AOJu0YzxeplJVL5IINCM+o8TTkQ3UbW7r/rZ2xQScQZIGd8VOpK9NmSL
	HUWb72rPTglVncydECyfqxM0TYtTehDgSTTjQRH5QrN3qiNVaDfHplfdoM3dYUXBjbxXCPIXCOM
	k
X-Google-Smtp-Source: AGHT+IFlfukMGy6CQVit3oZ9NHmT0ghaXgkLiCkU/jTIojRHtJdMuSvhy9Y0/ClxDFMjYxT3BXj6eQ==
X-Received: by 2002:a19:770c:0:b0:516:a77a:9a7b with SMTP id s12-20020a19770c000000b00516a77a9a7bmr198687lfc.52.1711856936227;
        Sat, 30 Mar 2024 20:48:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b00515ce9f4a2bsm762980lfo.35.2024.03.30.20.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 20:48:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 06:48:52 +0300
Subject: [PATCH v2 2/7] arm64: dts: qcom: sm8250: add a link between DWC3
 and QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-typec-fix-sm8250-v2-2-857acb6bd88e@linaro.org>
References: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
In-Reply-To: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6si3gBmbo9hW2Dn7hkIjEsjv5s2gkDHJdnkmLUy/Hlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCN0k1mckRDq9DyYIIFsWsnFESKj0BdPUSLm5V
 yopSvES4LCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgjdJAAKCRCLPIo+Aiko
 1YVDCACPdVhQh0f8lHkDHKGLjQT/Iibqsjz7P0s02+FIY+pCezTZw+0wNYI5T7tqGyGLxxit4pK
 uVgQDCxfm0fx2jG7bcQAG25VqqFiMvLm/VT3Yc5CZoGfk9BpAfn0DiOnwcSdqMAyI4hPdiA1gzd
 fkZE2UrXzCIzyF1VEyCMcksHF8yPeoNJ02DLBUvxgxILVB06e9svPf3bMJjhvTHD3XH/KbqnS2u
 Q8zsuJTXZDiZJr5l1BNUuwHgpXLWTRlAjaivObWc9iwbWhdb6DBAiOQ8stY3OxuJ8O4+ekTdcOy
 0xoVFkvaCRzdOSCqQROFiGbJc4We1/wMmR8dN/TrmQocYNld
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SuperSpeed signals originate from the DWC3 host controller and then
are routed through the Combo QMP PHY, where they are multiplexed with
the DisplayPort signals. Add corresponding OF graph link.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 440bbb89bf8a..cfc07dd9d0ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3917,6 +3917,10 @@ port@0 {
 
 				port@1 {
 					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss_out>;
+					};
 				};
 
 				port@2 {
@@ -4195,8 +4199,24 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
-				port {
-					usb_1_dwc3_hs_out: endpoint {};
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
 				};
 			};
 		};

-- 
2.39.2



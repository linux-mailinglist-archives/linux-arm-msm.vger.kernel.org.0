Return-Path: <linux-arm-msm+bounces-23940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48A9149C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20AE5284A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D8613CA99;
	Mon, 24 Jun 2024 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlgeV9F6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2613C67C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231832; cv=none; b=VAkBEg51kxhA+E9S6e06QQxznCtsAaVuVXGneMiVLjsggmmiuzq9gs0HnpIfAeVrXjt2co3nZYq9Cug/WYXcr3d5kNWf3mlkxedVujKFP9Y+ngg1eZHL54f32HEjdgCZMFjTf5nlKVXifnRdbTA2NTOzSMk7dUkg8d2EiiRHQF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231832; c=relaxed/simple;
	bh=3P8gYlNAClgbprmMg7XMB/2nB2eKKzV9UYXy4nreZKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvXaGiIGOSjbFEerEGlFmNwMGew/u6n1XEM8ustHbKYfFDn9eb6n4PhjoqjASlLrJl028PO0tFDt5xvxTz17rq/qOoO3C8xWDt2TiatWPTS8N2lCJt+cYOtOonwWjsFPJHlCxWtwWTzI3fGoFEv/i2Jrmc8WCdHf4pEIpUaH1Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlgeV9F6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d10354955so4634230a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719231829; x=1719836629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrT6eNksAV7hwwmsFoCoNHV7DjcD+Yxh2uFSWLxZw+8=;
        b=IlgeV9F6NoeWTcnctEzXBL7iBuQj+KduHJ1O4wyKMIdThR+az+6jloFGUxR6ZE7jyJ
         8sQxUZ21cwFK2yVM1kWk7wlVrttKroji8B75RHwj1qht2Nj4n47576pb2V9aJ/ioCnHv
         /3qVO9Lfkuq5RY8vRgBvkwWookfnJgQe88nnc0FYmOVUJf9PyX7wZ/P8FTMHnfMOMLSd
         qy9U6bx+wZ1u4MaOPn7nqelSDYkICnKyFYRab20HobM48HAKdow7/oT9S4HPmPeUf68s
         FeVqwO6iS6N1I6zYEr+X6rUZKtrJNJa2C4lf7aronaQ1akVBbRJrDj8YNIaUcO3RCliy
         tkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231829; x=1719836629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrT6eNksAV7hwwmsFoCoNHV7DjcD+Yxh2uFSWLxZw+8=;
        b=MhJ8TeC9w4poh5nWAm/DQH3n2+nHO3mEAAcen+PbeLOB1FJ9Y04s0SnGebyzYeEk2I
         h/3xrp2Lt0hW7wwjbV/gH6dWgEVctB/fHD1RcL1QQrEczEFUJlYLu2CFoMP+saoueCwe
         Z1w9pb0/TSlDFG62c7dO5K9FSkBKh1TRD9N6wd0OR88uGBHNdoDf+KTa3Fzi6OrNFkN8
         qdqEqifwUvUdAbygMCBW+Cfmqx/F+S7FXVLDSrBDc+zt3YhMrY0qWBUolFsBzQtzte6t
         TS1umYj0GtA59vHpXb2lS1KHVX01aHaIcSNMHI/EOIz2FSLo4uogIxuid9A8sdcV7psY
         rpdQ==
X-Gm-Message-State: AOJu0Yxqffzv02GQsgw9Z55C3sWa2zZACDfQc2oyGYlOqreTsIKCjUyE
	7fm39sN/XmFQ+tNNmYhOSib9fcIs87nRnOccxDQaye7aIrluprDKzICltuyozhw=
X-Google-Smtp-Source: AGHT+IFRF4+gGX2ujhcoBI8Qr9CNCSpMJffiq3hJzsagpkhMHxxDNntyqjtPdYKojyKWr4kFVBPeBA==
X-Received: by 2002:a50:f688:0:b0:57c:5eeb:b543 with SMTP id 4fb4d7f45d1cf-57d49cb2c07mr2803452a12.13.1719231828719;
        Mon, 24 Jun 2024 05:23:48 -0700 (PDT)
Received: from [192.168.0.113] ([2a02:8109:aa0d:be00::52af])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d45496336sm2946824a12.22.2024.06.24.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 05:23:48 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 24 Jun 2024 14:23:44 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: prefer host mode on dev boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-rb2-fixes-v1-3-8d763ee4e42e@linaro.org>
References: <20240624-b4-rb2-fixes-v1-0-8d763ee4e42e@linaro.org>
In-Reply-To: <20240624-b4-rb2-fixes-v1-0-8d763ee4e42e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6259;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=3P8gYlNAClgbprmMg7XMB/2nB2eKKzV9UYXy4nreZKg=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeWVQftNDCSt+WdedR4ZtNrBJJjByFVE+E75j8
 bz5BT985WeJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnllUAAKCRAFgzErGV9k
 tja8D/9Irjg0w9L+A3Dz/lQpgtfcVxho1vQzGwqIg39LTN0jC/xySUdjLqtLiXmEvHvkZR3OcUY
 ULHr+7k7Zrndphm6wf8j/YftpqqdzOjjBHrW++Eli1YsTdo1XSRXZHdVfxWfz7WTgTQ7POGHrjX
 CuF/VquP9IcW26mwEgK8/xXS5+wE3RBXq16whYBVYk8hex/NSwu0XZ3o1SjMW1j5J0CLTcthPzD
 8YpAKetHHcOyR9xtmHH7iIsMR1wqNTTtfJ2brn9ymvooXNqDownJglCs/n/1Af0x5TSBNkkTdUC
 2TKGkfUg+3YGkY8phtJvZXAo3zwqHybXbaED/YOXl7EwL9mbDRnVQOSfMZuoyTLBMOSy+xifdUH
 /1Fd/jVMbJo0r9xak3Us7tcOKefuH6Kc69VuyR9+ncujf4cRWZ5RyIE3CtTwL5xFuOOS8mHOW6W
 9SMlntLiipTJ8dEEpoAZ41sgBYB9z8eExbNjSErK1d+uDXZ0+apJv9TueNJZ3WoEH1GmsPfpbbH
 XVR+wphMa79ug9wXxmAoBt5hbLozSnGSKpnMFBvkPi1eTQLT7DRtgQexPFOUzbWK1gA/gAIbVAl
 1lrB9rES4jIIp/eAlLvAVBsfYLgNr3lirMTj2ZatuCXQ1RzwmkGFcNvH6T5RDoebwE9I1syi8tW
 +xichjl99Ib5roA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Generally, when given the choice these boards should prefer host mode
since they're SBCs. When attached to a laptop (which is host-only) they
should still fall back to peripheral mode.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts      | 1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts      | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts      | 1 +
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts      | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts      | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts      | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts      | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts      | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts      | 4 ++++
 12 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index c4cde4328e3d..bac4ed5874b6 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -657,8 +657,9 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+	role-switch-default-mode = "host";
 };
 
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index e19790464a11..bece4896ca23 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -593,8 +593,12 @@ &uart4 {
 &usb {
 	status = "okay";
 };
 
+&usb_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_dwc3_hs {
 	remote-endpoint = <&pm4125_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1c7de7f2db79..17d36f0ef5ab 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -661,8 +661,12 @@ &uart4 {
 &usb {
 	status = "okay";
 };
 
+&usb_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_dwc3_hs {
 	remote-endpoint = <&pmi632_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bac08f00b303..fe548d795490 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -695,8 +695,9 @@ &usb_2 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+	role-switch-default-mode = "host";
 };
 
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pm8150b_hs_in>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e031ad4c19f4..20d5c54cfcf9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -847,8 +847,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index a754b8fe9167..ebafcbe6859e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1098,8 +1098,9 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+	role-switch-default-mode = "host";
 };
 
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index e0dc03a97771..1efda478b7b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1252,8 +1252,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 26dfca0c3e05..7b05932f9c36 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -945,8 +945,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 361b0792db4f..744bdc846e70 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -1211,8 +1211,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 092b78fd8a3b..f07a56583e7d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1300,8 +1300,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index d6f91580ba8d..1a9a31423af4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -839,8 +839,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index bd60c2770da2..031b7ada8eb1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1285,8 +1285,12 @@ &ufs_mem_phy {
 &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 

-- 
2.45.0



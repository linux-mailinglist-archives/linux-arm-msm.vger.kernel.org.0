Return-Path: <linux-arm-msm+bounces-76573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B615DBC82E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3AD21352D67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E0C2D7DD5;
	Thu,  9 Oct 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PS7DSrdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403CD2D46A1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000809; cv=none; b=K0w8YqnfYyT+V+Yxqr/K2LB+N+ydrNqtbMIKtvirtnSTBhkHdNVzJZB72ld+TPghhBQGvJBbY1z7R+/OpPw7+tat+zZ414jq9/tmzmgE19v1M/vBvu6Qupo7V78B7IP7CY/jWX7q78+ZRWlqz290Hrm864VGi1oVq79pk6pxsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000809; c=relaxed/simple;
	bh=fZCYmtNCQe12JjYQPRgLVyJSk8LPgXNFI5+qVtzIJSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBkzB/CHF/uLxEceaWClHPtPP7HjPnsXKenKy3wLKVKMuZiHZRqaZINZia/8IcGb3fZ5mEqYQXotmDov9e2k7Of2l5eBU8Nd5hJi7u/YTkGPuvlRV6ucA5C9a+kdjdFRwbwwoL+RzSYfZQZ1EsOeBSZpXgzJakEzP/nSL/3UHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PS7DSrdV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso1398086a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000805; x=1760605605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzQIJT+oWP8JOTUvlzw9ahzPSZhSuNfk2H3YC+K71ow=;
        b=PS7DSrdVUWhVDoLs+bAWHzFlC2HA+d3AVUI5tz0DXbbS/I1lqFBugZqxg+RXhs4AhM
         ME3WgsKi4A1r7U4Fsc31gYuXOgizQ4wUJJi98K014FC4W06WVKuqdYGNKXHbbACSR2dE
         2THohiHIz/SodmdvQsg75/aRb0k3DuEXQIh2XmSLANvHinhF/c9n3V7WnoXGWrI+rHtU
         7aRIuG6BE/vcJhu16LNyy+5SxzbiqG8UHIVwSdMTZU8OqfEdecewagO+WPrMmynTTSPx
         332/ZRoN0q2vZgaDK/D8OBsy1C6VKpswFYlkFUKTyFMqNYcC5DSsOo9RVQLDBXIDawtJ
         nz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000805; x=1760605605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzQIJT+oWP8JOTUvlzw9ahzPSZhSuNfk2H3YC+K71ow=;
        b=HDUcYDm+ufpMBk7luf1Z12POFKOAJAOp4RrgBqFkobCH8Q2uy2tTCwpZdJ9fGiZKwZ
         VC3vRWRGNAVj/bRGz94uvCWFIhpBFH2nxVOLQOGVDonfAjJvMdOlZMor7y2mTy/mjKDA
         mrppp37GRiSXWzw5Pmcnbdkf/usSNZd7ajcNPjW7z+l9Qf+zSsvBnsuGa86gkHRI18z3
         aU7+aWZ3jCEhe9gw7fWdrfiHvMFnUX2JOm4B2rQjgXgqBqpcwfAdthAZJ34U1Mt5d/hv
         6p6DqC3q1s5CaWO6kmPJH49xN7apLSKMakrDdZw8Sj4r/lqgsM/7S44em/+fsP6FsW0r
         By3A==
X-Forwarded-Encrypted: i=1; AJvYcCU19CS3l+JA/tcBDFELncm4J/3TZi4wWJYIMbKD+SseIX6FsxmkdeRx8PK8XxQJYX6gUwKlFjwUh9Z9CCfE@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwObNBpGGls3zYPZwM9pDt8L6QsEGRa4uhjv4DFNdw+ZXUi6t
	laJfIPgF8qpCVLVgJt39Hae/z+2zqWRZ6EuNDFX+VH2lFiM6CZq9sITOamxtAKVZHQU=
X-Gm-Gg: ASbGnctOw2MAJXPVhFoSAPPgIA5gX7w13Hij5/cOx1ZQys2bUumzCVGijvhBg0zfpvm
	p6aaXyw15A8A7sHesLZAr3CeOLBhzyEoJ6aMymIlLRZ/Gy6VOdcaXnrMua91kolrS7Thf7/CiKl
	e744Uo0VwPvnaF2FeXXQ+ENRHAndQZsvAQb0gpdm/NolEG73Gdnsr7vvcM0EaD1gi/4gWFGpJLd
	iIEt465+jlZQ8O7YrjBMEdUG3LBT4tbav52Y3xSb6AWp2UmL33B69t5JZ4kQCbs9JFOWVMajDw6
	kviA8XEe/Oz+so9cm0ql2COHNvPQL2UACWoqfKkyBNzDrhyf+2Ak8dDn+dbsPLG5HwBWPRTK9V4
	WJPL8H6K2y+PGY9rCHZAKElB630YWFnKuxDLCDPaQdx1ITQvj3QWkcTdVRHhSp7//dwKJ3p/ANa
	/X596/Rwjmtx8EiyqGBimMXqQa7tOA
X-Google-Smtp-Source: AGHT+IEYTHj2h+GrbQHhx4FcWh4m2YP5SUAwK2H7uI4DUQ4nEykGFfNfZePu8F24BcVjEojDFHnGvw==
X-Received: by 2002:a05:6402:268d:b0:629:3f9d:b06c with SMTP id 4fb4d7f45d1cf-639d5c75d91mr5585626a12.33.1760000805394;
        Thu, 09 Oct 2025 02:06:45 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:44 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:31 +0200
Subject: [PATCH v2 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix sorting
 and indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-1-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1478;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WNIZy8sqEvcKlL5+9A4FzujEN931utTB5lCkZHPfpo0=;
 b=0IGeWflDlv/UhzSuO4laZhyQUDWpOcDOP1R9rFA/5YMq9/2TGVvGHcWvV7dsTtqLWwtG+T7m9
 6vdKxNUY+rvBbR6Sb1Jqv6vMpg/HAydzz5KDWifjbUvVRsu2piopMzK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

Make sure the nodes are sorted correctly, and the indentation is
correct.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index eb8efba1b9dd..8d45e6ac0e44 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -857,7 +857,7 @@ &uart5 {
 &uart7 {
 	/delete-property/interrupts;
 	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
-			<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
 
 	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
 	pinctrl-names = "default", "sleep";
@@ -920,10 +920,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_dp_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -950,6 +946,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
 &wifi {
 	qcom,calibration-variant = "SHIFTphone_8";
 

-- 
2.51.0



Return-Path: <linux-arm-msm+bounces-14969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B288A2BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2492C8A70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 13:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086C13C9C4;
	Mon, 25 Mar 2024 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hD0KcwzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794C132807
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711355679; cv=none; b=DA6dwqA0Uvuv6TGP7WXz91S0nETCr6rD48/kzEY58CNIJOlpOK6cTgj6F1Hpj4L+xu+XgfyBn3hLej1yb3WahMvXB4103rTnU56+nclqMGAfZv1BnkH1D8WKQj5HbhGcC6FMmUEu0HfunZvLeYGrEjuIRSf8NYmvgJKIbytmnK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711355679; c=relaxed/simple;
	bh=7yyIhBC44uUFcCaAdEzO/GQZa5Tl3VNF2DxHLD5xO18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BdriY7KH79qnI1sWaHEBp7dBfKedgx1YVOSDmJpEWyAv7vRUBhd34Lo7F83tJpn5kDQrjEuMfFuv8s7CBLlkuhDJjITtivfK3Q591maj0g1AfU8NgUAMo4p9+VHuQK8UGBKvdKdJ3z0rG9ITz2buqGmZuKus4V3T4br8gszcF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hD0KcwzT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512b3b04995so2079032e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711355676; x=1711960476; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r42NlLNHUthk2LPagLV4PLr66V/AmHRZKeW0D4n5Wcc=;
        b=hD0KcwzTf0zVNp740De84sb0gYjPL+BGJ9J+e0LzuQpvo8bVRPSU20Jp8FS7lgAdMN
         DTiCN+FF+gozWeWP/I891jtwSLVaDxgzynD/eM9H6UBnR0NZat+lIC/FA5pMqaV+TK/v
         FOUH/uhLaT1xLpPu+lkDlzG302o/radS3Hz/V09YTC886FVL/9x/AmsY7OD5h3rhF2pV
         iGqdSGxz2U2d1Fa6dWSdIpbfqZmUUXwAsoGEdsWcdzp8nAgbT6JXUIvjyptLnX/U1Y4g
         Bg0Mj8NLR32LxCatQTFtbHdonIOpk2BU2qiSuSF9J9L9LMpqcqFy3jsRCTViNThAmwVB
         L4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711355676; x=1711960476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r42NlLNHUthk2LPagLV4PLr66V/AmHRZKeW0D4n5Wcc=;
        b=B/jnNvxCuIrMdY/DaKM2y89DbxcFPmHP3J27EmJQK/29suM23wLsmwfRc9VgtcBBQB
         eGdQkVgno+SzDhWU9ZDRS8T9QXv74fXcyHyMWPfkNhxkr+C9EPX5onyrRoMKmkWOcHAy
         lwyQFYPx9LaG4RUJaWO1V363Y7EiPVZBQStfo5FDJoOUn58FJfcNUdJeqstFCsbbXeQk
         jPymOfft3Nwq9+VBvQSl9WaA7cCjBn7H+63yoNL9UtG5bvBkWzOK4RN6MkYLKY360jkO
         0CyxxLgSXM7pFB/VO/qA32bwQCyln1yz0FUXDAGrp4pnO5vWXwhb0CDYN9flkz7RlFcA
         DXZw==
X-Gm-Message-State: AOJu0Yy/iAbxKDInrWifySQlN7APpCv5qPuzJBre8sbpDCliRESAMuM+
	q/S4MUA4qs89Cfln2lYFExlJSE396LcD2ZaqMFJ7EJamJQEa9zneCwWY9yNN7b0=
X-Google-Smtp-Source: AGHT+IHgLLgooCSfG/9fTw8uWYdMHfusMCvkTn2zD3cYAaJJEsBMjb2r2kxE1pzlKebQaZo5QAIizw==
X-Received: by 2002:ac2:5e3a:0:b0:513:cf61:6847 with SMTP id o26-20020ac25e3a000000b00513cf616847mr3450433lfg.22.1711355675327;
        Mon, 25 Mar 2024 01:34:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d1-20020a05600c34c100b004147dd0915dsm7725837wmq.21.2024.03.25.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 01:34:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 09:34:33 +0100
Subject: [PATCH] arm64: dts: qcom: sm8650: remove useless enablement of
 mdss_mdp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-topic-sm8x50-upstream-leave-mdss-enabled-by-default-v1-1-f1b380132075@linaro.org>
X-B4-Tracking: v=1; b=H4sIABg3AWYC/x3NQQ6DIBBA0asY1p0EQdPaqzQuEIZ2EkDCoLEx3
 r2ky7f5/xSMhZDFsztFwZ2Y1tTQ3zphPya9Ecg1CyXVILUaoa6ZLHB8HKOELXMtaCIENDtCdMy
 AySwBHSxfcOjNFioMk77ryVnXey1aORf0dPyvr/m6fjV+HaiFAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7yyIhBC44uUFcCaAdEzO/GQZa5Tl3VNF2DxHLD5xO18=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmATcaWWfIGlnXLOfBt4TegxV+XmVD0dglgiUguILZ
 KJriFjGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgE3GgAKCRB33NvayMhJ0RaND/
 9JCDQompxYEmlZmzYKLqBXkMKTUgZlvEW58mne06FkzuRc5Qy2JrtEvHXB4mIbdkXuLXnqILzE8yMr
 rrBjYLGLCGFOBC8XUbMeVp76Y/JHeqA8RFYWRQ4ltkxBy16z/oVoMKWepj4ojolUwrNSs9XzzsK03S
 73LDgA4BO1Hvn1ZXyBjoHsaaT9XemaC7wPufHa2p0D/V8x7ODzcZ2OxZ0GevWKOTXDqvCLKCF5mEni
 uk9+mPc6NBStRn9qnhiHwSEG+o6tJbIV5J6aZIe5Jzn2r7U/wLV2B4afO8hhuZNg6Y+UPosBYonjAj
 N3qRFgSG+gTipRnDBJ0/PILVVNR+VeH35ptrVKp7sd+8PPrq9yoUYyNE9tfgwSn8JbDvth43ykPdsL
 PigeKbACThTThWkbfmQztXaYXa8ZbEN6qlqrwD64UFtBPj7/+Z7mgnuHzlLNLJclDoHU67Zn01Ajfb
 RF4b3ywWJyqWgcvqxswMlII9nenU7VdT8btqG7YFsIK46KrgsaLCKgbxe4HSja0bSueyB5NhpMg3OU
 f0uADyzQLEfnWgt65e+/Y6QHQ62QZT6J7XB++5Qhzk6QIibN0MVy/MFKRTG4o/IEZL3SDJesanzTrR
 XSMTundIIhw+sX2okvjmC8+w4mbULBbAPGDYnrgiu3og3oyBnS7m9bSz19JQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MDP/DPU device is not disabled by default, so there is not point in
enabling it in the board DTS file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 4450273f9667..d04ceaa73c2b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -641,10 +641,6 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &pcie_1_phy_aux_clk {
 	clock-frequency = <1000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b07cac2e5bc8..e0e4587f08c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -827,10 +827,6 @@ &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
-&mdss_mdp {
-	status = "okay";
-};
-
 &pcie_1_phy_aux_clk {
 	clock-frequency = <1000>;
 };

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240325-topic-sm8x50-upstream-leave-mdss-enabled-by-default-493739dcd1f3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



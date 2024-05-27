Return-Path: <linux-arm-msm+bounces-20621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E28D00CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D741A1F252A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352C216C45E;
	Mon, 27 May 2024 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JUNJt//O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D621649CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814623; cv=none; b=ByUI9lowse+P89K6fiXl1QRfDECjEDPB6Kfoz0M/ZN9DJQQlwMVpTt4bRXeQZds9/+BbSh5rwD2XrXOc3uiu21Z1AKx/e9OATQowI/AqY5DozNsIO03upT/RNDE6rJ2lbcAk1Ii5yakqUpR/wyQaAm5OHeUlO7Rrk2mZcNOxgoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814623; c=relaxed/simple;
	bh=qQLSlx2vlxIKR6+8ZF/gl2kvna8bmWqtILBIWb+Weu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2A67E1vscrCceD2RT6lHvFY76MVVpnP/N3JLyc947Koh4IB2efDOQAhziNbaeTwMplpJCluUaW/0oUp16Ntd06QyvhdmOmCTsbzcdPX+CBkqKe7ijhDtyM46GeXot2aMrwhcFMifbcb3jDWF166DJYtEYOqsh+XjwhWp8Gy/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JUNJt//O; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e9684e0288so28500731fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814619; x=1717419419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8rkN2Rf2Hp0nSXd463a14N/vLIZb9qc33eAk0xmKNk=;
        b=JUNJt//OPJRCOYZ91o9LnHtJamJqppQPKmLvWeSkSoKiXxvrg98fwN6NV8W8rIH5WR
         9a7h3lgFykZnJRwJTgUKzy85QhVxaDuFcq23nS18FE7jrVdHZaH1P1kVTQA5u9W0KtIV
         GLosPL1yU1MX9+qezb3Gr+lK1mQgXBduCCLy6vUFCXtH/Q7utaSjeGWLmRHj1nF/iEGS
         nl0mrzg37jJUXIn6NtU1wk8fDtj3dqIPWtPfyA/QYbBi9kztOkuhG5MGuxEp+Oc4cMqJ
         7hIj78xIpblmyOgSIOgcLHFx/CnklncZBfidCyEw3BURJiS2JlGbAPJ5D2OQw80HTau+
         Wozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814619; x=1717419419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8rkN2Rf2Hp0nSXd463a14N/vLIZb9qc33eAk0xmKNk=;
        b=o7LW8XwsPgbYWAdLiIKN1ublRHFqyp/EFPNwswJJCI3eAyu3dQLydEaaXDeyOEafB/
         e6tZQzjk55TzAc4bRZRXLXR8W+o9r+rVj5l6zdMvbuoRPdA48J1+/vRFxBpXXTLiEIV2
         39IeBUTmbHz8HECKVTJPaDnCjAAtPzR8IjZlYSsPQQn7bNlgmSTyOuaH+4ul3o2XPdtf
         3N3IAgwG+J9P9L8+XCLJ93LkcQVKrsXPRw6u90lVLi7ICHmdAuPQNFUwVmvC2ONeRUE2
         oznAi0RqHtGOBhMaVbQZ0vIwqTvnl1Eckcr1+Shc249GuYsuMM0sA1BCgkxsTjoV2kJL
         FSfA==
X-Gm-Message-State: AOJu0Yz329RhHbhoYwNQeBPQ+GKVSnIebRAfmaRANlNrXBgrEacEv8j/
	H+d2EwBzfDQQT3StYQTdGh7VlwpGrJE8BSki3oZ+7YCPmZpAy8FJ52NbN6Zk6vw=
X-Google-Smtp-Source: AGHT+IGb0cN1IEanxjT22vgWa2Oh/Nwkk44pYpQ3psoE+0SJXnPbzhugKey/3Mfagl312ok7FO+FHg==
X-Received: by 2002:a05:651c:4cd:b0:2e9:768a:12b0 with SMTP id 38308e7fff4ca-2e9768a144fmr29910491fa.50.1716814619437;
        Mon, 27 May 2024 05:56:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:55:05 +0200
Subject: [PATCH v10 15/15] arm64: dts: qcom: sa8775p: add a dedicated
 memory carveout for TZ
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-15-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SVd7PalpjimcUnnSzGmMJxD42sVU9RNmLDvL9mtYIc4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIML/1S/Eg3P8RXxcQCjjbb5YnkY2z+23gAer
 8Pf6Xgu8fCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCwAKCRARpy6gFHHX
 ctsGD/sHdMN9reDJMUt/1wjiJW9kBhGHtypqVB80ebCle5co7w4LFflL9JFi6RF/W8W+s1Vn2Rn
 lgy862NKRql+tnbWKURIgDtct4vRfDdXnZ1R+FvrJF2WqIHUg1rOGmTJ8c7dcE/h141vY3oXlHk
 y9Zv5/MFWfA7G9XHXgELLM4WmIr+53jZsdGJXttDMqwA5lo0bMZTWJxnQy7HdVdFlCA1hhBlBRX
 YRYIv+Q8Qt+51l/sxFsCjREZwuO8VxBPlIwnuhF24hOA28kvCCaEnKGesArM3BWJF55KS1nQOuF
 xwpgLDjUKEP+BuTpHS9xv7nD80JW7M3bhZTUv4KF9wwTL6T92k4lF4FHk12maDIIOp6mt1E5e/I
 hnDaH88SyX1lnjXivcke0Kr25SMzWWE5S3HZcjY+J9bUaXZwtC2diOkrdlBFGZ95zuFo1hLmYOD
 rLSqBNJTxWOddihl07lAviS0Yr6h0roTOtePkdXLPGMBreZN9T3ZQyuV8kL73KhDA/38vvXa201
 VyRhsm8TrjDRvE2TP1afyT+yqsI/P4KMCtxRRa9c8RwW/P2cWklSXUaJ7gocy2rwdRs2fgj6BiN
 EXRPAaqJKMsTzxcYb16jRGgtLMMEWqIe1c2rRcqyqVsQ/hEW0cY0zl6qC10RggwANsDR+9jJZun
 OerT6qSU38nz0/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a 20MB reserved memory region for use by SCM calls.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 31de73594839..c183527452d7 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -208,6 +208,7 @@ core3 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
+			memory-region = <&tz_ffi_mem>;
 		};
 	};
 
@@ -418,6 +419,12 @@ cdt_data_backup_mem: cdt-data-backup@91ba0000 {
 			no-map;
 		};
 
+		tz_ffi_mem: tz-ffi@91c00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x91c00000 0x0 0x1400000>;
+			no-map;
+		};
+
 		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
 			reg = <0x0 0x93b00000 0x0 0xf00000>;
 			no-map;

-- 
2.43.0



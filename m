Return-Path: <linux-arm-msm+bounces-15273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7588CDCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 21:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB2F6B27C4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 20:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22ED113D511;
	Tue, 26 Mar 2024 20:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAeuHm3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8F13D29B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711483384; cv=none; b=kNagRrJBv0rqBJwC225uv3nsilkV6yzhwx0jQ0d5zV1mc8/3dUtt8EXfjE3k5gpXBmwi/cELw0n+s2F2HjMneY2oDsmlv7Q48j3VqyYHfG8l/b0MjEZk9UhnFSFamLB0yFhkGN0AeWlbe2xcQkBczSxCVTlN+KWhxxHaWCERoqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711483384; c=relaxed/simple;
	bh=M5PDgsfLVIKABExlt6TlS2fGlnl3XAgxVoXclxwHIH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1oz2b04Lif7c6JGZ4/7oYXcvfTpmWsxHsFqpinKPt+q738fNjf95ZQ0aHDT1fCfyZBe/LPL2++R/tFLd6vsw6TkB3lxofL9IlgVA37ZPngU12T1KEP/TYCfA2RPqpfSkWGOkld9VjHnRYp9sIbEVkvMtxlY/3nzz0uv2rGU7Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAeuHm3K; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513e10a4083so6823969e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 13:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711483380; x=1712088180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQopQsz++KyAxMIyytKdPL33zkWupusjZ2yKHzV+hFA=;
        b=WAeuHm3KCvfRt9cV6ojb+CsFlLr/sMBtt31UQo7nuZWfva1e9QSr7Yojo3rGguTKPx
         TkQh9m24ncd1kf8VhPLOSdSX0VfvveSBozh7LUalYg1qA0MqvJTUPDgVRyihSn9sdYU6
         l8ZIUIdFTzIOwk8lJF8xv+VKSMI2CyhH6XT4OeH5QbaA5A+H1BHrTTtdo5vZTEVbyOw5
         gFyt1/dIMPmqQBkqkhpgjSLlBmhL2Jcxr8UkHkxdJjPTsA3bdhEMU5Lb66cwI+M3ExSZ
         fkgB0Ba2wva9YSNYfGeUlh2NZRpNkBSMNCw4bR3MDSwC+ZLper90/pianpF1/YTH0/US
         DUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711483380; x=1712088180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQopQsz++KyAxMIyytKdPL33zkWupusjZ2yKHzV+hFA=;
        b=NzSuwaf9KuIZV8EDZnz94KOv30a5/pK22mFO3j2ZnJoTWUbEjIqPnoelCbxiRcpU1R
         lw0d0Gbo5dRKb5u2wg4ZZD6GfXBBUHYMcU0JL/AM6R9f17b7rbrFF7qyBTbqaPywtRyd
         gDO1tq/mFMWiWldQX1BOehO5vHIGrmUDPWyiJ07/zodDiWF33zDEHHHx/Q0QSBv1G+TI
         4NQBU16buxEmpHjyaHN4wMAPSp8htS/Q/KZE17k1qVMhjHdT6ZApNqsPtDxgyf+dTxXD
         YPApnNCEHKaz+H5awG+nTxauA1YPFuRU/hW8+k9VnTsJRxODKCFLiOm7oVHcJmkeoJve
         ftaQ==
X-Gm-Message-State: AOJu0YzrIIiQL92DwC9eAHDrRi23xz4WN8xMxfKXqwCGsqlAjL1wkGC8
	5Beuul7IN4/veV17Its/zRaRExL9ZuTu3yk50ho3+VR+VdnJFzV3zlvvr0ArYxM=
X-Google-Smtp-Source: AGHT+IFnIUQKR1NUHfXxdzxBsBRq+4L8hLoiAjx1D64J0vm1IDre8tnXPZKedRXEjfkM/rwyZQDgeQ==
X-Received: by 2002:ac2:5bcc:0:b0:515:bad2:825c with SMTP id u12-20020ac25bcc000000b00515bad2825cmr1375441lfn.30.1711483380262;
        Tue, 26 Mar 2024 13:03:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25e75000000b00515a7984acbsm1279408lfr.94.2024.03.26.13.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:02:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 22:02:57 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x: add dp_p1 register blocks
 to DP nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-fd-fix-schema-v1-4-4475d6d6d633@linaro.org>
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
In-Reply-To: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=M5PDgsfLVIKABExlt6TlS2fGlnl3XAgxVoXclxwHIH8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAynwQqmWzf2igSonGtm/LlpImWQsxvrhjNxo5
 oGaj+uthFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgMp8AAKCRCLPIo+Aiko
 1Vk1CACOjyNVYW+tkP4qhqZ5fM6vXzj0fu29rVIteeUM6ExFg05XKzDZeZiVsZtlxlkAYZkbSe6
 UGxOEw4joPudBSyWwxGQ/21v9JVEg9SbarVapzr3Hvb4HOzJhxpZgtLXGkN5FyQA71kwIJHygUC
 zUIOa2G5/f/AIv8Opw2vopG+QTcOif9NLN+ox3ylKEoW5jMYSSgH9hTMxQlGLR7gXIi27yAcfvJ
 EfqMOHiQt6eyh+tRYEMBUFT19EZujmFrXEmBvzLuSgbKa1XS+4VwFVdo21uGibXTtf3UBXTiTbd
 PL/HJj6VAkggCbKRmrLAR4DbHt0Fo3lHUn2lX28rPZjYM/8x
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DisplayPort nodes must declare the dp_p1 register space in addition to
dp_p0. Add corresponding resource to DisplayPort DT nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 6d74867d3b61..019104bd70fb 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3029,7 +3029,8 @@ mdss_dp0: displayport-controller@ae90000 {
 				reg = <0 0xae90000 0 0x200>,
 				      <0 0xae90200 0 0x200>,
 				      <0 0xae90400 0 0x600>,
-				      <0 0xae90a00 0 0x400>;
+				      <0 0xae90a00 0 0x400>,
+				      <0 0xae91000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
@@ -3105,7 +3106,8 @@ mdss_dp1: displayport-controller@ae98000 {
 				reg = <0 0xae98000 0 0x200>,
 				      <0 0xae98200 0 0x200>,
 				      <0 0xae98400 0 0x600>,
-				      <0 0xae98a00 0 0x400>;
+				      <0 0xae98a00 0 0x400>,
+				      <0 0xae99000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <13>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.2



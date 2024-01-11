Return-Path: <linux-arm-msm+bounces-6992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA782A5C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 03:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B442928B986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 02:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DC5F9F2;
	Thu, 11 Jan 2024 02:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZ2EFjdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04EF9EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7dd8bce8so5557617e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 18:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704938481; x=1705543281; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80ZQ2XBHcD/YCySePR/gE1GYB4EFyeK55yDHDBjNrps=;
        b=tZ2EFjdn0IrHVWLZsWiNkAJpt75Q90ZHDkWHvInAaOQfyYfyRCndnnOzbqvALbSyWJ
         KJdNUdgpqJsAjRtZDtWrycQdiwsdXNBJivwXc0I9scBfmJGRKAH/eP69xvco88oribZt
         IAU+Bo/eUZ5PmFkQekl9yMpY7YSs9a2rGLUr+RIbF5+mOXSi8Qi+DKepGbZ4XPSKYYTh
         AB1gTrvOMLweyk0yDGl+Eovf7DRgjmrskfTxwSfiJRirVBNI6+Zsczwi9DA8poyegRuE
         Gc/qBomOYT4jddMc8J2MSWtCktYQKOuNIYpMjvETBpY51uEuWZdWdwD3J6oelTSb4wdc
         T5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704938481; x=1705543281;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80ZQ2XBHcD/YCySePR/gE1GYB4EFyeK55yDHDBjNrps=;
        b=vrP31AngHkZBMorIcJna2fJWffBWiBn3GPlY5ZoA3iSOnSOWPfT50cFDDQEAmWcHpj
         RV+WmrWBmG8G1W9rx0Sgotyu8iyPBlSCWgxYPb3kPnT+0KnXOMvOvg2rl2AFHNhX1yi5
         QwXqi2I0hPlblqzdsH3l7B3QAFPKoznHaQ+xVhwF1Lbn5JjMsdoy92Gd8yPHpLa+HvBX
         Fs1igJGmmD+tlMJMUiHvHPMDGJX8QQg1cnIXd0zNJFjn4lS4x6wrcZYGcGMRvJ6UW/5d
         jO7bOeNhO7eKWSvvNUOaOHNcjsIBszlbO2xA+EmRviPtQHOJJ0NPPLiLY5ULGDdI6WTb
         OTZw==
X-Gm-Message-State: AOJu0Yy8QqSHeIEvKp1VY5fG26o49IkNYTXOWpq8t0Pcb1DhdKgPUGqy
	Vqm6cjmgLNlSvlLUqigqZLh2PRbzbLVYiSchWdH1oamUCl3P9g==
X-Google-Smtp-Source: AGHT+IE3L3OYiMnTp4qREwiL1/KwEDPisAIDD01M81aUwauRz+1ecuUKICOtFHJReztAcidqGMFCAQ==
X-Received: by 2002:ac2:4849:0:b0:50e:ca83:b00d with SMTP id 9-20020ac24849000000b0050eca83b00dmr150087lfy.69.1704938481646;
        Wed, 10 Jan 2024 18:01:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i22-20020a056512319600b0050e71d44aaasm18049lfe.114.2024.01.10.18.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 18:01:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 04:01:14 +0200
Subject: [PATCH] arm64: dts: qcom: qrb2210-rb1: disable cluster power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOlLn2UC/x3M0QqDMAxA0V+RPC/QxA7BXxk+WE1dQOpM5xhI/
 93i44HLPSGLqWTomxNMfpp1SxX0aGB6j2kR1Lka2LF3RIS7BWZyaIEwbTitR/6K1WoV7EL0bWh
 H558M9fAxifq/76+hlAsCZ1+KbQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8HKGa8Kwse7VRXwZhEuEHdjDMOmygc0So9kXb5bJMNc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBln0vw7Agg83Y1SmerhKGYnna2qBH841vt6E0Yp
 vWa8F1n8ziJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZ9L8AAKCRCLPIo+Aiko
 1SouB/sGurPKSCyL4jsr/GU3Qt6OF9HfBBSiTMpk4s1Uu41soLaHxdClFH8UetzCB3QHgfmiAie
 ZCaaAb4tzPRd40mvEB+MNIME7bfTc8vdQnG48Xlanu1jzxqIV8HyuQnQy6AQwl0fC9UaH7HwqgP
 orP5cggENxWINBvmWkSpYgqjfjgOKDIWATVSa0IM4IklYYzbPcozVzrmiUktRg9ARCY9+idnNH1
 K+9+qwZRwvai11gzE87S0LywFGpfnhHpPwj72nWsdDdtQywnCJCMFxzlpHXVyywqya04ccD96Gf
 T9hGBy+w9EjOikD2CTLP2J6ND8V9PtY1p8CI3fF8yApPPiAv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If cluster domain idle state is enabled on the RB1, the board becomes
significantly less responsive. Under certain circumstances (if some of
the devices are disabled in kernel config) the board can even lock up.

It seems this is caused by the MPM not being pinged during CPU idle (in
the same way the RPMh is pinged when cluster idle is entered).

Disable cluster domain idle for the RB1 board until MPM driver is fixed
to cooperate with the CPU idle states.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index aa53b6af6d9c..9a0308ef8b0f 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -177,6 +177,24 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&CPU_PD0 {
+	/delete-property/ power-domains;
+};
+
+&CPU_PD1 {
+	/delete-property/ power-domains;
+};
+
+&CPU_PD2 {
+	/delete-property/ power-domains;
+};
+
+&CPU_PD3 {
+	/delete-property/ power-domains;
+};
+
+/delete-node/ &CLUSTER_PD;
+
 &gpi_dma0 {
 	status = "okay";
 };

---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240111-qrb2210-rb1-no-cluster-idle-7bf43b3a0452

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



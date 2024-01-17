Return-Path: <linux-arm-msm+bounces-7463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E54830784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 15:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9B8528681F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 14:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D5220305;
	Wed, 17 Jan 2024 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psG+AHYm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E43208B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500271; cv=none; b=sw3WarLmC2m+vutAPxn4S/kR3+yA1+wkZ9W9CgusX8vDNpf9FiR2OUBYdNhwb4b7tzKthLM3z94or+2lFICdfMCb5h3MSR6vvaEWT0SjzZm4Qv3ZS4DlOgXsYP9uihjvi8sYxaHWN4xbZtY9zWM79cYk9jtq4uWr5thelj4zDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500271; c=relaxed/simple;
	bh=MdoBSrycZYklvpg3wMrnQWxk/afUuXbu3ZRk4SLziVo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=XWY0HqEG6k11h6+Z+WiH/RpwGCZjYkDLLpE3oKYijmSptUZL6Qo79dbEn21jgGsgoBX70TObtB33ygJYHq4kYcWUby2Lmr4U7qc0NcjMxPYrYyKR4Vk9iRreLn5KjSJl/kWRL2mdlfD/C/EItHtYYgkRhs++B0dTHURCP9m+tDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psG+AHYm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e80d40a41so14121332e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705500268; x=1706105068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDBhbGYpjTtYfLENzNTw+65o/Tc1yQuvKthYRLJB+4M=;
        b=psG+AHYmKixLWGtIHVFit1PaJwjDqVAEKqSK6pXqDbttEj5iEn/Ne8qJCAp6vJvZKP
         86+WseCJTQrvekjToOihUT5cTFrdh2NCrGVtrcq4arbOQ2hxiUaw5zcsfL1j3Rwxn0FQ
         DteDbOx/3yUGVgis45x2OLOGsmRTdzMc8nwUFd1t/ynXs+2LOZQA7mplwfKp+Z7WNblZ
         OyXD0xxJawnNjbuLcZCS+3fpv3GzWdgaVhtZcdptRrSRjyf9YUooFss49k2sAyQCCQlM
         K4ssmsWxktAysT7OqOiwn5OmzW6Ny9MVW6XwvmcRPDl+BkSgBj1KOv11D5VZbxZna80Z
         OUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500268; x=1706105068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDBhbGYpjTtYfLENzNTw+65o/Tc1yQuvKthYRLJB+4M=;
        b=OGdynMUdsbR7BuDDgSIrBCLPY+5lY9EbgFt5vSeUT8Bn9sXUihVxVZmAOOCY8Hvlmh
         SV9ded6+225hNyz8bxBcBfeIBp0+A6zTPHpXDTUiWETo8Y+u0vahGX8Qbsxz7wObzqZv
         xSz8//KGs681w9weVsIRohsgql093nL9dZ43LC/BwJSvXGd3NOBApHdpXNuPxT5kp2S8
         Xx/vsgtKKprsIDw6rgqcr59AxsWCnbNmlT/r04RNaHBtLMdXXJPGjtTX6U8NSpprOv92
         CC2u242ziryf0yyTJtYNzVFHwDie95pM8W6YIWEedMP/fKmHIKQzcp42EXDpz1ozmRaI
         Qa5Q==
X-Gm-Message-State: AOJu0Yw7nXNtO9tlOgD8XoCBRmLhHMHMU8dk0Q3OdM7+VgDwi/iwKxqB
	bsqckGpjcTm5+rwmI1NAL59XZoBpOL0MVA==
X-Google-Smtp-Source: AGHT+IH1vHCYDSOtvo5keq6KG+y5uUXHlp8a1UnMO5nKy5PkIM9jbKTRki6B6acZ5XtiWN6qDyqAXA==
X-Received: by 2002:a05:6512:b19:b0:50e:246d:7566 with SMTP id w25-20020a0565120b1900b0050e246d7566mr6081947lfu.7.1705500267900;
        Wed, 17 Jan 2024 06:04:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y29-20020a19915d000000b0050ec7a26420sm269711lfj.204.2024.01.17.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:04:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 16:04:26 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcm2290: declare VLS CLAMP
 register for USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240117-usbc-phy-vls-clamp-v2-5-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MdoBSrycZYklvpg3wMrnQWxk/afUuXbu3ZRk4SLziVo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlp95nKvHWn6Ym3qkYZUxeHE2QKkiDl6lZquXZL
 Q4IpSopRwmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZafeZwAKCRCLPIo+Aiko
 1UgeB/9dhgwttDM/QiCLtTkfn7SYobAr+0HKa13nNimPrtMxJzAPF83QdCgwXEAoANDZ4S8zQFC
 vBh3/p9yWK+2M2HqLSI+fSBAqH/8hv15KnaazNugWT8xgUwQ7rBJBl2ELZvTqXsjsDD+zdVxdlT
 TB9nvCbCpm+vmT8zO7gF1iOnQWNvToc9sDVCSIBZCh6roYhsAfkqEC7Z9CM6E1zW2mYqclT6vjl
 QJZr7uM5ET/dAkIRy5Ohz+P1zOOywiEeu5o8K2aA1VqnV46zkj2pp7td3zCmmuNcqAfMrxAlObQ
 o2ohpwcqiNCnalg5oG+OBPUGl7u5oubMJloF+9tMLskENNyb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB3 PHY on the QCM2290 platform doesn't have built-in
PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
via the register in the TCSR space. Declare corresponding register.

Fixes: 0c55f6229bc3 ("arm64: dts: qcom: qcm2290: Add USB3 PHY")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 0911fb08ed63..89beac833d43 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -442,6 +442,11 @@ tcsr_mutex: hwlock@340000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs: syscon@3c0000 {
+			compatible = "qcom,qcm2290-tcsr", "syscon";
+			reg = <0x0 0x003c0000 0x0 0x40000>;
+		};
+
 		tlmm: pinctrl@500000 {
 			compatible = "qcom,qcm2290-tlmm";
 			reg = <0x0 0x00500000 0x0 0x300000>;
@@ -690,6 +695,8 @@ usb_qmpphy: phy@1615000 {
 
 			#phy-cells = <0>;
 
+			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
+
 			status = "disabled";
 		};
 

-- 
2.39.2



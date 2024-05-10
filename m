Return-Path: <linux-arm-msm+bounces-19708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0CD8C25EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9131F2644A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF93127E0D;
	Fri, 10 May 2024 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0f6tCSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A712C46B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348404; cv=none; b=BfeW7P5HXeCeRSNX1OEWeBFN97LT4JT0tSpaNOSPab736Yoxz4A+O9ZCpDGAlWk+xUE+iIT+Y9Vkydja0UmVysWLVGx4fZPkW4abT0D51LKkri3De8vKmOhrMAhb5YjPyeuioh0/iNxnLGysC/SBJYJrCTnhbiR59wrUfQ+uBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348404; c=relaxed/simple;
	bh=G58itSBLMxq7Hnti9OjMcpU4zbraFRoaHyfISMmS3dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kz/jXKFqxAHDLhxPQ5MONmOQFI7uq2Fgo5+gM6EX0i+CBO97OjRLE+l71xfTnX/Y9pn4Y4CMCmcPfUfmG8LYvSVcIdifxZCqus2al48ngPsLjn4yS5f5Nm7d9BZoKVrZTbSaSYPOgF22D0BUnFNLMjgdtzq5OVKP2DVOgnM6SlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0f6tCSf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5a2c05006aso134391266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715348402; x=1715953202; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha8fz4Wr+IwPLlSAFxnrozj260YrkxhYC7xfmynUBWM=;
        b=X0f6tCSfcKBxVAOAq0Qp98kKvEn/7k+bCYBm9fKN8BXzxbqGeD8Fn1kq4ID4iPIRP5
         xWs0Hl+SI1IXwll8JrHLcSdAaMo5xL5Y6Ep1VUmlD5eA3+Xb4dLpASAJhyJe+Tf8FpQY
         6dk9k1vwpff5i2m5/gaoTGAd/MHKEkZZ4QqWj1wKXCgcGcPuXB/ahrImtlwzXgGx81z/
         s5EtRpwcsdaho71vs4NHoHcsb2O9P/B3ZGZAgDAdHpDPa4bI5orbwM6ZCbUqEL9mV87i
         DJzI4eOtGr47gl2Xis5kWSJ6qeaGVWUEmiFRLP03jZGa7RmZB36u8i1DDZeSpCm7yhAD
         iJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348402; x=1715953202;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ha8fz4Wr+IwPLlSAFxnrozj260YrkxhYC7xfmynUBWM=;
        b=f6er1pZCgFxi5r+ezqmgde6BoOYuMSYG0t91AuSF12M9eqXra4QMgwvpoS7bSv7rfF
         hclggtgGIPo/P/jz8v6Oz0ZVlDpHUlLNyDOoA6nWAopBbo6DB7pufd6WSD937+pc/mO8
         cmHtxcfFYVKvvRENJniK8Z/GcmVxxJK/gJsrGRBPc1Q10zlqtjmy80vvFzYtY+HJ51Uf
         jWqZ5XVGq/9ToQ9rFkUOxrKhV1k+2A25D7ax/+I3Lfi+r+5BVxNNBOdO0prFKOuJTinN
         KHTf96FWkx561Q65wV+1t/1cryNdIlfppv0ZA4hKxjulSnZqBAIp0iImbd/759HRTOc6
         B42w==
X-Gm-Message-State: AOJu0Yws/aLP9h0IU+H0YL1fovvuPEQ5DVyEx6xA1YwiXBgDHkld7mNt
	ui+UQcQ2qDqQ9JpXIrgXicXiMvnll8AQGmUeCgJQSOJLzeY+cpvAuCN2Z88vEtE=
X-Google-Smtp-Source: AGHT+IH6BN4juUw4T+/Txsx7VnJHBlBsO2iEOHL3CdD35k1pZqHytie913QnQod0/ipiHQMnPn3xCA==
X-Received: by 2002:a50:9fc9:0:b0:570:5b70:3407 with SMTP id 4fb4d7f45d1cf-5734d5c0c84mr2419289a12.10.1715348401718;
        Fri, 10 May 2024 06:40:01 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d48dsm185200866b.5.2024.05.10.06.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 06:40:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 15:39:59 +0200
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Set status = "reserved" on
 PSHOLD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-8280_off-v1-1-bcc70cda449e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK4jPmYC/x3MQQqAIBBA0avErBPUkrSrRETYTM0mRSMC6e5Jy
 7f4v0DGxJhhbAokvDlzOCtU24A/1nNHwVs1aKl7aZQUV4jshdVWLoFIKGU6R94M5CzUKCYkfv7
 hNL/vB62AubFgAAAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

On most devices, TZ seems to be blocking access to the PSHOLD reboot
register. This seems to be TZ, as even kicking the hypervisor doesn't
seem to make it writable.

Fixes: 865ff2e6f5da ("arm64: dts: qcom: sc8280xp: Add PS_HOLD restart")
Reported-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 0549ba1fbeea..59f0a850671a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4623,6 +4623,8 @@ tsens0: thermal-sensor@c263000 {
 		restart@c264000 {
 			compatible = "qcom,pshold";
 			reg = <0 0x0c264000 0 0x4>;
+			/* TZ seems to block access */
+			status = "reserved";
 		};
 
 		tsens1: thermal-sensor@c265000 {

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240510-topic-8280_off-11539fc57f98

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>



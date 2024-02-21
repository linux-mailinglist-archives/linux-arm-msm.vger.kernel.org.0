Return-Path: <linux-arm-msm+bounces-11967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0385CEE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C67F0B23D98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260003A1B2;
	Wed, 21 Feb 2024 03:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEB+pa8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8539FD5
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486933; cv=none; b=CQW2f0MZHWsSpskZswvrJNFQDZOelBmQ7NldbJv1y3ijVrYLhZCj7MFVpdxFS2DD1lsTW3pqvTS1W0eyXCYZ/LQ7yaVD9HkxtkS3cFvhP7Agwi5GAr0TMVr2e4z6VTtATeSBJR8qbifsaYlk5e/LkZpyBjA6Mq1hrpuyGA3m290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486933; c=relaxed/simple;
	bh=uG/9KOG8Z17eKXEtbxH9o5AmhzmNnY1T/Q7m5dFGLnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4dZPaAl00xeD/lqSrl9WVZaD/kdDB23ciVyV5i8kgDufk8801iNtQJSDyzxPq9+iDRbDq7NMBoIwj1Rv/XXa1LyPczSqqjHreDjH0KGH7zqsvNcZJqmW8Sxn8YzZYPK/B/cXy7/22DbLN92lVi8Ymx+Owk6vzX83Mb3zPEpeXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEB+pa8F; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e484011e28so752375b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486931; x=1709091731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImXGIB7mWb7ZNVnOu2+1J6Z04awCO5hHkqZsUmjx4z8=;
        b=HEB+pa8F86X7b7Tlcg++wBIQwEdaDbwlrN583v2T/1CPFp3kak1PN47GDigs7OZN/8
         lV0Wx5aiUrfxjcsSqshLa3tgqi2NAklgMF4PVPqPiX94AVhkZ0TGzpV9S8LSkswPx8re
         KNkmak5i4J7me2gTmHxSCa81JSd1J79GWN6itjbXjIOBo5OsIWo0mkflTDH+1aczitpo
         yxkn+tNGSBKrxpx+W51uDsJ4T5S2Z8XJnHm9m1UG/4TzAr3WIuWUG2lrEuay1FlXCOva
         8Ie2r4GWRwmAr2LyVnWZdMPgV/b2Ll5hxoHV17rAtBzqKuVAQt658ZmbT9QqNk3zpp7m
         N2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486931; x=1709091731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImXGIB7mWb7ZNVnOu2+1J6Z04awCO5hHkqZsUmjx4z8=;
        b=fry3gvhbW4mLX5dIFUWbikFwkRPHRSkI7DOvdVr5e/e2Sq6p/UBdqeX36aVtbQhsnH
         Z/HKQVwVP8dzcEEM0b8G+5Hs8w+Zo5F0TVFGElUSA6if43SEOmjLh0BZ+1IxRa3o6eJ3
         5WEvFQqa2PpXWqIKklJRZMLwLE3us0uYF4UfaFTH90pZPWD5zvyLSyGdSyEOyYN/QAWr
         Myl0a+sys6SLO5biTxfT08/zmhpZyRocgtX/00c0WVpn4tGw7NgXcELRwl8NpJ4T8ddB
         +3btrMfl5ctPp3rZw5zGeJ2thD3K21tBKOnWIWs3fnARqqHg6kxLTJv3nH2jhutPKaA/
         x1tA==
X-Gm-Message-State: AOJu0YwpBnH8fUKuurnTMjbM4PRZzPW6t3pl5PQkcaQ+m/OQLZgSVL4f
	tqYExxMY+VMZgLIHmyBRUksvONSv3Mcl7rbgbJBQ2pXFoQMKX1HSE73fO0Jy/Q==
X-Google-Smtp-Source: AGHT+IF5eijTp/+XCue4i8inAVgdXDs95Vy9lc3aj26IyJDDAl/hNRkfFWOiR7Sg5/P1i9q0prIWbA==
X-Received: by 2002:aa7:9819:0:b0:6e4:67bd:10fa with SMTP id e25-20020aa79819000000b006e467bd10famr6201338pfl.0.1708486930793;
        Tue, 20 Feb 2024 19:42:10 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:47 +0530
Subject: [PATCH 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-1-6c6df0f9450d@linaro.org>
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=uG/9KOG8Z17eKXEtbxH9o5AmhzmNnY1T/Q7m5dFGLnw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEF9/fHNekkvPUiaqVD1hZQ8DqFjrazu7GqQ
 IHE7EVUO76JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBQAKCRBVnxHm/pHO
 9aefB/wOjD+6DG3lTAmXaj2NFcWPHTZlUrH+fNNDnmDiSjCYy1JhJV1mRvt6uqqoAvEjKOs5jAL
 XU69S7rZ/WPztMNu/HWFJBXdaPFpBfVqgU7isZCbtV/rsziS+4zPpnIlQ5qDN4kiUFJBNiMVYxE
 muUtwqZbCn5mk93f7nwDi17H1p4CvgVOmHw8lT0kgEWUtOmVBAW8lLFutR7PzEKL1/u/wtWBATr
 RnRYQ8SG9qPb+CWgVyagKenq16lkhab1jMvW7ACR9wXTtggQToeexOIDpN/7/ufZ7VNL1AdcY75
 MMmWI01hqDfvEgm+hzw/lVUxWUuhMAG+jNEmU2nz9hYMqfoV
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 760501c1301a..0c61623d9be9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2197,6 +2197,16 @@ pcie0: pcie@1c00000 {
 			dma-coherent;
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
@@ -2298,6 +2308,16 @@ pcie1: pcie@1c08000 {
 			dma-coherent;
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_phy: phy@1c0e000 {
@@ -2399,6 +2419,16 @@ pcie2: pcie@1c10000 {
 			dma-coherent;
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie2_phy: phy@1c16000 {

-- 
2.25.1



Return-Path: <linux-arm-msm+bounces-14725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748D8857FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6992F1C215E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8164057329;
	Thu, 21 Mar 2024 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="we458PSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABE5FB91
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019834; cv=none; b=W76YsRpQPWTZAzadqY/jlzYRnD2zXCDht68i2gLfSHk4W8r5SLkMvdNj8Ax4Dx3kwXaY1mvqNFIAgRk2cYg4qYS64SXlDlajCKwmvkET1oexoiMRP/jKs5XACRvnoPWKd9Ki1lZpf3vFkB7oWoo66xOcngrieshMmnOTEeP1T2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019834; c=relaxed/simple;
	bh=5meRU2YVUU23seGXMANnZfJqw+Ixz7s1OvoZwdTDBBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOZbvkoJ/XTVp3sgnc9RVKDLhftMyqRyKj9G0OWuitiCav35UKP3qOwt71oYU52VP/Kwf18EkRttTIXNjMns/EDxmia7n6/mU/mA1eOcQvNPyJMv0d64b10ft+okkLkdrODvbYSHRDdoWnUZZQNczsGwiOCEhs5KqfB6dHp9GDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=we458PSz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so673784b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019832; x=1711624632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvoaaCNe2L2vMyDF22zsVVzl/iZzIirF3aywOiTV8nw=;
        b=we458PSz39f6wmdVuY6bwvKEwrJZUcuSb9QFd5J9NOe71JupGc2R02Q/fqE8En5Y7S
         TmoxYuJzCv+LGU3vtnNCfX4jC5y/dvjc2RMosvOfvYuH7HJdDk/0UnmCTeptYStIYTyS
         dnGL+WrVbmlxUC7qHOi+zcs8b60edUjinMcTlyiV4WdFzyj7RQtQ6JIzEx04GYvo0wDC
         RjjcugJluQWY1/cvPtT2HkbRXcPCEYWxAbsAWfXJoBmXAnqc6J52M2wNOZLfmO8PKQGd
         gHtPhqTiLp8MujtgE0cbZq3GrXSy54JVTp5M1byXsib+HczfTOuuOxcrrJlVGZGX2c58
         uYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019832; x=1711624632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvoaaCNe2L2vMyDF22zsVVzl/iZzIirF3aywOiTV8nw=;
        b=tnhuUjAgRNxJCkXQ5xZYx04NEydSNdl1On2vpMBBxDNvbzdpsYUqkSoir6WNPIlQ6Y
         i3Wkx3Ppw6OKAFVS/yn0tsakI+28KDt8PoB/N8GObl6Q5zQr+LcR821LnlXBzX6sWkjg
         qu31m7ZLq+wsWeLodQlk/9VM4+D6GACXt5kjmCYqmHUHmawCGIBJi031Ctjjz417rHvK
         vjGpS/0M0XQz+W0pZwuab/fZ63v3F54+fjV3Yu2kq0jnAqvlLL38D07HjKR661r31veQ
         x9/fShoiWvlMrnvkvj7TJgFowqYlMFfnUntpeRlBYqZgdhCfZZaa3HOm1a4EbaiAfLc+
         ATAQ==
X-Gm-Message-State: AOJu0YzXpfJCferk2lXyjkJRFUmWGYzaxTuV8rYOomcWng6Ejp0Ip9tS
	3cvfI7fH+ez6wR4XX6GejcDNMCegXeLBv8SizFiSjg239Pmn7aCS6JUdzL+SE4anvhJUNwUPLeM
	=
X-Google-Smtp-Source: AGHT+IE0zWy2fXf7G3AFMCUrVT2DX7h7qU7j8TeDFsCitd2Q/jLKdGnj9QC/ZNMiA0f+O/qYkxQMdg==
X-Received: by 2002:a05:6a00:2d12:b0:6e3:fe0b:527 with SMTP id fa18-20020a056a002d1200b006e3fe0b0527mr10677517pfb.30.1711019832175;
        Thu, 21 Mar 2024 04:17:12 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:11 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:28 +0530
Subject: [PATCH v2 08/21] arm64: dts: qcom: sa8775p: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-8-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=5meRU2YVUU23seGXMANnZfJqw+Ixz7s1OvoZwdTDBBo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcKONAMnvopzvVDqwrjlcSLycTaFPBuNEMgK
 YurITVj2SeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCgAKCRBVnxHm/pHO
 9TEhCACg7twwJyGGfQKoNzi1x9qiHNI1EvP5fPdn9xN7HQUHiBIPc5K7w+NdkCMXU//B/RxhEv0
 /uRaxGrIJb6Fr5fpIsm9g58zsCJlsiknrKcKChtC76JOEFDqETi/qSFJ5TUA7pIZRU02Yt9TLLB
 g30JnSEopDmb8o1MxBjo+cymA+PzlMd38++AusgxBZdiGgk6Egx/Z2/98qzPRaaCyaXbBKXwGNw
 /UCFS9rWm/L6J8qKYH5OI57OwEJcnDl4QzuLmodlLL6DNFxzptzv5eJZdfQmTRnzphJZCS7PsEJ
 W6mE8FTLI/IqKzDqcsaZNoPWnDcZ5vMamwr1d5Ru+DsrTMbY
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 231cea1f0fa8..31de73594839 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3677,6 +3677,16 @@ pcie0: pcie@1c00000 {
 		phy-names = "pciephy";
 
 		status = "disabled";
+
+		pcie@0 {
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcie0_phy: phy@1c04000 {
@@ -3777,6 +3787,16 @@ pcie1: pcie@1c10000 {
 		phy-names = "pciephy";
 
 		status = "disabled";
+
+		pcie@0 {
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
 	};
 
 	pcie1_phy: phy@1c14000 {

-- 
2.25.1



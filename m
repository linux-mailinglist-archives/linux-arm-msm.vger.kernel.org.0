Return-Path: <linux-arm-msm+bounces-14724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D68857F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24ED1C21644
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5B359B77;
	Thu, 21 Mar 2024 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GL24sxDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67395B05E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019827; cv=none; b=MqWiKAhNZQi3mtSKV71cEsv3U2ZxJuJDrNF+Q21VXsyZBvm9UcHk+SKB/cmbLiPetwClCu3TmtLRQGoxhjjl2P5TRhv1KQlFtPRSAYql6ncWe7+eSsdI3pcRqz5/QcfKvsuwl8I44qXPNHFkLlAI5He85esioedVdV9V5fdFBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019827; c=relaxed/simple;
	bh=5GcAJHlBvKdEoubmGeSAXTJD4cDVK4cWaitoqpJbgQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvdUy/GNfqopdJFtCO+kP7+wgQ1rWvMYyURK3A0ICEh33ZwgILpGx3tU363cKiurIVbJaEgDdIeq3+32AxHb5XfqJe3UGBdPwJK7EnBmVdV3n8Kh40V4kIHwI7DR38rFGNaH7MFOZRyumNdPQrYNZeEsmxP1vB8jvPmB4AxHOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GL24sxDN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso558729b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019824; x=1711624624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCgE3LULkY+MlLhJXel1FLYizfuhO7rE/6pBSxAbnjI=;
        b=GL24sxDNiMNFjC+QrfBYKBjDOHVKxC2bM/v9BOGdbQE2GMg13wtJ4TGPHZ3Vqqb/N8
         pH/lh/F9JtzOYNQ/g/VjmeeKNWjvc64gnKfORwCPX1LWKQSLaL2PplVkTmqNXc3SHj4l
         1oCVesGN5cSAEC0rHaQZOkktEFBpaGgBKXvIJ4L2cBpWXriIeLQEKllcvS8otrd5eHon
         pnrPpARE//Id96VpsaU6+inhbQV2+2vk4gu0uSVyDQGm2uNSwwjUTU2PLVDYECNJiRMA
         9uV1xUS7FwjAi98XqiuX0NJ6KCJjbwz62TfSZncksMfYikjd83GhpLOKYcN4JBjbGoJE
         6V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019824; x=1711624624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCgE3LULkY+MlLhJXel1FLYizfuhO7rE/6pBSxAbnjI=;
        b=tsCTAB20GWpNGrNxa0QUMxzAVF53cFr4JQOAJmHKWET5i8VAgsaDqKntEzebYHJv3v
         KbFE2Hx6w8v6KhhwJJjYPDoyjaSRWyaRh1RKGyRZd6S+2p0EYx7yhRlKLbdZa2+JcqeM
         MYqJ/5P1iXcino83NZ1EZBqUD70KKQLx7J2284XqCcI9FsKfwJJwvAEjDcgNVdNA5ne0
         5D2ZfTxhsGVa7R5hhHzccMOuIs7AemTOTXDli9eA4peXdY6bOldlYupqG60Tx3kbQDY8
         N5GUXETsS7a8tpn2H5EiV/rUNSslnOna01EdwprR8eWUNHH2VYBiMATLFavQxFlHT0Y2
         GRxg==
X-Gm-Message-State: AOJu0YwQdLXjxIddRaF8xnMohzOm3Mh7AWe1ZFoicEATW1tteuwIeSp7
	AJPaAWlONSNwZW3bEjKzTz0F0BeFIMFTHO5gnbgo+jxVTZW9unC9LeO3Ya4ebQ==
X-Google-Smtp-Source: AGHT+IHugf9GHBmUcKzliLICDPtou2xS3lY6rzgr4eItvLYi2zsqVzbRozIAoUdbiOGLz+7MwvfjaQ==
X-Received: by 2002:a05:6a00:399e:b0:6e6:2dc9:dcbc with SMTP id fi30-20020a056a00399e00b006e62dc9dcbcmr3435556pfb.10.1711019823619;
        Thu, 21 Mar 2024 04:17:03 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:03 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:26 +0530
Subject: [PATCH v2 06/21] arm64: dts: qcom: sm8550: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-6-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=5GcAJHlBvKdEoubmGeSAXTJD4cDVK4cWaitoqpJbgQY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcKdnv9eU+5NjUZRC2zsEE6+iJujn3ML13Tb
 OUIoeLu57GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCgAKCRBVnxHm/pHO
 9RObB/0V6WSbb9d/QuL/IN/igbT/U8ZVi1TtULvhzAA19in1yQ0fF4lafvGCOmIQVgqmIZEFUQf
 jVc1UIGQLl7Z8nQyazTRu2bGDscoNcLvQBie5ijCUVnAUlA13OF4xYYf7dkIkoW7b2/TMZZgxPR
 jhe1yM1n35EOKf6+UD4eVfbP/1jFFXLoUrfAW2Oq3OORJvCRgt8ooHasDNKyu9GbcazPrKg/lIt
 pDip4FZ0aDDsnvfyJxGz2Pl5Myr23sM3pj4qh5YDdAWbqk8HXVU7VhFEu13m1sgUnHb2RNjiFy3
 kFYcA0IpJ+9LBIxPDS87fGvAIqn/+abQ47HQNEXQ5PLvthtY
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 3904348075f6..760b6a6cb59c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1770,6 +1770,16 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
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
@@ -1883,6 +1893,16 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
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

-- 
2.25.1



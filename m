Return-Path: <linux-arm-msm+bounces-47896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3617A33F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 13:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FAEB18830CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C128322170A;
	Thu, 13 Feb 2025 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVOTlQ5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EF221579
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739450650; cv=none; b=Pnh+UxOgrlMFh5nIUW2k2AbPbJF1yQ+bqSprUf5WnOWf/WAbXE4Uo6it5wrDajPVT1Zjg8mlavxsLUQ+HKgTek44BWrc84KP+CloJhdfU/typl6qsZumuwx9EvCgzwmG6Ni7NIocPpVce5YLObAoNnGP/OZ5uQtB5cLdt/gl23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739450650; c=relaxed/simple;
	bh=R3gnP0CayQxmqzX938MxGg3B4sCeWwi2pOEal8oVqNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HYSYZ1WLn8RGQGUoweV8cm4NsuIg0jZ7VX4g26ZrhDebrodUfaXjJ6esp4/RfCMnwFpJMtEdCvF6pEepNHv6hV8v4b/YG8kJy71547s6ltANd3iUwfmvDzfgbksUBbBFmArV1OQ9c8u3jbAnrmUJAZEwlR+EgRp1HXXf+F35STo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVOTlQ5x; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso5277895e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 04:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739450647; x=1740055447; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij94dGINxNx88EuxN0sn94TRfm6MJr1m8/2BrYCkTf0=;
        b=VVOTlQ5xjHS2Z3nLrcNXUGO3inpDmPB9dEFmtqyPi8hv6eUb3g7iHxQYv0xheFPD0x
         jkJ3DT89mGrxVUhNBvd+5srMlh1fiblqwsJ4oeBN2+tOsWUIvsvflsY7iNsItmOZerKQ
         78QMZaIaBjLvnNlx2dGkE6eY2Dmdj4nQMcb+N/s0lq+EKwXrpGSM8jiebiyJfs48YsPX
         WIxHBTjAY5G5g9ylOYLTzIseUO6sxjNxsoj3iOIbxBmop7A2GIyRhfHqOAeTpYfNmiZp
         5NzFdw94xCeDr2LZ300J8GBduOzp85DXmH4LHRfM9stPc85XNKk5Sqak6/xNpQ2bR/eg
         8oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739450647; x=1740055447;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij94dGINxNx88EuxN0sn94TRfm6MJr1m8/2BrYCkTf0=;
        b=CW02nrcRkolYpkDujYkwni9n2riZBhGpKo6L3VoNVvTn616kKTFBjKvi4agR/Am+50
         coG/UENhhp3SlFMol7kIs+rWDJeRcj+MrT0UGrAw438hwRasnhafAWEeKVLj6utbUMkM
         qJjlCLgIs4XJw3QEhW5gZsfPDXaRYyETNyYNMvEI6wwL59Zm8v+Kl3c7aZ8jkIU8KdMe
         QmiwrEtsAw0Y8xzQ8k7nseEnM2SvP4VZuZD0TlR1fNPzDy/D4zKxKtFV/iPVZkwBJ7xA
         NsLvo83Js9Kg3tdKorIFQ7qSK6lQauYd3th3k0FFcm9p9C4vlNyGyQNtbDV4dYcJeFIS
         yFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvZaWl5exexP+A08RdmqtrNqnGqYFV7NRbKtqj6eozxFiKfgRtE2AfR36B6hUWR1ChybT7eM9n1cLlhkBA@vger.kernel.org
X-Gm-Message-State: AOJu0YyNBwQPAIIGrlYcPUmThZ9AkxNuoyz8Hakt90g7WSX9x+PbMHQx
	lxvx8TTDUV+ErFPqFIg8UwuDGI5mS9NVGkTwZwtyU/bIRyH1iUgjkJ7CTICY/iNQE0saoOV143J
	z
X-Gm-Gg: ASbGnctdPYnvICvuL0YeiwntPPupbsO4je/fOe8Sm5iCATNnyju/1n5gpJgJ/oUdZ5s
	y+o4SSh7OK1UdYAnG3SdCVqoXSXd+YbRMY0RCy3LG96yA6CuvA88dQHq5WUIjQhm01eijQWA2Xs
	HXxME7F9MJV/gtSTwA/RBW9tIi3Mdz0EBaIozN8qoXGYufW53jzwA8QMsIO1vl9NZHtJ5BmJz0h
	BI7vbeNNDFTSBEQ1C7T0KvXgwC2Yej0/beeNbFdGy1WD20ztQYkdiWsopNaRBPeXZRRMUkiA5Ck
	QNvZwFaj8ULWPL0=
X-Google-Smtp-Source: AGHT+IHvfw130tAPFVEYbAnaTFlpZDnn4begdhdP+dVAGnpI8nYVoy0WyBXidzXuhcwcfWMAxmv2BQ==
X-Received: by 2002:a05:600c:1c84:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43958169fa4mr85886125e9.7.1739450646979;
        Thu, 13 Feb 2025 04:44:06 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884f88sm16584825e9.28.2025.02.13.04.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 04:44:06 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 13 Feb 2025 14:44:02 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
X-B4-Tracking: v=1; b=H4sIABHprWcC/x3MQQ5AMBBA0avIrDWZKaJcRSxkOpiNSitCxN01l
 m/x/wNJokqCvnggyqlJw5ZBZQG8TtsiRn02WLQNWqrMReKQEA3Hez+CIcetp5p93XSQqz3KrNd
 /HMb3/QDicOxWYQAAAA==
X-Change-ID: 20250213-x1e80100-crypto-18c7d14cd459
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=R3gnP0CayQxmqzX938MxGg3B4sCeWwi2pOEal8oVqNA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnrekU2lpmnrvba9K27nkXaa+Sfk07K3qYP2J8z
 dvLRjpBdDCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ63pFAAKCRAbX0TJAJUV
 Voo9D/459rHi+SCEdYpHCUBHoj5yUUN/AqZZ6Y4drP6RG1Pyo3dZcgwZvI5uIgtecQOp+oY49Sn
 xrbD4qg5Qk8xBFlTn/dUN809zL6YgfSWsInQutRrwM6N7DJq5UzlXPnno+N7OwYIFtptXUORQBB
 hMuylnWVYNInz+6cos8jPI5vjSKNzFS66A+QK9xZYuFQeeVGbFC0BziqawO6QcMwf/UPtzPibRZ
 E1obkv+mgXsH6GwiOCd9OjGzxccsZcVbfNcscRzsVtoc9gEuq9Pt4oiUS1SkL//XNBouSJ65/JV
 /MCuuq3YXIk2nu6nGqiMDSNszB0SYgg1oqY1yUn6XPMZDJ05luIf7bChLzKz8ZxTXeETPtLG3Ng
 2DIiGi9A8+kzHINzkLvqtPWjp6DeukvIPy/rcNcMnGEPhFrzklXBkPmKLQMv0NoEKC/qAcORZaE
 2xfd+EpAmOfSCJdSaNQSiHyl8SOyJx74dJDnKZpKWxCsFhf/gQ3SITeeRt4sdGbLerPX6wd2SLV
 GbzVBSaQJ8/WjQ/Ljt6N85GLhHv+GJUwGmrsCoRWfRiN8Ls7kNhi7x0BPqkaJ8nYOLUXWChwUCg
 dvYqc1Ls+8/qIIC3QiQRTz3TgQeq6Mvzmw35xc8luNUw5Um2HzBloFBXNgWDgQkI58Pk6EHPc9/
 UtUul1QIA7/Wacg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On X Elite, there is a crypto engine IP block similar to ones found on
SM8x50 platforms.

Describe the crypto engine and its BAM.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432892ceef95daf0335d4cf446357c..5a2c5dd1dc2950b918af23c0939a112cbe47398b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3708,6 +3708,36 @@ pcie4_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x28000>;
+
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+			#dma-cells = <1>;
+
+			iommus = <&apps_smmu 0x480 0>,
+				 <&apps_smmu 0x481 0>;
+
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+
+			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+
+			iommus = <&apps_smmu 0x480 0>,
+				 <&apps_smmu 0x481 0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0 0x01f40000 0 0x20000>;

---
base-commit: 7b7a883c7f4de1ee5040bd1c32aabaafde54d209
change-id: 20250213-x1e80100-crypto-18c7d14cd459

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



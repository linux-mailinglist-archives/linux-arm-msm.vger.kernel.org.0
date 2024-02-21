Return-Path: <linux-arm-msm+bounces-11972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05685CEF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 04:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93D2F1F23294
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 03:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB7C3987C;
	Wed, 21 Feb 2024 03:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1UBwlw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21F3CF4D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486951; cv=none; b=pCz5PgFkm2oOs4zHffNVcEO3nFvPzLCbR0xsa24gUMPwtVozElyIcDkKpcqpdsjDTNhUwfS1Fi85RWi9nCfwb2CWPwEewUyJ1qtTFo7OUyVD1zVuOTVeHxuhxgvUhwWK8Xc4GABRaPZ46TrvluuJGqcg2z2ECGP83ojM2ndaVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486951; c=relaxed/simple;
	bh=J3jKul/0PQXElhNJclej25sO29NA0XDyDmSBGcZmLg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKoWITk00ymODYOymql2nuS2C34IJ4FMmJSE0ru+sMfz5uUy+9+i3yoHa6boZD6ghhLvgEzBBxb4b+67sx1WMOtneABj+cC8D8qf3jBNhoLMeThq96PcazSF8+TG7VE/cBYdf0NaF1YOzbf1gCEoQpQlV7C68pg77EZn/9C+pzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S1UBwlw6; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so4336531b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708486949; x=1709091749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jx+fQ/t6ipFNBqSDjoYR27DTN7bGkftha5+FUI6wBY0=;
        b=S1UBwlw6Seh9sPVUZ3UbRWmGyEpJR25PwavkCHGmkWC3uL9IhIizsc50HMJjg0tnlF
         VeMeNJZk0GzPDO/t2w2jTv3y1Io/+J9n6Nvbck4TdL66kGMmVhEqQhBvF9l9egYPW1q6
         efu7GeoFEazALHjxoMHu+dB1utJFG/Uil7oEi0cAiUZkY5jeh2bvWLAPuErxktBtE3J3
         nu/FRKtOuJ3+uXm8R81/8QR7EUs7VUsxtGlTflnWcz44w7pCpSKsTGW3cnD7TZm0Wkpt
         d+HOjZ5pZQyomXfjlqwYQ4hJgZy+k0QiF54VwG5EovH5it5hNfsqbdRJZcSN9tUJmOYd
         5S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486949; x=1709091749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jx+fQ/t6ipFNBqSDjoYR27DTN7bGkftha5+FUI6wBY0=;
        b=umTbSPig+90516cDJCTfQhVlkyRCl1VyszYZyeZPAHMkhSfNxx4NeCDYGhh/h97ly+
         SHYrJPzGrXXZ16w+zOZTuxDBOHGexOAux7l+375VLUtLwuDAiXQRy1yenmfApWrR3BZD
         MPSAbNPq5L3lY6/XhqBthm/muSfj8rEHeDtN6qvBdkPvlWsM1FJsU80C8B7b/l+FnhSH
         pELpYnU7Z8DG+aq+Z7e5hLx7qiO2WMuvo55abcomCoY1lq59QaAQqRjG8RtaS4RpwRRw
         sPqi9trdYColYnpIvTKRUVEPuRNSGFZ5JTMxF99t+NDCFcqUVlgN1RZ3hBHUixvJrwgu
         e1Og==
X-Gm-Message-State: AOJu0YzmrgQ8A/zWozXFYGlckBWEHo/Yw85sGLlI7P7mw6jV05NqJxD0
	ybWQOutrVspyWv89ymH1ap0fwhagWw62nFquEswSLvaPXltYQlOCiAU/a3dbAw==
X-Google-Smtp-Source: AGHT+IEUmeZhzX6g3Qkt0Q537Sg03gbNBl5J/8cyK0MtzWEGTj2vOVvfhE5ZFSPam6JQy5AY760bqA==
X-Received: by 2002:a05:6808:11c2:b0:3c1:6e60:a332 with SMTP id p2-20020a05680811c200b003c16e60a332mr994218oiv.11.1708486949176;
        Tue, 20 Feb 2024 19:42:29 -0800 (PST)
Received: from [127.0.1.1] ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id o23-20020a056a001b5700b006e466369645sm4436231pfv.132.2024.02.20.19.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:42:28 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 21 Feb 2024 09:11:52 +0530
Subject: [PATCH 06/21] arm64: dts: qcom: sm8550: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pcie-qcom-bridge-dts-v1-6-6c6df0f9450d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=J3jKul/0PQXElhNJclej25sO29NA0XDyDmSBGcZmLg4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl1XEGLKuGwuIxVfZ2RAl8RPL9QF7taAoLBqgS3
 rAp1TV+/q2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdVxBgAKCRBVnxHm/pHO
 9d9RB/4mKO61dfmraNPj60rQK3e6WYHIT/rny685M0kxYOBK6saH/jo5Y5hDv4vWoBTUrthxCRn
 s4uhfwePoyfGLdaLZcg8vK59hXliyzLmhT9nG5scCP5VfF8+4kOaYpTzFCGG9zjCFuYFEuu6Itn
 MKvgyo8mJjALR7uJVCTFqBCj740N0c1lRxo/0zvngJ3dP5ipJmBvdUDUH5+dtqgtB4ylHqUnTvE
 5iH0CgMUOMk/i6VUqN/VNIy6jtKDDkvlNvfcy0whCx1ZcZvNY2lq62n5JaBpO1tYCu/d9OHFQPl
 ORvFjlLFZtfm0K5GsXjxl+JUMxDDIVdZdXFlsNOafSnv88w7
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ee1ba5a8c8fc..3ee11311885f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1754,6 +1754,16 @@ pcie0: pcie@1c00000 {
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
@@ -1851,6 +1861,16 @@ pcie1: pcie@1c08000 {
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



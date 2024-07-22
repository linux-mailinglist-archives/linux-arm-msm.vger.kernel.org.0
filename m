Return-Path: <linux-arm-msm+bounces-26794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9182938E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 13:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 539CB1F21DFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7D16D337;
	Mon, 22 Jul 2024 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZOK9FoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6416C85F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648920; cv=none; b=YxZ9FAgBx1Jgo1JvAFShxFIq6800PEYAHYyO0aQIWZ+zztYQMT7+RVhTHPKvbRGzwImH+PzIA9X1IeMiol+KJgHti68ui+IazvgTQFYqy0qVD79XBcnVhIZNbOV0uLyxCIHKTEWRpo/vz8hL0z2zGNqv75QcFXyT/AGlmm2Bv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648920; c=relaxed/simple;
	bh=3Xwhjvm5wbJEdiizucjdqYXuEcrAsilJiNWDsUxK5cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZNubFGVXSisS+efc1H36EeuYQgK7jUjaeGeYZ86Itc2U4RA12y9ic1dwMJUaUwYr5N5Plu1Ki7+DVUKrCkvo7lEYVsJmrM0ZouguTZd1BCJ+oxD1cO3edDvFXSv3pJSa31WUkZOIEN9CJJqYKx/3CJndYRiL0xwTv3HFm0aPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZOK9FoM; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2ed592f6so11272261fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721648916; x=1722253716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxCX5fPAViMuGmpSeyA0JTwF6wn4RYFArQbIFQ2vTrQ=;
        b=EZOK9FoMUESG4I55A/lkUpccuK2q2oJ8CPKUrMRExThccRA8I3pHsEV7iu6sFEJGhf
         S3D2dg4pQSJCBmG5eOIxyqcWi+UhN3r2vSJ6Ukw5E9dSpi4WQm30nL8Lss1dkiX+7aZ2
         oOT/V2RhbkFvOangK3vVsQ2amJ4i/TiEXNvH3ktu0OCm5zbrXcyyOQOrHKhtFFbXQYAa
         SI4CQmXf/nnxEp6bcMSpNbPuOkaVDfdq+zXAh4kUUZ+u3cS8KpgeSw7SIdmxjAEhhw4x
         DU5OvVSdcU27bkg2fUoiL+JA76pxBn8gI3z4stMoT2FgrqtZXR/pE4uXjOQRvDSStYYb
         BAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648916; x=1722253716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxCX5fPAViMuGmpSeyA0JTwF6wn4RYFArQbIFQ2vTrQ=;
        b=tqCkT6OQChcjuOmuNWDqCyDI0yOGJLBVEGAvjjzG3E9fhNZdDti3VFII8FUYZKf8q1
         P6chPjCywCRjY6ONhc+EZLqWQko0HRll4AUi2lJLSF7PynWynUDQaF7uZCU/Z3pTgcNl
         V9Z+YudjVcub54AS2lOGQjb64B8OrESZoFVXF+xZZJIMumVmuvXKHu98Lt2lbiUkZ5Y7
         ce/AHBxM5f+tq7e2NmGrRvk9cueJDw85gQYFbM+jfnyy84UCbvIWcJDeH5lxYTD15qco
         NoLNzs0ZTQkh9usRvkzd+OHqUlJsPhrnS5gmubG/QrMyDq0Rm7AE90ylRXlyRAfaurPr
         CeGw==
X-Gm-Message-State: AOJu0YxjxFo7hDMOP1CBYS0JboTeIcDo20OzHfU2Zv/PcOzPzrgwCdsi
	aCKJnshCZenn0s5oZopC0ZsgD6aIQ3iQ7JruwFFOpuV3xQ+Wyp29hTThmk+PvFKZzXrbUVtqR8S
	Q
X-Google-Smtp-Source: AGHT+IH35TeIaOyRUboeH3UdfecFWIeyAoEP0iJfK1YfO/fp2bVWpoSUS025RhJSlGJzRTjJJlT4lQ==
X-Received: by 2002:a2e:a27b:0:b0:2ef:22ad:77b8 with SMTP id 38308e7fff4ca-2ef22ad7b3fmr35328011fa.23.1721648916185;
        Mon, 22 Jul 2024 04:48:36 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa17csm125681235e9.2.2024.07.22.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:48:35 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Date: Mon, 22 Jul 2024 12:47:55 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: pmi8994: Add label to wled node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-pmic-bindings-v1-1-555942b3c4e1@linaro.org>
References: <20240722-pmic-bindings-v1-0-555942b3c4e1@linaro.org>
In-Reply-To: <20240722-pmic-bindings-v1-0-555942b3c4e1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=748;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=3Xwhjvm5wbJEdiizucjdqYXuEcrAsilJiNWDsUxK5cI=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNLmuQs5xH/sker9zLblypq/U3dcuqvIpb1w36bvu2ve5
 tU6a95s7yhlYRDjYpAVU2Q53PRlzevtTkJXtledgpnDygQyhIGLUwAm0iTG8D9xybt7Nnpf2Kan
 LBEq9gvwO9hy2MEuNTWiU7/ExiJRNp+R4a75+wbz5tt9TpLM/6RFDqcfLkuu4LyZebj36qplnZa
 z2AA=
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Add a label, which is a required property, to the wled node.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 36d6a1fb553a..9ee59e6d2cdb 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -57,8 +57,11 @@ pmi8994_wled: wled@d800 {
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
 				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp", "short";
+			label = "backlight";
+
 			qcom,cabc;
 			qcom,external-pfet;
+
 			status = "disabled";
 		};
 	};

-- 
2.45.2



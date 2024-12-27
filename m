Return-Path: <linux-arm-msm+bounces-43496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF89FD43E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 13:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0CD1188213E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 12:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0D41F236A;
	Fri, 27 Dec 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knG86+ut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC513C3C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304326; cv=none; b=az4T0OQaSjkqR8LrkXl9dcV7lFhnGk+WVu1rzEU2rPOTvrAEAzQp2qsvnsj2hGLwMRlg30C46udJ35hCXZcTxgsEUgZe84HzaqJuZqAG6GlwZQCK2PirLxnNgG5PS7hApfxNp7I+0PoYOPp0grOpLekjXGCgEDz9twvZhZm8r3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304326; c=relaxed/simple;
	bh=I/hJbx+UhPHPiscNE9lP2YdCvgXCRwBeiiwDYlaGj4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HPMH9uXyn/HkDFOWECbQ6nXBTaR+ShcEd2KvfNrnCP3Xmmz7OVtRJp3T5UnLLlFHcokwcsn0vsypXiFpqdOYaA7pkLhC+gSyEoSuHpvyGx3AeFSYMQYiG9Nk9/0SqVGnqIRH74mfNmWUw2hpiMZh9rVTSivJEWpcj3Etj88ZfKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knG86+ut; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e0e224cbso3747485f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 04:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735304323; x=1735909123; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDdGEckgi4owvE+DWRBdebkpETzu1CKFX85k+EedgfM=;
        b=knG86+utEeFPAm66D+PQJ6Y/eGZJJ6JWmGAUYVw2yKqye8NCuic1ifSonkZ9uHK5z5
         TQiUKJIu0qSJ3bK+F6ioBagMDJQRgbK4ZSVBHAmnpj+nWKreA52/OdLYNvNC3OxgSVC0
         RUp30BqS/L5AMaTgK6yG/dKfFq4A18U9n7RLb07wRpVTS7NP7CEuyGFlts7o+cpm0JMD
         5WN/qjBPl3amNsMh5fUzhhHK0lGpW1uJfE5DjJethZy8Dyv7IVq3K6esooNWT2m9arsM
         Rz2kIwYBC7r3R1MHKWdCcpqmS+J00oc2JIQ73F9XR9vmYo8hkRz6jcDakU6amkfCbSA1
         AJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735304323; x=1735909123;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDdGEckgi4owvE+DWRBdebkpETzu1CKFX85k+EedgfM=;
        b=gbt1698vDbwfb51OhxT3H/WFvs5pSQo8TRnj3Vgbcbkqf7giuh+8maE+TGUy5W9OgV
         x8jUC8wBWHQfBd5YOynLJ6BH0OgGRmrs9WUHXIP3wBKiFrlzXPTfZc6d20zpaw1lpWxQ
         Oqhg4Cn1x0R9QWSbKA+C98vOfsQIEsp3a8qo1b/hB87Wb64Vt2pmvCKcHQsY6ZSlrmiI
         rsDRz8TxvjCeHEuUQx3k1/fVWCIoA/qzQtI/Ko50Cw4bTmraJrXXmVOjNoeMIT9febhH
         6V7xY1UR5Qo/JSLQ2BMxemTbloCcr3Wy8eyyxADQpAjEIyKRPsYjn6Fb8ovxFI+0NzuS
         8YnA==
X-Gm-Message-State: AOJu0YxqkXGeFQNdw+Ii9Z4P97aaA1sO9D5ka7UNSNACYgq8ZvZiN/eZ
	1CkqQUyuyGO/yUFZdhx48lyh8Eyb8IieDuFGdQjP+bzLYYCJSlm+OnALTH2X3b7rltpCpOgfNJd
	7
X-Gm-Gg: ASbGncurlPDHfaRE9tgx4m7Z2E+a/BVZYW7NxSoK9X/11WfRncTs3ec4vQrYOgWW1Bi
	jsI5wya7Fo7HZp4Ref7ufDcTUXde55/iLE+LLBP+4fPCI7k4mxhblI21XeEZtSFa7nyqnGP+Kj9
	DKeNmmUWLK5YUFC8Lwz4Rfzht7DM0S3YQ8TXfpY5Cjpq4kvVSpElnT5RORs9QidzVeHpPE2qE9X
	0k5TRTb36xa5PtAQOhi3FtljqeMf6Jpxbj6NH0K95Qk92x/I1j0wYPy
X-Google-Smtp-Source: AGHT+IFhkcxC0c+E0VfZles7rdAdsYhqqs+ATikjgURZTRqbT3bU1zZC8fVT4zxxYAFmI7TH0aDuLQ==
X-Received: by 2002:a05:6000:2ae:b0:385:f560:7911 with SMTP id ffacd0b85a97d-38a221f300cmr21977862f8f.10.1735304322944;
        Fri, 27 Dec 2024 04:58:42 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436724169afsm213946465e9.25.2024.12.27.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:58:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 27 Dec 2024 14:58:36 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Fix interconnect tags for SDHC
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-x1e80100-qcp-sdhc-fixes-v1-1-cd971f7f0955@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHukbmcC/x2MSQqAMAwAvyI5G0hLqeJXxIO2qebi0oAIxb9bP
 A7DTAHlLKwwNAUy36Jy7BVM20DY5n1llFgZLFlnrO1wcfgY7skQ4RVO1LgFTPKwou/90oUUE3k
 HdXBm/kXtx+l9P6+6ZvlsAAAA
X-Change-ID: 20241227-b4-x1e80100-qcp-sdhc-fixes-686b7cfdf064
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2421; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=I/hJbx+UhPHPiscNE9lP2YdCvgXCRwBeiiwDYlaGj4g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnbqR/XZNhn2y3VyDORttqYlP82xAV8I9hCbLN5
 CwtRTBCzEiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ26kfwAKCRAbX0TJAJUV
 Vgi5EAC+3ThsLdZjWaeqGZ7tyIlDZaDctj0YUYkUIn7Xg0XnTIMaSRopBYe3o5cKxGlcZ5dFwd8
 /dEQ+wQfB7u7920Azi5QVoSTb+6U/QFqg4G7jJFzdarsfKUKfQDhmXsYtjSQz0otg/gu3JNUWge
 ZlYErAUV1ZjUzqJ6KgrQ66O/PjpUp4buMPmY0CStTZWGwcKOzqfPAY0dJhPaDrVX7MBE7ZfYSNx
 +F7Ec8cTAokDccsrKcIT7kFpgmMNXOBs073vdynQvJhyfjvIumskoWL80SeODgicNWk8MYP3Q3J
 yVnvM7XOL2Gl3V8qyGJKKCMiUrKK8a3cI+5Mqh/hO1EBm7XbBR+rtXhCdJetRa+nyiptuyatNJH
 k0mtfARjRKvS8FYCQYob+UC2jHX/ImTqCuL08aFzwpHeh+0WhSCeFbLWLBQ1kO7fibYF8kgtRin
 7meaklmePcttreQwb0xrT09pXq6PF7fv6s34a1RKeeP+f6dAxmeEo+DaftvY3ybe7Y6c/hxhEc/
 XjTInIpuNvnhGgMkozSgByHOvL1K3Zts/ojXKYkkDxbw3Sky2rHP3wUkECBsYwr5t7KmBSRREe2
 pmXzNN0uoYTMZK1SplP7Nev7Wuc1q+mM7m/jOa6o8TpzJTyDDAK5uk4qHWzzmUSaLmm/Hv8Y39D
 OB9Eija7e/Oix4A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The CPU-to-SDHC interconnect path for the SDHC_2 needs to have the
active-only tags. The tags are missing entirely on for the SDHC_4
controller interconnect paths.

Fix all tags for both controllers.

Fixes: ffb21c1e19b1 ("arm64: dts: qcom: x1e80100: Describe the SDHC controllers")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Please note that the commit that this patch fixes hasn't
made it beyond Bjorn's tree yet. So fixes tag points to that.

Also this is based on Bjorn's arm64-for-6.14 to make sure it applies
without conflicts.
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 0e30029bfc1948d8412d62095a0c9b9274ebb9a2..9d31cb55b055d0726c73f726d6467edaf4607dbe 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4315,8 +4315,10 @@ sdhc_2: mmc@8804000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
-			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
 			bus-width = <4>;
 			dma-coherent;
@@ -4366,8 +4368,10 @@ sdhc_4: mmc@8844000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 			operating-points-v2 = <&sdhc4_opp_table>;
 
-			interconnects = <&aggre2_noc MASTER_SDCC_4 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_4 0>;
+			interconnects = <&aggre2_noc MASTER_SDCC_4 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
 			bus-width = <4>;
 			dma-coherent;

---
base-commit: 1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
change-id: 20241227-b4-x1e80100-qcp-sdhc-fixes-686b7cfdf064

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



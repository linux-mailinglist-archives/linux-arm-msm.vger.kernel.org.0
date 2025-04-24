Return-Path: <linux-arm-msm+bounces-55395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7FDA9AE77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13929A21F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0755288CAF;
	Thu, 24 Apr 2025 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SABBVXJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BDD28150B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499890; cv=none; b=pOAhaaumxVlcE+aO8pgNpVNq9JwCm4lfudRk6ZzewM77atYzFU11wOqZph0psT++/to1YBy00vEncA5aBoiRbmLzkJj84t+WL5Di4ZJpZcGi51L/+9s/v/XQp5lkQbWxvvDG/JdpF7vUfh2ZomXX72LCFDfd5de0O+M9XxgQO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499890; c=relaxed/simple;
	bh=Xo1D4WMW3u8AexLikJCqgRpBtmlISfqstOrN3jZwAJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMvlP3trmGgG4a5HWjqD/ubuj9Z/Q3weiw1EQGz59AHRYFkd5p1HztfqQ7tDZcXT0aSHxf3P1lT114SLrwsJpKd7JfJWgI4hEQHO//R8MBqLQyS1WCH2rsQD1aW9xaHyhvm3C39h7AwpZMthGHP3jKmT+N0Wdo9qGSAtaQAYNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SABBVXJP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e78378051aso137822a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745499887; x=1746104687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykdI3Gi+8HO4bIXRSEA0t0XdHfsbEsUCV4pjAqv7UHU=;
        b=SABBVXJPJhBw/cThxHU08t0Hk1iFK37/lNUWxMRjBx8TvBTJAJn6df/Ct3D7BSvwDE
         yA35MZnrGSI7nm10SKklofSoJNJE+L0QUfu5YO2tHFgE/mEROV51BqI51Usfky/ygZhg
         1OSh5dYFEBfnvJpVSKGLNIGj4zfZCdz4awJX69GU8OjInxO1u9tq3lqn4/zDZPF2Fk7E
         5mSXTQ1OJGBx38Q00LA6/GxntstSRc22SIJuhqxPZwy9YcVbgNXIVuNUA9hw9uVXG5S5
         95eFF5IVg8itG2JkVdW+g7/vL6xnygsXT8o10RBSeMdr8P3uv+uVIfLmhNGiFE7xfPTo
         gRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499887; x=1746104687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykdI3Gi+8HO4bIXRSEA0t0XdHfsbEsUCV4pjAqv7UHU=;
        b=QeIqa1lKPF3zZ4/ui+bwTFywMlWZY6AbxHmd4XqGR+Vgh++Hg6U3LwtPpbj0Y1BQXY
         AuQc+VdThfOpXYkqyUiGBBKIO8j9G4vZI75GL191k6kiQof23Jwx0ZQ9WoRkZYN7ahim
         JK72ej3WiFZe/yPzwFPUxZ459M/YbN6zME95zY7oG10jTw5rl1h/ui0F+YBbEaQ9NLJL
         TY1wrS+I/tLivdEc7UZaj5qBQwGjPKcNpTCeGR+/Z10cwldgR+nb9fr7TEqvROd/KQbe
         Ss9O8EF95MOYJwC6CMJBlwe73Ha4nSbkafhW4SQxpB9N0AtLBwy/z9WQH3+xXWnli3mr
         752g==
X-Forwarded-Encrypted: i=1; AJvYcCWYC43t0k6ks440sGH6RYqqM9v4mvOg9AfvHT8LoeFnioD6bBca8aYFq00Wcd7sdIhy7cBchFUj3o3r0Oy6@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRlnV+miq9VsDyDoEXU8Z0D4+RNV43VVycOcPo8gO5gPMj/JX
	zJuZOGCCHWD2weCG9l/aFRSW+V+o+uvXUcZ6kUa2eAdrf3eT4wHrkA/vEWqnINM=
X-Gm-Gg: ASbGncsWQxO/3Ibi+plha6iSYmP12Cc1bJFSJw/weIZutFkw38cHgBiirD/QfWqS9Lb
	hxpCyC3uIBK/XcOMwraHNtS/7qvJ+Pg3G+ea9GveBxky+0EV73hr2EERnfjIWJ7K3ZYF4g7mx86
	RrOA+ZTimRJwdfWwb1D5h8R5iDAMoJ4ushdRWNkku5h9Sa4ltp6JXFFFKtrvfE9l9Za/VsDb/L4
	R3ToiS0SQREKahtU1giQO0lKKAglSguacejZZrtCi4g7mpw5wvRRs7VBcZ2sTPxdRp2Tzy3q4kG
	TKkFoho8Ts6hj34AcbnldVwUq42mcuS6KeKnCAyx1ysNnkY6H9+6nWgKC+lsMj/w8EuQtA==
X-Google-Smtp-Source: AGHT+IEnwMjmqYoeXiol5aRWjKTI8V0HKRWyVipeDqDx/054e4xCWp2ngxOEU1v1zHU6J2MgEsk2bQ==
X-Received: by 2002:a17:906:f5a9:b0:abf:6c88:df53 with SMTP id a640c23a62f3a-ace5725d41fmr89394966b.4.1745499887122;
        Thu, 24 Apr 2025 06:04:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59898006sm105101766b.46.2025.04.24.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:04:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 24 Apr 2025 15:04:28 +0200
Subject: [PATCH RFC/WIP 4/4] arm64: dts: qcom: sm8750-mtp: Enable
 DisplayPort over USB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-sm8750-display-dts-v1-4-6fb22ca95f38@linaro.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Xo1D4WMW3u8AexLikJCqgRpBtmlISfqstOrN3jZwAJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCjbmi1xU3eE3c43nUPHItZE3DFChc9pXj2fks
 c47cykL5daJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAo25gAKCRDBN2bmhouD
 1zWmD/9p2QKcbcGrH0JBB350VSK8vdheJHkABSI9fKr9JwvDM3Zsnn2KB+levveiHs4D+5uYw/M
 XlVOH0A+lEWOLMsMYnZbh6c5gX8HZoOFmon81afG4/eOfRtaH1ObChIYGtiUnWH2PhCCAHCv/Jl
 ZaPCSJH+6urTjZyTru6y0rBG4u/fQvOnblFhz1kZYCgqIj1fZgb3bMaHmtmFb8O2UKZlNDrcCId
 sRVlTyAv3Fv1YEZIDr5fLMpTySP6fPdqOw6gpEeh4NRHnCg3d70x6aKpd5uSUiL1nfom5YvM43U
 +Xy17fVtby+pvDjEHEAhoJDYbmpBzyYATv/BkV2jC4FzqwQyJM4FB0vzsBukdIjdDtYAW310I9t
 axbIFbruG2VLPWKU4Z7/DGOhHMftTy0JPkmHSOfuZYKRDnVOTClc5ZI5OvnqeUjNbZZCtXMYgDx
 UY/XVlpz/inPG0+PzlS9pEP14MnKIn5r/2Htkvo8XEHx1r9flR7lYNTmiOAZbHaFSRHqemDrT8w
 NO0FFZ25xIyF3NbVLLEwR/JB7fljzIbj9rGyQJ8Rjyp9I/WdvaVf6KKa6NlZEn92J4Eu11mwF/i
 JvBM4nYvGLCZF14Ssf/2jtBzyo70ZoxB0nXbZAqMvktO1LMtCvPlMFVS/7babOtbkwonvgE8fce
 fRKg/LtTAdKmjvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hook up DisplayPort parts over Type-C USB on MTP8750.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c3470e1daa6b7f31196645759be23fb168ce8eb7..69a54ac0f85d5ae20d005a09fbf8da7d769a9c2e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -910,6 +910,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3g_1p2>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 753b069cab1de636a3b1108747f300bec0f33980..b20fc5b5bdfab598fc7b9be53eef96cc16bc5985 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2965,6 +2965,7 @@ port@1 {
 						reg = <1>;
 
 						mdss_dp0_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
 				};
@@ -3064,6 +3065,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};

-- 
2.45.2



Return-Path: <linux-arm-msm+bounces-82725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF5C75C11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98F2D35C035
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDD03644D9;
	Thu, 20 Nov 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crM22pZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3313644A1;
	Thu, 20 Nov 2025 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660039; cv=none; b=RPahJENFy6NJtM4nKFQldyf8n6SpbJGBZsyqWhJmADGObOqZ7KGYCbt24OVw4uIJViZMQLQl7g9CQoNALLKmwETIUZPqZMu3nfkt/Qj1OUUwVvQ/iVAmY6OD/f/nyCoJOZZ8YGnDDGuzuaAR2afKUWSPbbfYnnppbS7L9rng/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660039; c=relaxed/simple;
	bh=MNrZLI7r4Dti3FaXgjWT0a4gO/9htos5ti9p2fEt2Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qfcnzd4ZCQm4zCUn9rOP1DdXR3+P/Irvsq/eZN2rtibVQuvdMyIwGaDSRtJvCnK7Ft4u81NKO4TRRIFr8ENFWJ/wLvvmf8KaxyXpiZPY9/urK/xP5NFruzKUnEqkxuZSD5YEYWx819La7Ss5aDlTm9rbZ8WemJI+fNw9/DJtVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crM22pZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F1EC116C6;
	Thu, 20 Nov 2025 17:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763660038;
	bh=MNrZLI7r4Dti3FaXgjWT0a4gO/9htos5ti9p2fEt2Q8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=crM22pZhcrdEMJWoKW8LUDFu6DaDUBqxGg7P4y1SJKnGwaIP35Lkl2zyzqX6Lbibr
	 +cMNLmRfCkT4sjhof67X/ZQyTHjSIL2nhqsjNf270YErmjvgC5IdSpLH4hpj0owNbm
	 EiK4JIjsgyWUu0L14SsvCkg76Q7eVR1HKO/5qAc5N32wN7IVw5wKnLAvbv0/p2V8Az
	 OnlCamL3mxWl3hs8dfvyxyGOmlh1VqJVLhVyhb07sPtDFc/ZmZy+O00RBidMJtcZf0
	 u55KU9fm041r1ClpGfUBAuENlQt9H3XJucM/xiN1DGDnU9Kjd6ntNT06uaVf9l9V3n
	 rtwc5XSSAQk5A==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 20 Nov 2025 18:33:33 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750-qrd: Enable Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-b4-sm8750-iris-dts-v3-3-8715442c30d9@kernel.org>
References: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
In-Reply-To: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=krzk@kernel.org;
 h=from:subject:message-id; bh=NJ/a7wwuwwkC6Pjl6gikKZ02zNf+h5hXHikT1ar6eZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpH1D8S3RsidIqxoDiVvHB0a7fPx91JN+hBL8bx
 ZSZ8GrGjG6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaR9Q/AAKCRDBN2bmhouD
 15saD/9Pae0lQecTWY8XHpQH1Nhn3XGtivC2SwO/ZkLYKzYlT0SFuDgP/lim9+WoQyCOTM6WU+1
 3o7e+DwDn8GZJoNXxBJIcqg9cuC9+gLDdVNhZKA3x+HWgiYDuyDpJuSRosyiPuemfMpBVnBkrIT
 qLJTtk9SDc23ZNNbOqxinOhguWxuQPok5nv7MmR4FN9buG4sj5QGrfqfOA3E2zTZya0KRG3n8vG
 EdgLkk/VQgmxnTzMiuZefgezG0JeQKDOqwRZniQqUhEkwhOiFPdJk1+X0qJTaTNtdmwsTxY8Hwv
 XutdYaaiwc1GVl0T9Kp/uncaYMABmdjm+hcjcfjngmjuj1ZF0y9HJWAxNMBvyTKzeQFxgT44rQI
 hc7/Rr/2KoRxax9n10sirrwBjj1i5PwZg6nSz8hWjhZidvo3vsSpOxj4caX69Y0+VExo+K2/5i+
 g/nO5EveN5+qNDB9oHh6XZrKKlFDP31rzEFbqJyROwNqBWr780KYCDwrRH+Y4PXLC2bJTcYnxrm
 nSQa6sGZM5J0JgeU4cV/EPNZew0RQnTu9YZOvBMKTwKwT2iorSz//TmP/Z4GbRKyIjBatl8hezg
 LqEZPxxmsF7pBH/cjMZHM9g2n7XiG4F56Fbb2iiIKWooFs4U57nZqIobXCBPX4EmaQz9vcHpALV
 vhwzZ86Gwgcc6IQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Enable on SM8750 QRD the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

For Rob's bot reports:

qcom,sm8750-videocc bindings and clock headers dependency (will fail
build):
https://lore.kernel.org/r/20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index b0cb61c5a603..eb3b38be477b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -858,6 +858,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 

-- 
2.48.1



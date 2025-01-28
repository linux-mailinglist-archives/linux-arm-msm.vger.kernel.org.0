Return-Path: <linux-arm-msm+bounces-46381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB2A209F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174761886783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCFD1A23B9;
	Tue, 28 Jan 2025 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6WT67Nu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE9B1A2388
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065222; cv=none; b=rsrS2Gp84ouXGhI7k8cxuF5qtpxjpGcyHmMTP6Xgn0dy5OWUL5rN52FMaTofyeRh48PNqCKe5YAUwr4bU2MwMxSaItg5N21/8G6l9gM9TyzlPLzrZAcTDOZx4zCZX3gtL3t0+WEwnnwgl/8vnco+oHagth2M4ojEpfr87hxkgJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065222; c=relaxed/simple;
	bh=qPrFyWPlGBodpBuu4+h8WtaNui4kZdvHpFJOTkV9TvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVOe3zmxm9OBzhZ/I1QD61KyB5FRA7h7WrlqVCr2iKRtRPlAccw9BFyVVcbHEJLTBZeAGyKyyYnsdZKK6bXuJA+JNXmsAyuoouPow82/GGMkd9rGwJxIsFA+Km659MgSBYSk9KCrS8bMuuksH+3xctQhOgHkhCJtZR3ywt3RKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6WT67Nu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43637977fa4so4720355e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065218; x=1738670018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZL2D30XwifrtVotNTncHJbvGIZjGZyVrJbBvC31nqOg=;
        b=k6WT67NuwhWaRn9iTC9eqLVjmBtkhbdRSh+V2C4FP/Is2aIhVl8HDROhL4CcAAAtWs
         nHQ7InSYvFDpZXMzdQbmkCq1JG2Gt7Z5YzpAB+P3fFtw0qtXgQv7Pm0eBjyLQ5epsIPP
         aonEhwP2Lj+kMUuq6Nd89GXPAaeCzLdUhhBMvogp2X1ZBiKISPGyP4A2rfsu3GNocECy
         HkahsfsDti/Uw1RjIj+UVMn1i49aRShUZVBL/yMiqo3ZncsDl6M76z5HTFLQJM6iDOIe
         Ncx4zE9OF6VQ0S9wfhE0GGxPZxFAxE6stBEeNxKtaSfk00ujSiTkCb1dbzHTEifPH7xW
         Gh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065218; x=1738670018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL2D30XwifrtVotNTncHJbvGIZjGZyVrJbBvC31nqOg=;
        b=Gwt9vUhEWrRFJeC0iiZoj8aZsr3HVDNZhE51uLUYuJpScxUCW+Zu2NkL42ueV563ju
         up8F+88VBJbeolxRZGQ6rqnKIYu/M7zrgcU3s/xvC7X0TYpv+hO4mOom1SFMOzXUxS/i
         txpBFe1R7wUjOOzj4AyEg3/tkF5dPY1xDIt7QfY80MmAJonzgvtdZMEbizvZ2uoRKj3v
         PCsRGbus/vz6S4vjkzq4EqwJXIXKzZSnvll36QuVPQrGwg/Ub5N38WNt+yh7O+nL214P
         xXSzrTxP6jss1Ri8QKruOlhRg2UaSmS+dK2bB2Zoc/VFZlKugtdnDo9Vr9hg/Cox8KPO
         3L3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhy9W+T84VB7Z7jOO6aFaA2/54PEnxw61hfsVjy+nNnfBivP+mh67kupImeBz/+pYAL7B0pTWKsbFnrWmJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yynll0yfazwo3QPhWnYo9lCJlAT6sVJOJm6j2IGCIZgRa3gQsl2
	USyU+FASUfYa/wOzkpUbqdCUTBEvYP9rAwweNozYHSToYJQWtRkd2p+SKHdzIKU=
X-Gm-Gg: ASbGncsldNJlRYsOgF1cyNHqD1dvJA2UVOGuWFJZKy2PAB4WuLSF84wRFWfOzRMLHRL
	HYvvUWjRHKxX+/R2CuYu0eYLmIP9M5GsjPOYaLnIOg2If2DgYZ1Ts0TGRauxKAyMcbNw4l0VVes
	B4/5RQqMCiSScZ6V7fhXGtKCcZfCw6TQrRkCXKY1PjRJK2oUYZcCsH+sSzjpMZRQY2qCzfujB30
	ErmD67hbx0fdleHRxBjct8MYsuThgmI7rQ8mwdJXj9tUfE0a/roHRq5ULNn/a3/Il6onc/5L1bL
	LyP8LwDzRANnS+8NR/3VFm9ehrM2
X-Google-Smtp-Source: AGHT+IEHtm4K7jLoxky+LwnfIZNejs78eEBS/ppLwLn3f34zcevEz7SpGpQQgPDSEr1j3B0FeBKLPA==
X-Received: by 2002:a05:600c:1d0f:b0:434:a0fd:95d0 with SMTP id 5b1f17b1804b1-43891440a8amr155224865e9.4.1738065218394;
        Tue, 28 Jan 2025 03:53:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f269sm169140195e9.8.2025.01.28.03.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 03:53:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"
Date: Tue, 28 Jan 2025 12:53:33 +0100
Message-ID: <20250128115333.95021-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
References: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Partially revert commit a86d84409947 ("arm64: dts: qcom: qcs8300: add
QCrypto nodes") by dropping the untested QCE device node.  Devicetree
bindings test failures were reported on mailing list on 16th of January
and after two weeks still no fixes:

  qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
    ...
    'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/CAL_JsqL0HzzGXnCD+z4GASeXNsBxrdw8-qyfHj8S+C2ucK6EPQ@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 4a057f7c0d9f..13b1121cdf17 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -798,18 +798,6 @@ cryptobam: dma-controller@1dc4000 {
 				 <&apps_smmu 0x481 0x00>;
 		};
 
-		crypto: crypto@1dfa000 {
-			compatible = "qcom,qcs8300-qce", "qcom,qce";
-			reg = <0x0 0x01dfa000 0x0 0x6000>;
-			dmas = <&cryptobam 4>, <&cryptobam 5>;
-			dma-names = "rx", "tx";
-			iommus = <&apps_smmu 0x480 0x00>,
-				 <&apps_smmu 0x481 0x00>;
-			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "memory";
-		};
-
 		ice: crypto@1d88000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-- 
2.43.0



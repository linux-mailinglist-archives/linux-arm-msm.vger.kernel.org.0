Return-Path: <linux-arm-msm+bounces-48953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB3A3FB49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE5767ACD1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472FB1F3FC1;
	Fri, 21 Feb 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iG7/S1gJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306D1DDA24
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155042; cv=none; b=WSpXQhmxJm7To8mP5NT5+y1VSlwCXUmOrpqVqDquLqaPcGIJP9jbL2sJbzYqWtTIoTfdRhVSP+ij8l2Yplr3HwKIzEIFthRB9L7p50leBYQXXnxs6X8UV3ucTObcMe6+tfflt/vgcthM+2iG/4rPi0h3CtNKcbYZkA6WxMjFRsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155042; c=relaxed/simple;
	bh=nVhLu0AiCCxQH/soBCHuVFIETyl7UMc6C9vhLI8S8To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4qu84KW609FIoy2X4cmG4TgtczcKxolnRP79s5MX4Uf2qrfx+9ZNOhy0E0wEfmkAzMS0NDWBzHu9lkt3WOFf7xUpiys27sF5FAR9XbghHTJak7CkCFnngD3lDzZPpeAE2c6A7jYcpAJ1jIzxj0qos8Gbh/Enfx4yW/F+aaiKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iG7/S1gJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abad214f9c9so39348266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155039; x=1740759839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjLNng74rhxdSjD2x2QVGFVe11P7mYgAEe28w7w2n8s=;
        b=iG7/S1gJGXkCPOXCN80REPq7pdRejN7cFkpjTNsZqiKjNXnswu85xhKbNPcBiTTprU
         xeUaQV3d/dC+zDgPrfb6BzmCLAdae7fYsCBv3Fu9pr1j7+ynAAe1nTT1l/TEkXWr/AUH
         tU42KpaVsalkBmPx5K6bnYW5R3v0FqMo/rM76LQIij/WqD6pA3pSU8f9jU7xcHZ+wi5w
         FxvSjKLSMJYRYZ8YLfYUzGCcmCpBY78Qa64WLV7wrMxibYFrlE4xvEszodwaOuz+kjtm
         gFWXwc/VLvu4H4Cac+VKbQPsFFCQNTwPFiQusx9Mc9TMZNu0JDPFNIQWd9FSL7eRuRyA
         fJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155039; x=1740759839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjLNng74rhxdSjD2x2QVGFVe11P7mYgAEe28w7w2n8s=;
        b=ENe/Kw2wSdpkArd+/4aEzwXUz735fS9pBIs76lpzKR9jntF24OZiRKFgEdmY7SvEBM
         p6Yl7cXpkBQAerr2Xyc8ORTWgB7T3MuFYjWXUM2rn1jx+DIKinKnP0kkpwObb/5wvnXi
         G2XzFUODQsHPN049+uIWliGHeGGmjx8o0Vo9gHJ7JfQlT/G2MAHwllKYeutZFwsGZP8Z
         boEWYTMWPi79Bq82/fw2VbqkQikF8ewcvAMFB+FTwCkhgbR3CPgROPcDl63EBTP/KTuP
         HdaZzo6cCz2ccNF6mqQ0e5YMGMr2u5AQdsAeNF61JQ+zjh9ScJaBu0GvlmKPeczYbtge
         DwKw==
X-Gm-Message-State: AOJu0YyI+mLUobV40ejlOfOGALRVlAx3d/mjQ6fiV7kHNLoXuQ+rum3L
	sDlWJ1OPO/PghAqJREwVCDwBuggqIHYqTmSulr7mOcYAGke39qfCkMm73IBj9VQ=
X-Gm-Gg: ASbGncsvOsREpirHF0wukzKJuBLeRON6dOr1iAqXvBsacYpmQCRtlIZ1L/awUoPMY8M
	RaaeAs8dl1L6TX8ukb/fCD6ZoLNEYaarAvE7aJSZy66qrujrhmWAho/s6h3bkB569hxhpGQ/4AC
	0lBbz9F5TZL5CecMSfVt21YGdI0D4A3a+Xb8MM21comWBvi2EAl3RK+x8IUPqFJ7aXeMkmsZJTx
	C7XZ+rOklbKMci2+IQzzqKQW6yXIawaZLS+g7LJkiBiQEaPfcC5w/ObsNWjw8uP/9qpc2bafclp
	8xf+jVnnA5opD9oHO3IhaVVBTA1icVtqbowkBC65l0co2W+epyUJ8A77kIS22SMCbexSKdQHDgy
	y
X-Google-Smtp-Source: AGHT+IE9n8WT+LZbEeNJpCmaPGDaxOuwTNa0Yfora0XCWQhgh3qzuxNavIa1QJcqz2nfqkDrP/IXTw==
X-Received: by 2002:a17:907:2d8b:b0:ab6:db64:b040 with SMTP id a640c23a62f3a-abc09e5c67bmr164906566b.12.1740155038670;
        Fri, 21 Feb 2025 08:23:58 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1050545366b.96.2025.02.21.08.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:23:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 17:23:51 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750-qrd: Enable CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-cdsp-v3-3-fe2891beeef7@linaro.org>
References: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
In-Reply-To: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=884;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nVhLu0AiCCxQH/soBCHuVFIETyl7UMc6C9vhLI8S8To=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKiYweY66DfEO3Vn72kN6l3tvIOj52ZgdsS6B
 bowczgEv8SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iomAAKCRDBN2bmhouD
 1zUMD/9c+LZFMNblY0pAJwmhJIgLjwDovglQ/SnLT913ZfW7JB9/Bt2bYjdVoUt5cvtjgW3PY5B
 nX+9+k4rULTwP1U50Of7pRlWr6bwEXebQfXWYalK2MAD13IvsTOTPrWzQQIPTNyNMlcieRrsuYm
 DUXco0J6ysvljhb329joVqD6tsjI0noQ4Pi+6IL9yMPMerhwwbG6WOQwlP4btsaXnZrwnR54NC8
 7IYQ3tJTnocgzsWVfgyWXOz0+1TfzRlBfPHQsmXQFYovvg9+uZmkgHJtIct3hbPNzncV7qIta4l
 nCmF9XuetgMUfi8QXZ+h2qtkMHBy01oEHnzVj3XDQfKuYP4X6+c8WPLTGB7bl5jC6R2zLxdZ2v6
 bfQRB4bCp1UPpld+cnf8BcfqVRDUjc0e1oJ3inYuABQ+SwLIx1yvMC6MPJhFKtVc3u5hJHdyayh
 3Cg057i24QBD5l0j11+P7VAj8UA5LAB2ZevBulvhqiJ/ZC/gbJDpLu0r8W6tjgs0MVPBOMlPWqk
 6r4GzXhXIvvEoDOB/EBI5UftETxnXCJtddvo5AKnRVROTkuZKlqexYvW6OZ4OiTnNGWcFMVsaht
 KMZS0RGU6TsHoLBQbpyGSDyyWQVYZDRHggWUmQf6QfK/K+73VaOcjYCA5/xNcwn3OSMurckRriB
 E+3rCVf4BMDAG2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the CDSP on QRD8750 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Not tested on QRD hardware.
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 341774bb042ff88af8acf49c2f0ef14f9994dfc9..7f1d5d4e5b2813c59ea9dba2c57bee824f967481 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -789,6 +789,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8750/cdsp.mbn",
+			"qcom/sm8750/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0



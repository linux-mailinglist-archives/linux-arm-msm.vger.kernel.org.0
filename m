Return-Path: <linux-arm-msm+bounces-41748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D6A9EE773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 14:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54AC21887B01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 13:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B372153F7;
	Thu, 12 Dec 2024 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBygXNsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024E2144BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734008931; cv=none; b=m9HOVsdxIW8gUakvnv2Twx03bKWGY+PAYAvANzgLjD8VAgXd0RK8MS9yKY38SiBOvLaNWfwDhkqYU1rD5HO24WNbO0zI7kzX8/at/1NwhEgyP/qcpxQA5MiTN9jy04HgW9VzRq0mbHKadMizwCwsBBafDEbbYCFuaVDFeeX8cis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734008931; c=relaxed/simple;
	bh=uXl2hEmCTQKufHaw3qRwm8b6rrSxvV0DnO8x+QbHetM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1/251gJneWbAkpKMPa0orkCc2t/JC8WtWqegtEUYAqT3OvHNqzfNXDtSfljah/u6Q1D6cxIUtbeLAbE06sYmokrrZ3a7ib1fnZ92WHtlS4MnzM3et1JA/YfWcsp9zLmfvhbVXeZwmzwsG4pFFpvOn8Na9fGodGflp+lTJWpf0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBygXNsa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso519559f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 05:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734008927; x=1734613727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Laarec9Gcg77CSK8knsrpRMAwU44ByomzCcpHvi92jc=;
        b=FBygXNsayRPSRtU8g2upnjxMiyH7vY7IQVm3GFfMVtImtv7do/4mV/DaxwxeGbczid
         BuMVQ2XKVlT6ZRQmb0ED11sQYGt3pi10M26G+RVJpmqX87CGYBIYqGVJSChwVC3MmNX/
         GGh/69V4TduLFfg6AhIcsh33ET+rKS0VqyUJI3ovfv0CJF5HpAq1rmFju12423VQhvBu
         1ERlx9q8k0IjKTr/U327U6BZhXX3Th9HYLaSyy/nYvoY0J3CVGeAjCKDX11QEgnLs3wV
         y6178naeU4eH8gi3ihzRbyWo14xgX72qLF1Dk8E7l6KIdphOUY+csbxCYwRmDoUtlTOp
         GoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734008927; x=1734613727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Laarec9Gcg77CSK8knsrpRMAwU44ByomzCcpHvi92jc=;
        b=Ws6LWwma2GVhBKNYbhaZlG4f6a/WTnQB5tXY3kN6M+kZsC44TKA+rIAcyowUvAqsTv
         XBkhylkY6HAX/cDIhizFbO+5PLsTYImk7V8UeoEUM+xgj+cXF4gTUpe/DwjWG1+VWkxv
         qSN2nuskHu0dZFRWH94f0muN0pAy7RkLphP//m1jOKJd8//HSedCmyLGX0Mgau111pY7
         sDO/TyOa1DjL1+zkxe1fE/76E7u5HPMNSLer6jmE03eFW/fvSW7ScSjr33FxN04SN0aq
         hkIlBIJpjTool38V6pPw0XGL2TdHo0aNKi+0ORbXAUZYr7LFj9kFkZG/7iAIKtroSv2w
         k6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuFXnXDhv3qdDxtGiVT9iZAu1qKRWgqAvFbR9/fNGDnevIq+JFLDgf02eh1cDcVUNUH31Nepbxm5N3RJqe@vger.kernel.org
X-Gm-Message-State: AOJu0YxDKj9vVmvn7f71S8+TgzwsyQzBzpjUR5dITrEuROtK/spKttUP
	K08BhgbA+SBxNbQwrpdJzbYarkD26Zm3juAO8NB8yHUIHcXGPpqsLtPRPKT34Ks=
X-Gm-Gg: ASbGncu4vNlkySkux9giaJEq8QMH4ABow29EK+ZA7n6YrIDIF4GLmS0zpEDIGFRoQq7
	tmbcsnSAvzHJrShPkB6uDAhIZxyZvk4Qa0yyF+DgXwAeHcxwbdu5F2nbM41rCuNiDzyVlcaAIN1
	FA/qmNpq0Jy4ysgzKX2iuMRnCZjCqTXEAIfURTOBaduGZdK7KjqcnhsHIUAAL2rgJ4X6eokMuks
	i+2wiiMuqOszCIXqlfD1Ok7+qi09ItvU3pT3XYlbGdxb7pNHwOAlykNz2EK5febUL9JpA==
X-Google-Smtp-Source: AGHT+IE278mQiSqfLuj53e2L8BLf2OCaH8QWc+w2KN9nQLaegzE1t3lgp9B26uV3jFUsqIGi89QwRg==
X-Received: by 2002:a5d:59ae:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-3864ce96d73mr5779300f8f.20.1734008927226;
        Thu, 12 Dec 2024 05:08:47 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:3c0e:7a2d:e7e3:9cf8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm605843366b.73.2024.12.12.05.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:08:46 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 12 Dec 2024 14:08:25 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Enable external DP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-x1e80100-qcp-dp-v1-3-37cb362a0dfe@linaro.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Now that the FSUSB42 USB switches are described, enable support for DP on
the three USB-C ports of the X1E80100 QCP. It supports up to 4 lanes, but
for now we need to limit this to 2 lanes due to limitations in the USB/DP
combo PHY driver. The same limitation also exists on other boards upstream.

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index cc0561debdb0b5c89f5d7f298d34f1feaf183b61..f45df1396eae55896a66e140b7db96c6089fbe38 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -711,6 +711,30 @@ &mdss {
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
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.47.0



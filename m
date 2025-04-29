Return-Path: <linux-arm-msm+bounces-56044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1ABAA04CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF684834BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416DA27A914;
	Tue, 29 Apr 2025 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHnYY3RR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96F27CB18
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912590; cv=none; b=Q6992hyQjUii+Xyg8lKXNpk7Z5zI7ntm60Y+ikIxJbGXdnn+vX4inzaDkGZIn1dLGkA2m4eh8O3GfDvZ85TthTP5maJ0xYG9oJnLBr3WSs+nWLa02DbzhjvpFad+oQIobZMQlGhGM1oyLrit3PVxT2Y5vD/L34oGvY8iX5/Ctkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912590; c=relaxed/simple;
	bh=CTwTt1G+dlV2uvVXAeYFRL3LN+3HEcJBUhzYf+1LquM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KgFzZDKgfnGy/HgT0TiDdTEW8WCBZCJrfbdUiL54OQR7zNu7+KDG/G2j4td1RIzUfz9t0E9KTaguk+LygaADFL+7gCLSd/NsNadHepbVdMVm9C+a95Lg79ghLRWRh7NctM3RH2gdGKZoqNAzXHr9vENie7x0IWEBNOa9BwbLQZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHnYY3RR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so7418524a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912587; x=1746517387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfxkgSvaAT51IBkaZUI/5ZAk5pQxxcrmYfjfdWPA124=;
        b=rHnYY3RRC0/2G9iK0nsQHx9tEK8j9J2fuq3HoLK4LLOdMftYWZTlabccM+B55MD3lw
         w3AXCzBWejTyw0MJsJ2MUBfm1RztaveFBLF+vj5+eqweCbYqK0Eti7LbUyRqinQ5OOhT
         6rW5qpNfLSLfShFgL+yr3RtB3n0uBbaoWqW98YoCbGwdHornlrJQzParFj5YGtyCOknn
         tGwXSIS0SNTCTP3vGzsbbhcmms78CtJWtSW5qKaOi9apRStc2qjpKaaBfk0kf1acqDIH
         epvexzOg7emIi1rTM/EWwlBedTeZAAlssaTFtBY2vBoj3syRVemhtGW6vSmagwT6ts4R
         DL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912587; x=1746517387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfxkgSvaAT51IBkaZUI/5ZAk5pQxxcrmYfjfdWPA124=;
        b=RaCyG4+kYHZY6kLIiCfgOgU7dsCxH9T+jZNZS7M1L+btkTKMZRGbEfPbud1DeIjUyq
         Jhlvo2Qju6ftwmzX0EOeyxAljzp+B5k4KI0jfg3UXHEb+U5wO05g80JBYh0vq0EMJj8o
         KeJJFjqgzTCD+cqvJAtgB9OBdbS4qcD/a6kJ2aTrtKzst0gYntPpNDo1tFOQiOZa/vBw
         JXBYv4mZfTqIz4Du+QYSnfOpHAkn7XRwE5jTknGgJ1+uLJnmfLC2UcEoOwlED828kzqz
         RF32yodair3MFuIpFQIveGsZaNOH3iydRJVK6V4fwyVHZcVAKjWxZBXgPi1xY/xZz+41
         jtDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNCXWKWFCbUImaEl2xWW5/ESsmOJultdqufzSj1y/CLOBShzZcyeqmdqfIdyHB+CHZOojsL1naQb8802M8@vger.kernel.org
X-Gm-Message-State: AOJu0YwiXv52KydjoCztqxxeSIR4FfwNFW5TumJfSwn6bDryawaEOhQy
	uUBaVgb70gHQyOJMIPgNI1XjFeGEnca7/HgoWfpaw3MC6dy0WBXPsIgq/Fq22gE=
X-Gm-Gg: ASbGncsKgCweiaUWeXA7NwlVq7v524ok9tcAKd5ONQc+EDsqdUB7uxZMUVa0mY+nTMK
	gmD7Uua4ERa+HV4T2jOSvZhAfHb7yhTjgxuTSLWrnUX21xvNjreHGMOOE5u5gLFsVTHW6DZEGxZ
	0JncKfD/iHG7QIFJtgcUGc+M5mXNuCsCNMKWqFyNBjHszxkCdzeNmXN8Qu0NfBI9+jIFmrd+3Bi
	u94EDyzspsoWvjfVyjuuNLQdMnhl97oXacTtxVuOaO99lGDKW3AxhcW1f9Eo404SFt5U30fnlnT
	9jFHqciCDezjhkezC5uTDlMt4PVvIxDd3+vU2Tg=
X-Google-Smtp-Source: AGHT+IETQTKdMbWbEhocs8zhIYnOS5GPRZMByDHQ6dHQPj5ZNHD9M6SccSvAvYq4Bi2rt9TJvrY74Q==
X-Received: by 2002:a05:6402:3513:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5f83884a96cmr2031776a12.9.1745912586387;
        Tue, 29 Apr 2025 00:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:31 +0300
Subject: [PATCH 3/7] arm64: dts: qcom: x1e80100-t14s: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-3-058847814d70@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=CTwTt1G+dlV2uvVXAeYFRL3LN+3HEcJBUhzYf+1LquM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIL4UVDHlaTAMeYepFtAaY5PQdOyWQkJ/t5uT
 HQaOCSt8ACJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC+AAKCRAbX0TJAJUV
 VoXAEAC6+HQSjAj0dv5UAgsGEPiBq3tYKRfy53LWqfo1n4lsoegFLRhEgF4wigTwDq2q/za1VIM
 4Pym/rDcfe/oW5qc4lcw7hcyxsRWprNX95/M51unYy4Gg5lqu68rRNCKdJwLHfwIfHm0etUFp9Z
 dYxSGDoRTyiO6SqhqpEVze6PWbSqvHBeWxTTx+zlo7J5FBG5tqi8soqbzVZWtk4CSzbOI4pKWgp
 7RPlxNAKdwaKGKbfA/SU+v74rHlZKdKGgTcjk5izxCyA8EQNzTmmYZ/NpCbPO8jE1CD5xvMYuT4
 rMEshvSr4Sd6gfP0Rf6agg329GUp/GEllHFUcqDq8c4f8qRYWkuwkyo7XxDsJAr3YoReMonLU6G
 hst3WDWBiAy0NlmvWbERan1n5o2YWmTs/whRb1CAkrMd7EMvPLE+x7jwhUP8yn9fPCcxlYQk0d1
 MM3K36S6o19tXV91BpNRhUZiE5aWmrmM8ttJAa2LnNdng/+pskD33Q8FlTggmCY0tTQYBZJqh2b
 29+F/iNBTSAPaNmcTmYjpsBQDEeHYXHWYadNF98LhRerBrsaJSu+PX6xk+5JIoJW4fETjE4s85q
 EaaT67mV1nJHf2IHgnh1NFcNe1MZCZAr4OIp9qWPai0/593S9jDiogOtYQXkZ52TdS+evAwG214
 XSc4cYxi9ZwDtgA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Back when display support was added initially to CRD, and we used to have
two separate compatibles for eDP and DP, it was supposed to override the
DP compatible with the eDP one in the board specific devicetree. Since
then, the DP driver has been reworked to figure out the eDP/DP at runtime
while only DP compatible remained in the end.

This override was copied over from CRD which was the first X Elite
platform upstream to have display support.

Even though the override does nothing basically, drop it to avoid
further confusion.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..88cbf2a8186188acbc29baed13169fb940f83c73 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -972,7 +972,6 @@ &mdss_dp1_out {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1



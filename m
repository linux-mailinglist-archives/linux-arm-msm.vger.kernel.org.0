Return-Path: <linux-arm-msm+bounces-15982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268FB894618
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 22:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD312818C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 20:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C45D58210;
	Mon,  1 Apr 2024 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJFdxoSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029756B8E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712003633; cv=none; b=N4HPGLHurgX2poA4UXa3MYE8R+s/TRSS7dbdGcf5RoioH3XxyQd+3fnMKzZlMg5q7HeZDUmY/Dx1cjmfQfW8IMhVJHsPCL75fEZl0pYqyWKd4S0tVSDXQuXLwRscJbDhHT0DM/e7S7ICQvD/Wv+3fzofiGJ3r9I5k4Hy8gE1kK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712003633; c=relaxed/simple;
	bh=+m4KcknPtPtiYtZonTjzGx6OYYK5R2lRlFqksVKoy6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtZtGCwy9/mIxxyrdjP1kg37kTIbbKnp+v7AoJaQuPSb09elZcTdLB72uWDo431PqmdGUFZXUXASqOV2dh823rbYEmBVgMcDBKssfa0ZeTBEshHAF2qB9tlwARrb4mNqYplnHcbUgC6B9OoKI6ahUaFBDeeJfRKy2Z8lHY56bLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJFdxoSl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-515d515e28dso1964698e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 13:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712003629; x=1712608429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA39XfS6kFKT4ejZVfv3YPVU/6vd+JV/fWoR8cy3Hug=;
        b=lJFdxoSlm/M0aZoVMaULjVN3txSdpIH/3YcqThTKXHk9sUVS1uin2sD0+HbLJcBZEH
         PLBQXPzZaQJ7JCWvsrJTlIErjfaOzxcPNEQDuHYleqQt0S3JdG7yMiGNDNU2mqCHrWxg
         ptvnOxGH8ifGYsnnzL0yrssZdOyQbtHaDVc4wPsF02BGlPZR6dSjqmCC2++RtcXe00vv
         g+l+45ZnBjdDT5kbv/NFGr1QHa3Um4OuRxNj0gtboyKnLFVjZ8fy4lRKHd0lPrFDWBVW
         1/cX2EUIuLyuVCMQh0lPRljrF0Dt5VnwJLl/GupH4uyvLtJkx5sjyOlES32Z6Z/Ldn5i
         aAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712003629; x=1712608429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA39XfS6kFKT4ejZVfv3YPVU/6vd+JV/fWoR8cy3Hug=;
        b=MuJIJHfgP+JuShKE/xj/7RUONLV77/Nj/RgBTerqAV1Z0WvqY4NBGZw2VUlpeOoX0h
         p+xvmmXVG1EpwjR+IbDwOjAihlDVjfvOybMJqdblFJeZiuHv9jI/UsErO2iUejwHrj5a
         Tsz30OkRdHbZyxwgv4ldT502zIrs4969WdjxdW4IFg97bB1aNR46/UQ4fhqKjif/evzx
         aSp3NL40vbGUpIBqeSgzmnwrbkKThyLBZe5ob/QnPy8HGrLB9IMB6Mfe1RB5d/r0Gy85
         GoDuruhlAuRAk4SqjZMTt6XDsBR8Gd+6ELlst9e9ZM9ilnychxcepsP8fcbQIfmhw0il
         +NLw==
X-Gm-Message-State: AOJu0Yzn4zcnDLesQQabZOu/n0r3GHZBqoR3FTduv5rnz15ySRHtBGw8
	WTBSw8w/pZKENfMGPQErnirXxsFl9Xj8w2njEOiOsnvuE/Fa6RsJ38cxhyaMNTU=
X-Google-Smtp-Source: AGHT+IEX2xucaNOqEi45e6rA7xWiaBbHHqTl57NjxOHbuJYOV2LS1R05RrcHUWwFbQgnVwIACR9hfA==
X-Received: by 2002:a05:6512:3e4:b0:515:ccd8:37c2 with SMTP id n4-20020a05651203e400b00515ccd837c2mr6005739lfq.44.1712003629119;
        Mon, 01 Apr 2024 13:33:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j11-20020ac2550b000000b00515a6e4bdbdsm1478342lfk.250.2024.04.01.13.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 13:33:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 23:33:48 +0300
Subject: [PATCH v3 9/9] arm64: dts: qcom: sm8150-hdk: rename Type-C HS
 endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-typec-fix-sm8250-v3-9-604dce3ad103@linaro.org>
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
In-Reply-To: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+m4KcknPtPtiYtZonTjzGx6OYYK5R2lRlFqksVKoy6E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCxomu5aU5NG+Z/64wI5iPLxDf2d2pJXxtC/9V
 Rx789XMZ+WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgsaJgAKCRCLPIo+Aiko
 1W9oB/4wBdn4/QHKK+hmLb6lInouPt5uF6PHRC0lKI3zIsxUg16wXXI51U/eaV/RNDk9pdHaLT2
 cOAt0rJnUmgWfnPWEay58qAIQvzAsCrrcWzaa1nxo1b6l77uZiPOS2Q2WjUe/Bodju8/nO/lOAK
 Bp4IJsH/hI5PJxhM3OrE/3Vb843jIurkukowYDFHkLW3optfQyWNSA4K6q0dTvOpwEGR1unUtQ9
 qkVDpDGcLTwEnhwmEKJqzYecFpVqA6h3i1bC+UQHJngXJkCEAN3y1yrbidup8fJybfWBIBRZaMw
 KoPnzwMlDq2mGU0o7eeJqeF2tCOieBcQVC0svm+3y/5XIszQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow other Qualcomm platforms and rename pm8150b_role_switch_in to
pm8150_hs_in. Corresponding port is described as HS port rather than
role switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index de670b407ef1..857ccc5de085 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -556,7 +556,7 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				pm8150b_role_switch_in: endpoint {
+				pm8150b_hs_in: endpoint {
 					remote-endpoint = <&usb_1_dwc3_hs>;
 				};
 			};
@@ -703,7 +703,7 @@ &usb_1_dwc3 {
 };
 
 &usb_1_dwc3_hs {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &usb_1_dwc3_ss {

-- 
2.39.2



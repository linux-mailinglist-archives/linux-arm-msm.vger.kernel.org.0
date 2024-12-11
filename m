Return-Path: <linux-arm-msm+bounces-41419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA8E9EC670
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6D12828FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C641CBE8C;
	Wed, 11 Dec 2024 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNmY+z6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A21D6DB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904206; cv=none; b=J94L4OXRX7vujLctXXdaeehmkIy/CEUI9aa3aGXdifJ5aT5I1F1VF0836hoiee0LJRQZ6dvXiM0ONIsqtfIkFR8Sf5ylfsDkE2SeW4USltZlyYhgDYI1V5WmbBrq9h09fr1uwOPOnIqTc5O++FicZt9039xOimSc4eXUu7uI1ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904206; c=relaxed/simple;
	bh=MjE+gCPtd3g9S1tORrv2JHiLOE0a8BYC25RRtAjy814=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y77q80RVxRM/rFjeL00A1ymhEosIUehbl0K0snSc+1EptztCibBvrOygB4/xSMSp/eNcVJx/jSDUydNrfkY4CAuDajWkVnhG/1Qo631+VajT3CftpIVDD+Z9yb4C0ev8MGeun7W4Qq1FkZBBWimzkCuBFauxWunKgzM8W9KMvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNmY+z6H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434ab114753so42454835e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733904203; x=1734509003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDLpHZqYoth1wOxgJJwZS3j1+oo/RlvEJVFdtpMBXi4=;
        b=sNmY+z6HeT4QesELUN2UvMaXAQ4crCNh2CXJqMTtvpQrDqSMz7YnDv0aDS0Rsx+LkM
         I3qTjPBfIDRFvtJG/Ikl7KcBLJuKY/V8ig6hyEYLv5+abPiXDaTxWCXvjJvjP0I2dmsL
         ebkARQZU7v2ymgZrniajsU2bDIQ/THeJp2kXwsqT8F1Ru9D1MQ6MLr5HLbJrPnCYR0qf
         g0tCaM/Fin/99G9NAkikY2vtvmxxIdRPpycRfQ0aqsW9iiFTONUg0KpO7gMkbwqC2/EB
         IEDTxuXzbZ8LYTXxBzhUMBxPu1AFyuVd2SVMJC+5iaicKeP6V1gK88A/H0iQ7hW5rV5C
         ymNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904203; x=1734509003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDLpHZqYoth1wOxgJJwZS3j1+oo/RlvEJVFdtpMBXi4=;
        b=R8Rv0F/uz2paF4PWAfTZu7Seks4ZbM3QZrBRYH5iZFbjSEEfw10oDyLzErE+vAjM3a
         7s9EwHjKFDvqNIRQQrl+dJxAZsHtGPHL5+p0O3GrVL0vYl+dmW4zGcGCQBw9lA6IMxWI
         SU/VLzf/7qx9B7pki4uIUECXo4u2gj/eE1ioV/nmOU8Xf5J0i06m/ilZKvvL1TIEignB
         qPrIKyb6s4ohghtdN556gwqxN+WuLKkK1aLsU+MefEE0LJ6+ZIUO3HOCgbZ7qTnmRmuk
         174t+sr6TbiuonMWxd6pK9aIkhjUZsxLc2qrZCTcVgm/oofnRJoidgE4MtRIVYHjlcxx
         bQew==
X-Gm-Message-State: AOJu0YzWSq9fc6Wr4CVk0gIw1MWC1TZo7ZHWaeEjNTpiLtB16pBKo1Oy
	/U0KuAzMeULxqlIqTRoGE9ALcVQsQdTnHdU9TYyPQqvWRJCGVVYyR1qtO/lGAE0=
X-Gm-Gg: ASbGncuvqXdQR6ah+SLD3BKmd/SCZfQFRRSG4FNI2BatqUhbR8XTx4b4PXwZgE17NWK
	LqHY9TIMA2VEhsJaRqeC0d8Zvu6xbA3v/yUelETn0d8MgauVkC1zv0VPXgdSAC8G7zURe6r08qB
	edCRt35CBQlF94cCioK5rAZEUR4KNJUnle9YfFko4SG2x9j6cCi0D/aL7G8B8EDoUaeoBbQe+Pv
	ITuy6mXRYu6dk8nUFR6uoS4zoyb9DMKwhOsx0NLVENNg37eNDEf3tTpbJGpsaMlwE726wQAf8Y=
X-Google-Smtp-Source: AGHT+IHMX9b26V39pIn8+UNC9rmWDLmkYADSjVq/tbVMrYC09QU2FzrgKGswQwCW12k3jYanhUCrwg==
X-Received: by 2002:a05:600c:4450:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-4361c3e1cfcmr10245555e9.20.1733904203396;
        Wed, 11 Dec 2024 00:03:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361b09fec0sm24205795e9.4.2024.12.11.00.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:03:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:03:12 +0100
Subject: [PATCH v3 4/6] arm64: dts: qcom: sc7180-trogdor-pompom: rename
 5v-choke thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-misc-dt-fixes-v3-4-010ac10529b1@linaro.org>
References: <20241211-topic-misc-dt-fixes-v3-0-010ac10529b1@linaro.org>
In-Reply-To: <20241211-topic-misc-dt-fixes-v3-0-010ac10529b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MjE+gCPtd3g9S1tORrv2JHiLOE0a8BYC25RRtAjy814=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWUdD3UC9CZtgoGQTC2/tEks5rLX1+Dt0swd2ZyU0
 jFYiYQSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lHQwAKCRB33NvayMhJ0VzMEA
 CprxmAVyahbKdnAtoKh2MzF1apys+BMFORDIn9lO58Y7qkNmj3ck/GZziIxCZTDtwx+r/BcKIUrgef
 c1G9q94neAbPy1C6tWh2E5y2PH+S1p3HUutabSvq9X4MnCK5SvjhIdhuZKsMjAYhs1VVil8qIi5nTj
 9B256KuKePMI/zzmcAOj+64tw+D5YhonqxGuXU3RS9yljZicXKMWay+DmPTDFOfJv2Q7nNClkUk6mE
 phggazlAzozuoYYzkcjjfT/QsJuQsraAiB98aMKle1whs1DcsYGztwey7wzOZEnF7KMATSeyeiophf
 QQKLyEaKKEy+LzTcUjie+oiJlVXF8tTjjyfQ0l5R4VomVVEVvHp66hwB4CbPvbdYjYuOiJ8sv2CbYF
 2rmg/EPtOwdJRbCpVl+l8piqHsug+fvJ9/r/HXU5fhpyOzcjeZ1S8tuC1B2b4V3t6sLXYRy/mVK/rY
 ngOeOvtzwPOo7q/cdQbstfUwRHzOeYoyj0uboC6pELVw0Q4Z7dQDamNimafQ/v9e4DSjR0j4tAnA/V
 GEenCEaFSB/YfVQ4xl1TM+kRlesCNSky3whKgtJjMrlxlniV1vWt48G/pJKNICVwIsYdozOrx7gCvz
 Vc5txMlSYUFogtmP6dJZBwm1un7cUedu0XxvbkvPHx6zlkiQwbb5ghcI0r/g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Rename the 5v-choke thermal zone to satisfy the bindings.

This fixes:
sc7180-trogdor-pompom-r2-lte.dts: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index ac8d4589e3fb74b9d9105a8ca2b0cce72de22d86..f7300ffbb4519a7973c74198fc0f9ca2d770bc3e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -12,11 +12,11 @@
 
 / {
 	thermal-zones {
-		5v-choke-thermal {
+		choke-5v-thermal {
 			thermal-sensors = <&pm6150_adc_tm 1>;
 
 			trips {
-				5v-choke-crit {
+				choke-5v-crit {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";

-- 
2.34.1



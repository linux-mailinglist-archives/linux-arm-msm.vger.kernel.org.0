Return-Path: <linux-arm-msm+bounces-40766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C719E6B74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA19F282230
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2401DC182;
	Fri,  6 Dec 2024 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnuXRKXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5D91FC0F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479987; cv=none; b=ThD5Qy/lcb4WCQx65rsjgIfYGzpJSW1A3tTQ41tT+NepXXKa0DKhyhFGVl3lJuTfIedg6glonLo1ri0Rs41wutjleGegpJ65wRyu5IVjhrw16lCYnfjcX7gV3VRfXMbA3YY3jHnQckkU2bHC5uQItPw4jePRkRYY2yUsDzJs6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479987; c=relaxed/simple;
	bh=MjE+gCPtd3g9S1tORrv2JHiLOE0a8BYC25RRtAjy814=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUjkbmh5WtBl4NUWKx9vFtAZlWsP7YP02om4VIY/X85k13r9Gh/WoNaam7sUAKghhJiVXihjnQEdm4Y0KTb1EsmlwvVgeTGBHFtIH3+yE45mYruoWtGGOJelJRT4Cmqyj6NESxFVuN5mWu3AeCsAdcPb15wxpuf8a4359+gMsOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnuXRKXH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434aa472617so13124035e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479983; x=1734084783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDLpHZqYoth1wOxgJJwZS3j1+oo/RlvEJVFdtpMBXi4=;
        b=TnuXRKXH7cl61SFeMH1YDx0Z1I9/ERbg4zbP+vQ2nnHGMZirgLDthq+IMVt7VJVs+q
         xDZBm57kNk+DCp+cfHGJwRM5oKXwzguZHL6JZS/bQhKaTEu3SwyRAMNXCmb/wgEwduFs
         A7RL6ygLNIaUc2MWsNJcQK8MKQou4x/M/OuU1q4iu5udlC18t9lqK8fgSeprgD43NhJA
         c4FlbVGo16Btp3tIXDpAPDKRh/eaUaRZlRyccS0wdpqW+qMR9S6tvN+04ASYZHhmz8E/
         f5OGCGONrVG/RfKDcy8CnKW+o9OnzpQ69TPbNuZbwo0MOCU1aueGSjXLbOxwikfmwMwk
         iouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479983; x=1734084783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDLpHZqYoth1wOxgJJwZS3j1+oo/RlvEJVFdtpMBXi4=;
        b=kXGOaExCjV4o8/WuUSL8h/3P4V0QYCfPDIEU/rsi7Qh9H/hWfl0fYyo2G2uTjkm+8H
         AsAi5kIKv3msIYUCZIRSy1k4Rth/vmFL9YaVRad76sFrJrDYlKz/Ygk+1JlVu5Sj7zd2
         iHudgWQr0fciX1+A6LulsT6KZpwsdtfXpnEGvQzalXz/T6c/c27IoARv4lXYepceNhZI
         s9JQbLeumFAVrEqtc1KW3M3xLwmMBem/kcI5qLtY+6c5CWEipysx8g3eq/VtUR6hvoJ2
         LJ9nFswMr4Gdt8fd3RTlXb8RNnaSQiTijOomovbP61HyT4lKdra9aul8NDp+eh5CboL2
         95Mw==
X-Gm-Message-State: AOJu0YzcML1j/TuCisn2gCNNB3FSrDZA/o6FPtMjq1UocqetEW5aVW0k
	XRBg0IwdoG8qXLwI436j8G70bmiMHV6oa+nvayqyNFvNEC0nsGDmgrYYxsjflCc=
X-Gm-Gg: ASbGnctHP1FygpV9dEveUalQKr1QF5gu1eNoACUe+Zw7KI2HTQU1FInpY0U7hmEPWwN
	/wJAUpPlqoF6tBv78i/4O4UCVvMpaWOnHbiVooNXfLH2BwjI5rh1ykF/T0mMHgorY5pXsD5RZVE
	LGyvrE4LQyTSVl2tacFxhGrs7OfBgnQAP2gni2KoajdcQQsH49ET15yDO7nReg70scVdfvRs1db
	V7fghmIf+G8QzKCmSQdQmqcMg9evJTj/S94mgOwvS7z9mgjgTrTEKiiXYFsEULeJep1TZo=
X-Google-Smtp-Source: AGHT+IGCfKuOaVTIijKryJYKTf/RmYyi/S/0Nt5QeqV6p2QJliwt4OGGy9KjgaTfp2NdEr3vTSYJlw==
X-Received: by 2002:a05:600c:444d:b0:434:b9c6:68f7 with SMTP id 5b1f17b1804b1-434dded6c9emr17394495e9.26.1733479983349;
        Fri, 06 Dec 2024 02:13:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm91092035e9.32.2024.12.06.02.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:13:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Dec 2024 11:12:56 +0100
Subject: [PATCH v2 4/6] arm64: dts: qcom: sc7180-trogdor-pompom: rename
 5v-choke thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-topic-misc-dt-fixes-v2-4-fb6b9cadc47f@linaro.org>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MjE+gCPtd3g9S1tORrv2JHiLOE0a8BYC25RRtAjy814=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUs4pGUyX1SMfL4lYmw4sJF0C08X1KpLXh3RU7bK+
 YWn7lfGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1LOKQAKCRB33NvayMhJ0cwsEA
 CcG3rjO7fbYHW8gyezURww1psrJnGYDzvTn9U6PAtvfiiBqzb9uFT9JrNFSWSbY6h71TVofomiXRAA
 uCj36fgZoqlNti9Tl9Qk/1DyweCHqfQpyAl70u813UWyqj2ls5KIy+XifiwJLgNmmCMDsvNFH6Zcnz
 a21fOaUrzZph5oN2Lyu0BEqNVVm0v+G+mayMyaobN8cVuv/fHi5GKC6RVMYPBgGaa8vaLxXvtW+sVO
 yy2OvLC0PuPdJ1afsgHfVQUcHoVsp8UfYNIi11SMHIKI+XH4quUdXmLrmI5NfQZv9GQH/dPFacvit4
 iwHBkIZQR/pSsyKrvL6Vx+rKMXqkiEg6e/TUJ3QyL71oaTa+ACVy6warFSta4fr7DyXLbqX9hb39t7
 SNJL+VthhL8AANKfVyk6zY+uF4w/QAiNk3wFQ43IUq6TTjZ07GI81yyyTVFPo+TCq3M8ltGbt8zwli
 1eGl21sCzYThHfwlNMtkwwRkJyZlrMlS2UHzUq6JnoTEoMUOnTnB6cP3/SkNF8ev6GTw6B/Sb4u3Po
 PCvibfk4Ns1Aog037iMjcZGcCsdX0QUUpej5MEcaSVDA3OKdEod/KPTqXbgqVXa7DDy0V7tyfsNi9Z
 4jBKadYQnUOdCi4oVHC6NWXkcO0ugKcAlffAQWKIJ9N8sYbITpQeN/RWwndg==
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



Return-Path: <linux-arm-msm+bounces-37537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048199C4CD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABC7A1F21CF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 02:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D3F208222;
	Tue, 12 Nov 2024 02:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOp5U5/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E0205125
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 02:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379997; cv=none; b=WW+Z8UUQLAkL5s4POGk5zpznRe19IybeSMg9hjoLmdgxrJhUvseHJToBYIl7PHTN6FYS10iHFfN88etXfllNO9qb8HXDORPjjVsSfYVsseH2i5glgnXpHRnLrp7fbdwHuLyBCw7uBFZvWhB6mKh+5NRhdzwFi05LooXXHp5d3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379997; c=relaxed/simple;
	bh=ucgy9cTopg4E0lG1/WUWNQk0L/jEkoP91XiRceUS+fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8CFY2ed9bPaZZarywquCh7u6myHKY8zXzEFYBjlG6Sk9gseGk++qK6RIzuoooc+4bk9T2pRAF/Kmm6INOlayWKKPcch+33VlIEtpGUujHXrWh0RUqJceW1FPWtb/7CztSpmmmbeFbU2FKVAdBA2tTBhVHzcABzACCa7AyxUMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOp5U5/f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so45479715e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 18:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379993; x=1731984793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUmkRrbbbyk9xLx54NwTCapKIUbE/O+g3oU2muHUiIc=;
        b=gOp5U5/f4RbKfVW2JEv9bPATv0in9hqoVo24bRUCJ2UZX/FtW6FpfNjXsRn9Vvsuyp
         GbLr05sU9YTSpFrFpg8Jj8ojcnuiy/Ufxu3EDevUNbYi5zYcVIK9JatWz5Mg1K8y52gX
         2tHfwWNuSZTMh1BfGg5Ui6SCl2DyCgFpXTjK65PK/W9airTHxpDUJPxon9AvYstKsbX3
         f14BGCVZBvNzD4u3Fsd1o8C4lSJ/gx7O1F6Mb7hshYhi/MIWqORUCP96KJbbLOwWbOa3
         Nwihdtlb0KPJCQIjmIleBjfifmepqHgOqUWC8KJyM+qqsS79HAwAOzK5jRj1nWElzgjE
         /oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379993; x=1731984793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUmkRrbbbyk9xLx54NwTCapKIUbE/O+g3oU2muHUiIc=;
        b=wk5ig0n9o+MFcVAIEWA/Hr+ajSosWZXsKnk6QTARDRri/Nm99sA2cMRJwnH4grf06T
         zGdkJQQL1q8Wd078XGBnFKl2QBDfGx8wYgfCSI7H8PzJr0GWqVUrR2aZcRoecusrLswJ
         PkjWf03nkzuxJCrhtwhLtkzhHpS+nACXN/kRSLfpOcJYgsMexbQunFwcDENX5zkgr0VI
         wMx4cCm0WJ+mEm2vx4AMhfjFIilLUlCTv3bR3cvZX0Z7Ws9gchVA8Ksijf1OgglUUbpt
         MCeCtovaOKdFY8SNxRX/qOksWkD/UZB5e3cTXJU0OUiOLpjOLkNnqvB8YibezhMO82b/
         wsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVhyhZjtqG0M/On9rAKwpgaWwqncvRtawa57S15x4d5QNKd/2v+CSe8S+KurZJhxUhKx/PGkgo50NyPpo9p@vger.kernel.org
X-Gm-Message-State: AOJu0YwmjxFtZTszk3xqZxShe45P6T9D0ApLhfgT58OYYj87iyELqPXg
	+LpAyDpX2tejufbkVCXiwFTVIQsfNW+4zNPgu6CRboTA1eaiDoLH7XL5Bt8liPE=
X-Google-Smtp-Source: AGHT+IEwJoxeWcs+JgTBSm7RguLuVxJryodvRLUUZ779A7RyAXR4KAjN/Qdedun538HHJYqULBojOw==
X-Received: by 2002:a5d:5f52:0:b0:374:ca16:e09b with SMTP id ffacd0b85a97d-381f1863404mr12322257f8f.9.1731379992780;
        Mon, 11 Nov 2024 18:53:12 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:11 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Tue, 12 Nov 2024 02:53:04 +0000
Message-ID: <20241112025306.712122-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 816b8331933d..df2241237b26 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -810,6 +811,20 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6115";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
-- 
2.45.2



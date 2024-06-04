Return-Path: <linux-arm-msm+bounces-21676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 495958FBE31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F8AC284CF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 21:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6633914D2A2;
	Tue,  4 Jun 2024 21:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GbijcIrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E317214C5A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 21:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717537360; cv=none; b=C7Vz2xQ1kCADk/TzjsTK8szWGBS2/Dp+5o/uyw9UQh+r2qU35c4AyeIx4krCru/1lfCM+Tjpm0b7w68yM+3eAee0P38x867W4NdMaadiO1+t2wlcY+ornJM0l6TpawGvACCJQR0uCiOOHRd47jfc6sb58Xfnv/vz54et126qOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717537360; c=relaxed/simple;
	bh=DR4noGTvQJfxqZgaRPYStAP3sxtorZHW3MerXwYFYK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQ2rBFYJtKxDqwXwrDGIIKqJAvuymYvuQHKZHZ+ZvCzpY8VscZ4iUkHb3NCnMkPiTX0FlS3DIIaj9HrQDI0cSZ9+XSA6rgCAknwBjAzfxavWMcHFNRgIScdb8ZH09h9Dr4Yq9AdCz9+1b1a/f3U478Q2bVXplIH9bVBw1AbHA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GbijcIrX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f64ecb1766so13900985ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 14:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717537358; x=1718142158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYm2Ihcymc0GYYvAeFdOt61hcsgG8S3It6RMdtYbi9k=;
        b=GbijcIrXMRHO0d/7I+IjGT8Cj+XG/7mYMDHgInqqYXbroH08fHVwhCxZh5vaQsJFTJ
         FcJfSJrX6Q1SEfUC7upYnBMeDIxMyfGtbLBx0dCxIsMSybRRj//dE36yv1AvwfJCQ7fi
         WSpykp60ocoOBcyRX7zBwFEQnhItQctlw3wkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717537358; x=1718142158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYm2Ihcymc0GYYvAeFdOt61hcsgG8S3It6RMdtYbi9k=;
        b=XH9m749K0Ri/FelctIvKbgi9DJVigoHWSoMUbU6mlckj/jwV3zicX8jSjErqhE1Va/
         QZYAEDDxW6zkqDdO+H67a32G5jS/zMUZ8birCeQc47xX0nDFK+2Y4imgm2imEWmHSuDP
         cePIzOrq9djtYbmGUfbqtSbiulywTN1jrfjGTMirrS1OFN2KMrb22IxfRXw0MH/WMq5m
         MN7f3s/+OiTeYrywUo3IgnfZlDqZ7Skked7Uwq21m964bwUQTWJLwCam+JBkKs4m0eHo
         0Ft3ycVdRG5bFXzG4+UqD8OfWVna6WlGIUsKmeEqNUQQosumINRAx3Q45pbZkHW6lbr/
         SgBA==
X-Forwarded-Encrypted: i=1; AJvYcCWV6eS5HNNY2WOOiexkuKKDfQfjHLhucAupb0labGSrEK9XiBwruwIJX6byeLMSFUgCj4l2suMSlVFIxzXUXov8J2htXVhJ+kzqRocKbg==
X-Gm-Message-State: AOJu0YwMTEOWGp7+/dp1AoiKypRhH1qE+r03+k7YnyxMb5kFbqRDhKZ9
	sWCxDhb8aJ+rZWBX9ecCkyz8IKWsxa3ygCzQoaslbMGe2CHh1hiZw8tplVlW+A==
X-Google-Smtp-Source: AGHT+IFhf8nAUYL+FNdvnpqa7A/O+7CUJFcajK2GH8sYTtYnOeRE9RYY6Tu3RIZW/OiV5NO7hyrY8Q==
X-Received: by 2002:a17:902:e543:b0:1f6:5551:9e6c with SMTP id d9443c01a7336-1f6a5a6b42amr9616895ad.54.1717537358165;
        Tue, 04 Jun 2024 14:42:38 -0700 (PDT)
Received: from localhost (132.197.125.34.bc.googleusercontent.com. [34.125.197.132])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1f66c412fd2sm51747355ad.283.2024.06.04.14.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 14:42:37 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sc7180: pazquel: Add missing comment header
Date: Tue,  4 Jun 2024 14:42:31 -0700
Message-ID: <20240604214233.3551692-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240604214233.3551692-1-swboyd@chromium.org>
References: <20240604214233.3551692-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We put a header before modifying pinctrl nodes defined in
sc7180-trogdor.dtsi in every other file. Add one here so we know that
this section is for pinctrl modifications.

Cc: <cros-qcom-dts-watchers@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
index 8823edbb4d6e..73aa75621721 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
@@ -83,6 +83,8 @@ &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
 
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
 &en_pp3300_dx_edp {
 	pins = "gpio67";
 };
-- 
https://chromeos.dev



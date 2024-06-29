Return-Path: <linux-arm-msm+bounces-24705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6791CB6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 08:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0331C21577
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 06:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D6636AEC;
	Sat, 29 Jun 2024 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="In5JEN0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B21DDF4
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719642595; cv=none; b=haYkhyy4/4hMQHTolqf5mS0EESiY+JVtk3F+GE3CZrNiq/YKXUxFy0OLKQkRImWzfamPmnvDXZk8T+tLp6XOgXCZgN6rTsnqF5+HOyj36dBHDwoicJIW4UHcLeP+O5fHS8svXLfFO4DSQyx5x4aopKcM+e/3q77WLrJ24fzKY10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719642595; c=relaxed/simple;
	bh=qVSatF3fa9MkMeQ3gB1PaG2l+3HZPziqG43vHCrDzJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ty/D9a0nLU5w/h+GDEQ8789BdyahkOxaH0tr9TrYsxLBFBHemCOOppbv8WoNMg04x2Auzpx90TujXN/ykzkUPrHDltFPn+qMKJNKs9o6PJ8/CW51EJV1G1qwemlLQhx2IUmSw4qpemhymcT1DU7V91hbG8bfZHirCQGdWDqojDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=In5JEN0F; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cd87277d8so1363194e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719642591; x=1720247391; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hsyy1LA6LIrVepifrsEkKn5W6oEJicQM170V6Bq9QfA=;
        b=In5JEN0FyCPluDqI1T1E8tv1nhkhqiQrrack7NTCirBPucEnP/Dj/YC3yOF8hJh/6w
         SvlbZrJmax6AaRnwZpU1uJOebuhfofSJ25PB1d89HF/AcgRnXGWFYXo0MH5jO6f5j2fP
         AuoKe4DYKvoWYcbyV8qjxI3Vg+ACVNs+LsDKBVbxavjzsBIEQk+29Ada6+DmkEeacAvs
         sTTo7XOaySXRYIMa6Gx5cgRKmyI70poXn1ukjJ6yptfe1R4HfQENBRm26Sxgk07n20VF
         WG4X9383QxMOcOQ7fXYd0p1L3kbZu7XSZq/JJxs4GfTxWemgpDrI4LvjzXwXv3Vdm3Nr
         5C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719642591; x=1720247391;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hsyy1LA6LIrVepifrsEkKn5W6oEJicQM170V6Bq9QfA=;
        b=KjpR2pGtBsDckdvJNO/XU1DPoofhu6mv/eZ3UPzJajiEy6Rm17+S8Spo4VvZI5LWnZ
         W3v+3PSi3Cq+hi9bf1Xr1XXHOT+8Juoudjb7vD3OnZRxobOq1x0kMy9bqu9LZzVqUVpM
         C4fh2Ooc1JHwy/OChwju1yPQxWClTBUq2gD0UBm+a356OdYNpGwVG7qsy3mxXbFeEvb4
         Z3mFGT6YptZQ+7QD4q9kB1nnQ+9Dun4aAKYlK1+W7ACmzOcYkDMMW4VOR7GBBclIYKWz
         VYm/iHkBVv9peBeAtQsNH6ScnEEdSv48TvKghfwrK9NhwyewZ4ALXTJzN8wFMnfMWdGH
         LrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGRdhHOX7bflat4e7mGkgOUX6MsmAnvlR8cFB1tXK6f5U9tXqIVA9enh7lrYH/x3U+VZux89pHFHaqU/XyzdtmGZxoNtiEijJ7CpJk8w==
X-Gm-Message-State: AOJu0Yyf5xz2I/astZ9sj1DgwrSFIgBv98VujX7fhrvwsf7WOpG5WFOq
	ugaQKa/uqEnjq9qIuzQTsns43Hrt6U8ZT670OcmfEvOIAug9OSJl4QXcollWNxc=
X-Google-Smtp-Source: AGHT+IHooQKCbP/b97Bq9RLGi5OHbbAbfZp26rES67jE6SIAUe/bBsj6zBC0D++YVDN4bzfoyvRQPQ==
X-Received: by 2002:ac2:55ad:0:b0:52c:d88a:8981 with SMTP id 2adb3069b0e04-52e82692a09mr250731e87.34.1719642590917;
        Fri, 28 Jun 2024 23:29:50 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd707sm4126022f8f.1.2024.06.28.23.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 23:29:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sat, 29 Jun 2024 09:29:43 +0300
Subject: [PATCH] arm64: dts: qcom: x1e80100: Fix USB HS PHY 0.8V supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-x1e80100-dts-fix-hsphy-0-8v-supplies-v1-1-de99ee030b27@linaro.org>
X-B4-Tracking: v=1; b=H4sIANepf2YC/x2NQQqDQAwAvyI5N5CsIlu/Ij2Im3YDxS6bVhTx7
 4YeB4aZA0yqisHQHFBlVdPP4sC3BuY8LS9BTc4QKHTUhztuLJGYCNPX8KkbZit5R8K4ov1KeXs
 NuQ1TFyW1fWTwVKni6n8zPs7zAguaM6B2AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=qVSatF3fa9MkMeQ3gB1PaG2l+3HZPziqG43vHCrDzJI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmf6nZJPrMX+gKb+sKC4JmpFlMHS0912XysN55L
 WGKvVQpMmSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZn+p2QAKCRAbX0TJAJUV
 Vv1ZD/9uSz3BZHyyvp+SmFZ8rlEbB/pNkLN4KCeOzZhI4738Y+5b+iyj7w4J1pFYQUPAZjfIFWn
 RFqA1qrghbm+beNAZsuHthK1PFTcX9Q0ri0C7gFvQD5n9umOltblfDBTVjXETVroPy94GNBrPn3
 T0mGXO3aXHQOiIB03xB9el1Q8mIuEecasJaUnWmzLZWwXYrVG/Hatdj9FehK1RfoZXOZoPq6RWO
 LnmVKzdGKaHFARcL6TDcTAe/bXOp+a9eXuOLBg9ktPNka0VbDo8JxI2Z4tyWAtkCu9jgXrtcDm3
 aL4gSGWNU+cQXP+L19X/g6ob9HuWoWtFnf7mUXWx9Rga2V9gaYjM7758lrHZNJx+ipP7JPejKr4
 5DdK9J1DJ3L/XNNZa+cbYsZZ14wSkmkf1mHpRivJoePyDIta4xy0WxAu88VLjj3Yj3oeJ7OfBXw
 Paanvv2ZepeoYmJ/XFmFgugSM6HXSeEFi6GNxi+nybYlnUVhl4wzUHidbzd9h9bU201UwPu2n8z
 jySy20Co0hTVbZnfKf2Op+UkSA0oRd0GkqbB9K36VKBhu1JEPM2LREoNI7qtwsICyoJMkBEfdrs
 Q3PKEQ35eGYV16yKD68BjnPJcLJZXCFM+Y3cT39ur9i0lBK+k4EAf3RZu0WtKfxoiolqR1oymw2
 JIAlMBsY0gPYC4w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to the power grid documentation, the 0.8v HS PHY shared
regulator is actually LDO3 from PM8550ve id J. Fix both CRD and QCP
boards.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index ce80119d798d..6152bcd0bc1f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -990,7 +990,7 @@ &uart21 {
 };
 
 &usb_1_ss0_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
+	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_0_eusb2_repeater>;
@@ -1022,7 +1022,7 @@ &usb_1_ss0_qmpphy_out {
 };
 
 &usb_1_ss1_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
+	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_1_eusb2_repeater>;
@@ -1054,7 +1054,7 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
+	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_2_eusb2_repeater>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index b045b7bac9e0..c1ebcdbc3cf1 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -687,7 +687,7 @@ &uart21 {
 };
 
 &usb_1_ss0_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
+	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_0_eusb2_repeater>;
@@ -719,7 +719,7 @@ &usb_1_ss0_qmpphy_out {
 };
 
 &usb_1_ss1_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
+	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_1_eusb2_repeater>;
@@ -751,7 +751,7 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
+	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_2_eusb2_repeater>;

---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240629-x1e80100-dts-fix-hsphy-0-8v-supplies-132a48ed3681

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



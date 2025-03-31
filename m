Return-Path: <linux-arm-msm+bounces-52898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1836A7706E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDC2B7A4D24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DA021CC52;
	Mon, 31 Mar 2025 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2VY4LXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C248221C19A;
	Mon, 31 Mar 2025 21:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458250; cv=none; b=UhUmp1s7C4u8cFlmF09G99rwSPqXWVgsY+ha9iauDQBCouK1bieQl5nN1dcmXyzwO4wn/5XEOMbSejk9zZwFa3H8aa6fSL3CpekU2CRKmWjYWf+n/lV5eJsTga3AcTNB33cvVf6eB+9LOU56slpXJsccJcfUzP5wQ8mHaeN2gsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458250; c=relaxed/simple;
	bh=lu522QdEXiOwME9Y2F2r/fwOwszd4rJNhCuIpisfwlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cb7yTiFsbm/mjqGPa7J6VrhKlb3fgJWW6TIgdyJBwubt3GXdr5er2tk/eLG4lYJvENMPznFPw8bQNF1qDfU47QgsLLNakjBkcWPBTBO7GYZTvz5+PjgSgEyJbLFSeDj7SLiDI1OxmBpqgWq4bUqGlhIa7KQbzbW5vbgGYuSCCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2VY4LXi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so34481905e9.1;
        Mon, 31 Mar 2025 14:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458246; x=1744063046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTPRb6OvEOYM6ho2eSrd86j2EW/kvPoRyQmClYjf5kU=;
        b=d2VY4LXiswQzsRNq4p5mxfrXb1ejDamQg964YmqgKiGisduMrXFptxphtos4PMiTsi
         OhPV0OWGo3QRobulY4AnKp0O/txCPEVKgVIeK5yXvuKLl95WRDsaBgx+tXrqlkDFWJCi
         9OGBQKVuyZJg2cjQCHwUnAy2IfIbo8xlbDBRa5H9fl0H6F4EB4YmiI16iXlKMBwtxcIG
         mUxgK1OB51jCdNfJF/L2Js42jg7UQAUxb1Fa75l6Fo9sEOPtKcWJ+BC5db8EGfx5t2ak
         On8QsuKWl8gpmIrMd+DtMxv0eHSUOoLy6JX6jC84bgZzsqHWvjdDt2z6cy1xt/whlqLo
         iKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458246; x=1744063046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTPRb6OvEOYM6ho2eSrd86j2EW/kvPoRyQmClYjf5kU=;
        b=Zu0mhZPjeohHx2AP8YsSqJVq4ila6AoF2OZDHhcoDzAbd3qlcDNQTPTOncSOF9n2/c
         1W3EUXoSPg30eGOyLbaYsBooDk1WlsmkBeLH26X5jxLIZ4A2O/M+uUSxb0aLiMLEKNGR
         cm3dsqOBRSWcKZzb8IrxPuIe4/j5FIHOtdjTzmeznxEjsErs37MJTp+J5Kg0y4KyuFuP
         4ACF665tLrXZgnRndtS/mrr4dxlAcrEllN1eL7o5m+NqQ783byXgL0WwgAar3N5qEXnJ
         Kd3z8Jzra+w/8nbdqEgM8XN7jnsrcw+cB7fLEm88W7SKFsZ0IoBUWHJzTCBsaZjdne/V
         b4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUFn/FdbVdter8ZC4bVyQuVhbezlm1e0i21eHPOW/PeRMFsDYego9wEP4LWvZehS+v3v6gFQKoxJtv6@vger.kernel.org, AJvYcCUWfS11/o0Gm4viVrFZmkl8BtyIak3yF6lRjtesmeE9B/vB87O0M7WWcmz2ZWF1cdWzyjPSjRX6rf1KePdr@vger.kernel.org, AJvYcCWwGynzZ+SKIbuZZjUOZjIqZ22YSFGkgZ4tQqDGj9AyjIZ0ea6W2FF1y+xNfN0qFGBCBDcK7usQwsDh@vger.kernel.org, AJvYcCX2C2Eff6O/ASGVaF0uEDqdXR5ljMgvV0+qj/Dgrakld/0yFVIzJAuRjhnkKyCYYFKutVVAtcVJvhPZKb53uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82/LI+dhEVk9ri5kXU3fTt0QzAMeyELJbeIsutNBvNYz8AjMt
	UxJpYYMYIUP7EggOrUPssmhTZSnaHHZa2AJLaNBYaMXK+mNLqy4=
X-Gm-Gg: ASbGncu7lhoSavLN5dPaCtWsg4KGC7P9uGcFhABBQh60n6IdJZ3CBlgO6n+mICEQ2s8
	Y+KEXPXT9keDAtLyiPbcCDQnhEJr2q6YM8hBtaWPmuU0wh2ZsnzGVv8fiDPB9u7n4hYeRTv85a1
	OND50Ns4SZMH2r48EkBnEC4Vfmv1q9vFkFIsLlUINrQJvPGw/6v9D8pCt8yYqLiHN7ynMhlg5kY
	GW3tFM3gGeDbq9TphcX4PHeQYO2iFjUoQiOQP7aoioxtj+oGnAEeVC0TrX/3u+TR8Ee0QT4YfvX
	ktJqcGi2NFcys4YiCrdaf/6019/OtjPmXsZsDxZ2WHHpOYI=
X-Google-Smtp-Source: AGHT+IHo5j722Woc49wtagjtLZQUtxRSbJ+NClFqslbVzeVbWC91gerAkeADmCUQX5RjCbr7L2rL/g==
X-Received: by 2002:a05:600c:470f:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43db628b92fmr85662355e9.20.1743458245852;
        Mon, 31 Mar 2025 14:57:25 -0700 (PDT)
Received: from alex-x1.. ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm182244665e9.0.2025.03.31.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:57:25 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 1/6] arm64: dts: qcom: move pcie6a type change from X1P42100 to X1P42100-crd
Date: Mon, 31 Mar 2025 23:53:35 +0200
Message-ID: <20250331215720.19692-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331215720.19692-1-alex.vinarskis@gmail.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears at least on some devices (Asus Zenbook A14, x1-26-100) change
of pcie6a_phy's compatible breaks the controller. Move compatible change
from generic x1p42100.dtsi to CRD's specific x1p42100-crd.dts instead.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts | 4 ++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index cf07860a63e9..a2a212b31556 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -15,3 +15,7 @@ / {
 	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
 	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
 };
+
+&pcie6a_phy {
+	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 27f479010bc3..4424a8708d39 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -37,10 +37,6 @@ &pcie3 {
 	num-lanes = <4>;
 };
 
-&pcie6a_phy {
-	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
-};
-
 &soc {
 	/* The PCIe3 PHY on X1P42100 uses a different IP block */
 	pcie3_phy: phy@1bd4000 {
-- 
2.45.2



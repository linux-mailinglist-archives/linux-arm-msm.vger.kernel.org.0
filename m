Return-Path: <linux-arm-msm+bounces-26179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E952931561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808751C214C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B25D18E746;
	Mon, 15 Jul 2024 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sgoUCVnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8A18D4CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048957; cv=none; b=GfIYIIkvAqt32gghduLO9uStnBzKbAhwxzhhaLdPwaihzY4ka10O6/3v1nbVxeScpZOECVGoAHoUda2dLChLoRJj/Qhi+dMOqhRjlFaanIBDb75rLO3Ucakgbg0fhZOYqYshgQMGQduduKTmg4cC7an4QoQ+xn8jmmN5nQFaFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048957; c=relaxed/simple;
	bh=Sp4rJOAfwoDg+VFyI4LSIIgR2i72s54RLNQmNjA0en4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY6o+NpsfFBO0t6jYp+puNrAs8ICj3uZ5+09AY5lkMcnFifJGEs/uiwi4KHRoR2Hq2m8t6dDR7IHFj3ivngwoxV7cHOxtN2qQB7EtjQff0Ujh0zjxIwyrIdkCSCuhS8W39IjhltWh2rrJ37Z8gDVLviQBrBQh+Rp/du7TO/P9ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sgoUCVnB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367b0cc6c65so2653546f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721048954; x=1721653754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg1g1741KIeUKYb9m11yGc/6n/X3TYaI+dSIEkjSgkY=;
        b=sgoUCVnBouOoJdqARhSifSnyiTCbGcsuDn1LhIGSMJAES7XCXCg4Nm0qCFaZnLl+u6
         CLG8kJAUJOewvy3pbKOzAuUXP8NMJnjJSBT0sSXaQS9pMYPrpE2Ih+AOXOvjAli4WTSe
         HdslKgq/nsa507GgjqzS/8BKYU/RrfHGEMSnYqyrMFD+vu/6qtozQpZX9fcWuoWakrne
         0ZxXqTwmoWND5A7gY3dPJf+2mJ6/nn1noqJiBJeNk/CKE0sV0bzvos/5+c5vqDc/Ee4y
         k3xeJzxTfM0vkdewNxBaPghGu49QueGQv7hWVgX7fX9tU1Eu46L7vku7+7LWk9XXNyX5
         T3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048954; x=1721653754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cg1g1741KIeUKYb9m11yGc/6n/X3TYaI+dSIEkjSgkY=;
        b=fMFhqN0Uq4dFh5ctlTcwMnyxvUOK/N7MMURtCtWvQ9hPa8NXa2sxjivEORzwWiqWm5
         48+c9Liz5959HmGVen8d9UnlxLLx9AopcBTpLl854tsw6e8Yl4yIeO+QL57Op/aoaa0p
         0ucqnJvk9MnS4XP4x31RjGI7dsS3me8Xkicb2LHAzidVLJIe1CMDBGThSVRJm/pqZTdb
         Eb+kbhf6D1Y7FRN95Iyt1NZOf3q9rOdMYEpMDoL7NM6/hVza7eRNQTawtoU2d1MwRtOZ
         H0pc5Uf93z9IqFESLuRRmdMtcHIdrxvAGVL6ejFXM5GOBevGJBBMGT8e7VuGaVcfYUjV
         1YwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxgz43sTym+HosMBkpVq4rXsEXq2F6oiSDvcaweGlz4gYzTP+92JSTJjaUUfRXMiJBVKuZigMYWX/HpKlvCuEOuq5jotaHWodrUIbEIg==
X-Gm-Message-State: AOJu0YwQM7lmlwkb6WOfB9tQjDMmd/IDuwxIyj9VuvO4G/j7AsWxkF0r
	X5jd3+VPIa2/5Y8TYu3+DZPSNXSzQ+TNSQS6JT0jyOtB2sZB/jFlUQ8JextiRP8=
X-Google-Smtp-Source: AGHT+IHTCA8ycbg+4n5AdBnrvp1TwQNdgC6l8a55ueOh87lc552vC36yNGKeIdFpKvE0CAMgsrh4ew==
X-Received: by 2002:a5d:4dc8:0:b0:367:91d6:e12e with SMTP id ffacd0b85a97d-367ceaca9e9mr12859126f8f.44.1721048954235;
        Mon, 15 Jul 2024 06:09:14 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccdffsm6417766f8f.54.2024.07.15.06.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:09:13 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/2] ARM: dts: qcom: apq8064: drop reg-names on sata-phy node
Date: Mon, 15 Jul 2024 14:01:07 +0100
Message-ID: <20240715130854.53501-3-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715130854.53501-1-rayyan.ansari@linaro.org>
References: <20240715130854.53501-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the reg-names property in the sata-phy node as it is not present
in the bindings and is not required by the driver.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 769e151747c3..81cf387e1817 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -871,7 +871,6 @@ sata_phy0: phy@1b400000 {
 			compatible = "qcom,apq8064-sata-phy";
 			status = "disabled";
 			reg = <0x1b400000 0x200>;
-			reg-names = "phy_mem";
 			clocks = <&gcc SATA_PHY_CFG_CLK>;
 			clock-names = "cfg";
 			#phy-cells = <0>;
-- 
2.45.2



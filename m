Return-Path: <linux-arm-msm+bounces-33592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D73379954ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC0F1F2592F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D05E1E105C;
	Tue,  8 Oct 2024 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkJ4QJWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E881E1044;
	Tue,  8 Oct 2024 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406322; cv=none; b=UTOoAnyn5AunPoQSYS/3SQ6eByHXfAz7KXdFqUAFLPWaeT6qJuew6am2iuKlI1FOS3dUmAUmagrf1xJi7XwiafyTURitDql4gS9I8SEOXxb6/ft3rlIm9EGsBSJwqlONabGiFk/GoH//fSZZ2iVigEKm9KuAYtziYUgqDg262y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406322; c=relaxed/simple;
	bh=B5YYlbLRQVvY4Y4SHyj4dqgnNnzgmNJ7eDkXD5DwF8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuzl5vqckLQSBi6q5dZsrLM2cZQUtz/Pkl9zp160uAmS19NJvdyDhS82VWar8L3SuCdGDwY+dCR0cXTC42+Y6BURCfgMqmMXdnS4JFdWM2xgaVP2U6Uv9U7THDKhsul+lQZE1ch2hbHJitQJSAihd80AfZYNoywSDLrf0ST4kWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkJ4QJWC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so6710821e87.1;
        Tue, 08 Oct 2024 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406318; x=1729011118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTn01V40/JZpsbLizMmeKPolgOynGLSIEuEq+BQ6pHY=;
        b=OkJ4QJWCDMuKukkBLHQll8NcpppjG41GLRUGSu+V0rts71VKPRbw9MhbtiqI8N2e9q
         HrqJdk6eVR+HyK2nhyJ1D69b0stVoZrFEjNcLro9+UHbr1SZMLPsWL65iug47BPvkBTT
         vABnBWVDOj1D4Cm0kjyZwTyg/HvBOObNbCyHdV36fZsJd5Xxq0e7YVpoVtdC1BekiSQg
         W+wH5NUZfjiJNqH/yl/bjkwZsFnP/ZtrN5RYpkqP7T/AKIUPppLHjpdFaSCRTemXGj2t
         XLjLZEQmfIsPYl+/timGvGaL8bt7sP/SaQctq2bQJV5qjw2YcD+7M1IrDKSwK864Hil8
         rriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406318; x=1729011118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTn01V40/JZpsbLizMmeKPolgOynGLSIEuEq+BQ6pHY=;
        b=dc9LmwUaMbD8dMQSlR81dryKjKLTD7O9KNHqI/Bz8/VOJoEpBTp2kUPVACwIC1MHo1
         2XnoH/6KfcY72/w5vC4JQtixW8t7mWP2CXukUELrRP6Z+ltSBx3kSxTX59qvHW01A/oq
         xojKGMczSM9aQgzE1yTcqIWH/mtpXExvp1kXc6UY7G54nO4+oBSYTi+HFVOzPjakGUU/
         GDxvnZhAFscs4qumPQubUMRs66sUsTrAmbVOMrAu6kCKlXGmMJr2bbfY46P/VZQ4uKKm
         3ZIzfyZRjxcRAqfLcIwqFQauY9/T3pNU2YkDYJv2L7h98j2R1R3f5AZcR/gBIxXwYT4M
         qskg==
X-Forwarded-Encrypted: i=1; AJvYcCVuZK2wRSaP0tIgLZVpc3U+C/dWNVUEmWb/odDJvOJT19UHWPek0He4ngFII1bVFi5pEVc6V+xRX5zx@vger.kernel.org, AJvYcCXkrnf/WK8WvX4KkCu9ujChRnvccxl/Y/26z0iRBpZgPaEVP3gzgSp3q6mP01RtboPElA4KoLoWRLezoga3@vger.kernel.org
X-Gm-Message-State: AOJu0YxFcvTKoczHVpMOwZquZ1rMxEnqdc0wKrVbBSVko2SKYmuDRKoD
	9C07jgrbfDady6lV0BQUmZOcgaa9QCZQ3d6rO+QkU9G7rn11rwpL
X-Google-Smtp-Source: AGHT+IEXCQtdHE6tbZ2Fcg77ZohP6v4X9OR48Zr8pyQWokLBg9pPrcaJh94n+JgEna532muWhIMjrA==
X-Received: by 2002:a05:6512:12c3:b0:530:ab86:3 with SMTP id 2adb3069b0e04-539ab84a49bmr7463315e87.1.1728406318165;
        Tue, 08 Oct 2024 09:51:58 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:51:56 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:39 +0300
Subject: [PATCH v6 02/12] arm64: dts: qcom: sdm845-starqltechn: remove wifi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-2-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=1185;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=B5YYlbLRQVvY4Y4SHyj4dqgnNnzgmNJ7eDkXD5DwF8Q=;
 b=Q6rCtE8+1KP5UI9UzsAALJQhlLg2TJcJrXZE2rgB1W7GBFvjPlSqULRPr8eZKgLtVRQqqDlaP
 aQmEPmQZxVtD1H0VbuNLux34RliWDKrHHJYJcSqho9SkzaqrKPA2CK/
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 

-- 
2.39.2



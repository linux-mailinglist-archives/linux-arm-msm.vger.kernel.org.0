Return-Path: <linux-arm-msm+bounces-17790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D428A8A9330
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 08:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 878D71F216A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 06:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8903B44C65;
	Thu, 18 Apr 2024 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cB1QfxwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2228DDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422243; cv=none; b=nxRBtUqtizKRvZ3H8tWd9hVI1DXVBp2eO+EvM/2d0adEdjbWkYf1/RzFcN+ROHXertRPYU3IRh17+Hb6ihit5Hn97CJimXf26lYiCcdQmZYCsNeRaZXbWu8rz+C0Cpud5MDUqPh235yG7UNh8+kBzeDwSfAXdQdxRCQF9L5BZ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422243; c=relaxed/simple;
	bh=kT60WxnXzrxY4hpdxhmajP21sGsE+yA6ZN5cjdGB3gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=urRJQLBK03FWZ1S0w2sKp7Fa6PGIrEF2cjAMC+r4mrLZDDZbl/AYyvA5AYp6vyHluRsCU3E+wd381rxUfO0oz7ni+ONi1E+lxcei5/e+RXaRf0FEsyvDPxMhxecF+DyHk3xGy80MXBq29jN3u1/eVvFrXinE3xyIIVGSlKGrxdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cB1QfxwK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so608062a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1713422239; x=1714027039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JvkkKzbM6G7xJ6mlKhxNlJTYC5/fgdCMmwInuXlV88=;
        b=cB1QfxwK6bh0+p+136MfmNnicxqK0ypqlHQpCpAHh+lpjQl+ahWV5/Xdx8hrDOElj2
         FTbmR2c04L1CSAisbOHgammpedFxCvY0Sfpkzt4lKjUUZKfhHuQBBod3O5+uiI7Qtqmd
         7lFKLZjJjHXYiF5M/JLfS2Wd26uGU50ZAF7iBUXHQNFKnYtY+Xi1QQWw4B1F1yA6paZ1
         F4S+CGZj/GX+CrZBOdeYkD7hSMkuUqFugbBX6uAcHshjO8kyZgJl0SIH0ZClQ/ZpqHdu
         SqnXa7pkx0A8NqwmcJdNQiqNnSKoyO96v3JJOhOhBWmq7typPWXeLzWfJPv0RII0hEDJ
         7xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422239; x=1714027039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JvkkKzbM6G7xJ6mlKhxNlJTYC5/fgdCMmwInuXlV88=;
        b=sQLivSTRclx+IvTA6AWzwjvfqyvYXrSvRqz00jXJh3b3IGFGlDug379/UjlrrIEV+y
         Lzhwh8Ds3Jnuw7vMvVuuPV7xPtHCfZP2QrR7P3fAZnjFvAv3TuI43SGfld2/MOso6gTJ
         CkXvO7N0/ul/z9UGGci2WzhxtGf1LaB6dyk1Fv3jRCewJeZjbvQKA47mdsxuDrtiNWis
         oKsvaTydo+oRB53eGcwsNvJBnC2ZgH1Vbv3iyazPwEXtR3WFCJlk9iWxMfugH2BY42P5
         oZSl4yx7BVsuTgCizBDOcsmJh4PdHUw6vZY42nQ/EOHDuMYUgBLXFn5zs4W5j6e27XGO
         XJlA==
X-Forwarded-Encrypted: i=1; AJvYcCXm0IMMr7avK1rUnXxzHbwPQCbH2m3iZjJ2tmvr5xk8O5mwDy6oL7nH4RGPPtzJjCIMSEzrr+gfz8JAcqqZloC1FI295rLBN5sRYdujkA==
X-Gm-Message-State: AOJu0Yzrp90Iq3Wh++jpSli5jOqucB/Uy6kQPBSiUYuxfZmfIv50RGo3
	iLYgpr9+kiL+j787FMf6L6FzZZ/JYQUPD5ilaakkhbhUODC3XgfQManmDu68CJg=
X-Google-Smtp-Source: AGHT+IEBi89ScDQrEZV417qfSSqKe4JxXB6rP/2GI8INLg+6lM4PM1KvguFm97eMoamsK4NSW8SZNA==
X-Received: by 2002:a50:d6c1:0:b0:570:db4:e5cd with SMTP id l1-20020a50d6c1000000b005700db4e5cdmr1031014edj.34.1713422238910;
        Wed, 17 Apr 2024 23:37:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cf8-20020a0564020b8800b0056c24df7a78sm472277edb.5.2024.04.17.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:37:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 18 Apr 2024 08:36:55 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-fp3-vibra-v1-2-b636b8b3ff32@fairphone.com>
References: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
In-Reply-To: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index e2708c74e95a..2c1172aa97e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -143,6 +143,10 @@ &pmi632_vbus {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &sdhc_1 {
 	status = "okay";
 	vmmc-supply = <&pm8953_l8>;

-- 
2.44.0



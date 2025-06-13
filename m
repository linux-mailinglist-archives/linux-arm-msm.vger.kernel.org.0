Return-Path: <linux-arm-msm+bounces-61267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE6AD95A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB3E189FC7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548AC2236FB;
	Fri, 13 Jun 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvDhYuQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D03C3FE7;
	Fri, 13 Jun 2025 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843445; cv=none; b=DWLQ6Rf8iG0BoTBh/o39QcIdQ0myRVdH3nc32uAg4rfwhtfYXxCz+m1Yqqx+fMv15c0tJT08rFxra0nzb0fG/rsjfxAaE7NA8ZuYthF5zEl8EW/3qSq4MPdPIoDunPT2A8kkYOu+oJcAl4V5Wvv19zoYW0lA8D6g/goOcyy++sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843445; c=relaxed/simple;
	bh=gWaM2SwWG/RzB3IQhP4sXhYbKHVGU+CduuDqU1xoFbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivnhRK65/2qWXJDd0xdbqVhI3NeQYLDyi2Ir33Sa7NYzsyrFu+iKowZc4mekB0YsvGfCOMNWCvCxEP4SVDM3ATblg8yf3hFN09PMQjxNL46JIT31aYazP77i5ekSITolPAwNkuilxYny3fCRaLX+I2QbGcFeYeGBVHB1WMFVNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvDhYuQq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so29146645e9.1;
        Fri, 13 Jun 2025 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843442; x=1750448242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=RvDhYuQqjV/ihSLh466y1f8Woo9Et/SGRh/DnxSu2cx/x1nshYNLU16xVX/PpzoAqt
         iPHfujg27shGsjvnVMc+IbMTw8BeiCyRI1heX807Q6in+in6qcUCyQyu9/3Un/Wbw84g
         aoVihmkraR8KwTWD84yisfmKGeqkdPRWKm8z6OhBqEh6k7MPAJwKFHY+hjheys3tRGE2
         rBOhH2TaI1rjRhFvbOKtNWk+vqfdiIwCn3V5mdZ+E+JOZPfsRnl5drcSDrUOz8YA23sC
         TeVwVasupMCIkOYcU195jfJvpldkNRt4AkojzCs7b1KsMo57qC3YTXH329g0L2Yt9fH1
         DgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843442; x=1750448242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=mao25I8Lz1zSYq6JBuTKENM/zbXoAlT9raAuvxrVj7tU1gZi2KiJ74uVmmhbbEKMDt
         9gamdgUeGgMLKN7EGa5Zc+/gkHChjMWBYtqS4HSyxoXMAvb6doOfUBrcWHQ8MQHdiiPW
         YINOk5sfD9zXhsqZCv/oLyzei52S2h74Jkg7864XYI+JRO+LrusVipROP5tlNBqfl8mV
         Gs/uUcQxgxTHGBpiphZbPJa/gxuIwfGZVfAMrSmcMTcSW4XxAyjHiijIWDZY/7t/8k1V
         xbFgWPY6VrOE/H5xVBunNT+W9M9HxjmwkBMXV+Avbo4ewc1cAF8jzqdBe7Htn+uRfSwQ
         CoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvLL6DwiMNDkt1vikkaZjUyoAHvuUf+3dW6fi+BEYjaIi4jQQ7w0St48lg2jMtAp8kQoyPgjB641IM@vger.kernel.org, AJvYcCW/dms8VAALq85/hpCev5w17osCqJ2X1py0xNFRQCgKvIr5PR/GjDaxZcd4H5w1bA8P8mK5hc2F7p1gGbmn@vger.kernel.org, AJvYcCXKyvA5jomdG4xqHmwsfc8i2Kz7gJgnGd9irzYNapskKeUavuT6NET/0TRvurtu4WOREzyde6Teh/LRaxPzAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEX0BO1Zrm0HwxXZJXmZ1a0087/vQHmCvZKVO+ew9kHrr+FBOe
	yQ0QNjedJiUIQHEqhFsmW4KYAR2yfHv8mpOl5djyNnYMCuJRNM/jSHdG
X-Gm-Gg: ASbGncuwaUaJ5h4O5xeaKab9uLL+jQbpUyFglSgE+cvPQMam1jbCU9Wy6yVoFGkjuxB
	hFZIlxBCaljWSN9UPo0EAJsTEdyKx1WbZEd/aTpPuknoFpImlhZT8nNyNxsYNbF0cHu4cqjzbxF
	HFqiHsGvERIsHALPmMkRWcGdEEji0ezS267xSSJSxxWB7HwRuhodoc1N8MrFgGIfT0zYPTp24Tq
	yKE8v/BEYM7iqNtJXHbS9GX7j9GXFNVANqsP5+EVVkg2NUL2poxtoNKC9kpZYgzaohHxwqZFNPV
	t0E9pp4DlKT2qHJHMcdNYE0LoSw/vJ6xD2vc2VfUCfd820EfwvPXWvuO+ZKkoPd9BA==
X-Google-Smtp-Source: AGHT+IE51GwvZHeZkjWpAoorVe29UzRKjPOQEkinYvcn23mI/tvwl1AzLqiToypl32uj80peUhCIyA==
X-Received: by 2002:a05:600c:8b0d:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-4533caa6283mr10881615e9.18.1749843441884;
        Fri, 13 Jun 2025 12:37:21 -0700 (PDT)
Received: from ainazi.fritz.box ([2001:9e8:1ad:9f00:925:9e86:49c5:c55f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c187sm61379055e9.23.2025.06.13.12.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:37:21 -0700 (PDT)
From: Shinjo Park <peremen@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Shinjo Park <peremen@gmail.com>
Subject: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
Date: Fri, 13 Jun 2025 21:37:17 +0200
Message-ID: <20250613193717.18668-1-peremen@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the same definition as pm8058.dtsi. Since vibrator is used only by
some devices, disable it by default and let it be enabled explicitly.

Signed-off-by: Shinjo Park <peremen@gmail.com>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 058962af3005..535cb6a2543f 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -17,6 +17,12 @@ pwrkey@1c {
 			pull-up;
 		};
 
+		pm8921_vibrator: vibrator@4a {
+			compatible = "qcom,pm8921-vib";
+			reg = <0x4a>;
+			status = "disabled";
+		};
+
 		pm8921_mpps: mpps@50 {
 			compatible = "qcom,pm8921-mpp",
 				     "qcom,ssbi-mpp";
-- 
2.48.1



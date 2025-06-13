Return-Path: <linux-arm-msm+bounces-61265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347DAD959A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D9A189B00E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED862230274;
	Fri, 13 Jun 2025 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GleYQYtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36E20371E;
	Fri, 13 Jun 2025 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843265; cv=none; b=KQU/czuYdkAGLom9SaK/YNweHj77yx61fm3KwXMciV3TkZSY5ZXpr/h1uzGAuOo/uPEnPVaEzQpFm+31UvHofIoLNtfPsbhgeOhFCTyDE3Ug35U2O3zBOCgugdP3vsuM514L6qiujnIdUyWS/3B0rfyZqKebWjVCuc8TwjdAU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843265; c=relaxed/simple;
	bh=gWaM2SwWG/RzB3IQhP4sXhYbKHVGU+CduuDqU1xoFbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nk6cT9imEPjUewrDQ/1NOfz9kgHXSDvKyzaV4j02ww06v1Qv5HyEMn+kKE85d1QUmoQiao4SEoImgbzausDjGGf+pi9euFU62BlY+JZs+pPQEU4PQwsvx4cvMLxVXBbwTCbX+q/GZErcZ/fD3BdUuVdGGSV9EE8zz5yOsXY7FTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GleYQYtq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso7103085e9.1;
        Fri, 13 Jun 2025 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843262; x=1750448062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=GleYQYtqiyArJVYZuyrd4yFZtCFLDHpfIqYzkO4i2fsFXRaGZuWVvpOCy6jMMsTmr0
         VfZljJP+n1zDC/kzSka2D01/xwpGpVDZxaJ0SfiZJ0rezFc5rgt7z4EQufK6pM2R+gT5
         XmIqZHuU1diwnFMinWUspESnTRVnXSQs6lXz5iUg1NGPtnNRAwv6qlQ/wGITGdiE4MuD
         1o7tWqMHqSkb2qKe162l4RE36xhTsZSFE47UQMnlF0QuYnWfocvxEEcaaAnOoWO7EQj5
         oNzZ/3pXYQ9VL9OIRGUBE8hqpH6QK/XaWbhdUJ1mI6YOsAsQE7EeuYeqQbc4mZBIIsc3
         goeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843262; x=1750448062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=NsmJPAH8IPd0FlEOfsQafssW/bOqPVceEgA+M1u8vtjI4wNmhaJTdkaLREw9RTSBUg
         62Xknz3GfJBzqgso/pYw2OQOiO9NiNAZkzKjT9aPnL1SGe6CRGZj7mQv36MhKCKmYpHj
         gpWBCf7HpDIkZwFXeiowdbzmVa59OuZ/FB0efuk7g5mf7YShIzav5oZAWOTt5ady9wHE
         0ar02p8k2RWlzdcGE1gTNJAtEMki9gpVxk2PPfrCm1Daq5b2fbfOV/L7NDEXIQABJ3kM
         7loA2Gs2sTu6Tv6xq4AbiGqU/GEiJwjjfLfcl/QeywslAIDTN8/r7uPRUdGeL3iOGte6
         3xUg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7q/y5oZPJ73/msustnAnyn4C8zvba1NRb4mL5VYYgh1N6pYVIO/JWNA1tRsIZussOVbPNpYlGRofRyF8@vger.kernel.org, AJvYcCWk8HX1x3p+gEPzFGDnhcOoyl4YxNKWVQkc8iOuthQ/7NcBq2LJsYg3cF3pAaCX9WevWt1XX2XLinMD@vger.kernel.org, AJvYcCWx9GSxhlaTsAanMWJ4ghzXJE0YfCx091Rh0TfjhTeNGtAfvGkzaz1bSibq1phTVUNWdc2Sip0kYV9kTnIGxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykWykOpoLWxhV1emdN7tSEH0Q8guW+nZtEZfa/Hfs9QWuhdgXX
	nA+Q4uBPlEDv9x5hU8I2wZ1SOE7QEOlgTWOz/O3jLSVzzXsH/NZM6Reo
X-Gm-Gg: ASbGncumAyLVSyrSFaDW+9g9wb4Pi2rvr4fyhw0iWUC6SByvTYqFHAS2sr80XCjSZ49
	lwhPo+fFBg8OjMEidrXgO+M4cz27vXkv/phx8Ongt5H4YhQ8LwnrlV5DIy4rqouf2hFGnacAaic
	veTpXGGPnLVl0CYUaY4kOHsDZlMmc3U7EBDf43aiIPM/Xpyz04SbClysDvmfRFC9auUvL52kTSC
	DKIeQYC9KOaIIsUKPd2T5bVpo356nGj89Xn96FwQqGiTuLBGWVOIselkgnxyWavuZC83nEJk07o
	36nbAPRko5dRAWiQvv9sbmGPAW4+7eS/aebEk4niButAzyMmfEaBitLu6XXK/y9lQpSYIles83G
	J
X-Google-Smtp-Source: AGHT+IFhTTlaB8R5R4t0mtPHvv7KJ38bI0KpQK9C1D1O2kxgMVeOacYhHLq1vXf0hOcg2wGJanfSgA==
X-Received: by 2002:a05:600c:6099:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4533cadb4femr7612225e9.22.1749843262281;
        Fri, 13 Jun 2025 12:34:22 -0700 (PDT)
Received: from ainazi.fritz.box ([2001:9e8:1ad:9f00:925:9e86:49c5:c55f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm60725415e9.4.2025.06.13.12.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:34:21 -0700 (PDT)
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
Date: Fri, 13 Jun 2025 21:34:19 +0200
Message-ID: <20250613193420.18100-1-peremen@gmail.com>
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



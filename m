Return-Path: <linux-arm-msm+bounces-61271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A12AD95BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F21A03A3A23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45DF23A562;
	Fri, 13 Jun 2025 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV4Z/+Io"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2423FE7;
	Fri, 13 Jun 2025 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843795; cv=none; b=SLZ/W+SBLTZjFVYE7M4GAKdXh5KyDyho9Tabucinp7yORr59Rvfw39QwrfYg3qdYH+dyzyNNdWVKO7nESBeuA+UUqSjvIlaUqjuC2NIF48mvJjsRDHtp3rfLvEAbJFpS3aRfEX/icj7yQDrXIEreQaVnwCxKFGUoMLa0g7t9220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843795; c=relaxed/simple;
	bh=gWaM2SwWG/RzB3IQhP4sXhYbKHVGU+CduuDqU1xoFbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T64gqQx/KMCuu2lFW//WHySlhqD0ZhkSuGH46OLLRtI1saUaFZ48girPfATHGU4eBXfqhka+FuvD/Hw1o+NNXcH2exj9xISPSmSqQxU6cKo5PzHKqkdcOhzFQ7oE5YW2LelEDy4SKR08Qciy2OjrESCJd4rUHvK3YrP1bTVF55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV4Z/+Io; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo4787162a12.3;
        Fri, 13 Jun 2025 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843792; x=1750448592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=cV4Z/+IoKU9SwAXqZxVWqaHq1Lwx3w+bav64GDT9TwOf1/uWGH1Jqy8XB5sS6yGwM7
         vzKZ05qG7ng8mDz1vhN2beM3oYVy67O3Soa50c3LTVcjzsYMLIDOXtWUbfGmsjS+YGsy
         P8zyOP5fSWqxKboRjvnYYHL1HwIDG9tXcJhDb5TzdBxFlAOgFafp79EBBoDrH5ejz/Sh
         AC9KJ3a/BgJVKVdLzOVr3UsOiqxBk/EnuXxJyDNxF/N8UV4qnIMmjX8IwXHIj8sCoyAJ
         z1P0MqPIr1E1Rg62CMaG4uNYPju6XFJA3QRiUxbSTFK/p1DoHHQu/gFxYx4r+qNLubr9
         qdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843792; x=1750448592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVnXDO8P8TTyy5ZMGp74R4GEWT4MAhPxsWXUOSUBcps=;
        b=Lu7D+F24gjePP0UxGOhGTyBwObvepXLbVivCmHqZ6dsL3hCi4KAnLEa6Nc7ZIvOEX1
         vbl1DTC6TDLzDiVHOPIkNOW9YbcqToHIPzGwxHQACaS7Dn0RwP0K19yNZieRaRNmB0iM
         8X3GwbkLQJUZNXUEHGvJhPIUhw+dDmAi8pXNSdOMZVB69jv659TThq8bwnkeUoa4u70l
         Nk6ibI1eRA58BSfkcoRuYYVzu3uKLzOI0KN8IXsWz7bVBB9hu193CgJvWFiT2b4JMVG/
         D4P61WGlPEMYuduy9fyMNTOajYIPusS0Xn9+CUzua8zKMQxs8XJ8Ige2Zka/oeKxBeDl
         1rZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9baJg2gHAoKmo7LJIVx9YpT+Z6NQgOfZ8nXNHUcPEOXn/8OJ1vqUT4GAycJXejDca/28815NxLqY454mVqQ==@vger.kernel.org, AJvYcCUBihFoV4BaEtFRBFiyIjk5MDW8IoALPE/zj5ZxI1E6a58/LTq2njHSIFmAcfMbQXbUF02j9mTsLVholoVY@vger.kernel.org, AJvYcCX6piUBCJlCWj+xEXDCnwl47rPUmV/qF4Q1EsjSE4v9cdMA/UD4aRMGoT7F+LgtRtTQ1Lm4fj7p9XJT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3ds+RGm2kvz9k2qFg17ytxQavHkvM8SCeQJXcBhFaBhlb3QJ
	PqVmsqxiwm89ygh4U4CM39+qXYsFeWvRe3Q55+gXEN68mS18ZBdvHw5YzlDeyotdjgY=
X-Gm-Gg: ASbGncs2dnFWHNkB5u3gz46dEGc8ax7NeutmfOPMMxI9wPTFKEPVT201Oe2oB6weJiI
	lH8qs4d6LPDF09AMJJcCHO0qSm7VXJVBjVG1U1g9yBOl3oI85Xep7/L/zUOGw22i1SMBVui1L4u
	TQAWfSWQkY+fMYN23+CarbUKwxH6OYDpIk93pJ2tyepg/LyqC0C/h7DZ3orkjBsOHI3ebSzd7jq
	NmvG6dGXriD0VZd91Jw9z3XB4/aP3iNCqpKeiqxW0hEUZpGPVBSsIGor5R7Poxv9SqZf1QAXf2y
	aJ8D2c8iy5HLIVVXyw3oaqiUDHCHAKcPov0jlBhZn8opGEfwqiG+icM/ZXoGo9fDCg==
X-Google-Smtp-Source: AGHT+IEea1UCROg9VWoHOogW+rzKLVn6Eb9YuxISnCP3IOJmiBzBCZd+dWoG38r40j+VpjnkqgwJHw==
X-Received: by 2002:a17:907:7f92:b0:ad8:959c:c55d with SMTP id a640c23a62f3a-adfad2a1efbmr48350466b.2.1749843792507;
        Fri, 13 Jun 2025 12:43:12 -0700 (PDT)
Received: from ainazi.fritz.box ([2001:9e8:1ad:9f00:925:9e86:49c5:c55f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adecd50da29sm161053166b.72.2025.06.13.12.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:43:12 -0700 (PDT)
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
Date: Fri, 13 Jun 2025 21:42:53 +0200
Message-ID: <20250613194253.20080-1-peremen@gmail.com>
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



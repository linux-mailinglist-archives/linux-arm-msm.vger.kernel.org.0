Return-Path: <linux-arm-msm+bounces-62243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E7AE727D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648011BC53E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6685C25B675;
	Tue, 24 Jun 2025 22:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/rXiKGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D331FBEB1;
	Tue, 24 Jun 2025 22:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805464; cv=none; b=MqjY1gdhOiFiOBqS1WKdE+RyLQMn5PgtR8AIcC/G3CnJ70T5ZaiG9U4ei74gNYchjhucOX5l2yR+sPh6IPUcCB1KGTKW8so9nvCtTydVUgPC0bBhBICOfFm6Vlzrngzd0t5rmuDAK8OvZT2JSup7QMdepvf1BfmO5ZCa5NULP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805464; c=relaxed/simple;
	bh=rYaqrvDO23I/zLBnmWs1LvAXpO8Xgs5xjPKA+GcPozY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxMnEAzsso9IKpesBgS9ER011yFZmrnVmwVkg4FsPOqOqfiIFlXJFX2XgeeIFRPc2aETYHprKq+G472H8gJCJQI9psVz/MakgrWmEuuNIeEBY1mf7vY5LWDrv/OWEOVE/W781SUdcxgybrrzm1fLi/W6XQooHdA4/MS1y2QiH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/rXiKGW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acbb85ce788so179762166b.3;
        Tue, 24 Jun 2025 15:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750805461; x=1751410261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSInPMBKryeA9x7q8R31YHirkH7xY3OcKtEQAYwDfRQ=;
        b=I/rXiKGWP9O8nbK7n+Ima5lTBi0PtfjkatrVwVgCJenohZahxvPSf9LptJZsKwMqcp
         Uzfs5ucXNJe1YRl3DTbBabcaNoQocg3KM63sAC8a1J2jGmxEskYslrEF1OK8VIwj4jdC
         331wQM3JHZJQIiK61LT/HSzJvtIHm4T/iRQd1nDnBsaaGN5I0rrp9xXDevsAhhjE8fg4
         R7eR9wv7OQecvgNGUrwwUkNItQkOTVPuCT0Mx13JHtQ92K2CfgbiLN6ERs/pYUMJUIc2
         Aypz3y0XbEbcTTJ8gnbheuT6vzmvk0UHSmizu/2GUiB3r531TU5/WWuy6mMiZDP3GvYb
         EhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805461; x=1751410261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSInPMBKryeA9x7q8R31YHirkH7xY3OcKtEQAYwDfRQ=;
        b=IG1gm/bKa722Nk4GPBkDNlnfym8rYIfqOnwlUyUiWNLTiNdITNlKAsZ8nUcES2SG4t
         W4aspSdUcqipuJiyp+nfwqZjja/w0e+hEKP9FW35MM3YbIEZD91arUZZMRSJdQDNfmOP
         FwMAZy/SizNoK/eWL0M5XqYcIEz5rzaHRhSXmf+quGzJKGPHJG+dl8pqu+pSvzI9TlXL
         sAVMT/8K5mPzKRPOd+3mC9LUBt7VaQeXNota/FHzKrAtY64x+wSq8HSH3VApq1hcXSk1
         cwfyNBLSQVhSLwnhlToOBFhXsWyrhNiLr1bZ2CEvCjSixu40gOCpaRY9vvlBgxaa1Dk5
         BQvw==
X-Forwarded-Encrypted: i=1; AJvYcCU8HqxFs2WwmKhQbfzSE1lxbo+UJlXX4jFdbXsFXhO3WGZVmTef74mNqv5+Rh5HNlyqXMUh1oqHCRiT10k/@vger.kernel.org, AJvYcCVGObi7uqNpV2DJUUf5epa2S8sfO5zCLc+lkm2cZt2mvdcToViq6em2oAxZFbNfYcZelQcc1yrEut5I@vger.kernel.org, AJvYcCXTOYsq9dTmZ+ifh47u69Euapv51wxUoZd8OQ90f6v3l56DhVOO5KqKBearZxc3/Zh/gRIW0Ass9UNxVwCSBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz6evvvHIQfkNPBl+UNgETItCkfn8S762SiKEd9qs80rZQx5P2
	pwgVqWDftu/3hTEbsvn1LkZSwnUDh+X5VK7JfNbpzx2gM3n6qe8CDaY=
X-Gm-Gg: ASbGncuOxPHKEHkowz4jAV9gJgc1ikbY+xYRed6z3T2bPbX9oYsJVA/75aHeGap6Z7k
	cknT7IZh/gRlvgSK4L1s507lFdCATaiSUHH8TF6ftIOIpJfqNNUziNZ4/Xzf2R1xEGuif+A1JJT
	AZGxY+PJKS5f0HeDstJTdFUKU4jVs6GIe70zqEJfSsM6ilkvBLyhi1Rzgj9Tu0IdFXky2g96Gs7
	elrXgXoxK3JCe6DDED2wOkFj9tfprUUIEXWgg+vW+8c7FlWlzs4VDh5i/LNiPltf7ET0XaMLkaT
	g0q8O0tLw+ptEboGxDkxaV3iFXOfw78ft6BHeYX1jn2W8ZxZh6broXD5kzOj9mEsmySTMRk66nX
	U19SW
X-Google-Smtp-Source: AGHT+IEj+QBLgJLBX+ctD5aG5eUEFW7fHZsCA9RqIualLk6POG0x2ZTdsGCYRm+qbX0jh1PJdPCQCg==
X-Received: by 2002:a17:906:6c8b:b0:ade:1863:6ff2 with SMTP id a640c23a62f3a-ae0bea31123mr65857566b.52.1750805460899;
        Tue, 24 Jun 2025 15:51:00 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0543421e9sm940093666b.185.2025.06.24.15.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:51:00 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
Date: Wed, 25 Jun 2025 00:41:20 +0200
Message-ID: <20250624225056.1056974-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm8010 is a camera specific PMIC, and may not be present on some
devices. These may instead use a dedicated vreg for this purpose (Dell
XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
alltogether (Lenovo Thinbook 16, Lenovo Yoga..).

Disable pm8010 by default, let platforms that actually have one onboard
enable it instead.

This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
fixes the issue of power button not working as power off/suspend (only
long press cuts the power).

Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index e3888bc143a0..621890ada153 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -475,6 +475,8 @@ pm8010: pmic@c {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		pm8010_temp_alarm: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.48.1



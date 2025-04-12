Return-Path: <linux-arm-msm+bounces-54101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCEA86D03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 14:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE2964601CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2C71DB92C;
	Sat, 12 Apr 2025 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqLDNIBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9681E480;
	Sat, 12 Apr 2025 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744462203; cv=none; b=ZOQVTb6WG7+oUdRvsmWZ6GtLn+BaEVPMX3xcpI5RXIdM1rbVty8MpBntwugsSBDbUxYKfYj8eyHOEnNOELTF74xtFQi1r8Z/vkmLjYLU7HUkrWreV2OL/Mq8UJpqlkY63JaW59jXC433L0VJfoV9aZhSkQ66tuwjVA4R6+kDgeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744462203; c=relaxed/simple;
	bh=7bjpdH7rRZHgzELQSMBk5HfdDd70gzmO4TpFtk1I7UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYDHcYH1CHuZ2cR6xvIs1miRequCdrCiHSn2Yi9IkC3VkI9P/rQ4J/eb4HqPS9Js7k2OrBa6zOK+Vp4eLHQEz7MD8s18doKdKcJmVISO37Aq7GTpVrnBiQFHaCq4a0llP9FsdnyAU1nHa+uDBeSJ73fotPCmfkA3Hd/y2Xgxfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqLDNIBI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2485338f8f.2;
        Sat, 12 Apr 2025 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744462200; x=1745067000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DNgScngiE3j5YjAAv9PlSz+Fs3uBzdN/tFwz7cjBLI=;
        b=VqLDNIBIB7V5p3klpLnJKVIkkoOW7zQ53v5m+L/lgbuKWkaiQ6vKPWenFsX8rPaLYV
         KLkB9e/lqkfVb1rCqzMvEX31srsXMaJ+NI0K3RwSoCm1TQPxLv6wzGb3LOPOsn0mpnEa
         Am3/VkuaSuVAWDFm/Vd2VLT3UY1SGIxa2RalxHieE958H4EvsSynVAHx8u0vMh8Rs48j
         qNIy4iouMTlByWHh3B5NsfamNddGnkMK1xldhDORm7BK8j/QvFZOJISDR6ZwroySe0xA
         PeqLPmgDURRZEtHPi2mSDjYlOAjFktZelYv0KB8aa2xAMgoPycDyuzHK0BhfZFDXxFGM
         k1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744462200; x=1745067000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DNgScngiE3j5YjAAv9PlSz+Fs3uBzdN/tFwz7cjBLI=;
        b=Sn4zB84epTKMi60A08232QExzbgfSaHgpdWniUyQbMZzOSKOnLE+yw9OhLg9aUxjbO
         F0f8tz8/zC4Q7HSoyubJbcGJt1QKKM9f/O+BNB95QOurVqvZoA5W58JJmKeGYK0i1D3P
         zAI8XnX/ktBnwsJMRTl2tfXovvOi+fkbAoGpg26MDnrHbxkbs3fjTVJId2h1DEo24BRH
         WfDSVPGjsTnZ48YX0h/VVN5CcWH968OnojSFx076tRixtQW50DToJ5xo+lpxcVAB8gYQ
         iKhplCgwEyvuv96G9N6F0jIftEolZ9NggK0xnL8wncFRfASp6KOnL7TPvA5zRGt61zH9
         tHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUskNl1G1tspm05uE1SvBwvaXJTcslxiLN2LEXWx6qJaMmR8PXiWObumUmzrkYkdfsHy6y5gsSS87/i2puSA==@vger.kernel.org, AJvYcCW3N0d8HavErTfIjEgmJYCSNUOY8cmpvLQ8ZDWDgKh4c5Rrdt0pSdSsWvGCbcj32uRHIJ9mQ8wrWbzy@vger.kernel.org, AJvYcCWDlbL786FnEXJo9YdyJxErcvmZgQ4m33aqy7zncDqmKchXz8Mu5jqZk7QXv/Sx2bBJqWxj7snFe0qOBsZ9@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSXDXcJdXZRJmSBaPGl/xBNDQ6oY8c23AVN4F+x8gigP6dARp
	OPmQKOk79zkDbO/QX2M5JRQ15cKW7aYAPiOr7ctcpUJjwaDos5A=
X-Gm-Gg: ASbGncuLwrWPMwLHsvgk/2jSPqyl+rBOAD8woOD7HwCK1YM5jwnHmsA0gDYU/TH2pUt
	0id+ctnvzSCUTBrDePQKJd+Q48i8yWNFlXCihDZO8rzhZ1/+B2n6QE++/FHdna4JSh6ftPat8bv
	KYKLNdeJVzz60fFV0VOAjGW0PHPlG3JJBdHXnsSDPSoigKpZQUCn3IagBNuKtxGDgnwvCxdjefE
	MW5V8NHR2ZKmGINM4+slJkSBauSWTtLbc/F8gsosQdgDFzciN2EasqPVkEoTJ+NVGNlB7tzEn2k
	LU4iAXDLcRorAes9RG7rXG8gng3XK+NCR7lLrGjvjrnRTQ==
X-Google-Smtp-Source: AGHT+IFAdrdGPeAzQJeSH+UxxCOHuga17CXmikrVeO77hb0Q3HJP80OLUOk6t9Zn+55t/Z/nliA/nQ==
X-Received: by 2002:a05:6000:1843:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-39ea5201eddmr5420849f8f.21.1744462199881;
        Sat, 12 Apr 2025 05:49:59 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm121609705e9.1.2025.04.12.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 05:49:59 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: enable MICs LDO
Date: Sat, 12 Apr 2025 14:49:18 +0200
Message-ID: <20250412124956.20562-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particular device comes without headset combo jack, hence does not
feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
Describe all 4 microphones in the audio routing. vdd-micb is defined
for lpass-macro already.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 4a35846b5947..68745a4f4766 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -152,7 +152,11 @@ sound {
 		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
 				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
 				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
-				"TweeterRight IN", "WSA2 WSA_SPK2 OUT";
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
-- 
2.45.2



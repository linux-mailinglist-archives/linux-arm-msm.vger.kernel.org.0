Return-Path: <linux-arm-msm+bounces-19284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 690858BD987
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 04:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9644D1C21A45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 02:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D0D4E1D3;
	Tue,  7 May 2024 02:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMibQX2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BB3D0AF;
	Tue,  7 May 2024 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715050086; cv=none; b=goNB127yTDQbCHPpjgzccFTb1GPSF19dXhYTEDGA1gyj4LS3oDZJTuwnNRVQLzyKaS/zgDRdA8YsoM5ZQ6xGQM7/j2FkWC52RiFCVVvDmITTzK85fxL3OC1I2H9dwSXvO1WRCM/PhuAVenW8s9GCioQ85QMDfsdT+r3H49Uf77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715050086; c=relaxed/simple;
	bh=fPoxLXJ3y4JvA0eBPT3hLbERZiBjchIAQdBby/myRK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fuf8AHdwUZriMw+rMyFn0mXwy6764OHPz0I2XHTHtZz1y7byV7wepNgSDzspoqknG5WIn2AP8OoM2Oalx7+6uPP1pKxYq2dKzJrUGzcxQWcX4EKffBp7JFL9YEXFCa3pOODeYx8YiwGyXcyYz47LaZUspLZAa49kbbk56tx01PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMibQX2X; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-23d477a1a4fso1981399fac.3;
        Mon, 06 May 2024 19:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715050084; x=1715654884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+2Yi0bAJKr/RmDXQertnEjM4vkBzvytl6JH2ermaTQ=;
        b=CMibQX2XPZiifiivkDaPuvRldqwng7gnGLxitt1IN9O8hm7lNjJDBJNkXBK5x11bma
         2ye76lE04AT+rG0plJQ0EecSRjqYxUtAxshEH4MCulU4wPL7eYCpxCG6QRiSohoffyqt
         0LUtDpBoVyONTpWrrQnYqZFw01t4wP27fGKmPkREOQj7PV6Mrzovr72hkkUu4MuA6Kia
         fqQT19ZR3U7LMt9KDiwoI4gIhUNu5N8Y267p2blCK6PZpgKB8ByjhvKVPRR90jb5dpx7
         iytnxEtbc6pSHsqm+uCUWcY0bVOq7ielZQzWIBLHhTAtEsBP6ihf0Yf5qpYYyqjvfP9G
         IfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715050084; x=1715654884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+2Yi0bAJKr/RmDXQertnEjM4vkBzvytl6JH2ermaTQ=;
        b=DFrO7TppBD1BYo6JAFr/1omUydGT2pGDbh5aza6D8xuma/JJWs6p16nIckkuXRjgcu
         QGTGiGflharBTudkPPYo4aufodAHUxSF4mmg1qH89JIkKg6tIEnTwxt5J6YFwrD4m/kx
         V8RHtmExZwRHI9D2IUdS3Xl5rAAK4N/OIr8GlEiJi9QfSmxnGJ/lFTEhsAurijUIXyy3
         4C3S1ox533h3iE8u4Z9EAKLubAUUoyEKTsK90dAza08K0g6PHWJwynAmHwhfq/TgdhPQ
         9/B0rorfbZIKqX+gZ4W9/n216Gc93mZ41ZKUIpyTUAdO/u1q3bxZydQQB4uSf2OLRwW+
         62DA==
X-Forwarded-Encrypted: i=1; AJvYcCXTb/hn8K15qgH9EVNOJLPZfp1TOtlG0xZFcNb9/Y82BVv6myXts1v5Wpv9xWIfVp12qsPmt8+QBK3XeKjUnhKT40NTqQOyRiBMEnbc2eH4PJl3jaiPUCB5tga0DjlnDnWjbOrqkvDvrfVQuLJGvZf/O5fUEBB+vSBWQ7C4bWG3pnYsHgshEihZcMWG6QNyKTFMc+iV/cBu9MKAJmZO0zM=
X-Gm-Message-State: AOJu0Yz9tV9SxG6/73aLABXj8MXzjctpBfD6qdFFooRxsaFnGTV3yMI/
	5MdLsErh4158U1I9h3Bn5JTNNpDGdCxcgnAk9hjiuztze3uZbRXw
X-Google-Smtp-Source: AGHT+IEJtWYKDRvNU/yVKOg4A3pz537ZV2ldoO1wACQTYe6gsoPCrXTTJ5sVgICq2SqIVXCsWUaWZg==
X-Received: by 2002:a05:6871:7410:b0:23c:737f:5bcf with SMTP id nw16-20020a056871741000b0023c737f5bcfmr16880218oac.8.1715050084160;
        Mon, 06 May 2024 19:48:04 -0700 (PDT)
Received: from nukework.lan (c-98-197-58-203.hsd1.tx.comcast.net. [98.197.58.203])
        by smtp.gmail.com with ESMTPSA id hg13-20020a056870790d00b002396fd308basm2333895oab.35.2024.05.06.19.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 19:48:03 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq9574: add MDIO bus
Date: Mon,  6 May 2024 21:47:58 -0500
Message-Id: <20240507024758.2810514-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
References: <20240507024758.2810514-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPQ95xx uses an IPQ4019 compatible MDIO controller that is already
supported. Add a DT node to expose it.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
changes since v1:
 - pad "reg" address to eight digits with leading zeroes

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 7f2e5cbf3bbb..ded02bc39275 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -232,6 +232,16 @@ rng: rng@e3000 {
 			clock-names = "core";
 		};

+		mdio: mdio@90000 {
+			compatible =  "qcom,ipq9574-mdio", "qcom,ipq4019-mdio";
+			reg = <0x00090000 0x64>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_MDIO_AHB_CLK>;
+			clock-names = "gcc_mdio_ahb_clk";
+			status = "disabled";
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x5a1>;
--
2.40.1



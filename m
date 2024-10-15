Return-Path: <linux-arm-msm+bounces-34466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A099F3A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 19:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE01280EA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 17:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0951F76A2;
	Tue, 15 Oct 2024 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHa5tApa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCB1CBA07;
	Tue, 15 Oct 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729011757; cv=none; b=Pf3fguy6s7w0wEBaF3OdbVfOxSJig6hEQrG8YlaRDVMF+HBzPIg4yH8CMqhBopX0Vl4REQOW/3Ohvvc4tXI8MVN5ld0COwpACZ9TBepiANW37nyblEGeHSyga359TYg/rxkQ2yCcp++4kSBaTA0anf0ziwGhtDHTL6pSNEt3hRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729011757; c=relaxed/simple;
	bh=mjX969uiuUwFxTha3ATjNRBsXorKp3Xk+b55UuTlw3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIdv6nMIYrYliWUcaNa+/lXbeuS5QYZXqzwTtz1qdFJ1fVeynouQOo5tMXp6Y/LJIak3AtqLUlTuA1RWG3y3UEjRXfuvXL28j3Fc2jv1k7zNSQgdKEdI6vz1acK7WhclGj6P5lWUJWqiueKiTOlZL01yuZxTrXmKKtZvoo2PEkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHa5tApa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e59dadebso4243557e87.0;
        Tue, 15 Oct 2024 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729011753; x=1729616553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krABLQUOhPKpyg/+NTCc6dULQXBvHVAWEp5lKk1wTOE=;
        b=iHa5tApa0PR4X3vg92G+Q6kSXT0N5JnKecCEaW5+uQVdjnfNaiKcEVaP4WebC+dlIr
         JK3h+g7+Sz6CiJ+NLa9pli40A9QbfsJr/7zGoQMxewA5H5gIhzPrtMzQ+PMhXaGRXitM
         tuiQo0TGV/EfbihkhT6Cb2ZnX8ixYy0TRJyK+LA1FMUc9SNmRXuYfUEm9TD1vNF5pI7M
         U4XBfcsY4MoQV+kblhTtYStdN6ZPUmSIl7fUjOHT4UooB32eAfq96ZWboBNKGdS751Jm
         eVQVWo0akHIeeNQm9iErR9oegJdea5CNs+EER0XuH5y1jnW7GN3kDuZaeJMG7Oa5LYDa
         oHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729011753; x=1729616553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krABLQUOhPKpyg/+NTCc6dULQXBvHVAWEp5lKk1wTOE=;
        b=vW3QPBcdnYgglbehcL8ieXoztZwSVOJV3S2KeiXdQrWN9RZuNcj8v+xiA+91I8+a55
         PODD6513IgUnIkjlGY/8smQVo6uqbxZta56PHOqHB1xVU9/eASr0RvYpEr/HxWJP+JcA
         tdTpN0OfQMKBKll3zusUB2HGkFeln6wSZm2NvkG5UbNvRGU/PlQT5R3lU4tGHLpxW+Sn
         jMzHoHgc2z6mlLgvriDlqrhghFegmzEy75yS80iXbeC/7IoIZJnlSpCzceYZDS4Pctnl
         irEMYgkKcHr4PfYsJlyzy7Viq9Uj+wcmQJSZcch6cW+3HRcoh3ntvdl8YI3R1a/uN4GB
         yBgA==
X-Forwarded-Encrypted: i=1; AJvYcCVyySyxqDWt7acseSfqApUk337bzaAaTyn8DKZEW5G39Tfhf1vElYFsue7pk+FGg0sghv52dBc+subS@vger.kernel.org, AJvYcCWcbYUWisHvD5QqoWNcWMe9K8C+Qwp0kcRl+iF2CZ4VULeqcDB7p0A7sCQcrNoso8mcOSKCBtxaffzJCi5Qpg==@vger.kernel.org, AJvYcCX4Q4nEJrBZ0yKmJVvgGUiSFJV/0DJdzbAqsYtqKjLbyU8FSyIdyuHd2RchwV/Eq6aVizxz2ON3/S2U9rpr@vger.kernel.org
X-Gm-Message-State: AOJu0YyLBUV3qzx1QuCJUsruufGviB9+b2YBNLd+36HMkqkAA9IWyLnX
	539b8WXYfPyETfe4zejfz+pMT79VQco2TXpjg+F2rxmN8mYMgA6R
X-Google-Smtp-Source: AGHT+IE5XwKsd8tVB2eXHpA8pKI6YCSFne2iE1hn7kaytgEM8+CZ3ujUaw+e+N2/5X23OWcCcmu7OA==
X-Received: by 2002:a05:6512:31cf:b0:539:e97c:cb10 with SMTP id 2adb3069b0e04-53a03f7cefbmr872115e87.40.1729011753113;
        Tue, 15 Oct 2024 10:02:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00013bc5sm211045e87.271.2024.10.15.10.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 10:02:32 -0700 (PDT)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jos Dehaes <jos.dehaes@gmail.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Rename "Twitter" to "Tweeter"
Date: Tue, 15 Oct 2024 19:01:56 +0200
Message-ID: <20241015170157.2959-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the name consistent with both other x1e80100 devices and the
dictionary. A UCM fix was merged already.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 10b28d870f08..004353220dc5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -177,9 +177,9 @@ sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-CRD";
 		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
-				"TwitterLeft IN", "WSA WSA_SPK2 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
 				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
-				"TwitterRight IN", "WSA2 WSA_SPK2 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
 				"IN2_HPHR", "HPHR_OUT",
 				"AMIC2", "MIC BIAS2",
@@ -933,7 +933,7 @@ left_tweeter: speaker@0,1 {
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
-		sound-name-prefix = "TwitterLeft";
+		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
 		qcom,port-mapping = <4 5 6 7 11 13>;
@@ -986,7 +986,7 @@ right_tweeter: speaker@0,1 {
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
-		sound-name-prefix = "TwitterRight";
+		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
 		qcom,port-mapping = <4 5 6 7 11 13>;
-- 
2.45.2



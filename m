Return-Path: <linux-arm-msm+bounces-32721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB56989527
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 13:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C82C281C80
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 11:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC34916EBE6;
	Sun, 29 Sep 2024 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgOqvH3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8587D16E892;
	Sun, 29 Sep 2024 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727609349; cv=none; b=JxsHK369K1kOnLonNMtLsQNt6dLvKHqxovR2D1LBiF7AVT0MVi9d8QwlynLutTeF9bVB2Chk11dHXhc5fUcKbCh21KRMhxtaBbgY4BVKWXUKrfHGauB8gys5AKSUazGeekMn0w3zA28zBayDMULkGKad7Uh2f7VdcMp/1AXyclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727609349; c=relaxed/simple;
	bh=qykHEKtln4pvKrGg5L3Lxb7V9iSJBEZMdWoRN5Vgcw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGIqfN05kQvpU01pvvg10kEEH2X1XBCCXp6jIv1Lf6r8YKkc2AVkmqVVwmQby1wdEVq9pVZUNePolJhXArbmEpKp8gB/WFt0VWwQ6f9VEu87E8wjMJn2DEg0MAtL5lP8JU+hecOsinZhlVGNcck78n3JeRf1I0yl7Vn4GcEGSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgOqvH3O; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so2595132a91.2;
        Sun, 29 Sep 2024 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727609348; x=1728214148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUS/SWZQ7q5YzY6AaYKV0bt64v6nvcVjZvan/IE5Pxc=;
        b=DgOqvH3OHFcZWb6uBxfhnNS+655UocfV8s7ir/1AqySzeBEnjFmxsUzn79A0K5iEjg
         3cW33gcrSPjekLcdeROpYB9/XCwnXuRO3Vep/WEZz//7og1Knbd+KpPGS4l2mvkAYOIl
         F2o++GVkOcws1FRWDMXmGLLS2y0AdbVFXlwvvK885nTh60xL9srbZgp7LXwwGYh8kf5f
         dxD0lxgUOSAAeqq+sNlNfyNaz66p0vtcmYxKxQ1oRvKHFjKJQ70OTO2c37N6FKkI/2ui
         ggsDji8UINrbxUjFgr5mq0/JLCaBoHEm2fnAv2pIOuitkUX4OHC45TUeXkYj2OAQ38s8
         3nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727609348; x=1728214148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUS/SWZQ7q5YzY6AaYKV0bt64v6nvcVjZvan/IE5Pxc=;
        b=N8HbmZaUnwI1USQRl3/0ANl2cLOclcM47QQSWkTN1iDS+O5azPpSX63f/Zwj9oMK1y
         OGIb22YMGWDS8MjJdyaRHKzBSlNGvrtcFXBjs1N33E40xxw+s8jVVsGkdSXiuPlIzgZC
         Y3gcg+6v/TcF04hKmj8OGZHohN5i0cjp+1j1VHwkzcjJmshsM36DZWdJI3WY5lVGJUSb
         NEVtL4F1nRAfn1Pnn/hg9v4iv6W3Vx067+LP3JbtoO4iQFBymxKlESBG1nNio2jzErpz
         YOM8glsu+GRB1zX3k0E3nlNk32UfRlIUhFHGX9Z+W5Uydu3jKebGHvprcGBJhwmLQAWD
         t/cg==
X-Forwarded-Encrypted: i=1; AJvYcCXFA1kwOid8r5rda0ex5GjVwMerV0wbAKX6Q3cRGl7RrOh9MIQquWSvmXxa6RDbnm2OZliPXnljZlqjAW+B@vger.kernel.org, AJvYcCXoD+ktl+qY9XAVU4y5lzKQqIfrblbXMHTzMgWB789Kt8TtnBAiXVJsNJNC0+vSWmmdMe2TjOTQbq4T@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGH1+fhWPwhzdNlLjBZouGyWkynIcJ0cB5gprM4EkSS0BC+/Y
	JRa0zB/lZ5jzhalgkjOijiFn4EwZ7hKxO77vVSTNo7RoGlEPOZfiHqjZBdLp
X-Google-Smtp-Source: AGHT+IH+OOQyOzISI6y4GhbqR3NurzC/djBiRxh8Ust4S38OfFSVGHqhh0XXfrYp8/SMtMqKKGYErQ==
X-Received: by 2002:a17:90a:684d:b0:2e0:adb6:d0ab with SMTP id 98e67ed59e1d1-2e0b79765f2mr10475404a91.0.1727609347862;
        Sun, 29 Sep 2024 04:29:07 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e11638e859sm893650a91.8.2024.09.29.04.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 04:29:07 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Sun, 29 Sep 2024 19:29:08 +0800
Message-ID: <20240929112908.99612-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240929112908.99612-1-lujianhua000@gmail.com>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bluetooth node and this bluetooth module is connected to uart.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 05a71462325c..58e0614cc803 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -30,6 +30,10 @@ / {
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
 	qcom,board-id = <0x10008 0>;
 
+	aliases {
+		serial0 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -797,6 +801,21 @@ wlan_en_state: wlan-default-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
-- 
2.46.0



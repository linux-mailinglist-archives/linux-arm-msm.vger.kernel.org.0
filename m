Return-Path: <linux-arm-msm+bounces-34176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBD99AF3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 01:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22EE01C21933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 23:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8451D278A;
	Fri, 11 Oct 2024 23:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="YVZQ8UqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4A1D130E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728688824; cv=none; b=fxNQGbZTvbs2tiFBdtwLFCgERH3DMPXHD6RRpvKz27yFfFmCmg9JDEXn/B3p0DYHqD+ryP9QDl1XxTQBgHu2FZjD1erSCpoqMVOHF+cSvK7wih10FLvAbPIcPv4MT+sPu4SJ2JHSpMq8YOoVYEi9wrdNAZSDo5mkFepyl1FqHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728688824; c=relaxed/simple;
	bh=N9nDXoTGhNDbp9x4MKIIxmkPH7u9rknjdJ489yrHSSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DAPz4G8ZRTZztZ+UpJ6EkcQ79Oy1qNGOhp5L+YD1AQvp3gI9gsTUfTZKoDJHDKhUPTKqidGhmoK/9WIsAPsvX+CJR1Xo5kcgC6CcTEPCGE7hpkwogyzJUzSNfIZrDnOPTkxvcvb2rPMttomR4GUBzz300ToMECqmpN7AK1qioZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=YVZQ8UqY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-460489eec46so18750961cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 16:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728688821; x=1729293621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAh+zbWt6KyD1XQvhob2WxW+jNwJ1pd4ci6zFtaf4q8=;
        b=YVZQ8UqY29WM06EwSMe2DKIsy1dCsUFwf/+/wBWUj5x7sylXbYtkFuAI23Okr4JrI3
         3Ffff92C0R5HNV7eupf33SovFEa9WOqUA8svB/i82a13lCo/Jy8mu5FIfak8lDEp13cA
         mEWbw/UrDNm30+xXx5b4Km9eEaTAbu1701Bn3hDZIrIagUThg//gGle9lwe5CrOXV13o
         r1BA6sGGep5ftp18hsr9sW+7eyQC+ED2rWrVX649E++5tCoHlSDp0U6GT4UhW+6/OF0F
         ryKeI6prqsKZJdEuz+OkPFkd8x8SB7MTbi5ot3CykUwqnY4W1z6jXzd6EmHn7EJdPGKd
         jfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728688821; x=1729293621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAh+zbWt6KyD1XQvhob2WxW+jNwJ1pd4ci6zFtaf4q8=;
        b=it4kPsUv5OFDEyQP6kKc3RJXp/DblHaIQIObLhqtsEnK92Fl5ny6GAbWzVOpI++ijS
         pee+OCB8p5mwc11hLhDitg+keDUTX2/8K7JXA1hnYMuuFfx5xin7XeydxnWRIUFsdEQE
         PtXgSWIgQ17PK8AwImh5BMgeIlcd0MlQkXxMttUM10cRt5kEotxnDjQfTthQZ1EU+21y
         XoI0qWv/S/WAgGChWHNwVowgTPNQNtdg3x8UKhe6FOUPyYZtSs0twz46ruWsI8YbV5q8
         ZYDSUAOW9yX1ROJU0z1LvS19kcTn4dfNgIT0b9MYWZr9IRXptrTId99NP80GmViiGlHM
         Io4A==
X-Gm-Message-State: AOJu0Ywchi9VxkE7qyeNzidDf/BUu59hj387lkx/6KbPMaxfnzDX9i4e
	SeGWqZaOsKqtoMx6SG4NDsi9NTF/CfCwMYETZ+d8FWvN7f/Hrw8Z9YhX+g/9U461GbcFtI9yH4l
	FzDE=
X-Google-Smtp-Source: AGHT+IEtCnEYlF69zuVjVFKwIZFEx8PnBR19MdQGWN4MFFkom5KeV6aUsF+uwV1sjfm7ynb6WreqRA==
X-Received: by 2002:a05:622a:53c4:b0:45c:a9fa:cbfe with SMTP id d75a77b69052e-46058444fb1mr23670861cf.27.1728688821143;
        Fri, 11 Oct 2024 16:20:21 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11c0a8902sm89949785a.31.2024.10.11.16.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 16:20:20 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers
Date: Fri, 11 Oct 2024 19:16:21 -0400
Message-ID: <20241011231624.30628-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 3 controllers support OTG and the driver requires the usb-role-switch
property to enable OTG. Add the property to enable OTG by default.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7778e17fb2610..fb16047d803c9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4199,6 +4199,8 @@ usb_1_ss2_dwc3: usb@a000000 {
 
 				dma-coherent;
 
+				usb-role-switch;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -4452,6 +4454,8 @@ usb_1_ss0_dwc3: usb@a600000 {
 
 				dma-coherent;
 
+				usb-role-switch;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -4550,6 +4554,8 @@ usb_1_ss1_dwc3: usb@a800000 {
 
 				dma-coherent;
 
+				usb-role-switch;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.45.1



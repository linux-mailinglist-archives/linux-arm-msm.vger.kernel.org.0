Return-Path: <linux-arm-msm+bounces-34135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404F99A7B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5876C285D76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F64A1957E2;
	Fri, 11 Oct 2024 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="g4sTiufL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29E191F6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660669; cv=none; b=lltI6H2CQyoqBV+iRwcW2kc/P7VUGIWmNm507xWHVRz4Nf/eceN5LbGMM8l96Oux+t6fmYO250xNcB1BleRMH8obmNaA93ijRgg+GJoGCrisL75OJYsLFjfP4hWE113l8HaxbbaOeDn7bkcKlMo20GmYaCywqikkSf8ptUjoMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660669; c=relaxed/simple;
	bh=l7jQ1X2oBQuwdyuwW7KQ7mPnxUbY84M9o4xS5gFr5Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIumMGVE3118bzp3A5UlfMotzP4Cyfl4jl3NM1IGq0p2UQNnr97A60Wrr8wFOchpmAulOPx2ApThSB5iF1m8eH335qJq5bD0CozqC0qHCzfPrE8l7HnIx3kxwddPDC6hd3iEKirAYfQFRAvh8v0LIRGoy1qNcGGkRhiJB/snBr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=g4sTiufL; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-45f059dcc77so22606291cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728660666; x=1729265466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fb2KcZ8vB52++p4TQiPnR8QcBRBwDyWeIHZkz6fpi0I=;
        b=g4sTiufLjFl/0P4WCDbmVNR41hUUyBshzw2UUWVWp83PxZzEu3Z7mC4/p7TTYNrjA2
         sOJyyEEhV0vySd+1QiDnORqKGJW0Fbu24MQPq/xhBaPw3hr0N2FHJvXfEekuirwaywy+
         Quippa/lbwaVfjl0SzkfasEi3IjNRssxg0CT35H/N4tMJ7Fdtzul4iL0dT9V3ppLVT8+
         ZtyVvI8qfshZTyIv7xIeeHmryKBKDalZfraBBETVZ66ekRUvl34Lb06ghPd9k/7ekxkt
         uJOKlUEPPHlkJomyI6M+BU6wA/SRB/Xs64b9giHMs2780RlC4UxnWn1IXRyjtQu5d8wY
         EL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660666; x=1729265466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb2KcZ8vB52++p4TQiPnR8QcBRBwDyWeIHZkz6fpi0I=;
        b=Ggclh9aca5SNW7mZYYiwPrghP7PjLNFRHzk5Tittb0c2jNGchIvsn10FFrTl+ub3Kd
         0a+RgckOckDngqsfs4lzhmu++gKbqiq1l6nLe3/jwa20IlosAPr1PyBKXAHk3/IMaf4R
         pQEDVG9TK0cfUNt4ffFpMCqxlE2gZlVhHf4uEcOyNvpgrJC/t+T3hDHBsTjoYOhaxlAi
         0NX6XKSKKCpuMdlZ6g8blHAvZQPRnC+4V358s6AHmx9L8IV0gQFsSAv3RsEfNZeb5VQC
         qU3U9SQFe5UaxbX8eAzV5GQhtwzE6PIJ2OgBFMrx/HPKRR99qN4/vco2j3p3qRyMusBj
         IhMg==
X-Gm-Message-State: AOJu0YznNKDkk28QjFpJotCPBaJp7sjNPHaoJPuIfVlWzejvAxtF+hm+
	mZm/BCzaK3TL1nqJxYLIxCC59waLysSgvRjGLeV65BW7KIDUkCSC6+MnlXRDvY6Tyek2azagoQY
	lGys=
X-Google-Smtp-Source: AGHT+IEFEE0XPv0XTlAVQlyG8kxf8Dil8h+qcmlGDZ/regXb5Cq3ODYbkDwLIinAt94OV1ArDaIyGA==
X-Received: by 2002:a05:620a:170a:b0:7af:cea1:2de5 with SMTP id af79cd13be357-7b11a3a6685mr404387485a.41.1728660666581;
        Fri, 11 Oct 2024 08:31:06 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148d6a09sm141714785a.42.2024.10.11.08.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:31:06 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports
Date: Fri, 11 Oct 2024 11:27:12 -0400
Message-ID: <20241011152712.31571-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011152712.31571-1-jonathan@marek.ca>
References: <20241011152712.31571-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 USB-C ports on x1e78100-t14s are OTG-capable, change dr_mode and add
usb-role-switch flag to enable OTG.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 08ec2419f95fc..8579c45dcb0a4 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -1033,7 +1033,8 @@ &usb_1_ss0 {
 };
 
 &usb_1_ss0_dwc3 {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1065,7 +1066,8 @@ &usb_1_ss1 {
 };
 
 &usb_1_ss1_dwc3 {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.45.1



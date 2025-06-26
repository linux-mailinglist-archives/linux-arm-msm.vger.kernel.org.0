Return-Path: <linux-arm-msm+bounces-62645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E44AE9E9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ABC33B107B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BF82E62BC;
	Thu, 26 Jun 2025 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAKTJ+DD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EE22E62B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944225; cv=none; b=WIgSQO+jwLFVJZ5ujx3/nRqO++vwxPSt/7FSyPeLwdiVaDvtTPwqqcCcQ9c7v9tpy/kWFjf1DSsJ68S7ybKKZwbVNn+qV7nmHUjANoi9fj7Bj7B3oBGn4xz985FT4mFuWIsyZFGj3U6FLbRRPAz+TJCx0vZrfKM/EWUoC1XnsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944225; c=relaxed/simple;
	bh=nsHewx2VL2AMVIeqVCjKf9A1TsR7pvGBhC7x1KZydl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilW2w+plmrF78fg3OjnCDNC7UGhevLfCCP1iKRgkMIZqmb8begfM/NqV70PevZLAdGXBd/DT691FluV3mFeJdDWf8I73d+TN8pKuNN0G2UhvWKbWYXvLdLbgxHx1QsuQREp7BI2Eoizik05qzbIYTNOpMc7WsEzitU4cMTjonZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAKTJ+DD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so558234f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750944222; x=1751549022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvZ6uX77hyNJJ7iBgJDLTyukijUbXgdBZZJDIwJY4lY=;
        b=nAKTJ+DDcsQlUGpLTZ3oO1kW2uVDYRH/RCk4rIInxZ1Zpjbe4iPIvSOpvvePRV52AA
         vi2zLLOYxb11oQLDLbSjU/Rv5Q2RxsxRtY1TZ0l0IoIyPNR7z3U91W4ceNoJYdUuqgNO
         B9C00qhoQOz8b297DnAj5vV6ub+8bTxGTGXNhcbWtQ7Kaw6z9Ltfiuj65Kp9xghhE0+a
         Whiwe8plbEv3ISxLoGUNxo5x5B9mIBT6lRXBQHxQe0+EXOBucDMsmUUeV074xZhciv81
         gmCgnSUTpIsrmAWTNWnHMkdzsLKMlo8RHrTSIVEnIwVJWbysSe5GmCCDyajp7HuP53u8
         S2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944222; x=1751549022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvZ6uX77hyNJJ7iBgJDLTyukijUbXgdBZZJDIwJY4lY=;
        b=gsepi5Frahdy6YY4mhKQtgI4n1fhLM+A3vcCDvcOUb8CN72Lp/acPLXorV75PUcpmq
         SHJf9/5AwdYrUsy8VxsiKCONHB2jDv8L8EK8Gf3zFrSXviyot/il9ApwfVG/h5akSeYI
         3Mz8aCVsdb/OfEw2gkzRjJWngvRJPR+XVq1nL9QlfzKoYLipwaVG+Ub3T8HlL4IBSd4c
         6HiMsBBeoRRHgxHxdGjr+uIAl9QavW2aPaZvmTgDHcg9g96/0uL7ZPWw5i42X3bLXA6i
         LLrwBVb70A2hAkb95aSb2Yljh6ZAsBX150WgfZZgLw7F5Y0oHdqqhmEhHzhjyfbtwK7B
         7dBA==
X-Forwarded-Encrypted: i=1; AJvYcCWiKURfMd2nodDeCh2v2mtbUgYmPgXpbYxc8s2eeo6fWVmYwJg+MR9Lw8dA29dFdg5wgSsPlwLlqps5+GHT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hoN+4VXhojie27TBECw7WKf5tw3CARy2jnr6xMvmCTIXEGew
	c5+Frw3w3GO85CO+kHFh6yzq9sE+IAwzE02Ajo1ig9SvTbJIFU73Gakxc8I8Q4CaP4A=
X-Gm-Gg: ASbGnct+S3Kxy74T7G4zC7m0NCvjCXr0xiqXPvTYhwyi+gQksDTNSXF/976xr2cL7b8
	8DW/vNYscuoLAj0A6fjuL2SgJopu/Kygu37DPfScfdmvR2JsNaLqlxjxI8LhDUxBmK/HwhTZzxs
	mN6FUA6lbpOrxZGWrYWomkZ7GNJUC4jRAw8Qb78SgrJePwSmNZEFZdU6luJm3nn/XN0m6B0JmmF
	vSflqTqAFhIfh33aPbBMfUltTRn7/qUuAH55dCukrbX3prW8TTXjawaSJd7Eo8F92pqQSwqXTlo
	Q2Pf+OjwXXtqs7BrT1MTefICFxp0Uad05E/Rq759voY41/AbInIAruzvgRK0xC0z2qJbLuNeC1U
	ZNKCcDPzhO/ckdZTnitMJ6bWYllyDXT2LAg==
X-Google-Smtp-Source: AGHT+IHLgWDCWKhldR992iGGgdKmiQvfEEbj/qhGSBInZBEK/oh7BDBrhDGEkY0fPEStJ7yCE/2CSA==
X-Received: by 2002:a05:6000:310f:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3a6ed64b8cbmr5290102f8f.34.1750944222377;
        Thu, 26 Jun 2025 06:23:42 -0700 (PDT)
Received: from toyger.localdomain (p5b29ef66.dip0.t-ipconnect.de. [91.41.239.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a57c2sm19868645e9.12.2025.06.26.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:23:41 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	cros-qcom-dts-watchers@chromium.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7280.dtsi: prevent garbage on serial port
Date: Thu, 26 Jun 2025 15:23:30 +0200
Message-ID: <20250626132333.351351-1-casey.connolly@linaro.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During early boot phases there can be garbage characters on the serial
RX port unless it is configured as pull-up. Add the pull-up bias and
mark the rx/tx pinconfs as being necessary for all boot phases.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd30100..60e4a311405a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -5742,13 +5742,16 @@ qup_uart4_rx: qup-uart4-rx-state {
 
 			qup_uart5_tx: qup-uart5-tx-state {
 				pins = "gpio22";
 				function = "qup05";
+				bootph-all;
 			};
 
 			qup_uart5_rx: qup-uart5-rx-state {
 				pins = "gpio23";
 				function = "qup05";
+				bootph-all;
+				bias-pull-up;
 			};
 
 			qup_uart6_cts: qup-uart6-cts-state {
 				pins = "gpio24";
-- 
2.50.0



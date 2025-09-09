Return-Path: <linux-arm-msm+bounces-72869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F5B5065A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 21:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F64F4E6F9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D41735FC09;
	Tue,  9 Sep 2025 19:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSL2oXGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BEC3570DF;
	Tue,  9 Sep 2025 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757445732; cv=none; b=q0hh54tDyge3ISOwflRlUm2lk1Il0+7kpAxiHxYI2VV4b6Gp8zbLQ5nLn/tDAff7ywy9SaLUItMGhiBH9cNFoWdUV+jXXoM6Z3JUPdb4XQmYf4Yae1jxO4/hsVZcwdq/ookctKeHu0qj/aDhUTLneabP9uZu4/TbCgt5Ja221/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757445732; c=relaxed/simple;
	bh=7+u1jA5G7vR+SgQyU3hQ02fcjSZ9CmDsoBCL5MAgOe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtJHcGUtct3Yween+pK+jT7vpQ9IorlMDom5mJiD436ugD2xiREeRafKwFBXyNpBw+a63C7kfTGOr1j/mw9cVCG9QRld/ZQi0qs3SAsna1pxluW119xSwh+s4qa9Sa+Qrl5QfgEpaVSp4/WCAzzMbJC7x3/xfcqPznn212lhlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSL2oXGB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6228de281baso6549519a12.1;
        Tue, 09 Sep 2025 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757445729; x=1758050529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhKBD7D6tXgePQdQ+FSTRWn73tPSfossVsPJPhsYyEI=;
        b=GSL2oXGBTK+Rx8RSW0oDHSzdXWFCQ/TLd2iZnba2b4vq4PwKhu2skS/G3szr0eOVoe
         g6CynPSnWHIS19IQVDYeOxqtwo8JApAYlY/0p8DOZ2uXyzf6TVv7Y+/XQq5zlFN8RxHs
         aKkObRsCwBKWc4bSrbPX3ktDJ34BnC0+W1PX5qBTyWUeQmDUDtm4gfSMGA4N4UBYZqf/
         dtms/gy/4tXY7fDZ8L1k/zv1IfaTEWs/NuSALmQm6ehN6xLYKtPOI704/mN8pvLyZzSk
         RQdQ1MP3Xnu+MNUpcmiO2hYc3Dbsgwz2y/wuWw+20Dcs0fqJWmR3U1oh4hd3j7DbAy0k
         vMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757445729; x=1758050529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhKBD7D6tXgePQdQ+FSTRWn73tPSfossVsPJPhsYyEI=;
        b=rUaYSGqPh+87edxpJp09OLtA7NVqrAO92UGwTMr7i1rOFTxMzcyHLLbjgP/d9qUwcL
         /0QU3cAJLcsYIoLxmd2ko/F11lAI498SAfGlUiALwjvjDFG0zrUMaWCtod5P+RDFei2M
         3HwbpPu5uZDievNIsJ3324vboesjv7RV2T4ZC9htANcXG137fVUixPOMhhOE+KazuQtN
         IGVbVIbjinAmzB+xkIgDQwbmskDfExpdifa0QxfXfyx5S9mCeS7t1HGc0lDhzPWMJU31
         Cdb5LDRKm1fK16SwK9xK5ZRDfdX96fUSAHMT+itpE7Z8WxfFa9hxOAR3bo9Q+Ar2wZ2B
         N1KA==
X-Forwarded-Encrypted: i=1; AJvYcCV6o+U9HPhrolXnJxqvXsyO6tGJM8UBgyFxfFDz61wVzjuSCRYP4BK0wEApBpn7sofUDywv4IcqETGQ@vger.kernel.org, AJvYcCXHZiuYWO3JQozi5/gakhX7IX09gI0kW/c77rERpLOpHzT82r4ZhXnaR3DuQqnBOqZMfOx8qVz7DTw/7m16ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34mTNpQwDZcQxaRQLBIMxhi9itKVuVqpJvRuo+OipCSAbC7Gb
	GbA4mGAfVPEcpkRdvZPa3urf50kjWKNyqLG2u04BPtNrpFkEu4opzST4
X-Gm-Gg: ASbGncvCUF0LXXkPHjFcIfnfvIcjDguWNFNGr9CTX6bMJ1FLg2gfUqUWQvJEX1ze0J7
	4HSKmNqIenNNaqN5Qrqx6SMcKrKIN9CLgZiyD63vDjZ8FzLDGM4V/4nYF7nEt2ivdE+EQJ5smTT
	dhqB5T+N3UtuGxLfS7nvpkh8Fl/3kkNW1hNbR6Nys9Z3XR/jF/bcx10+OfDEZbD2OVi11acl+Ka
	VNq4Q44cWQvHYOOJp4OcauOLcpPsRMSui/wZTn/I9PtlYzXOAwMB3pHUGohznKHvUaOI6IYSoUI
	cR6Tm5l9Puxnrc5UUmAK6DEG6ioGBosT0vTi5wk7UPLztB1euhrHl4hNjiaHtlt8ydVOIzqnbyi
	9DRiKBra4X/uEfYGzwkh5
X-Google-Smtp-Source: AGHT+IGjfmP7bIn34pDjiDZwcbXfl9kcY/cqmVDaeuZPZbXqPjcTAVmu4PirJeEcbxZEtFUjQ2ZH/A==
X-Received: by 2002:a05:6402:358d:b0:626:1fce:d2f2 with SMTP id 4fb4d7f45d1cf-6261fced5eamr10535366a12.16.1757445729503;
        Tue, 09 Sep 2025 12:22:09 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm1847142a12.46.2025.09.09.12.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:22:08 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 09 Sep 2025 22:22:04 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm845-starqltechn: remove
 (address|size)-cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-starqltechn-correct_max77705_nodes-v2-2-e4174d374074@gmail.com>
References: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
In-Reply-To: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757445725; l=852;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=7+u1jA5G7vR+SgQyU3hQ02fcjSZ9CmDsoBCL5MAgOe8=;
 b=nAH3D6fEEdB4DDqm6bjT1k9Tm/3PUoslvHkrxj/qMgkJQP7raZ3+NY7TO2TGfMT/Zbtsv9hmw
 aXrSmFj2+T+BLneWretbV1/rhGqfaxzfjCT9ZlR1+VAHS9QJJeeHAHC
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Remove address-cells and size-cells because unused.

Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 9eeb4b807465..8a1e4c76914c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -591,8 +591,6 @@ pmic@66 {
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		leds {
 			compatible = "maxim,max77705-rgb";

-- 
2.39.5



Return-Path: <linux-arm-msm+bounces-83916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 018EEC957DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 02:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69CF34E1B31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 01:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BFC1FAC42;
	Mon,  1 Dec 2025 01:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9rSoWvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27491DF736
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551764; cv=none; b=LPKNu7q7X2Vu79Sg/PT/qHaccl43CB5ERyOc3dtKnm1ySGi83Dl+qe9McZ15CE8hcIPxGroc5219YnL8e4CCEwyK9thfaddvrMHDZj/LoC28/p5OotwT6QYOzXB4+7TqREftTTRZgaA+ooYQVcxTCKtvVugmg9v5gLJafLJWhsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551764; c=relaxed/simple;
	bh=OkCDO9ck5Q4rj4jCmkv7rseTzENdZD+IfBXalzly0hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QisMU2HmJpVwrLgNfIwDAMrT+uMNXORnoXmCbFMBJPzRCzvUT0E30QailGMpxr7b5OiokH+4V/Unkb2II9RT8iVtoQ7DKgNXjAiVeb56inrSZQgRGfRWIY3yzc4W4s6M2rtYpEca0ee1ALBWwL7PfG6KerRatW938yEGW8XsoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9rSoWvf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso28447205e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 17:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551761; x=1765156561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIc9HiGTae4NKzXvKMP64+f0l48VwiinzatOpKlXzB8=;
        b=i9rSoWvfZe4uuG3eI56V3MCwO/elqwfYQj+MITbG1BrjMXeTLL3P0WbFh1x8vpxz8h
         cKWzwyjYuL9pHqKbVIeG5lX+LmcIwfo75RwStRu2TkKe5frpL00b5iA85BFXWMP8tOZp
         HkZUCShQTABCXb5K+7RLyxRaRilvUkNESkbqvKX7UxfHTZ8lGXKHOz6vw2os4kNHSKnY
         0iw6tTgzFIsE2jYY9F3K1e/rpoaz9+cLw++OLoqVNGxIg1vPentu9UTd6PfOQvW8UD1D
         vDfiB3Ny3PpvEHFGGYBrWiYE0eqzdDJG/Me2mwrHZLodbq1rE+vg2+TDlo82DelOgmle
         4Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551761; x=1765156561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TIc9HiGTae4NKzXvKMP64+f0l48VwiinzatOpKlXzB8=;
        b=ns/eiwsCSaZsIRr4cWIZxTcq5uIQZU8vCxFrfB4YqYiF1BmbWveyYHjapTQ82SgRzp
         tHcOBdyCGHd8zW8I8jHHyQVt/BOxwzyx5UXcIGEsW5iktDL3rcVXyVfUsq6n/hqmW2Jh
         t8xpbJ87h7DxtIDHuJMwsy0PTKkXbwQRHI8wTMKdOx8akGZZOU+m0FXgsMtMrojyD4sZ
         5IG80VCV9R4oVlBTf3cwggllbgbfPRUkdShSXTmkBMsdesSCXdYAc6kTfjdS/wAsBUSi
         ikyniFW17Wc2Wc3jxQtBapXz2w7pTvKGchXu7+enE3aqUUuNgnlnnltyGVKybnpwY+jv
         vPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE7hwCwtYAO4heMcmqPHVjUurxzXgZsjedr8UyvRgwJnc0kyz1qPKYlveeUgQnyQbYD9BcGd/cpeNr8MOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNL1X+K2WF+FQ/MJmXrVeDr9sLVosnKxWDrzfAxEqPIeR3eTZ8
	ceCNb0OPH3O3OJ5vlD1YP/49LIyFvUbMVxrMN971aQ7rnOtNZQxnGrE+
X-Gm-Gg: ASbGnctC1tA4OFM/ZheuSMps97XHLs6YpIyZ201gsmaqhPFuHZxPZ15aTKK6XjAw9MI
	AkLCsol9zVI7X5Jm3nG3YbCJkeyBWV1fGkatNW+0ixsH1jgVyhYkpHvaTBg/zvZFiZb33dzEjo9
	z2RZm3g7Z8evoK5Zp/5ICmLz12YXJuoqKVHc6ftOK1vYkwloE2Y4S3NYo2x8pt7uATSN3P0xoFS
	L3eZlHgx35RoR4phQXzVUcy7mhXh0PTQYM6Qtr+QOQ922B6t9hUobI8eN/vpfK7kvBmjvVoOjGI
	Ke7uErwBR1KzPVgV16q9NgsQLOdgb4Q+JA+c9HDBejfw/onSDLCK9BnwDAMSf+thR3AHtXjoqbv
	N2dpMc0Np0GhcCV1Y1crd56AgXDBIHdlD5zKo1se63X7BnhisCyiLm6FxqIdgBRgoKFyPlCarmw
	36oKSQDwmoJCbKjN/FcqCYEL/JCdKFaC+MQx3+wpwWsSzI9hr64Fo5/fFadLPPnmd9
X-Google-Smtp-Source: AGHT+IGm4gC/z/V448V0Dya/MA433KTldbgXox5LV2IX+XB9gf9DTH0dNZJEX3DhUVGCCIzrPAaDhg==
X-Received: by 2002:a05:600c:21c7:b0:477:75b4:d2d1 with SMTP id 5b1f17b1804b1-477b9ef50b4mr305611365e9.15.1764551760881;
        Sun, 30 Nov 2025 17:16:00 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:16:00 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: qcom: x1-microsoft-denali: Disable rfkill for wifi0
Date: Mon,  1 Dec 2025 01:14:49 +0000
Message-ID: <20251201011457.17422-9-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Disable rfkill as it is supposed to be according to the ath12k feature
flags in the Microsoft Surface Pro 11 ACPI DSDT.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 64eabe2b96cf..0bde0db01f47 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -976,6 +976,8 @@ wifi@0 {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
 		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		disable-rfkill;
 	};
 };
 
-- 
2.52.0



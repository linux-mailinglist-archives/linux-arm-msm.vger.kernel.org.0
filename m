Return-Path: <linux-arm-msm+bounces-9091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F0842D2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF2C1F25224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BB27B3FD;
	Tue, 30 Jan 2024 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QalN87VV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8636D1CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643780; cv=none; b=Yui/29zFgKZcyxe0vwGY3bKtGlaQXWrVxgi2sN8LjZsrC3Ic/RoLLOOuS/Nl2AD30PIUx89GAXDiWs3ew70CchREvthxpjoUEzeuwROkYT9FIFbsBYtTlRuCskTgnB5pcaC8vjs3FeiQR0YsLIDdzLI/2N6KVWXOCTArLi+pDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643780; c=relaxed/simple;
	bh=2eFkLR4eZ/BtmZ/l7yjfhOU62vZHUnLvICH0ly3+krE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJ+TBZqtams//xaUC9wvn7W3gJ6uxzb/of3LYpeAKSozmVgLrQMXIT1YPGsKkIHzvNCXnw/YtI9CXencV12O+9kdIYmGlUps7z7m0rQY05HcHgShbV9d8syAwC+29vBuRVgtGzwo7f+WZ+KiUKJ2eKiEpsAYaeRm+rPhmW8p/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QalN87VV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5111c7d40deso1452456e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643777; x=1707248577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdXbeTNh6iyefMZHctqCBzD+zNk0OH3w+SGTTvK0KM8=;
        b=QalN87VVnUIMjLGM8PLgF7UfEZ2k7/IJQc/rF9PmKe3575sAdm3Ir71yYWwTn0HiHo
         pGgzveJ9H4UfrxG99+2Yc5MwMl4QZ2b9/GXhc2kOGdGPvD73Cu6mk/bnJLYodtIBqCUj
         L91D0UqJuBHGNhJ9JwcnOVyVx15Z3G0KZOGN0CBge09lvN8ys1ZqvTRt15bG60z9uJq/
         oXZYU2FzCw/7kw6TMv9MCTPH9q6B6BJ99RsZ1DL4eYaHHTItfjh3ItPlUMV2l8c4CMGL
         uGp9Pry2/ODwIa4N5lbjLhmxeP1ubzn5tW+mR+Trg6J7V3gdKRa9bt6TNyZS7eECTVh0
         wkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643777; x=1707248577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdXbeTNh6iyefMZHctqCBzD+zNk0OH3w+SGTTvK0KM8=;
        b=XLUtK3qPSyBZavzSJBWRzxpVttsPVJDdud2CAZDQAdyExINn+YPO5av0ODmhJyBCOU
         6Q/++vjFfBBbcb6+OnhC8WAlRJ4yNuHxZ/DCxnwU6mhZXOYN/rkMKLsRBw8OBKNYzdij
         jDkZEl//Dpjcs5jl+E09dE+AyFlGPWR+VlTo7f7yjNWKMX9wSw/6kVJJzJtpcVhFg0ik
         YqDs7giEab+8WQAelofUkdOCUfGCFHkoS1oz3/TEHzpAYdtqbK7QUPMoJlbeqWHtdFHn
         TFr4RZD7RmpflY9E01wCQ838xqmk3nk7jPbklN6SGRjbZSVw+LWzKaFWzkE4Tra928eJ
         MOzA==
X-Gm-Message-State: AOJu0Yw2mSR8W8B7UOqGncknewsNE25m1F8i/+z5aLR4QDmSWOOXnLG5
	7XTBccGfKIM+s5hXoCsgNUi+xJWmGcsf6cL8uXSWcUVeYeCXVIY7L7Foykm+x8c=
X-Google-Smtp-Source: AGHT+IGhrTTkvS2szPiudwr6HMJivUfTY3G9m3Hi5rpkRLO4vsd/be2hqP2KQJSKVUf6zwY4j/0IjA==
X-Received: by 2002:a05:6512:2353:b0:511:15ff:5628 with SMTP id p19-20020a056512235300b0051115ff5628mr4118151lfu.22.1706643777075;
        Tue, 30 Jan 2024 11:42:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX1fDrvqj5sFGwMOkhdAu6wNJNu1QevcgmET9aymsuddbNhbzLUZ4TVcfRbFndwnA8ZppKQHJwx59lWLMLlHpRqquMBYXNuCXobwVcTbzelG4OuD1NWa3u3pxxHmpg6JWzTTzP5LkyhkuIitLXHWiWl1gYhXifno1u8uiq93zhoJYuLTQuRvRUzTLK2Gtu7pu6+aXWgtdcOpuDHfPcNc+4K9Ho87UY+LU3GySEnDefPjXtNJ73ZxdBzO3u2Cd7amG0UMHfFODdZbMRpFHOhQRN3kRoN/+kRWwaFwdAum6KUK3XunzYg/HbCTdR7DhSZ3UBs0xxVubRnXqr15eBHqdomUFKcFeGHSHi7KVDzDYqwzGYj1fjuN54ZbqKYw47SO6B562z/MG9kOxXoNzu1ttM8VKoDj9szNjA1gR0XM5ctfzHd86tG
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b0051021a9febdsm1552145lfh.153.2024.01.30.11.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:42:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:42:54 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: pm4125: define USB-C related blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pm4125-typec-v1-3-e8d0097e2991@linaro.org>
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
In-Reply-To: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2eFkLR4eZ/BtmZ/l7yjfhOU62vZHUnLvICH0ly3+krE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rOQFtHA9bI3vurnzUFC7E/fv1eTavIMcrmx5y80BNmu
 rLGpjGdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIlgQHQ3d7zI+3b+SV9Ut3
 Rv0UXZQtcUj0xntjfq//X2/tVH4kJbR6zhzT8PdmWy8Ztt5NSeHQmbozOrG7vFB5GmOHM+fi7Tw
 7a2dczDXlv38z7mdIxGUG+XvXuk8lqE79wX8ywOeqQPz2Bc3Cm/fMs0/ZUHVTSnxRh7BMjuf1pA
 vlYn/M52xUfMddqjUt2fnaDT/Nn6sXV0x7UWeqGnm8RGzy7drM7sKZn38eF5rGFX722VN3jyvc0
 Ty+P7cYBhdrr+Res2F58Bwt/aJNr7b3K3TcTRALWK0cnFZw59kRNnv7+qiMAl19fQU9oe02BfuW
 sjBMFzrmqxZ9y/340b0/k2dE1/2In/NCJzI4yOpc3NxvAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define VBUS regulator and the Type-C handling block as present on the
Quacomm PM4125 PMIC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index d886a9e4b091..cf8c822e80ce 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -36,6 +36,36 @@ pm4125_resin: resin {
 			};
 		};
 
+		pm4125_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
+			reg = <0x1100>;
+			status = "disabled";
+		};
+
+		pm4125_typec: typec@1500 {
+			compatible = "qcom,pm4125-typec", "qcom,pmi632-typec";
+			reg = <0x1500>;
+			interrupts = <0x0 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect";
+			vdd-vbus-supply = <&pm4125_vbus>;
+
+			status = "disabled";
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.39.2



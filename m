Return-Path: <linux-arm-msm+bounces-9059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B598429A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 17:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBB81F2BF2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B086B12838A;
	Tue, 30 Jan 2024 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WXpfq+fL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8A812837D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632726; cv=none; b=gPiq8qW2+Na1brF4lX43yZM0cdCW6JayJCsy9Gp3JJSoLD45N3c2mg/mj1ISmDTDWX2A+B/pw0q7yGJCJwqZOcD/6vq9qtKjOvrPjT2ImTQSDXuzl99FaySRktX9iKImtsvpFtxxLGvOzvBMc2VgSH9sHbNgA5sA3LzvRQcqHco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632726; c=relaxed/simple;
	bh=XiFXtXUgBeCWIuqGLN8UNFtmRcIWgYtyn5r3qrXpKIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQGcBYU6Ggh0RHAqq24PD7Ztv+etF2Mnhfm9TnGJcfwy+XbwAati77NuO8v/Y5aBgfJ9fJkLjqL9fZvW+DDu6zHJRKufcAmGbPziUf8nRhTiMYZRGBKIrHLHzFpvl+7c1akYXyepqD4kRmrsBVzeut0aXmlAmmdZGoGrOtgXmsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WXpfq+fL; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cf4a22e10dso48754851fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632722; x=1707237522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4VJOtIb2gzJ/Ge1sLyWe+9sjQ2zPVQUoV7ZriL+kag=;
        b=WXpfq+fLY9HK4izTqAKurHeT+6D3CRilU6WwOr9KN9K4MV1SpEW6hntMCE0C8ORlDp
         eJbx/wFcx0BF5AXkDOwNpVU4Q1DhB4/dfbG43ipuwZ+mejWEVrJVrcYQ3B7zF4OCybHT
         cTXpKM1J/KchDsiKG9j4AoMIEONnavKpbP3+ozAscDBOQSzDkYB2O0WSIQuHOnMjSCTq
         jpvH1PMBZFbo/glm/6agj5Sd0IkdXzAaz7h+7y5dde4xO37uXAhehj8+VT1e4nxotIOK
         UQAveoVil27TOm9yG49P1+XiHZ5myMpDlhdnuxYY7CeYkUKiGPy9E2YdvbQ8TBSZJEWc
         VOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632722; x=1707237522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4VJOtIb2gzJ/Ge1sLyWe+9sjQ2zPVQUoV7ZriL+kag=;
        b=HAzH9OBjjhmWPaGEc4BWy2jZaB1L/UXPzL+p8+Xezzhb0vGMqpvqmFiUCzJUyzKMuq
         XghqFHhxJ5+kSjelztN+++NIODPMLRAcW/2r0bcwHhcC8h9ENr+QWPlex+khhWp7vBks
         osV5XoHigymcKhNAbtRcVMbPt+5hygrdiTDsiUWGRBkyhyOafgooNxUFR3o4bXkLMZx7
         vhVKZbx2MySCc5ozcgCtxntccyw7iUvJCf5NQjUgQ0ANj+dlOaAhbZsGxfwM0ZdsnWAE
         l+JvDh3lXw0tyJRI2elpkWOtGUADqvFKUunfKOyAiv5X2bFmy0Lf2VY5U0lafgIF895V
         wCWA==
X-Gm-Message-State: AOJu0Yygr70GzWcObuQrCRq2H+OOekpBFQyoS+Y3VnybFj/q5rEmjAYN
	bRdi16W798TqEKh8JHSOMZX48i2Rk3DE+67OuM6MJDKTFZ3Mom4pE8ViSAu0Kw4=
X-Google-Smtp-Source: AGHT+IHJ6kVsOBZJGy19jA7M87XMNLU9GqkAiefdnQnvWehUGH/2YErtZzWclz5F4SKI2QHKE7Eiqg==
X-Received: by 2002:a2e:a404:0:b0:2d0:604d:fda6 with SMTP id p4-20020a2ea404000000b002d0604dfda6mr956534ljn.44.1706632722284;
        Tue, 30 Jan 2024 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUMr96uRImDqWUBlcBNTjPq/VQtrJDOgFWRoK1s8oidK0MV+hqXS6XthXlsJec2TNOTua+n+zZVf7ig+DmJqX3WF/pqKs4qobFn6pm98Qne4R2FWRuPbPaNoLTKOz18liaNHRwMv7Ck3zL7UaeOHn+NGlj4EC7eylq6f4O8/FxNjTnspwhkTUCk2STdgRekxljBmw0ThGYEKY3r/fecZBofYEOjDec979dWq36dorOZnP9VzrYfbCjuDWHNDMiklk3u4+8QKhqhVx3ZS2zcpCg3xSDy6jQPn6RmuSkmR69uFTBxA2LodnBcfxuQCvkrtYgXJCVevO/5l1a6bjIsuAZYKhbCT40XMWl52rmawRmhEo3JifDvs4zQEo0HHmOQZ3iZ2G7vRYPi/6t2ifP3oG/tZ1iMHO+xdL0U6UCBNYPDTIc5iOA5WsbwwZH5324Myh2PpHQM1gl/UxMxJex1SLUHDTdRA+m/7N1SlRFQUNYKR40LuIe9iQzQGMRNIY1nnTuuljKsrqs=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:38:39 +0200
Subject: [PATCH RFC 3/4] arm64: dts: qcom: qrb2210-rb1: add firmware-name
 qualifier to WiFi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-firmware-path-v1-3-826b93202964@linaro.org>
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
In-Reply-To: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=727;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XiFXtXUgBeCWIuqGLN8UNFtmRcIWgYtyn5r3qrXpKIo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluSYPBV7e/wSr8zhiUF2LBnl/ZIFpoBsz42qL9
 C5+SqnQqcGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbkmDwAKCRCLPIo+Aiko
 1XLSB/9E83Xism8LqXSlXFQ6uIos+4MX1UKarwMt7kKvplSaK3TRWd2tLa1oov9G+f1Ovi78lyz
 Qpmxdp3yYxByLMRidFyP5Kwa2+QARD/jllGugCE2IhAdVcdvIpENH3xAEqvyOahzZ2e+ltoRRqm
 PMEVhs+Ov6/1iR1uvDOSDnsJsBWt8mLhIpLtVnfX8XDKGaaZ4MMuuNyR+sKg8VPeqRUhSznG8nL
 d2OFEBUne/HOX1M8Kg0Q8D/DTVc6Stg2g+dcNtLc4xlZQ46vhMRFQmd3esO8Xl1z112ibuUBBir
 UstnwmcIR6Uyk3VvxWXEeWUBpJrT8QFIOJHTx4oLiWp+uB7W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 64b2ab286279..338a12f98bfe 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -540,6 +540,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&pm4125_l10>;
 	vdd-3.3-ch0-supply = <&pm4125_l22>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
+	firmware-name = "qcm2290";
 	status = "okay";
 };
 

-- 
2.39.2



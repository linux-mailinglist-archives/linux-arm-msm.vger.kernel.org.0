Return-Path: <linux-arm-msm+bounces-31149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF996FA33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 19:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11E061F23AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 17:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE2D1D5CFD;
	Fri,  6 Sep 2024 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dUNtNmEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8361D45ED
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725645380; cv=none; b=Yio/btWjNxLX4NwwyxHJuZBeqcNEKl0FImJNhO9LET8pq/JpeXBoaxeZ2TPp71QuRz4hAmL7evYw8BiaJA0vzGTLnchEYVu6TV3or0kUtpMPc17plkOkOXitStGX8OqsBnqwva4MERA+0TdiI6E7HzhfGEIuoOjcuCcp1Aj9JVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725645380; c=relaxed/simple;
	bh=5Dxhejo83b7BZRGTuSJpWWW/kENxrchRxMg5qxt98C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emBEpcuC79EpEIcY3YVK7H8OqWuIya2KnULYLKfKVVfwdPxwnJMNYq2MktzlhWyCUs7nRLYCKLo4Zcai8Kr/T7UPKoaWEPBQbdsn9cOck4vYRbc40Pv7JnRVEuT+/MIOVx5PC9NQpywxRJJXm9DonpfhTnQCmspVl4njrAwb4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dUNtNmEX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so1736068f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725645376; x=1726250176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4TzeGhPZPdY9JQtDyTb/OAE6vL2y5An/c6z+QfwjxM=;
        b=dUNtNmEXJsYAeQbJD1CH7g9YnUwRQy5uYgRGobBkOoaWkY6oCNNkIfMRKz0eiR4JsS
         HtE6VhbD5xwdIQcxoUiRG1HemR/JIUnh6eL7/LaLon26HdiYshRhRoINLlICfQ0dLpYG
         nH9oS8/BK7fMikjNrMcUVTJpoj24nmlXorXBtz1h/RQP1baPeU5gOkAU/SUP8/6j446/
         5m61fQpAvJML784ovms6cUpp8gF8bFTm9dh3YuSZCghtBbBr4ensU+biHkYwtBIMKYnz
         lQHz30naaoiHF3wF99rngvQ+i92zt4gXb/oxNQrEBH0+mKwxwBCiwMZMJlhmbDftzBDS
         3C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645376; x=1726250176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4TzeGhPZPdY9JQtDyTb/OAE6vL2y5An/c6z+QfwjxM=;
        b=EvuraQHjl0n4iJ/y9qq6+aUHrTIdsg4TmKJgJgcEQPEOa4Ru+QHLDtYEI5FDIR04KA
         zeEkUu2BvvkgbtZvzM6dGpN8Jsz+LEunYccoi3erSZ2jQ85B106Am7cnzhpgjmIlieSS
         hM6PXQHU2r63+2bMZhtViJNfpQ2Ps9EgL05lCr5XWkG6H94h/bxZceY1FBG5197FOnVd
         iseVYc84E3Tk8o8vpCROrDykez8Jtx+nEYrzMogXyv0AjmYSqzeqNnq34VjqSXFK3lC7
         d33YMC3nEXjJoFF+q6xfl04D9zvstO/+wt/sgsWN1bMeWAv07KpkuIP8oQfi27DakzvX
         fETA==
X-Gm-Message-State: AOJu0Yxh2cd0w5nDsTlu1dZIs7SMYNrw/N+M2+pUWMdHPBt075gU42bS
	/zmXIvrgxP9+hn9oO3Ay0x03NLZ3eMaRGuiYh2ONyHG52aYUH9D0HDIRrcA5kaM=
X-Google-Smtp-Source: AGHT+IFxyYpm1+Wx/7DVs3qqKFgMu0ASeliF/6+BZgOsY8EMFF5xuo1tk/sxYZjrgIL7z1Nks75JyQ==
X-Received: by 2002:a5d:5547:0:b0:374:c8eb:9b18 with SMTP id ffacd0b85a97d-378922b690emr69546f8f.24.1725645376059;
        Fri, 06 Sep 2024 10:56:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37891607e58sm442920f8f.24.2024.09.06.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:56:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 06 Sep 2024 19:56:01 +0200
Subject: [PATCH v6 2/2] arm64: dts: qcom: sm8550: extend the register range
 for UFS ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-wrapped-keys-dts-v6-2-3f0287cf167e@linaro.org>
References: <20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org>
In-Reply-To: <20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zY/HgQ+2tcsdye60YCD3+U+QkHXsvRRa2dQ79TLBPdQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm20I9S0Qt3/zuy72QmUJYIIU8xGCynyQ5dDGRK
 BRtjxHpihWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZttCPQAKCRARpy6gFHHX
 cjNiEACmLWN0X1xCfKus4ArBRLUfyG2ZkiKP2bDRmDf0hmjpAS4IeOtBVkbIg4pmAWkHx1DJ27Y
 zyqjJ7RS73+oGP0LUfA4jsu5RHpON4QyFwsu5NjjXjsRv9qKsWupFMryzRkfACJNn2/s+llaeqq
 mir7mcI+cxuF4sZ2TF7SK2uznQ3MPrTWhzQbPtazZkIPQ1vMkgfkuJziN2pj9/mq8CANUnrSwi1
 75pciolC9HA9oTzI09QzLbLUS8wyjsD2xc8OlQOfWZ6yNTl6hto+HJTH6sVepobwGanECX1diRi
 dhZSCFw7FyXImGECeEyVaJoM0El1OwxQ/Yfxwna8VJ7Wje8i/jDrkLiLAd7K4dDnyKa3ymVigeJ
 EdSGaW+tr5uM271Yzb2fUKQWG7BEz/woSAY3lJJyT8+4PeTSSHK8Prf5OussNaWc17Uh1uL2+x7
 7MaiDXSHLnZJnQOwXAip3DPWSwM9MZajm5E9ZogHvbomwXuYj0EO1Lv8kyo7H4Gs7WIGQCuuwR7
 KbfY5+kRtmvH3M/dbiKOYacIa2BTtqVAG4cQYnpSc2ekEJ4idmwKNUcha1c+zSMqSxFiudEDOSG
 98/D8OLgGaF121KGpqH5Mg7Y4ybQYAsmekFyzbCKmVBQtEqVJATDGJ7kk56RAMKFGWEw5yMDE1u
 uXrbUPV8A9DQgbw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

The Inline Crypto Engine (ICE) for UFS/EMMC supports the Hardware Key
Manager (HWKM) to securely manage storage keys. Enable using this
hardware on sm8550.

This requires us to increase the register range: HWKM is an additional
piece of hardware sitting alongside ICE, and extends the old ICE's
register space.

NOTE: Although wrapped keys cannot be independently generated and
tested on this platform using generate, prepare and import key calls,
there are non-kernel paths to create wrapped keys, and still use the
kernel to program them into ICE. Hence, enabling wrapped key support
on sm8550 too.

Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f..a000785f3915 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2076,7 +2076,8 @@ opp-300000000 {
 		ice: crypto@1d88000 {
 			compatible = "qcom,sm8550-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x10000>;
+
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 

-- 
2.43.0



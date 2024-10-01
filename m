Return-Path: <linux-arm-msm+bounces-32850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED298B710
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2823C28150C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1960F19C56F;
	Tue,  1 Oct 2024 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TrMko/O9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5416619AD4F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771756; cv=none; b=I8kDFi6hQJdRD0Bel6G0+5g3TblOQvAAc7F6jKGkl1LpWV+1flE/mfK4Rzwzir2l6YD8PqThgck6nuHIFDHki9xq+UEC0DQWX7hIau3GyD01yC10eEJeTspv+ByQ/UVLOwGqpeZfJfbXR/uX/ZY7L3YygOI/PBd47NVsE675mMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771756; c=relaxed/simple;
	bh=P/FayWGoin4JurDXa/OdUCbrzwJ7Rj/yGcFPf1CNzFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZcmu+Azu0N7EhHmULRjcosq35Mu8uzVP4X/RW67e/8FxJBJcxQGeGJf/lwjls83BbPfUew1MMjnyZeKsQcfE6onPjwqBaetUeqQ6vLDWpQLmdv23pvD3hqEmVd5C2odDX789nwPyirajhB3Ag5LmvUz4DkVD9xGvuMlcFF+0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TrMko/O9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso2183252f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727771752; x=1728376552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpEOmkF/FdshWXRpM21LYpftZo298L4Xzt+sw9TgTA8=;
        b=TrMko/O9Cqrtk0mz+A2to8H5gz8MBTG5jmiyFOmYnXTqiZ2ZrLFKyZtTPmDjChFjbA
         uUlF9XWbZdTenyEFidBlyJHHn7LLQNhfXV6E5R5VzYoodNoB5XVnV58mk7hJJErP4rwG
         As1lWJY8anuH5mkVKKYlcH91bjtNBwTQJkEVIufNvAOG5yaIH6mNu9+bEatw+lqkWp3l
         IJa6P/r6HiAtNLICWNpaJf0vCqhTJXe4Op4A9w9JAKTTmcOk5ZkUifIuo4gKNz3Op/6t
         2HI2Gest9fU6jIuv4o+80/3PuwloBmz1vU6DtrqMyW2p51PYKaOfLh7Gbs2DnlGQr+tr
         bzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771752; x=1728376552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpEOmkF/FdshWXRpM21LYpftZo298L4Xzt+sw9TgTA8=;
        b=PmrM/jOzA9Po5UGdenzoq5zIDr7xYYf/foblZ/PHG4i7CaH0RQ+NuYKJq49JlMHULr
         l4dye585O8tFN/Eu7wNNZahdw4GUjTcqivqtic+a8BlC19jV8Q6k3Xd5kk9HbWjXYPLA
         bVuyqolduy2Dubx0/hqpOx5exkdVXWkWJw80mLWVwM38QsaS61y9hc4/7JIOorPDWen4
         FsHk3LaDE843E/coXhoZZ7jMftZobHNiDGdsAw1WE6U14GhYvWXj8jdWKZHnufMwdKzf
         kh8R8SnRuaJvljDUdbZaPqwKyy/ploCxRSqwCTFKBvkFLtul3DCceD8oKgqnhYRvw7My
         Qbag==
X-Gm-Message-State: AOJu0YwEE8kuMo23x6RE6En5vY3YNpAjv1MOitxj+QQnkBadIELrtitR
	fL0IMM1BCjESX+esxN1GSjZ8U36VDKNwt7zjxUwmKHOw4dwgdc2s8oGjalQ3qVM=
X-Google-Smtp-Source: AGHT+IG6ZmaZZ8YxKlFomDEAnBjdEAhWgPbVKETst7Kgv9JsI8SIFK3CRCs22Aa+792Kjv9yH0uCbA==
X-Received: by 2002:a5d:6585:0:b0:368:117c:84fd with SMTP id ffacd0b85a97d-37cd5a6b529mr9665938f8f.3.1727771752515;
        Tue, 01 Oct 2024 01:35:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b926:7e5e:6e5b:896])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e881sm11231406f8f.44.2024.10.01.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:35:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Oct 2024 10:35:31 +0200
Subject: [PATCH v7 2/2] arm64: dts: qcom: sm8550: extend the register range
 for UFS ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-wrapped-keys-dts-v7-2-a668519b7ffe@linaro.org>
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
In-Reply-To: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5edj4eV3tJX9H5APKSlPByWHlC7LQas0Wvx2w7H/iLE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm+7RmU/lIhO2zKMXQ+OAKXZAdNv/dT/8L6IbMi
 so6802NZNOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZvu0ZgAKCRARpy6gFHHX
 cgcbD/sGOeLogs6ML0fFj7+V98WJlMNny5hfqsMulkdqFw5oYAUa7lJlYr7ovrmYFdt/OyjamZn
 qy4uBDeFMK+ObVPMoIA69bCmrICxpMG6HYeyMVWHLTiYmtr/u8YbUEjKIbes+MamwP9NVbHIxQ2
 eRjPFw+5heZVssTpr9OMAth7j8//XyoDqdWqQq9p+eBq/Uq7sOjbFfGUMwgPgAprlrH9dwVB+s2
 Jvpdpum+Mkv52qjrK3hQHj40NzJ3yNl7z2r4fwwjOCw2nu7gmZ6IqXXZxYrJhYUPeJqrw5KRisb
 q92fQc6fYqFGd53Bdx4h7pWxCwud+XsFcXKA9JU3lOqfv7ils2F2S9ozoGAh9iSPumQzzz/D4Os
 Q0ePhPP3SJgErgccEr/u+DaK8SaPkIbtrMRdszFbPRNL8vjLSMxL3NmLyTEC+BcWjZ97CVmlm16
 xHINf0SEOJ2ijiodY+gE4ntXoCOdXDaLxD/qi3/cloF0p2ku5NGrNq8r+fKC9mTH7bLWriyqrP2
 oVlef4WnrzhILuRGsixrbulMBU9VBdDvGJlbcBmuAOBOfHU9maURCdGadvcdU+yujdaHRbZeLst
 pX927HnJdIBjtVEYRZeo4bu+GdzQ0ke8hUwPNuO2ja2645meFEXTVQ5UsOEXHmnPcoq268llgVt
 4lS5bDwfbYyo6SQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

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
Co-developed-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f..93c8aa32e411 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2076,7 +2076,8 @@ opp-300000000 {
 		ice: crypto@1d88000 {
 			compatible = "qcom,sm8550-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x18000>;
+
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-53280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD694A7C8CB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 12:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A2E1896B5D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 10:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508771C5D7C;
	Sat,  5 Apr 2025 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvWuAQ8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23372E62CA;
	Sat,  5 Apr 2025 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743850709; cv=none; b=aMbVMDGAw+5VmT23pKe4KIt7Lm9PK63JiCqpbpLbM0V7FKY0WiqK9gnY5DCJnEPzmIjWAkji/TOAN4KQcKCUjiiYht3iemVZUkxUAULgTKobr/tHzSSoZoEORvG1/fleqbxBXEWaVIwSPl+yWAELmuXaux5IEoJR2Xw35WYHv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743850709; c=relaxed/simple;
	bh=hn3ijweSUP10Lc68j0Rqm0YPnr2gWcKjhnttPj2jdFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVANhn7f9ixiDXc1sOXP9wvbYtafUd51FXwcNhU7v9K6k/ahniPfzAGQpRjLOeVRGhXAdHHcyFYo10elXVJI3qrnuPTgBi9nWolVBk3shecN2p7u1y9D9vClTU1EHMU/v+LVw4SAmygDx3QmT9cX+daGXG8r5xc1pfDDtnlIfzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvWuAQ8D; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22403cbb47fso30119165ad.0;
        Sat, 05 Apr 2025 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743850707; x=1744455507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsaT924pTJDfpd3Bgj5M/bUiptaYWBKJB7exQxV4oxE=;
        b=UvWuAQ8Dr6MG6COfgZF3d/D/xy/K9NTH/GmJAZhcE5GsCQFa+hVRK+tsTeKi1hiBUo
         rkLNzwUdqj3jyVF2Z/3MjoDHOziMlC17uQS6C/YcykXU68JY0MkQG2E/nR/kwFm9xGuI
         m0pxHE1raN116RM3UrBJs26xWg7VTJcApAcrvT84LvsiLCJTjpi90xTZrRkUhXyOi7HZ
         2dQ51lNoP0HgZqzzO4p9uW5cBeAl/vRAtq4WdHAHngkKyEL/hKddynLxIZcgZb9cwfbA
         G5QNsKyO4hbA8v16Twl2eGJYAoftmFW8qP8eTFbyOZJZVyhpP0+qEyWxl76Q4ALIOGnj
         Ot3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743850707; x=1744455507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsaT924pTJDfpd3Bgj5M/bUiptaYWBKJB7exQxV4oxE=;
        b=Ld/ZWWKFIxVMz2+p5+YhPRKppOV9pBDih48SiyagkVSCrkXScoi0CmbQFxq72+lLDp
         dpOScW/6eHKQDtvLZsgf4J7M4UCoZc4EyZDQEeMMSA1hG/256Q7LMnX6rGJvpBF8kECO
         e18BrX2gUH+e+a0EV8mNmXCQ/2Kjoh+IsBdo+KxocANTurklmOJsaj/6kwarn93yuanV
         /BiPxTLneuZPTY0Sik6D88xhRIS0auK6TUq7gBAIrYCDltZVX+Gmu452b3lmxRVszKfe
         f/v2vrYmNa3Ikn1RKYQrwTv0hE+g0L6pzrqYHqtGhsyKsTbkYC+wFzij4JByDpGiTyER
         F6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSJ351DLl877p3MHSgHT6h8a/jrH1s9tRTiXDo+kyOsQBPOf1S2w6TNAWcpb0RhO7m8JhDixYuCJTr@vger.kernel.org, AJvYcCVcO8M8VN554MqrMmvJtOhhNMYToHwdNZdYhnL7z/i0yMfy6QIBqewzjgbwgi8F2NWQqyTyOPbVRdpZxho65Q==@vger.kernel.org, AJvYcCX0DLkBY4twpJ3kzVLDPlmaa88u5/Euy8CS4Nx7qNxzpl2gHuljkZzdw/a70jzWu8dPD9BXVD40IMQmldd6@vger.kernel.org
X-Gm-Message-State: AOJu0YxxpEVW1rmJ2/9iRwr8uE6zG8eRps8MoXbhnzR0gM5+xlMyDYs/
	aX4Dp1NB3VyK9iD4n1s8lCi6UfrYyQUZqbTuME2DB8DWZzcLMb0I
X-Gm-Gg: ASbGncuuPsJOMdNRqnn3DUXAKwjfcXHa0N9RHhfpFt7v5ZNByMmj/ilEl4wK41GrB9B
	MLYTDhQ6R9k333ps0XNVN8Bfl4sF13S1oOvUa4TmSG3QqendShOukrdDsw91vtsDUpYGsC3phIl
	fSZVdDJd+UEVGhpfu9XHqwUtjlBQfgYGcQ0PCAv3KyHRGu6t8toFpaxDlat1xTEvsouwQ/rjFcE
	8uX3U88YNaxwEdgdYbU8e6A3Hbo1gqjr+30RZlvU6VVxj7FHzu/WC0sU6tNNWbnjxg9aqsnCd0h
	d1XN8oHE5V5X2pHEdVlUTU80zS9kCgVBLVJ0Z6eKN6w=
X-Google-Smtp-Source: AGHT+IFTjNaDBcoW6j/uyQCgyHlR6o9SYOPibOgWLB1TYSr/11Z54hMAKMbT7P1O0Fgly5kEML2Wpg==
X-Received: by 2002:a17:903:283:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22a8a8592a6mr58840115ad.6.1743850706951;
        Sat, 05 Apr 2025 03:58:26 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978772704sm47234925ad.219.2025.04.05.03.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 03:58:26 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8650: add the missing l2 cache node
Date: Sat,  5 Apr 2025 18:55:28 +0800
Message-ID: <20250405105529.309711-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only two little a520s share the same L2, every a720 has their own L2
cache.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index a2b3d97ab..f47f29ec8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -187,7 +187,7 @@ cpu3: cpu@300 {
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&l2_200>;
+			next-level-cache = <&l2_300>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <238>;
 
@@ -203,6 +203,13 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 
 			#cooling-cells = <2>;
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
 		};
 
 		cpu4: cpu@400 {
-- 
2.49.0



Return-Path: <linux-arm-msm+bounces-54044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A349DA86297
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 18:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0984E080B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 16:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3F7221548;
	Fri, 11 Apr 2025 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPJL0UiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0BE21CC44;
	Fri, 11 Apr 2025 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387142; cv=none; b=XyMzucdFXyveYyHB/lkO2FtR4FrH/j21oRZP33icksOSBy2Qf/jyQA2lBt4eOHLZ4bdtOh4gz0VgFCS3TDWSD0SZpPB9O7tkO2+X4WuuA/T1UvKpiPmyk/KKEpJMUeapM2n3jIUAaKWLT05M6r1QIjRL11fJC2k0IWIHRHAwnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387142; c=relaxed/simple;
	bh=qsXtBiQfzv3ppOjk33t0VTHVUMSlolrvFHO5Ppcv2V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGOuF/fE0L0I5BajbnvHDev749EKVJRE2tzzFkdYWiT7LoLqDUmSuJjXfMHbNWYocVeVIEOhiX+imwdiXfogjiQvXcr/K17e1SYD4p5jzd+9sjAHqv4KbGLJPGQnGl+9E72lLomJvb7AaIF/ylMe5qnL1aPCda7mhlu6goIYArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPJL0UiE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso16049035e9.3;
        Fri, 11 Apr 2025 08:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744387139; x=1744991939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZr9fTRuG4cPDOtYV40TbKpOUf8PGvyr3lp6HShP6Mc=;
        b=aPJL0UiEsm9GaMFbdc7vtXJIsSkieGg2IpoA8SExrjovu2h0Lg5a2Cj7No98ZJnW9s
         xAt1fXhDY6TxoJECCo7Q2xg7601gYXRC8wfCNwHzLDFwkevSmTG9LzMyPrpdhqXMi2dG
         JBWtE9cBzcCtrRtH+mFkWIbJM3NsfMdFlrne/l5Jxmwv4AS8zKhpoUPrSK2tPxd4Gfni
         MZLI5JPHYqYJWif+sUKRweDWRchewxpbYmUABRcf2AOJYHvle1DYOAy+f5VOEP8S9bat
         gGWoR06GFEL8U89fH3YHNnoMUZNCUihjh4T2Xb0FFZZ+mLDHNQ9p32/01YQbsR2tH//S
         MBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744387139; x=1744991939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZr9fTRuG4cPDOtYV40TbKpOUf8PGvyr3lp6HShP6Mc=;
        b=LlYqUTZsBuwFED9UUAQdM4B79F9dDHlnXMs1pxJ9ETVclCh6uMaBuyAnJ9AWvhOCPk
         m21gzA2vwPgV17CNVG/4XXyndxZFBsKlPpAyB9NvrWKpPCsNENCe+B+A2Ro/3iSfDHoQ
         +ZkJDb+Y/VlQXF1cjWQ1a6hegqSfj1mDKfEiKHBxrPBhd6BeLoyvVNqYUaaoFheSjLXW
         zRXFhla6n6Lt5WVUw7YZuUvy0lETnJNdNRgEVwmnpB68WIYN21Af0umrCjyZtQ9PFwlW
         JIAsddZ/wjTy11R13CDdi6GIlGe1Hw3lqjoZUWQi8Gs+AMpEtLmlE2RvswjYrTwyDCEI
         tFgw==
X-Forwarded-Encrypted: i=1; AJvYcCUqHgmSsUWVYQ7AqgQbCpdTqHIG5mOyBbX+7B9oBmwXYO4igHBVGjWO1IuWPo5P4yhRyHiu1NUaLSfqZyd5@vger.kernel.org, AJvYcCVmuW4Z9Tc+N1YXuwjxeZPIzZZacjW8ull0DAsxlH5XpxOkzCay3llh0D2Jk86Gh0JBP7P8BWfJ41nlXgJoTA==@vger.kernel.org, AJvYcCXFnPopx/acy3fDhyKEecC2gPzA1bBa4J7aPHd39Qk6IAASol6day1k2tVsKDPpaqfhyfmKmCGimSjX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdE8TJlTTaw0WxzpILwe6T6COcVT95zXhJMXAs+bjKZ9XYTjxc
	EYCf07LfmMRjV6G1q8HOtYCiCJ6FqE3uwzfmnb5dpzlXX6yr5zkRNZR8qlU=
X-Gm-Gg: ASbGncsowa5b15nwbwyrosjR2Vg/PfYlD+VuJSC8SKYltkeQqIpvgovrzPhAt+f6q9c
	bMhZgv8cWB1SRC9RspeIKYzUFW71EEtjZOgnjyUN4/27zv8RRAOXl61ZZXOHWBKc+lV3/ao3tNq
	AnWEAke6l2a30QODPNct1EqyG0q9onNveLQQgXC46U5CA/7BSDov+MTUuncHO/EbdXJ8inASRy5
	OlXRlgmCb/G632PYLTMn5Gi1EPVPyUdmaGIhFCOXVAUfYylP0/JF71RLs4L0f76pAIgKExQ5HtK
	Ke13eeOTct8T7enD1XkVjYJUJauv20orv32yz+hOqKwXKvS/9dcDHsEQC0nGbKj41Ye6QjgbPS/
	nP98jIDk=
X-Google-Smtp-Source: AGHT+IGhrpb/YrnbELAph4aGtCS9VLS+UBEaIkjtSM/5yDy4tQaDR3ujgdcNMtWfN1WWrmsl1UJ1Vw==
X-Received: by 2002:a05:600c:5008:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43f3a9aaf7fmr27769825e9.26.1744387138260;
        Fri, 11 Apr 2025 08:58:58 -0700 (PDT)
Received: from alex-x1.. (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm86028075e9.31.2025.04.11.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:58:57 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: enable MICs LDO
Date: Fri, 11 Apr 2025 17:54:21 +0200
Message-ID: <20250411155852.4238-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particular device comes without headset combo jack, hence does not
feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
Set regulator as always-on to enable microphones.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 35d97db9e1f6..4a35846b5947 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -269,6 +269,7 @@ vreg_l1b_1p8: ldo1 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l2b_3p0: ldo2 {
-- 
2.45.2



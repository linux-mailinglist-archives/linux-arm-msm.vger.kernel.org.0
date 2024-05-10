Return-Path: <linux-arm-msm+bounces-19683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28D8C247B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F0E28D56E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE77181CE7;
	Fri, 10 May 2024 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xccwzhcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D6181B8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342421; cv=none; b=cXCz8Oa1iAMpVinL5E0YZ8vl5Nq8YS9OcXYBT62S+mLUfcr/pWuTSO8rGtbaSWFljM/m4Y0lEY+gx2paP+egB4aLFp0gljE2mvnTR8pOhEorMAd8AdkmrPViFnMY8GizG1/F7PH73Z/q+DTZ7D3zlhXiN7qYGOb0YK/TjPDMcxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342421; c=relaxed/simple;
	bh=lTJ6K/Pp6aZuNm1LsZs8XB234soM5FV25Lbeq0UWqMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nmg2b/S8BYNw7zAxml7+dMFgNbZHzkkHgOIuAQc5C5A6AR9r03MtSsBniKL5U93IvHJ5Phikmdn8m5SXEOgt5OsRc4rePVF/PqmVqeU3Yq8g484D/TaDyJdr0FD24UqvWDEJWV6jrN4tKkH1mVnSB7GBubXHHdjDPQFdXz9xBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xccwzhcE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59ce1e8609so521720266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342418; x=1715947218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BERj8pLaPZ3uX/uMf+Fj+AKRTbTKw3vHyZCsluwXv+0=;
        b=xccwzhcEBMdagyBUBCXOWACpuCQsb8JOuGmzELOHuG7HelsPGcAnqQpWDS4QhQHrPz
         sun+6qAYeW82bCxWYiq8S38aV4SuOHvqZg4qu2HVQxKLyuqkyeqaw07cTCpCgkbP5pcS
         WUJLfiQozDgXq75vZ5VaP3JH3Jwo+Wj2ef9MYiUZXng+HgYiOrvL8gWUzeGkblltgE7Z
         R+da75+qPDJ0lIOpZlcqHRqtCaTaqosnynfYcvsxKuX9OhhwPjw3MwAMC6KA4mSNPij2
         Soh9kU0xp/PdNF7ORoIVKGmVnYsmnxbn1GQV77YJXZnZrZSEa/HvxzjXpsLsG3FLFkiN
         yD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342418; x=1715947218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BERj8pLaPZ3uX/uMf+Fj+AKRTbTKw3vHyZCsluwXv+0=;
        b=IRwlDMFjzKJCRzLk9nwuhwvs650Alz1alfwv1S6JaM/G2N7hJiQ2YGmnwk2CYEAenI
         JyIGGgXKTgUK5lszfV9zYN60ehvJY/dckCvJCeFjgxfG+Frov0i9kjdzB1gFlujrQofs
         kbf8HxQMOPy3cfD44jhmeg8uTdP11qDyUc81mA/BhhBdPAzE7+g/qOx16HjJV9ZLxH+7
         xNeET5oH8no6LZKXVAK7u2116q3iNwcJ7t+Qlhlx04R75mLTNkk5QGJp1rL9nU0VJEc4
         c2hwrCCLMaodOgoxBncqzqwBlH8serD0OGNVqDblAqae2N/6Tp0aUZe2kPl+T7whty5i
         gClw==
X-Gm-Message-State: AOJu0YzaMGl4HwTNtJnxClAbwrY/FW2B0qp8R1nCpQoQLnCesrS8UyG0
	9AJKfwhPQy6vnopbUhlz0dXTqekUIDN2OVr72STEi+FmousuWzT1sGrR4zh4b4k=
X-Google-Smtp-Source: AGHT+IFshxhb13HlEmsagkrBj3R5X4Rd0f8NQemiFOeZCNIFrBprbwJ4kwH0lvU2QDfbsvbr3096nQ==
X-Received: by 2002:a17:906:fa16:b0:a59:c3a7:59d3 with SMTP id a640c23a62f3a-a5a2d1afdd1mr229036966b.13.1715342417680;
        Fri, 10 May 2024 05:00:17 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.05.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:00:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:54 +0200
Subject: [PATCH v2 31/31] arm64: dts: qcom: sm8650-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-31-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 88 +++++++-----------------------------
 1 file changed, 16 insertions(+), 72 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 62a6e77730bc..39e789b21acc 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5328,8 +5328,6 @@ compute-cb@12 {
 
 	thermal-zones {
 		aoss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -5348,8 +5346,6 @@ aoss0-critical {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -5368,8 +5364,6 @@ cpuss0-critical {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -5388,8 +5382,6 @@ cpuss1-critical {
 		};
 
 		cpuss2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -5408,8 +5400,6 @@ cpuss2-critical {
 		};
 
 		cpuss3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -5428,8 +5418,6 @@ cpuss3-critical {
 		};
 
 		cpu2-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -5454,8 +5442,6 @@ cpu2-critical {
 		};
 
 		cpu2-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -5480,8 +5466,6 @@ cpu2-critical {
 		};
 
 		cpu3-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -5506,8 +5490,6 @@ cpu3-critical {
 		};
 
 		cpu3-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -5532,8 +5514,6 @@ cpu3-critical {
 		};
 
 		cpu4-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -5558,8 +5538,6 @@ cpu4-critical {
 		};
 
 		cpu4-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -5584,8 +5562,6 @@ cpu4-critical {
 		};
 
 		cpu5-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -5610,8 +5586,6 @@ cpu5-critical {
 		};
 
 		cpu5-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -5636,8 +5610,6 @@ cpu5-critical {
 		};
 
 		cpu6-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -5662,8 +5634,6 @@ cpu6-critical {
 		};
 
 		cpu6-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -5688,8 +5658,6 @@ cpu6-critical {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -5708,8 +5676,6 @@ aoss1-critical {
 		};
 
 		cpu7-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -5734,8 +5700,6 @@ cpu7-critical {
 		};
 
 		cpu7-middle-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -5760,8 +5724,6 @@ cpu7-critical {
 		};
 
 		cpu7-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -5786,8 +5748,6 @@ cpu7-critical {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -5812,8 +5772,6 @@ cpu0-critical {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -5839,7 +5797,7 @@ cpu1-critical {
 
 		nsphvx0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
@@ -5859,7 +5817,7 @@ nsphvx1-critical {
 
 		nsphvx1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
@@ -5879,7 +5837,7 @@ nsphvx1-critical {
 
 		nsphmx0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
@@ -5899,7 +5857,7 @@ nsphmx0-critical {
 
 		nsphmx1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
@@ -5919,7 +5877,7 @@ nsphmx1-critical {
 
 		nsphmx2-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
@@ -5939,7 +5897,7 @@ nsphmx2-critical {
 
 		nsphmx3-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
@@ -5959,7 +5917,7 @@ nsphmx3-critical {
 
 		video-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens1 12>;
 
 			trips {
@@ -5979,7 +5937,7 @@ video-critical {
 
 		ddr-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens1 13>;
 
 			trips {
@@ -5998,8 +5956,6 @@ ddr-critical {
 		};
 
 		camera0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 14>;
 
 			trips {
@@ -6018,8 +5974,6 @@ camera0-critical {
 		};
 
 		camera1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 15>;
 
 			trips {
@@ -6038,8 +5992,6 @@ camera1-critical {
 		};
 
 		aoss2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
@@ -6059,7 +6011,7 @@ aoss2-critical {
 
 		gpuss0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 1>;
 
 			trips {
@@ -6079,7 +6031,7 @@ gpuss0-critical {
 
 		gpuss1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 2>;
 
 			trips {
@@ -6099,7 +6051,7 @@ gpuss1-critical {
 
 		gpuss2-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 3>;
 
 			trips {
@@ -6119,7 +6071,7 @@ gpuss2-critical {
 
 		gpuss3-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 4>;
 
 			trips {
@@ -6139,7 +6091,7 @@ gpuss3-critical {
 
 		gpuss4-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
@@ -6159,7 +6111,7 @@ gpuss4-critical {
 
 		gpuss5-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
@@ -6179,7 +6131,7 @@ gpuss5-critical {
 
 		gpuss6-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
@@ -6199,7 +6151,7 @@ gpuss6-critical {
 
 		gpuss7-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
@@ -6218,8 +6170,6 @@ gpuss7-critical {
 		};
 
 		modem0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
@@ -6238,8 +6188,6 @@ modem0-critical {
 		};
 
 		modem1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
@@ -6258,8 +6206,6 @@ modem1-critical {
 		};
 
 		modem2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
@@ -6278,8 +6224,6 @@ modem2-critical {
 		};
 
 		modem3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 12>;
 
 			trips {

-- 
2.40.1



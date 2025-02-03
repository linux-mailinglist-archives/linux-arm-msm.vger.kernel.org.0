Return-Path: <linux-arm-msm+bounces-46750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD49A25AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC69118853EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AC1205AAF;
	Mon,  3 Feb 2025 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbhsQXwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C902054EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589007; cv=none; b=uq9QU44pOIKTVWer1dyzHbsxYrU4CfLf8glLUYTf4o5RY0AB1+UwkK1SlyMBmqHRPCCXTUwgxTJZeyQGCYcl2iMzedR4iTvI+u1szKVgtXntkziTR5B1BUu1LS8PZymsZMugltCqlAMkOU3+TPkDPWuYqK270H5Hpk5qA7GjvUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589007; c=relaxed/simple;
	bh=S8q+TIWZ+6jhcRx3cQFyDGrj0Isfh+TywUhy0JgV3yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7S2NN+xYAGRlktHx64E6IrVCZLA9e26YCFMdsTNOwq/U9Ln/5Kb6LQuUeePZxS8SyqAiml4K5LrEGch0vo/zTIKaGhLH0HqcKXPOUb7UpqHNyuI1RuFv8SlXGLseX9EYRp0bK2LvKkzoGdqZzjWCnoH+rnLoxmxWonE9w6x+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbhsQXwj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso45653145e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589003; x=1739193803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAlNrAp2yNY+2FbO9eG2u77uRfhroZ4ozx09mJK67n0=;
        b=fbhsQXwjvlJAZl2gWIDTC4gJoKh+sRaXyo9//USeQVl/yl7T6MCSYOEX8p13HUN7zH
         y1E8Ks5iinmpxoZ1M90Jp8kXSmxZ1UPe/BWkhw4VDRNZrzSaq052DsguY6Q0fKAhJ3dd
         mnrO8tkbwklSaihUCbfb4vr+t/HaNJualGar/B3B02kIYqFIlxkwnhD5e5J7a8NwYnSk
         4Zoabh+pSnQQLP8QwQTaTglY5AB/COLwj9x8cnppGr7S1cX0y1o1KMhiPGPrNQucmkRe
         /uGnWANqX/TAaIjEHRJvTRVcgeE20qKyz0xPjwSDhBjBw6+DKv9UQaazMf6qu+qKXRfr
         CeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589003; x=1739193803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAlNrAp2yNY+2FbO9eG2u77uRfhroZ4ozx09mJK67n0=;
        b=G4Tm8tQ5wuLme3iMsymjI7f6pmtrqYkDkXeHQcl+Dsz3aeucP/LJ1chzIL/s5z5ZiM
         odLniRJyH2zG9GaMdFDe9eg9KY77ntLwOndtrLR1c5JlDhl4j3SEBU2ZadHIFdV0ArmO
         QuIspg3q00O7ETvdoDnaLvrvDN3VrZl5wjSEEDEq3yJ0t+GBw+cPZCtNHKsHtjaYD/SQ
         aEEHL0dFQEtsS2RHsPexWN3Bd1uno3fLZdFjjIkU+Fkx8shheEC7bzWBV+2JPlDLixjj
         gZVIL+t6sIFWbLI+9ocwLsEFDDzLEWwT2bH5tgVrb5yhUBgVf+moAqYJ+zWhHgM1+ghF
         kYGQ==
X-Gm-Message-State: AOJu0YyQPrN1CIRGJtdtpa+r19uDS4KqZ9s82JO4r5tm0Kcr8L1B1X5i
	xrU+AyHefUpbkE0RqsovQhaOu2nLh7Yvikac74J+FmFASkkMVQPVzVSV5PIYTjE=
X-Gm-Gg: ASbGncuUkJW2vrjMLucLb4RuHyu2Wklgzir/2l7QkjcirLYKYoVF3UQnhEwv9+qA/xu
	E90PeDjffsR3BA3cR3kBQ3ZHLuMGx/0cPSvvGSY6bdxx1CXP4AOXx/6nS2cP+zYimC3LkF/Vrvw
	KJzmp42rp8JU457ORqN8Yl5e4tUIQtrw2ku3w6gD5HndXM2tBXksXl0qElCDXm52aBnOkX2gDp4
	GHq4jag7SarljBD62/5G3T9ZgmgZt+lKz42XX8wOWEzJybXHJm+YuogOvJEplKZ+uVdyVnWRlDY
	PMTKX6pGpubHhWHzBKYdAASeUNeGUXSztpko
X-Google-Smtp-Source: AGHT+IFeKiqPz3dVen86NG2ZC84qmAaTNPnxYHo6EqOFkS6fMLHCNzQhpW2cHSV7COHrzuaTPTB8RQ==
X-Received: by 2002:a05:600c:3c88:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-438dc3c2992mr238045955e9.11.1738589002862;
        Mon, 03 Feb 2025 05:23:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm12570858f8f.20.2025.02.03.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:23:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Feb 2025 14:23:18 +0100
Subject: [PATCH v4 2/4] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-sm8650-thermal-cpu-idle-v4-2-65e35f307301@linaro.org>
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
In-Reply-To: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5461;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=S8q+TIWZ+6jhcRx3cQFyDGrj0Isfh+TywUhy0JgV3yg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnoMNH1nYKO9ihEK2wwAskGHBtjdOtIHOGuQP6XerG
 IwEXcb2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6DDRwAKCRB33NvayMhJ0RdfD/
 9Q6lp22drBWf9UEuq5ko0vH9cAnnlh+0qdJodOrzhAWZMO+BsmLkuUaqNqmICLWkYvBnoGkjUeyZR9
 Gh0y/7Jvu2fBM6wxU39P2HR36S1BuIoXgzeJ/RISlMxLLrsbkSUX4SDBrOHsJDMWFML9V51vksyAoR
 ysQDJBQbo1H4KGuzV7kdzjnebq5gtTzaujIyFGDW/OQno+WVMsY0HblzH4SpWH1OWVNXAwQAYOYz0m
 1Ztsi0IjphFuBkgEG5r9TmtXGzegOtBY6ZVbl665Ml2iWEecHVsiHR6oOhvK431hnrgYgRf7CGbANy
 5luX657YBOtm5D+tLnWvYVNbKtRkoIYZQFeD+Fd74PUENPcObDjGA2sC3s13gzSThu1ng0pdtjon+F
 Cs6w/E0UMiBRmuUZLOhKNfPuabNfML52AXHEyM5qH7zTxup0a79CuoyjCvGOoXZIf4dLhmGHukGpmY
 dk2MhOhuZ5vCeo1AfLQ1KuqY10gCEi8Y39wMD70TUOY6diVNSyvWqM+zfjIJVqCp4FfLRtsxIfx3Wx
 PkiTC3SVrpPBUrfpHv71oNJh51PfmjWavqiV/wBgd4XvF/6Rt0E/n+p/Kh0rfhAU5KVTUzSmAnVtq7
 2Y9FDBUBK0EFuJvO8OLqljvbHMGCcBniTX7E8giDitB4Sv+eX1JABLdiCYlw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
is done from the HLOS, but the GPU can achieve a much higher temperature
before failing according the reference downstream implementation.

Set higher temperatures in the GPU trip points corresponding to
the temperatures provided by Qualcomm in the dowstream source, much
closer to the junction temperature and with a higher critical
temperature trip in the case the HLOS DCVS cannot handle the
temperature surge.

The tsens MAX_THRESHOLD is set to 120C on those platforms, so set
the hot to 110C to leave a chance to HLOS to react and critical to
115C to avoid the monitor thermal shutdown.

Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 64 ++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 95509ce2713d4fcc3dbe0c5cd5827312d5681af4..798265e0300e7c7934e04cd971e3b9d3d55e3bec 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6173,20 +6173,20 @@ map0 {
 
 			trips {
 				gpu0_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6206,20 +6206,20 @@ map0 {
 
 			trips {
 				gpu1_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6239,20 +6239,20 @@ map0 {
 
 			trips {
 				gpu2_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6272,20 +6272,20 @@ map0 {
 
 			trips {
 				gpu3_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6305,20 +6305,20 @@ map0 {
 
 			trips {
 				gpu4_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6338,20 +6338,20 @@ map0 {
 
 			trips {
 				gpu5_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6371,20 +6371,20 @@ map0 {
 
 			trips {
 				gpu6_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};
@@ -6404,20 +6404,20 @@ map0 {
 
 			trips {
 				gpu7_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
-					hysteresis = <1000>;
+					temperature = <115000>;
+					hysteresis = <0>;
 					type = "critical";
 				};
 			};

-- 
2.34.1



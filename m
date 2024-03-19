Return-Path: <linux-arm-msm+bounces-14562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 440338801E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825BE1F232A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA66A8662B;
	Tue, 19 Mar 2024 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="toAw4Bzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651E86128
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864846; cv=none; b=Tvs20CG83c+kTpqQjGj1h9oHKy2SfmUdAK+botO/5irJdtWFeAsh93wpzrgWwTkIpH/9dIQk0v6+eMvYlHzMGryLq5HpZKX/5uJqLcRoeKEqQmzhrLIQiQ1idH0luVwxvNMtjZDorMIP4wPHcsGNAsZPb226QOIXYV+WqfqgF6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864846; c=relaxed/simple;
	bh=T0AMd595+W1sDBZ4qDqfxuerOD3YhbiZuI1wj+Egzv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KB8U0fOn3rvbn5UGxBT/4/7edc/vA5hg3Q1F1YKvJi5zR2CmiomVOg6ldfnfsNTCogm+eFjX/Daq1cyYvvMC60nny2D612O1SRlAsACxs9Qsq/J3R5XGAmrXYVDdh+SLRLjUCeVIBxic1KAKjzUa0HhfiEZBEbSKJPiaG6h30zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=toAw4Bzm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512e4f4e463so6489627e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864842; x=1711469642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFUKOQmXWTLWdjtaov2aUjztp6b4X+go7eRh8s9UnHk=;
        b=toAw4BzmRm9eWWOKEWD8kBGc9D0w8hCgdRGRnhFIqKy5DtB6l8NjKobaI5aVIhIfM6
         Sk+A4Azs4PR2DYGTrQeG6pYcGwv8yEt82JKv3sUcS1p3/ZHlBMp4R/tUHsNpRdT28RpW
         y0uKNk1cWvFGG+2p+3GodUeN+pG8fz/DAmZE0lqIr7J6gfrJN+8qh+1xfN2M/90zKbPY
         y3/Wv0ajb6RmCoiOqWv8yJfiNkHbDTSCnWENxpQwk2Alf6R5XmOaoFjJMquKhJgykAjE
         dsQyvW/T5gFduq4FdDWkpkHE729y59INzr3SILh+6eu54e8NwhFVvlc2n7ynilwtSQ/P
         eOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864842; x=1711469642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFUKOQmXWTLWdjtaov2aUjztp6b4X+go7eRh8s9UnHk=;
        b=MniHhF5w8FR127P5B8HBBCPNPHdEr+fS6HR51EU2lV73lc9omWRciv39TIljL6Pzj5
         OTHYOM3euP+2ryl7lzS+1tR9H7szOAXIVo3031IokquqS0u4rlFyOIwDNZ1Dod8cTKHh
         TWlsApucbLcHynpEXxHye2r53aHOInSPHDrIABIHy2j9TZ3FJomg4Tz/oPbsHFwfxrvM
         YmTLv4SdmsKntRWtwxYyt9ZNTXVTqnd2Qch8wtZ8I+YGaLzywaTvNoL046pzIHb/oLi4
         RRJbBpBVG5UiH0kAJMsulyDa/0lQAV1BLyEnfP+NNc95QfMISTAHFiMQbb2thpFjuRn5
         hC4Q==
X-Gm-Message-State: AOJu0Yxjj9I0DhBlX2C7C3A50KCzHMg30tzPe8qx5PgrrLJ6rVG5x7gw
	NioMDZCoyJ9HvRWQ8gerByoL3Mr4Gs2/Bfvb9FffsmAZ70sqiFMNpopMD02oeYI=
X-Google-Smtp-Source: AGHT+IEvECGMkclgL7HfDaZoY+kI+4AjXLi+FOv4w3hDzPRZ/xHz5uLc5WHnzIsltONPG4EerYCTUQ==
X-Received: by 2002:a05:6512:280d:b0:513:dd43:a153 with SMTP id cf13-20020a056512280d00b00513dd43a153mr10968746lfb.59.1710864842687;
        Tue, 19 Mar 2024 09:14:02 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:53 +0100
Subject: [PATCH 23/31] arm64: dts: qcom: sm6125-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-23-e0aee1dbcd78@linaro.org>
References: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
In-Reply-To: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm6125.dtsi                         | 3 ---
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 8 --------
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts     | 6 ------
 3 files changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6125.dtsi b/arch/arm64/boot/dts/qcom/pm6125.dtsi
index 99369a0cdb61..b92f357511de 100644
--- a/arch/arm64/boot/dts/qcom/pm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6125.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm6125-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm6125_temp>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 08046f866f60..dcd05f303b78 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -90,8 +90,6 @@ cmdline_mem: memory@ffd00000 {
 
 	thermal-zones {
 		rf-pa0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm6125_adc_tm 0>;
 
 			trips {
@@ -104,8 +102,6 @@ active-config0 {
 		};
 
 		quiet-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <5000>;
 			thermal-sensors = <&pm6125_adc_tm 1>;
 
 			trips {
@@ -118,8 +114,6 @@ active-config0 {
 		};
 
 		xo-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm6125_adc_tm 2>;
 
 			trips {
@@ -132,8 +126,6 @@ active-config0 {
 		};
 
 		rf-pa1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm6125_adc_tm 3>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index a49d3ebb1931..994fb0412fcb 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -84,8 +84,6 @@ key-volume-up {
 
 	thermal-zones {
 		rf-pa0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm6125_adc_tm 0>;
 
 			trips {
@@ -98,8 +96,6 @@ active-config0 {
 		};
 
 		quiet-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <5000>;
 			thermal-sensors = <&pm6125_adc_tm 1>;
 
 			trips {
@@ -112,8 +108,6 @@ active-config0 {
 		};
 
 		xo-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm6125_adc_tm 2>;
 
 			trips {

-- 
2.40.1



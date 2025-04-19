Return-Path: <linux-arm-msm+bounces-54792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148EFA94266
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 339938A5EE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFE61C3BF1;
	Sat, 19 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="rUvEFJlY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB066189BAC;
	Sat, 19 Apr 2025 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053260; cv=none; b=dauRysMRKHaB6DLqw7U8T8/2VMZTxZmbBD2TFashai33P+/yBEDymjp2NtR/nOjrR67KyBgAAoqewNcE49vYkb9el3kPd7PBVEwEiuCQxPsbHn+JhHSxQDKM+WHphKVotqq3smcfGRFwx4RW/WuRaozy3iv6dQJ96mIMetibUWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053260; c=relaxed/simple;
	bh=UTB0iLCcYAYtmujp3pQBrPpMHS5LGsxj+4ZntLwyGu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NvLDCprPsHCc/02rtzkceCZGpPgTjXG99/G5T+6rCzLF2yj/vfdDc9zHR9pntM48rUL9qivd0u06wdbNE1IoKLqlR1HlF6/uoMNSET0pBcTs0uU2e/p0qgtuB7vCL/Pc55+Lb+jOJSiBHhcloA+mWgu3/S3jLZJZsvdf1Tc+GfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=rUvEFJlY; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053250; bh=UTB0iLCcYAYtmujp3pQBrPpMHS5LGsxj+4ZntLwyGu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=rUvEFJlYqHygyIaSPnu8GaKHbC+d2NothMP+5r0wTocCVQTBOEUMr3eHrE44pK4eZ
	 8EiCZUXCwfkbZ0mh0VLmDLXnJOzabea/Eo2NA3XElttGhpyLd0FfeE6RPSJwitQUdy
	 zERbtErbBIMUtVkEU3JhE1ChY4Ep9rnWxXdskVEw=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:00:38 +0200
Subject: [PATCH 1/4] ARM: dts: qcom: sony-xperia-rhine: Enable USB charging
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-togari-v1-1-45840c677364@lucaweiss.eu>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=e6y8Mu1vjYCiO29scDHc/QVR91PS09dXMQ9Omaobgrs=;
 b=kA0DAAgBcthDuJ1N11YByyZiAGgDZjuic59Kx8ixMybDal8rTIg7bX8Rx8tPREhd60hsHsHLo
 YkCMwQAAQgAHRYhBDm60i8ILNqRuhWP+nLYQ7idTddWBQJoA2Y7AAoJEHLYQ7idTddW5UkP/j35
 irxfaVsLOOj+QDtrbp9fRzFpyibucEgdBRNg5jagrt47CwqJql8wOJExbicjVB/ArqYaBJ75iaT
 Dwq4lP6AKAMSWr06EKjpqpSTRdXvABuh5J8vrbunJCY+cz1DOcDicT749zhCt5mdosXd1RZ7rec
 +4L9t93O0XTmUA/rom/6QZ1z0GqJ4bmlGJ0OREvIU2BllLOrbSVJ7hiArK81Bha3lgRxUfrEP+i
 bHY6nyeqvmUmGO+xubeYenDbLu47efd+F6PySSkLhdVfEc7UPLv20zXnOpHk2lByIuAYiVfkYFn
 cdwOOHeeDzltjaeT94V1sI1AsilwWPdf4KyvtOqMyJdNK3MSHLV6Q54C+Ry1Y6X8OfOyqMoUSZl
 tjmy05AG3+dpeFdAnXHVWBap7jEIBw/GmqcjPdiY5dnJ/gdUgEDHyTY5GYFyWX37DNoESmTaBA7
 syeRqhLP6VpSirIqGfjZpiADGDFexyqmkwOGfYNqZKyG+iof2TqatB7l7/RmkiO+fnmBtiNkh1N
 SIXN+pXm+13WzJexgWBfApCwV5NBCbcNUNUUpMXCrLlczLMfGd4/AFiyfr41EF95h1zsQWKP3sL
 Zh2lxj+3fta8kB2952e00MHZX4Jb+MKew4uvmJyDQw5Uk2LdSfHB/MrGDz8AgkHj5hZl0SAE3Sh
 ggpBX
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

Set usb-charge-current-limit to enable charging over USB for all
sony-rhine devices.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index d34659ebac22e65a511994ef201fe04f12089781..915221e00ff348309b62bd9b637ae9771d213f1e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -449,6 +449,7 @@ &smbb {
 	qcom,fast-charge-safe-current = <1500000>;
 	qcom,fast-charge-current-limit = <1500000>;
 	qcom,dc-current-limit = <1800000>;
+	usb-charge-current-limit = <1800000>;
 	qcom,fast-charge-safe-voltage = <4400000>;
 	qcom,fast-charge-high-threshold-voltage = <4350000>;
 	qcom,fast-charge-low-threshold-voltage = <3400000>;

-- 
2.49.0



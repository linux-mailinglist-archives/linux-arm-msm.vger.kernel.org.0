Return-Path: <linux-arm-msm+bounces-23538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998F911E66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 10:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7B341F215D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA6816EBF7;
	Fri, 21 Jun 2024 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+khuzoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A016D4E8;
	Fri, 21 Jun 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957681; cv=none; b=pJGqgmS85co90+GIcNzdUV0Q64xc7gPn8ucvuh6tWTrb/qygcQNwWf5K/0qBgOMzC/j8gzEIocMmkdY+bsvYt+m2DWDDiUhVk/R/xOr3QT2VA9R0J3VqHCZS+RByaH177N5gr+5o9W0/VrRTvERFCqNrW709ITwSP5O8+auCOnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957681; c=relaxed/simple;
	bh=xFO0qgIbZZSZGxvGjihJgB2It0l8Hs4sqlpsLip0Fe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWnNQWsT6BMKp9agqvTLLGx68iO+sR3XTuwo8JbTz9eVpIXHj7r/7Bvl1qxnz59NyagIX+EmK+LXsHN6J7IJX9GZ3S12zQrtT5161wda/cb4/QWsF3c3Uvbb5KLsZX9IcOCpkKCpKXbQmFj6m/xd7Co+aH1ADEVCzJ7jSerxaY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+khuzoB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cccd44570so1975045e87.2;
        Fri, 21 Jun 2024 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718957677; x=1719562477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O/Dqe2KMVumxXzco1OedBrrN88fxS2sDSxa3fRQNVo=;
        b=R+khuzoBqAltiH4u9l6/uJM7yUJPjk8pl8dIJpIa/BmKcNWpTZMqiMDCnx0vsGifQj
         oPByo4vHQFwmHCOqOIAduVyyFYLwGV18ZWOu1Fp4otfjSxtcJkVIrI0BZDez0alJv9AM
         maAWukaU0lkkJpji1fakvn8TQBi6Nj9f4gPRGq24gaasA9V28JfgE8Vsxy/m1ze/beu3
         lXPL2gAxBmlKzp5iPOasNZfwZFQRjqe9qVzAcw5q9WmwYMHpxdOosTm12EWnPbRuXU/w
         kVSviV8T9I0ROgTTDccL9lsvOBWdYZrFHAd9PPyqaxLaQ2nUVSPwl02x0xaGEBuutkdy
         N/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957677; x=1719562477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O/Dqe2KMVumxXzco1OedBrrN88fxS2sDSxa3fRQNVo=;
        b=c3ww1NnRKH2YfRbF4yBdKwCY38sMkYmUlt3FNon3qY65n9sUm3wyQLvrM6gksUMo5i
         5/Li1UvKnbHDKrzLlaNQ4KXx8wTN5+lNb6TblxM85pejxqNobHJ2vda6jyxOtYZ4/bfK
         pr8zS4aaWLdU+geY0G/cnUepqYNpIfLIvKInRKoRUuR1iyFg5EtP8l+VcgjyroCNVFUL
         0W7Ge18eNjuYxThmPAMfv9oDrtoGqtRNCl7KgvQIf4TeBlqaJ2y/Sdw6ctn0t4hXsBMS
         Ps8JkX0oHA9Q4cm7IqHlfJWYOpdeplAeboB0oLmp7k9EraGaoH7WKm8cEWx219UQWyfQ
         VTiA==
X-Forwarded-Encrypted: i=1; AJvYcCXRk7lgSMblje+o4uYY7LAi6ivIMwl5GeBruM3WdQg/exdAAu8ifjzXAEtzmELLx45YuIVFcknpiQm0lyCILUAHACms0jBCxvCAaHiHlEfWMwUf3uHdIbF4Dg40MhNNZALyr///QKLAbcggF2lGnlPe58E8M6gzisIJw76qmJfv3KQ31dBD
X-Gm-Message-State: AOJu0YwDm0J5DRFO29r7FumCtc80JHsQquSC07BDSBIls6areBR6gJzS
	KUhzuWYnk6rw6KpzaigYVwAj6JJqrK62RiwWjEfDnW5yBmoWlqLOpjv8VCicbEA=
X-Google-Smtp-Source: AGHT+IFmXhWWsuxsSkJtNcuigvqkVVr1UAdGQByG20qWApyuUQTDSSBWWR3F15WjD5aFMfM657DezQ==
X-Received: by 2002:a05:6512:3127:b0:52c:c032:538d with SMTP id 2adb3069b0e04-52ccaa5be51mr4443598e87.27.1718957677223;
        Fri, 21 Jun 2024 01:14:37 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd643e419sm125548e87.243.2024.06.21.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:14:36 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Date: Fri, 21 Jun 2024 11:14:48 +0300
Subject: [PATCH 3/3] ARM: dts: qcom: msm8974-sony-shinano: increase load on
 l21 for sdhc2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-sony-aries-v1-3-bcf96876980e@gmail.com>
References: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
In-Reply-To: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=xFO0qgIbZZSZGxvGjihJgB2It0l8Hs4sqlpsLip0Fe8=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdTaMO55zgZkXeo5FuKQfLy+PdRD0EFqiNVRjh
 bL4U6jyQx6JAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnU2jAAKCRAOCbsK84IN
 WuihD/99DdSmt0QhpONeoqKvN1+5EVxUXYYfsENQcx3lHvgA5N18bihFQqf/7VaLtAoek5BHMaf
 Ox+MebFr9e4fKWdvqjdHAmUw3hbtRsbwd9+RVYHy+VOW55uXBF37iBtx4N5f0CBmv1u5qUZzz+t
 9CBVq3Z2HvcT8erjB4WGUKqz7mLA6BFmpGWaK8dzsyC8iC9OkPPMu8sWaak6cvU7FSCUBD8INAl
 cD7A9E3VxWIdV+POlhIlFD54+oNHG4tg0Hwj8Q0NCjHlg9tpv3LVxjtcpjGMzbc17Tbb8Y0+97L
 2KBFLC6vTRvh23MIMEYn51tlVEFzd0JVc1x1RwHuCW7IUx6rPAsyWpcUaq1wJCg9gP+QHu7zQ46
 GRhb6mYoxYKe0mU0x1MPZ50RC7PBXPJbD938Pjk/YfJLq5JXI98X844qAagMx5RK1+4WNBfSys1
 r6C1KSYhpEVT7xJo82mDAlcFlyWv5+KbNky+Zhek0nSAOIrJeYnFwb50FrmGk2dGpy63Go+P7aJ
 H0OYonU02/a9n82/qVOgxaBn2LMBKSK6mL03k9HxQdBRO+o0o7bUYDXoayoVLUYbgzKqqrLs+fR
 tB/aLC/5cMtHTPYe8A2QBgF2aqRGSTD3W3BJlE4INKLNlOVbPkeVo7yB0uRyOHRkKifoL72Ev5I
 uVFFtbQZdQmiPUg==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

SD cards would exhibit errors similar to ones described in commit
27fe0fc05f35 ("ARM: dts: msm8974-FP2: Increase load on l20 for sdhci")

This patch applies the same change to the regulator for sdhc2.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
index e129bb1bd6ec..6af7c71c7158 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
@@ -380,6 +380,8 @@ pm8941_l20: l20 {
 		pm8941_l21: l21 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <500000>;
+			regulator-allow-set-load;
 			regulator-boot-on;
 		};
 

-- 
2.43.2



Return-Path: <linux-arm-msm+bounces-63272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA4AF01CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4813B7A98DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1B4280A29;
	Tue,  1 Jul 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwrbRxPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15627F73A
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390940; cv=none; b=PEPwNcVpV/0zKLeHrmNUlVgcRBhGW8ZB/Fug6HEQR29OJ1GiEzAImiyE+Z380855ao1+buqD9I+joG6gH0YV3QlrLx7mljVoWfeGpfGtTmn97osRMimlw29iYc3EpBsQXxNCKolTXIq+Qi5/7D2oxiHwtNKp8f48vkFvvSGfABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390940; c=relaxed/simple;
	bh=OLa6CKz4Xs+1wTu88fe33/7qjTbNdeZhjKjIdN9j7Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LstarV9Cu4a8pvIS35XpHHE/0BSHzlsgFQvqJuBdb/WxE0pdy8fqVmlQ8Y+Y2EoDcOnfIdp4w+vuY+8re81gfpos+APk9TC54DOaogmE6sVgJ97UXKkqY1sRYxVuzwo7aRKu5PwQmXYLpocUBTvnuALATRsleoLx83NltWOSsn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EwrbRxPH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453398e90e9so29399755e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390936; x=1751995736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pItM3Ix+BDw9/JSngNN7OicgJl0mdYEBGF4MKXl4ApA=;
        b=EwrbRxPHbPIO58M83sno3xDAPMn7Rtjy8LNsVa5UbbnC7osKqvW92dyUR9lhwuKZ1t
         h47JN88wNaBGh9TXp1xp6bLr9YkcqYQsq0ET+AdHmgzfiKpoBBrMJ1k+uF/jXgVMvRwH
         ZiRcHuXa8TMSL38WPrxXEkHKFRQWWvX4kXak4Jm3w4HbASA83TwEmhcs6tEXFWLFOfXE
         NMofBiA+cvRh0OHJSAf4x4fQSY0163BJX5T3tl7tr7hfRTanxXfQS1Vomzh7NhS0YCes
         fWl2TIs3FYkBsFsl/6xP5NiGD8H8S8bgkk9YjieHkxIGDzXXjbTcmztek5ViSesNR1QB
         Q7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390936; x=1751995736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pItM3Ix+BDw9/JSngNN7OicgJl0mdYEBGF4MKXl4ApA=;
        b=Eyf/z8gR9lZGhIrWP9fq0Rm95PY8dkG1BmJ7mqnvvCYGgUE2rvKuvA8kmH7Ea+yBQg
         tMo08vhzVpXZLLew6vemQSieWSpuMTv0pqG7FSDhS/Hv1M+ZysoQOtAKP/T3wMcIe+Gg
         TtXBArFNrGIoYIKLokc0Xr/LJKjATd/YMbyW+0sF/skDJPp5aL93BsA2iDnJMt40nZfF
         /r/E7XstBSf9+piMN+GrOuTY62LeU4fC47XlxuGkRFij/0OnZjYTDMsH0uPIwrqTXa1z
         08fFtLNnJiivz3ypVpNo62wQdNLh/6C3nV3LlGBGbzqfCheWZRrYjrZtXseO2M/6LZqL
         UxUA==
X-Forwarded-Encrypted: i=1; AJvYcCX7+THgig5z0wf5Xwc800zGJ+Rmky3i3bmn3UVKme22n7ouo8ByzWqwb+oWaoBUgkSjbIN15x7BFO31cmGO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo1kZaX0xg1KNHq3hHz7aiPLm03nEQQQT0KH02sFh4VjCT9QJ+
	8nTHkMYCqfuwXWpDBqbDlvHi+2mE/RwckZTLv0kmd/uUSlNjAT5TToet0zk2qOt8NkM=
X-Gm-Gg: ASbGncuOLIQR33xgmynJAUqYrukNd3z5vjB9HIueMFKSIcN5SN1+WnDFIiSgt26SjvL
	WL9t8sMf2pHePqe9DMVoxXCfhhY2fe2geBvmGR/oMSADKlw6fu83hGE7zKIQamObOc990cSPkWz
	zp7I4ljzOdNd0Aymy2MeynZuuic1+eVdUJ5Qr+rD+ntRoUdsRIR/kooxnn3kQpvmCyiz+EdmKPO
	HvMKXXAHgArssEcLWbB1Mem4C2uuaQ4cMpaAmidrDSG9as6UVMYZwH4yM65rnsIaj1OpbzRYRLE
	b7JkI+VCHFLCKTPsedCrpqVG5Fl/f+yzMF5fPnvuihftYTCbv1meF028DEc6Sxe4qb3CnsImMSr
	f/w==
X-Google-Smtp-Source: AGHT+IFFB5ah+p+k2xTVqwWPdQPiTDaMINmyptlygkjwPQ2y+PhvqXL8U5LQdhDamfglLxAayP5PsQ==
X-Received: by 2002:a05:600c:5307:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4538fadee1fmr165981895e9.7.1751390935993;
        Tue, 01 Jul 2025 10:28:55 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:55 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:34 +0200
Subject: [PATCH 2/6] clk: qcom: videocc-sm8550: Allow building without
 SM8550/SM8560 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-2-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

From the build perspective, the videocc-sm8550 driver doesn't depend on
having one of the GCC drivers enabled. It builds just fine without the GCC
driver. In practice, it doesn't make much sense to have it enabled without
the GCC driver, but currently this extra dependency is inconsistent with
most of the other VIDEOCC entries in Kconfig. This can easily cause
confusion when you see the VIDEOCC options for some of the SoCs but not for
all of them.

Let's just drop the depends line to allow building the videocc driver
independent of the GCC selection. Compile testing with randconfig will also
benefit from keeping the dependencies minimal.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..26752bd79f508612347ce79fd3693359d4dd656d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1391,7 +1391,6 @@ config SM_VIDEOCC_8350
 config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	depends on SM_GCC_8550 || SM_GCC_8650
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.

-- 
2.49.0



Return-Path: <linux-arm-msm+bounces-64166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E7AFE56E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EBE1640DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B3C28C00C;
	Wed,  9 Jul 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UqSOyYZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2528B4F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055795; cv=none; b=UqyjDIliR2QUUeTcoA3Di3F1Xeb6Dt7XOvH1JWLYPqLtzVGP64zoWKnNr7AL6Ucjo6vuIsz2xdZ2UbGoLVYEsxFlREeDqlkus8Tv5mLmKVnfHdkHnrtjCG7+jJu5QPlQVB/ch2hWH1V0QGbO9WZVzgEBDDaYbZ/Jy0BrZz/l9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055795; c=relaxed/simple;
	bh=JYs69k4hNVS5lPqOM38UStT63udUZ2u+pAlopyA1oc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1EY74xz82Re67AajXboEFNe7pS9OVWq9kopd+ZFyrPQ6i0Z12Rbepk2JPuj0xfjyVwcRlVwB0PKW+DXnPJ96t/q29MpZhwDzsGxyBty/x/e5F7ne/tcfALm2neR7EgtrnHapKmb+DkGP5zgK5tMzVg9TX+AyYTRkZhfxaqYp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UqSOyYZQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-454ac069223so4338925e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055791; x=1752660591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJKs6pSGcR05CnjZyNb4F7ZsaFdoT5cYwaxabxCmccs=;
        b=UqSOyYZQh+98RK0/aH4OH79yKtZjNK9N+yDOP8gII1q8Gy2fg6CdBfmFP7kjOxN3xL
         +dxibtKcqZlYN+/YFt5MPaGMAZhajDiYHd45Bb/UkAG050mvfNaDga6sxddUUW1Xmujn
         /Dr0lHX6Fsran9mlaBMF486WRF87p0LScCOlknK7tEtCD5c71x3uc5YUUmawWqI7+GTr
         /jPdQN4qSstR9RvlpiiTn0AEUK5YFPwWmIars3uzddbhkqha/fb6fetxMxvzcispBkG9
         fpZ0OBX+wm5MwtCBGegv5mRoXBnXqZHbDZtM0f0m3di1ld+uLASLOWsMiwkDvIgjo/u2
         ibJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055792; x=1752660592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJKs6pSGcR05CnjZyNb4F7ZsaFdoT5cYwaxabxCmccs=;
        b=V2OX3cDPScIVJaLV8C/JMJ0eMy3JoLTeS2ew2k0OjS+5fPMyYYrEQaC4VhdHQsGYFc
         qY3k0xFhrqD8Z8k25sEkLrho0PtKt8lY8CtmuKSlUGFMNXVdMeSyaSUoVk2uxCMbbI6Z
         WDj/ZrOTLbsVxeJEaaHfjCKHn6Bd/obj8hcV7+hbvQpWsjtr5TQVytuIEyDcU2y96rwu
         EiT9TdnMgRenrguxKIsPN5paZXsa1aAGM2l2Mp7hWhx1ZcT0kQG1JFKt64AnXboeltzI
         xB7JXityb1umT3uNqGbyHQ90TgHqEVUNWmJd0NvJ53dLiohuSsElqfe6R0dMDcsT32vp
         SDNg==
X-Forwarded-Encrypted: i=1; AJvYcCXv0tUvEmKERrHbNUV0QLKCwLsnBKuE95zFd+FO/ANhHTo2pCtWZ25XF3/kY6MTKi7hf/UJP+34MKJ443Jy@vger.kernel.org
X-Gm-Message-State: AOJu0YyuI+qiJnrL0k0l3qOfu09xD461fAtsR6knegPDCGoNxJCb2av7
	P2EXhpgOclpkpuKX9ayfP7i5vyEBlAVXTo/GgrCJZvZrrX5ln53Bck9nr6th0h8HoI8=
X-Gm-Gg: ASbGncsiJM676v5LUGnr/x3slvO6xtA83ltkECeecTCTKGLXRtEYs2UIlEveOowktrx
	SyyFhznGSx1eAx8IvnkkIiliXxHkkz7AfLDOZe54VgHPDZM/My2hjjC6TUPhvB9BsoeMDFjaSJs
	SueE0gsDgX0Q6B9D9q88AWUYPByZtlTSFRfnB5qcGlCiyjFlLl0Mq4RSGcqBBwIwJhPryg9mkD5
	vw/0Z2YNkkTPQ4BrYhhM26WWcLRgmx4NQA92nG+KDF5bcwDn6UVxR4cnoRU2mX/qVTjojUi63oC
	eCKoTg8Xv4esTy1b1CaaMBhbLRqqscBPt7vrAU2HqVkU26+ikEZ4/K/q+RtEodw61ed0f3ws67m
	Yyw==
X-Google-Smtp-Source: AGHT+IFzc5yFh2wY77gjYrxQjTpVR45vDYq6+m5WrPEq+P+xzIkohYmigMzwvUyhRV68cdwu0zEDuQ==
X-Received: by 2002:a05:600c:8b0d:b0:454:b97a:486e with SMTP id 5b1f17b1804b1-454d5602748mr17103525e9.10.1752055791519;
        Wed, 09 Jul 2025 03:09:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:51 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:54 +0200
Subject: [PATCH v2 2/6] clk: qcom: videocc-sm8550: Allow building without
 SM8550/SM8560 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-2-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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



Return-Path: <linux-arm-msm+bounces-21042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C91398D4285
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 02:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790221F244B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27DD1757E;
	Thu, 30 May 2024 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGMcEO3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9649134C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030285; cv=none; b=iYomxVXa3eOqkKuZ5zEdr6r8tgV2kDte0Tvx0hsMgC/cGd2ioXoffA7bZ8zdyetNtrUkcnp6pP/YIew7RkD04qwCdeZMX9HX0EFuMyWfXNxiL6L4V/4D5gzZpcqjVFOmr5KP7M1besbyienIsHcNOZZqSGPgYmS3z2CXiXGLuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030285; c=relaxed/simple;
	bh=kmKy77nhcOHi6YYrTMmhX1IdbFXK68Up4LbunGWp1+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPuVcdRGHlAA4++Xr4pbclc+ZNWBRkCsabeWygMmbjNvmu9aE3flxZTqyp9QCRb7uWhSUgYAIVy1p1qu3j1evDaWdaTuCdKZMYKQBP7dkZ99cGYAiGl/8GyPFilHVxNxu2xo7ggQ5IkYbOshGnyCCpv+XgRNbU9WmwMXnF/gIcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGMcEO3W; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52a6ef5e731so477589e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 17:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717030282; x=1717635082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQiN1ahCU63uSRq0f1YjoqnbirPzB844yeiZBL32yy0=;
        b=JGMcEO3WUgGkVqkA8BZnmaC41ibH6CSycHGdyNj97P8Sso96nY2n8Msi3X6v+aVPqM
         lia13z2yjCi/4h+pVo4O0FvUUvkCRokeOj0JtzI5JemBNt/0yJplKPXzz2/NHgNBhcqp
         ts4fLwMnulAICI0wwFQb4UjAVQupn4dBHA8kHSebLsPWRbaaUM4mCly/GD8XE24kHoL9
         vqC9dHxH+ycNcmPytC1TTp6oDLNhqr14Ad5E+CqBLj/lCt2DMC1/FMgvszDY1xl6yLGt
         zMzEQkZhawCrpHcqFch2/IpGWSPonmbYMfXmJCEsXgg4geHbDeM1RvFVetvZpa2+g4Ro
         IOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717030282; x=1717635082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQiN1ahCU63uSRq0f1YjoqnbirPzB844yeiZBL32yy0=;
        b=Z8cMr8MgGs7tyMl45iju/ybmyNsikcSNg1iLSKZf/E719W/tAC0h4CyNHXNOcHD1YK
         xGjJuyLyx9Av4j1Rc36oza1LTRCaibCJDyNRmx/hdwa/eIHHLIYBvUk/DMiMPeJXV0lx
         Sdiv5drGy5TUSY8Yc30ksScb/znwODUOMOLvaMxFGU64+p7LMRLiAZ1f5+MqieYoO/XT
         AWVJqUwb4a6RVDWRTwdt9dJ2BqssSeDEkuHG1UEDFzCDqSjOj72lyCB5TRak2vgyFoSL
         214bCiG+Efw7E4+v9UsQwTr/vibQCvhftH5O2fJNei1THN39Eawxl59cc8gWNsIKZTbT
         1bAw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJavA5uLBBA/B39sjUbaZ2bSL1qMJ6HCKcQwDrpCdgOF8Ve1bGA5arOn+ha2aimfDp5MVc+Gj8k1IzpoZFCAk8Fdzv/Y7q1IJjwnFVQ==
X-Gm-Message-State: AOJu0YxGSsRbdiQklZCSypgKTXLeGZJbSozuKe4moiO29QxoOoxKFWnu
	GkQvOQzz8MJZZEG5QXQsz0CrPqwHn6T/GbhAfn6dVQX8f79KrCKEX7BdWPRgQrdR6oVlQsJfHvG
	F
X-Google-Smtp-Source: AGHT+IE5hnRoCM3vFZL25CCrQ6o/Kjpbvic50SmCRJzBb46WcO+btQXvcH6Ks0O8y8F8NuIbgiVEJA==
X-Received: by 2002:ac2:5487:0:b0:523:a5b3:5e1d with SMTP id 2adb3069b0e04-52b7d419e1fmr348530e87.10.1717030282137;
        Wed, 29 May 2024 17:51:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b233sm1396534e87.135.2024.05.29.17.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:51:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 03:51:14 +0300
Subject: [PATCH 2/2] arm64: defconfig: make CONFIG_INTERCONNECT_QCOM_SM8350
 built-in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-8350-config-v1-2-d6e871236ed4@linaro.org>
References: <20240530-8350-config-v1-0-d6e871236ed4@linaro.org>
In-Reply-To: <20240530-8350-config-v1-0-d6e871236ed4@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kmKy77nhcOHi6YYrTMmhX1IdbFXK68Up4LbunGWp1+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV82HtXrWBv2+7qo+AmuP4c2ZEsT6rPCAyiOf+
 zL+RRsYImKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlfNhwAKCRCLPIo+Aiko
 1bPIB/4j2FfkMU/evBkmeCVfszMfVPHTqW29i7LJajJYpyXD5KcidENQXIGK6WOaG5tQHEze/6i
 Ihox0kAc0SG2RKhm0WwWUndwGcjLqMPIlMGtCOauVbdbKqvjPVSH1GknFyYEkOfWBHdf+OG/Mrs
 vlOE8iewaRVIySyXUs683r1onkQjTeGO0dYE32NyQgjysqVet1ADtaZIQooDF1hAsZBes3eZgOi
 oiwRsAc6Co0FlblNpTijUKT01E6Ty04C/vzUEOkQ+KXHHworyMtuvjri9BZ/9AHlnWlVT0v/JqP
 BhMsVttwvvP8qGDffzYMfhrBW/4rjegr4Ng3Vx/QLhB2AAS7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Building interconnect driver for Qualcomm SM8350 platform can easily
result in a device hang / reboot because of the resource starvation.
Move this driver to be built-in to prevent such issues during the boot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 63a8e9335efb..9a467dec78b7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1612,7 +1612,7 @@ CONFIG_INTERCONNECT_QCOM_SDX75=y
 CONFIG_INTERCONNECT_QCOM_SM6115=y
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=m
+CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_INTERCONNECT_QCOM_SM8450=y
 CONFIG_INTERCONNECT_QCOM_SM8550=y
 CONFIG_INTERCONNECT_QCOM_SM8650=y

-- 
2.39.2



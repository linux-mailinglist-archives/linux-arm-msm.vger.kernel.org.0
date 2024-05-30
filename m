Return-Path: <linux-arm-msm+bounces-21041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B88D4284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 02:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 307F01C22BB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1813FF6;
	Thu, 30 May 2024 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tL3KgM8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A3134A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030285; cv=none; b=Rlme3bDOFtpiECKX2Pi8kp4poLQ+jhILalFhajiFQVf0hfnne3qago8ZVSaeWvbk49SDgGayg6ZxSlwwPcaNxDHtFquMzoV6qVEeZ1cyufAcKuwCRzE1uGO2p5vD+I9b+PQdJnoYGyKvVOfWatMPo4jNZmKT/Lvg9AeE2NLCbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030285; c=relaxed/simple;
	bh=uBjpRROAGGhAYySTps1Z1DH7fMokpKs/t6oNoXzZcRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY8XEPmnOXR1vZ943GEe4ZfXFWl9a8C3gVXpgNdWNEgrdmuUzKuE5eIRP+ZWyeRyatbR/est4wuedW3Yzb5/yr3P5FY2MTujNJp9csp260uNbM+C+YNXC3rQym2tyggNSby8zxgPUPqlXnJhFOvT1NSnWGHSlB+pFxMrsZtfTrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tL3KgM8U; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5241b49c0daso420969e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 17:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717030281; x=1717635081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5e/r5RMn9m16zlatVHzqiL2Yg0qN4c5NCpFRCLCIA8=;
        b=tL3KgM8UbS1VkkWSxhtwLYp3wE8IhJW7ARg1azLAtT+PEYCPzqKUfUmB+6UOsiZHwi
         zeHSsient+cu0TWRC/DjSUHs8draa+rsj/V8WIEqRKonOouJ/xj/1XIyZy7t+Dg5ZlfH
         Wi9hvbEgPGu4BUGvXOSSFFoaE3kE/k/ws0YDPx1pmqXN8mvkVVjHoX9YoN6FSk+1LGFC
         maB+G4/D/Er+m6w3wDdItSg3SVjtx9Wv1kdRCE5c/q7+V5KWyEBZ7KNjGtPbnL4Jl8Hx
         S4/cr1xPr1qam3nJWMQYKk+dazbg/NGmrB4SAi/x3pMVlU3VLx2o683UlI7PM21eb4GE
         caMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717030281; x=1717635081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5e/r5RMn9m16zlatVHzqiL2Yg0qN4c5NCpFRCLCIA8=;
        b=Q26CN3rZ8nWL5sUoX1mcDPHpUdSP9VyEOVGCNDkQh6oeVKj7BNTI/1hHbskpEbaXa/
         43n9Xtri/PS8c+qWJrF3xTIHL2FdE1v/GPMlVIO1dQlUbXR7tWnu6N7bMlH3oRqHBf4v
         lECmkLKgqGuzmn0qJ9NPkejPHXTq01LS1TNySq8LmvvzxjLpYqT/7r9wmWJxJwrtVu8g
         0tjje+HBvr7nNhZ2dOcaReDzn89uVpUazqlafNKgHoQmp3d6HAnUHoizS0U45jW6DIRL
         1E01I5JjVkl47Y6mPsenYN6dfhyzYcM1I/9YyfPvYnfNw8IBz2VbsLkCl5iFv1YTJUt4
         +uUw==
X-Forwarded-Encrypted: i=1; AJvYcCVOHSVswpsL53sIsPIO+eAE2g9MzzuV9/E2fJknUt4XWOftGTOmRtemOA6UZzZN43wGGAcHO+phmloJhwUcN1DZIndM6FwoQb5VDjVRNA==
X-Gm-Message-State: AOJu0Yx9y6F36M/C1vLB/V099k5PCM5djFwSuoiZPpAQdxmAEtIVHJKr
	ThRoTQbFo4Gg08IycAmrkutliNrEVDp6Ko4Q8yHrBRAUBMeo+SaLSXhMyXeSHBQ=
X-Google-Smtp-Source: AGHT+IFwWnMHVzQWB8b1FZCKBCdwEQSHT+JYvAAE6iaI8jw7Hm6calf+iUbpHFmDBPNDGPDvknHjpA==
X-Received: by 2002:a05:6512:b8c:b0:52a:feb2:72ea with SMTP id 2adb3069b0e04-52b7d47ac74mr543501e87.55.1717030281530;
        Wed, 29 May 2024 17:51:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b233sm1396534e87.135.2024.05.29.17.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:51:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 03:51:13 +0300
Subject: [PATCH 1/2] arm64: defconfig: enable CONFIG_SM_GPUCC_8350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-8350-config-v1-1-d6e871236ed4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=722;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uBjpRROAGGhAYySTps1Z1DH7fMokpKs/t6oNoXzZcRQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV82HebzneriVMwImdOWiB3mso9XrDBshYsbe1
 in/4fteBTaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlfNhwAKCRCLPIo+Aiko
 1bB0B/4rrgK07tUTadnJoHd63UKKNU0UkaUJvXlsaAmslXY4nzr8PZbV85bTAKjhusEpedFoIeJ
 Pn0pad0Q+eipmJuG6UCEUdriZUxaWFo1+dhCYToVof3yLawXNOb/AtHMVeYTI+drZeMBKG0BL7K
 G5LV6Xs4bc47PtqdMtbOTi0q623J1J7sScBVpHwgVM3sIiAjryslqir6Ksvj5oJiyfv4MzUXkzQ
 OMrilvhLNpra3smBD7NIJgBE74okk7z4AcFlTK+b1Ydh/Ba4YuoCgzPeOX4bE9HJ3ImSDjINw9T
 QIio5nVtaH312Ews1vcqZKEs+EDhC8tP/XK/m0mzd3BE5MD+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable support for the GPU Clock Controller for the Qualcomm SM8350
platform. This enables the GPU on Qualcomm SM8350 HDK and other devices
using this SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfad1cb8a072..63a8e9335efb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1336,6 +1336,7 @@ CONFIG_SM_GCC_8650=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
+CONFIG_SM_GPUCC_8350=m
 CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m

-- 
2.39.2



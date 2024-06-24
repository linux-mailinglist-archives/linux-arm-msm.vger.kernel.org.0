Return-Path: <linux-arm-msm+bounces-23996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A891516B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96DB41F234BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596EF19B590;
	Mon, 24 Jun 2024 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbkMOSAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0B19B3E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241723; cv=none; b=DJ8oMIivNs256I8BukkbY+E+uRWN4VSX+R+9yu4bkhyOSRyjIcjx6OzZBI25ld8VZhlIOKrTgE7i0KndF8KW3HQ7Ge8BTJlRxgFZByuJQVBq6PsQ/F4Pt60xJ7wOn0ipJ7j4k8CyD2cr9roiDNreXiDBtAge/iszjKrtPa+rXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241723; c=relaxed/simple;
	bh=8tKzwExQBw5uGrVk6EJMh5rj1XlrJN3GYv6ujg5VdWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bad81sTgxsWcOf4cKf91A0Kr9pZWPwZFEsrAj4LR/9AdbsNG8cz1zGHcewPq0SVYLLnoYsNtH15m1eJrZiVHi0uvRfBei+ilLPKFacOp+ezvXm2cumKf8lNJHcif+qcl7TDHA4SJilAQScaUWl+dL0pIdoasnFS9HsDkU565i4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbkMOSAC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so1947614e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719241720; x=1719846520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yftIHZLp8eHXmdT76tLth9/O15e8LEzT136xzEFdkw=;
        b=VbkMOSACxfpY/8axgh+Mtj+KNZPTQm7zG/lBCQGGTEjtpMtP6G5TLhN8KPD34lumHt
         cAMm/IARm+GfyYhbDQ0z1TCHr6B/gYbaxU6va2zPQE9UQhiqkrS4rPqH+6x5SWJXHR8g
         j3wMnr6MLc3AOy2NaIEVvW8RNzCoD3PPdVtWNmg6Kth4yfOXlnOZjwQz5pZs0ESE4Hyb
         2K/UG/WhTfjI6SW8okHZ7wvyzsEO5eZ9friwIlFUgwAh3Iii46ll5XnNwNmby0tE2JtV
         bhZJUdThU6s6Mw4vNhER4oQPI8BNFQG2YqZdkdfXJrWMszWL3DbCmwJDk4yjcKFmK1Ir
         OJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241720; x=1719846520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yftIHZLp8eHXmdT76tLth9/O15e8LEzT136xzEFdkw=;
        b=AnyDWdNeiZxOSXKLJ6XELD8fCBuO8r9qKk+RmbvaNXPEztCR5oItdQ+FmBMF8e+YBY
         jd33qkxphlMTvaHepseXXzG51eK5QgaqYiVsqFUYON0q7s2Uq70b9zN+xTxbKzKgrjXD
         NGMoiVy2LNSNbB8ATJ2C6mNkjv6aFqa2XT3uXYtBV5vRivIhszIxzIKC8NaNcgCFHFfk
         /FHinKhPQ4f8vUZRf5ElYpB14vuFG4Ik6XTvT+aW23CV7RQnjAmecz84MU5sIwZaTOMJ
         6m+SvgvrYZ9Ddxq52P19GjUz9npOPe9/QmeCcDY72DROjIn/tR32MYIlsfETKfmik1hZ
         BOog==
X-Forwarded-Encrypted: i=1; AJvYcCWxQnzk4XRTf5Un1a3z394OXpquYNS7wNykmFWLSvWb876Q9xR5IkJnLzFW7drYKQGaaWWQ7dMR1lRAJfi7T+VpaOk6mULzKD6zxi07DQ==
X-Gm-Message-State: AOJu0YwbxM3mecv+gMlnKuqLb8/5a0RZWuMIvXn3Ji9U/ntVBKHhTUun
	SdXexim0nJyVYvevQ+BiD7gGhGbuTHeFC6nwAOAETz06OTD4DUfsiL+jSxA84q0D2wniyUfD5tq
	gzBQ=
X-Google-Smtp-Source: AGHT+IELVkPKwVNxN4A8tjYiAj1+PNkuEIcPj1BT6h+vBIKPf78ibBEW/oj4NhDWMyCQQAB4BI1qfA==
X-Received: by 2002:a05:6512:3e0a:b0:52c:8b03:99d6 with SMTP id 2adb3069b0e04-52cdf7e671cmr4534542e87.6.1719241719587;
        Mon, 24 Jun 2024 08:08:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdbe1bcefsm840571e87.159.2024.06.24.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:08:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 18:08:12 +0300
Subject: [PATCH v9 1/2] platform/arm64: build drivers even on non-ARM64
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-ucsi-yoga-ec-driver-v9-1-53af411a9bd6@linaro.org>
References: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
In-Reply-To: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8tKzwExQBw5uGrVk6EJMh5rj1XlrJN3GYv6ujg5VdWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYvdCXewCSCLSdXZcWMlvqcJCP+gz8j/wucKY
 S9JOcrMdKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmL3QAKCRCLPIo+Aiko
 1SdLB/0YqnLB7JfF1aiZDS5x+Xb1N0rQq37UM2WWrB83zLSI+OgOmiMTBVzi+jU8MRm6LXmrDNG
 Ld35FLuCVkZ2Mo6xirDXm54gJ2IF1a2YcjDVhHFEEfCoPV6P90XMnTlmABibiHowQB95UNDkbOQ
 G+kAfll8P/solgJg0IsU90kkJnX7ltAg0+T7uc5fyIOGeQqkWNnpfRoaG87v0JxWFIFmCQBGu+n
 2WKIpVdFL3+7z6JOnjMng54qkQdo7IgjY4YRLkV9zN4hrFnIK4nmkt/JMFQMtNPjR19VuvnqXSd
 U1JE40KQzJUh1X7GpY41fQOjdjuIK9CXn2DzEJZH7aH2BFyi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Kconfig for platforms/arm64 has 'depends on ARM64 || COMPILE_TEST'.
However due to Makefile having just obj-$(CONFIG_ARM64) the subdir will
not be descended for !ARM64 platforms and thus the drivers won't get
built. This breaks modular builds of other driver drivers which depend
on arm64 platform drivers.

Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Fixes: 363c8aea2572 ("platform: Add ARM64 platform directory")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/platform/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fbbe4f77aa5d..837202842a6f 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
-obj-$(CONFIG_ARM64)		+= arm64/
+obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/

-- 
2.39.2



Return-Path: <linux-arm-msm+bounces-34333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9999CAEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0E3282DAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76511AA793;
	Mon, 14 Oct 2024 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CbkdEWNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC991AA780
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728910989; cv=none; b=YqyY6Ojn6Nm/bFQrRySkelleoLidtYr3VftSPaWLNU5bYFd0WWTHjOtKcnpa3KVXIc0iekpSDK7Xbxxh3b2H48Xwd7hmq3JSpR7nX0n1BVr6RmUbwWhT/lc439sO+cZHFuXLH/QBos/2ULwNeLFoj8EZ/jhVV3q5UowRlP38UkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728910989; c=relaxed/simple;
	bh=dCK+DW1YbqRVuM/4/F40f1zS9DYsJ6d8yLlFIWV+hww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKl/6AQzxo0iT+Xh0izBISMeMVeRDpE4p/ljdfgHzdRE58iwo/Sz5+0hFoFBh0v+NS86qmrTM0CNMOOS88Mg02gTOERGiuUH74QI2Y9gV870GJBsOkp8gKiYJL4xPM6oN9RgFcUPud5jPsC+fqR66G8QmKVBVK15JazpCS73ez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CbkdEWNL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d325beee2so2563407f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728910986; x=1729515786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJYNt081JK85+5Dhz0NObH0VzYCa5RTJdLoiL++atAM=;
        b=CbkdEWNLdA31yBsQdMYR2ve5aw713k31Z63PAlDSDrlM1nBeolnHkBqZvgP+xTdfut
         AAgi+Kub2ZUXjCxLHTk/jThDARJS/ncN2h7r55/CN8iWewe135XZpN5MZ82E+JPqPL8U
         IikgxfWySjNY+aOf5byXvteYhgfGrlRDvdQHX3DJQru5mWsXj6PVdQD3m6xridOo0/aU
         3OKnTIpKTBiPDLeldc0ozC3WtAVaifvfdcVFAGIvct+PYcz5b03puh62rCevdFzFlVOk
         8Ghwp25f9s6CbAHnnbst/uBV7Jblx76RuJuQfBZae1SGTmO5QAeLhMrUrD5XNPRl/1Lm
         eQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910986; x=1729515786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJYNt081JK85+5Dhz0NObH0VzYCa5RTJdLoiL++atAM=;
        b=WxUW3HfTIAMpXoQwRo0e3/43hIWo2xMaDrUD3nJyvuQ7//QKInPDXjrJf0IWIv/FAh
         XaFvddfR/P0C7eSdOO4kGyJABe/KSJpAxgXH9nkwdBMnrdpX8QWY85HIotVP/bMQaGEI
         XyDQlnKw/vbj/wbw/LPWb5lyqqu83zzAor8LHJJISEHcUQwrnh2HQty9l+3/lK9ttphD
         TkwwxVCCTNGLoIpxQ0F8aQfg3sSpZdX6RSSLYT2xQbSHYvwZotGmj85nsKa64pgKg4N9
         taZLiZvRZYyvufTpQxpTBtDm1fxiTJi7Vyt2twd39AVr83tulxMXBg4oJrYILhrL3wKC
         +K3Q==
X-Gm-Message-State: AOJu0YzRitQF9kiC5BKQ7Cn9Eicfxsqo7l/I/+XrKsR/7VPi6jhr2GuU
	75MGmtxScCJLgyQ+qDyRB7RVYIkiw/zFQDFJfrwN/9NmWBWC02wiSixFHraYEExDgH1pn9/oR9l
	z
X-Google-Smtp-Source: AGHT+IHBs/LOJaklozA5s6rUdu6NT0YhsseIgrE6DLZ49XBCQe2RyNV+MrhEXo64DyAswhy5eLPQvg==
X-Received: by 2002:a05:6000:1045:b0:37d:4a2d:6948 with SMTP id ffacd0b85a97d-37d5ff6a4d5mr5078819f8f.33.1728910986429;
        Mon, 14 Oct 2024 06:03:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cffa5sm11360500f8f.53.2024.10.14.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:03:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] soc: qcom: rmtfs: constify rmtfs_class
Date: Mon, 14 Oct 2024 15:03:03 +0200
Message-ID: <20241014130303.123394-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014130303.123394-1-brgl@bgdev.pl>
References: <20241014130303.123394-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The rmtfs class object is never modified and can be made constant.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/qcom/rmtfs_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index df850d073102..469e34864fbe 100644
--- a/drivers/soc/qcom/rmtfs_mem.c
+++ b/drivers/soc/qcom/rmtfs_mem.c
@@ -125,7 +125,7 @@ static int qcom_rmtfs_mem_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static struct class rmtfs_class = {
+static const struct class rmtfs_class = {
 	.name           = "rmtfs",
 };
 
-- 
2.43.0



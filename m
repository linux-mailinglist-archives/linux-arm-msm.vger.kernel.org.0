Return-Path: <linux-arm-msm+bounces-39812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8599DFDC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39668B21ECF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278241FC0EA;
	Mon,  2 Dec 2024 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Iq94b2wE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD551FBC8B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132952; cv=none; b=TQASpPwGSgvwGTOgjCivI4PKu/RoNyTUAzpNTMUYG5ycHsZBiLMLgLRPx/6CXRDbiJhvLRrXqr8x6nYVHESVTnhonGD2cx5kgZ7Z1kG4HIX68xphe3DYgM7Kgglp6LcKzFGgMzfTfvJyHLqP+DAGP+8uzza95asDapKxtK8c8Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132952; c=relaxed/simple;
	bh=K32+C8hiXE/ndgycsEiJqGzR/Swft8zJPfIfOlRu9rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMSF30peWRQsHgowS62KMnzcEx3ojQ5Uo036AJb+VvN5n0EaXptH0sfIdFjTqbLqk/SluU2GPT9WcvxLI9aPg+Noi6CZN1Z494zzmMc9ySA56C4QHmS0ne2/H/gMf0v/dImnAMFywrpO8CYtPzvUd3khPIkkKBhJLL2/kpc8h8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Iq94b2wE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so23275605e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733132948; x=1733737748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjAT8HZZIYRaFVFPw0qPZMm/T107boOCPhU2AJ24OYQ=;
        b=Iq94b2wE6C6Vp45iLhRwEQhZzJVFmSvSAwC5Q3qKcsHHdgNNWM28J2OkEM631wTvfT
         sxa/tyUmXvIxvNASOAl5j1ZDqRQsJlkH2bKV42OUApyS2UqVufP2qm+npiCl8/e0rND2
         MEBHCojA1VYBpA9XsvpU0kHNEEZ1o5G6lFyKSaOuu1v+JmjsxhGDjJ39Xf36YdRhibDT
         9AN36PsAlPdYB8anxTVj8yy4LUJLb1Ju0bCndG1ZhJu2eCba7zRbrZqeM5pcr3fsBlg9
         LERkMJGCPESK7SL2XPwUK9DNzDp1sHaIMrE0V+uZ2tnCIJvsvRpreuP238UP4zNxlguA
         xMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132948; x=1733737748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjAT8HZZIYRaFVFPw0qPZMm/T107boOCPhU2AJ24OYQ=;
        b=lnU6MPemy7AP6Bi0rBM9IrEnVbXGxv988KNjJrT31M2kBLhjLCQe85qi5AOtYloPgl
         0PMmEozQIV7irV5g3CC14M2rUz62AXaMSqmDhkDocrtwnAw/9zMtUPaoveFg5XNwWZA2
         B1dkoGe907LRuUb1RhFJl3M45Le3g6Avdm8HEYT+isX0opJ3FX24A0PrvoCdFzGRRLwm
         f+R0FUIVhRmSRiNYj37nJm+vIsnbLfZ35y7b/GMprAKb/2095e8RW3pLC/vUBiNuYjxg
         3buaOqII4maaIQTrx7fPKu6hZLU2JIaFXO7X2wMEeKFSVtlR4yQdfpDutAyfcQK4Qe1G
         2P4Q==
X-Gm-Message-State: AOJu0YxjRXJnd4/bZ1ADuUQFgj+QRLVkzk70Cf+jxO+pYudSj4KfFEFB
	l3lyur2Gu6nay/WQQm3KtBLtjaxp5zAtoLAISlQ9NaP8wwrL6FELJ/FwCo2tfPQ=
X-Gm-Gg: ASbGncsnJ2YyBoFmADHMHyd7P1WCrILgPdTvjdydv1/75GKdbkQWW0E/0y0+Fv7+sZ4
	Q8ef7ZOCbvLyYx+uYZrjg9x4Db0gV7BOqAl8IF9QhUlAjmsucC7WfUzAlCWNbpKOizARttRIguT
	sdJOkF3OJ3U1nJIJVBH5huWpx3JSmrZekRgu12OOJMKNHuCOg/LzWMgygToy+2heFa55PGppGb0
	S90oEwSHo0Vt1BYCGQFTywtDv44cvi08pq9QGmr/Yn8jj7wDA==
X-Google-Smtp-Source: AGHT+IEJZEiFCb36d5aROe2H5pY6QeNqNoxAK8OoHa+5immK0fFg1uKPM5A5PDlE/rJKRZUCfTPK3A==
X-Received: by 2002:a05:600c:468c:b0:433:c76d:d56b with SMTP id 5b1f17b1804b1-434b6a4a383mr118821615e9.12.1733132948686;
        Mon, 02 Dec 2024 01:49:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:223b:dce7:ef1c:4bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3c21ba7sm6486475f8f.53.2024.12.02.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:49:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RESEND PATCH 2/2] soc: qcom: rmtfs: constify rmtfs_class
Date: Mon,  2 Dec 2024 10:49:03 +0100
Message-ID: <20241202094903.18388-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241202094903.18388-1-brgl@bgdev.pl>
References: <20241202094903.18388-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The rmtfs class object is never modified and can be made constant.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/qcom/rmtfs_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index 33603b8fd8f38..1b32469f27896 100644
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
2.45.2



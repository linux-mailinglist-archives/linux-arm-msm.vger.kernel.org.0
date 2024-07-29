Return-Path: <linux-arm-msm+bounces-27259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D252193F5B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ABE5B2238C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B72614C5B0;
	Mon, 29 Jul 2024 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdIdYL+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAEC1474CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256940; cv=none; b=NYPsqb8Hx7EAwxQPZC6wnAVxNciGtiuniH4vzb/H04/VeJe99yBJ39G2zbEl76f0EfaQ6+Dd2cIA3p1Iy2OQbibYTvnvQz4qIEIvvIZz9vLtls4de5M/Pw/hXHat31CyWrIm6oDGD53zn9qRWERoY1rp3y48ZpB1QrAcnM3C17Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256940; c=relaxed/simple;
	bh=XMtSAnQLUPLTjEcZ9/jJuTztPkljj4KBCEwVdIRm9FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhsrDXOcFu15Zv9A+xj7pKvwacHUuoVqlMzz6uGxe/07OSwK6Bw0ArMoqCDGKyrEvecCZe4+batj0ByIPe0VV5pEgEMgYw/awi0EenocCtBVxqZLNYWqAy6aIAJ2UdhAHrKb0cwGOCekxUbcclWxNHcL8AiPRj3qi1QiRwWQ5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdIdYL+5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-367940c57ddso1460387f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722256937; x=1722861737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N37H6kLbkNAIPuExxunsB7bhPLTHsDDj/8KnxxdH8yw=;
        b=zdIdYL+5faQpUDJZwI9HxYaAMurA7BiYm+TksSWvmQGV+37eD/VWOMxc71Z/GNIJY7
         6T808NtQfItXKarLR2yWJg63UioqK9129dtyXa2TKxQflgtmr1k66YSpdKhkrpwBdzk6
         /nA4cGBVgwe3DDGTTHD51/whL66ZH4wXzuB0OsuGVlulJGO1A7TbcIjxiCqm9uy86O4c
         d+TRsVLkhIvauVLiGi19uEI4FDWl0vDR4S0nAOf4dmSh3qu/7C9tHZF1/8xk2eItr5dX
         Xx8SmFfGQHCKrW667KKG76uYtFtU3KjgI/TnE/VzYKoQCduOjarIbPh+PZGCmViZezrM
         4+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256937; x=1722861737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N37H6kLbkNAIPuExxunsB7bhPLTHsDDj/8KnxxdH8yw=;
        b=K804sK6p73UQKzfbprR/9Xfoq+mFbc2i784Ew88OqEB0jPPIMXemdEx3wYwNBC7niP
         cBgjQEX3siqv2JEZINnpR0kpLR+TinX/aYL2xOAZXiru+gvQUOAiqgPNBdMeGU7kjjeb
         3rMZRdYnedeOWKbn3UV4fm96f5fHpq0ntnVc2TRBpe2IJZIOkDF8pdoqfmnJ0PstfXfy
         dJf2TBHmb3NCNQLtblqru9pP1KeNnclcedt4wESaS9g/o0KhJt2if2vTJOuxpJBgZel5
         I9GMrdvWJ22qpv6vW9ud9xryFrvWBW0qGT9ZTui3+0siwAhN0378xCQgsun5RoH5r3aK
         r4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGY1JGlN5j3liqhD6I4ERl0AhXBHQRPFt3dbgV/2U5xm4sIMyDM0hbiePTI4/MvueqmwlZjKmznSCD4/P+AzYuJvOAcV6n9muWBnYnQA==
X-Gm-Message-State: AOJu0YwYHp6I3KbU1ulo/++akNBDyYuW9YG+tYzqw4Kkel4UeJb9sEyI
	WRrteIXqguFmVFTqvOgUhfHvQuVsh9MMvRPkCfbCbNol9/EUN8sDB+Ox7T9zcwo=
X-Google-Smtp-Source: AGHT+IFd9o55Nf2Yjsmn3MKtdq05hMAb79DL3MCHg9LTvgi6dSD5URw35jk1cVD61sFRmsWeY6X4Hw==
X-Received: by 2002:a05:6000:1a53:b0:367:9851:4f22 with SMTP id ffacd0b85a97d-36b5d0cc08cmr4558101f8f.58.1722256936868;
        Mon, 29 Jul 2024 05:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c092esm12106275f8f.13.2024.07.29.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:42:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 29 Jul 2024 13:42:03 +0100
Subject: [PATCH v3 2/2] media: qcom: camss: Fix ordering of
 pm_runtime_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-linux-next-24-07-13-camss-fixes-v3-2-38235dc782c7@linaro.org>
References: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
In-Reply-To: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

pm_runtime_enable() should happen prior to vfe_get() since vfe_get() calls
pm_runtime_resume_and_get().

This is a basic race condition that doesn't show up for most users so is
not widely reported. If you blacklist qcom-camss in modules.d and then
subsequently modprobe the module post-boot it is possible to reliably show
this error up.

The kernel log for this error looks like this:

qcom-camss ac5a000.camss: Failed to power up pipeline: -13

Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..d64985ca6e88 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2283,6 +2283,8 @@ static int camss_probe(struct platform_device *pdev)
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
 
+	pm_runtime_enable(dev);
+
 	num_subdevs = camss_of_parse_ports(camss);
 	if (num_subdevs < 0) {
 		ret = num_subdevs;
@@ -2323,8 +2325,6 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	pm_runtime_enable(dev);
-
 	return 0;
 
 err_register_subdevs:
@@ -2332,6 +2332,7 @@ static int camss_probe(struct platform_device *pdev)
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
+	pm_runtime_disable(dev);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 

-- 
2.45.2



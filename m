Return-Path: <linux-arm-msm+bounces-48031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63139A35EE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F213A17100B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 13:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9308426619D;
	Fri, 14 Feb 2025 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymAM7X1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE9265CCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539086; cv=none; b=uRVlhjGyN2ZI8FJ3YRGL6ISKZbsT2xbA4KpjOa199zQ3scGjQmOb1+DYFgFrOF7mKKFg3Jil56MiS6Ejh0oCHBieWJxgkAfW3fc3PwTJua3HjcqQeN172Tz7j9joOWu22/9zYZ31T2wOAWbMB/LkbToQvuGKFHffxR+Jt/3DV2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539086; c=relaxed/simple;
	bh=d16enuUHr2tsjXZlT4oW1ZXn1HEuh8ApCU8a6MrU7bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoaEcz+JDGiynUyFEi/dpjVj/QMdj46o85NH7DkEKH9LRt71HAIPNi2PyzpxaUy6kXlVCdXkKo/con88AxJjo00aRa5R6rVlifIlZg92rZ52813Om53INM4NPmBlGUzUpBxHvXKiJ2FK+POxHq482IYa0qBLBLyi2w9chDK+usk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymAM7X1x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38bec08834dso109619f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739539083; x=1740143883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WI6/TNYNauOLLkWpwha0LbPDDPCCxmIwr+Pcoxb9Ezo=;
        b=ymAM7X1xvxcY73UAQRU/rT8BRyPGmJ5i8g8zM6mAe39eOpyChE1ZPOHS6pt17swi8g
         JyXhMC6ye+df8b/8ihZzkYlpqtZnDzpFzCUWdyvYQrO+rM2D8Qy723uNrpZYw1P/oPZ7
         raiu8PScXzY8swtJZa5RMhUkYThEPyEwT9lvG2V90KqggqDjOUmwHYXcdqwQCpilUwTo
         RjxYfcgroR+1yUOOGCwCmnuuxGKDwgBYAsmsn6mI3WnV3Sy2Zl7anDSMwJKUNtVZ5irx
         bEw2W1I6Ut+w1elOIDBDCxW6K7ccyvWWx5vRXUEZP4BnNpD3yrKS8wXLWbFDXNXUsukC
         kNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739539083; x=1740143883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI6/TNYNauOLLkWpwha0LbPDDPCCxmIwr+Pcoxb9Ezo=;
        b=tkdqNkegRKtGINIBEiB5ahQg5VA+wBSU+cxiDd3I2YIuuopDIFsGwehK+xIPssFBE5
         +lyo7bQ665ALFtEdQ1PuUZLvFi8+j25ILaORQNfQVsUsVZC7pXsTiEWbN3YxwVsKQU0t
         QL9H7MLBDcsgwOeBpeQn5hmstnNz6RU+bBc/N28kp/XHH/o3GmKFY6TCkj7V4X9chQTz
         ebSMMw/SASPnBuRtFTDkFPpm0DYoBp+NQMm5GWqBkLsPzkmKkzyaYo6eGh56m2YwZlFL
         p7ebSxDgTFtRjIUEALkdWehpwOqqxG7glWwaito0s3FzZrTDV4LsFVb6Dd5y0czdtyOy
         Sx5A==
X-Gm-Message-State: AOJu0YyVCSIwIMy+KdkeEOXgOhpGnwjzmvZf3Faq1CSngEWyFoxzuERu
	9vNOlStY6mC4h9z6ea7qzXJFShkT9NuBqY9GkKqbIUOIUonGiXl/papdbDu3BMc=
X-Gm-Gg: ASbGncsp74V01qg0kQ1msOWKsICi/+UvTkdGnHJzwEFj9/F09Og15PSzBMeLKdhIyQI
	JQZa0i8foSxGvpopniOsBi2YVB+zO4GBL6nvRzC0U+afykr2Sco36e+Tctc+KjiQqic/iTomgWK
	34h9HdnluLbCq1jwlfz9gmoopO2ziCVGyzRsAQdishLsaPlyU1JNN7CLTdLZfHyjzmdXgmtaBwj
	zzpGqAR5H0z/yu/q752f+zjFZtTIFWVQH4sm8hzVgOLN+WzMnirNZrTSPxnBigoOerYRHaTQjl8
	RCUIIqjwRrvtv8/40go/3KaI9V19BsI=
X-Google-Smtp-Source: AGHT+IFL1PyC7Gr+eB+jAKZETUep7XKaMZD3nNdLMQxR8ZPDBgf5ouh3/XF1rDv2ZuwsE2CUo4Jr1A==
X-Received: by 2002:a5d:6484:0:b0:38f:2685:8457 with SMTP id ffacd0b85a97d-38f2c5e60e5mr1589269f8f.0.1739539082916;
        Fri, 14 Feb 2025 05:18:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 05:18:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:47 +0100
Subject: [PATCH v2 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d16enuUHr2tsjXZlT4oW1ZXn1HEuh8ApCU8a6MrU7bs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0KCwJWc8DDG4UnvVS1DRfS8YoAu1sErX0eRq
 9XLMHspTXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CggAKCRDBN2bmhouD
 1wymD/0XLt6GJCvc0hRmyqQAQeQ2Xl6T5oInv1r89dudN+E6TGz+0kVkW66XvIlulKZ5QbZZeZt
 XLP1rhSZTNo5C4hsYZJ1FXXS6vFbrpiJHMfXtrDAFebnrfp0oGDCaoPfj+2JuCPPh3EId3Fo2pV
 zgKF6maGiUM1mfNUQ/TzH/wRuMKhVM7d/efMHMf/lAtZcRkra4lSoH4slPLQF/iBN1dHa3cIQaJ
 R6pJwOQ501mGT9ovA26GCWVN3a68CfGlgO8q+NQv7ZTcP3/cMEIGmoI5RUUnhfUlf4G886LbPaT
 nLlZUg6neWgVaCkcAYry6hPxjx74KuWlJ+7QIVeumlWICWwCRDNAoMMK2Hx56xG7z/z1RvxSPF/
 ECVYAUoz6x8S8yp4tfSsxN1/o4FQqH1rYX8L/AslqjaUxcog0B+PdIuRmPRrCTBWir2DSJr+IUM
 oVPxb25Dc8eZV+jjjkmXjbkitDNLYwGdEbst4YLnf9vo3u1CphW80Em4SF7Lsgh+rQ57IgWnsRm
 Siweuta9/F+p9n0frosueEF0hVXodaPwyq3iQ7EHaARqq1qDrSFFalI45hxFiMpdq5GlmZPKARq
 fD4AZ1bLjVVQ43zSmqGTq8a5F5AWnRsKF8ZVcyQS2Ym0bQY9b48rsBFMXfBQSTN7bQBuTMITJzV
 P4QTwq+mvFuP70Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Kernel core already prints detailed report about memory allocation
failures, so drivers should not have their own error messages.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 051e26ae1b7f20d47969c3aff4e7fc6234f18d1a..2218d4f0c5130a0b13f428e89aa30ba2921da572 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1910,10 +1910,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
-	if (!msm_host->rx_buf) {
-		pr_err("%s: alloc rx temp buf failed\n", __func__);
+	if (!msm_host->rx_buf)
 		return -ENOMEM;
-	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
 	if (ret)

-- 
2.43.0



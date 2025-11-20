Return-Path: <linux-arm-msm+bounces-82753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D405C7656C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 22:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 798784E28EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 21:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D8305964;
	Thu, 20 Nov 2025 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="f36IRgW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EB29BD81
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763673229; cv=none; b=p3n7vu1UiKidaplcIts57w3cD4xg9Kr9aaTLdofnyMA2B9dqIYt6IN9vrM2oYQgq2n9Bz8DQBle/pJRDz0eq+taq5mUM8h2dZfa4TvZZarq/gorX57YF3shocjouz6cI7OZLP0wSeKyJsy5w1+y7bI3DPCx4VVkPR6eZWPvUIwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763673229; c=relaxed/simple;
	bh=YZ2upJZ3vV7ruugoQiRqIa0FJdfYNIuxZcSi12AKy1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7rRGkVOecuGmx/A0XhByGdZOcfuKIrTm9LE0NhdeablfDaTkpp+jZmz86qUcI5/kW0F4YW7G9q8wWobQ1SavrYGSedyW4cwvU4Wy/6udd7HHINC1Ma/NvBzjp4/uOgmZV7EyV5S7QM08ayknkILeoXlKU7tw88GfZkPKsyoGaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=f36IRgW6; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4eda6c385c0so9834531cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763673226; x=1764278026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNS/Y+KcMoFHGp9tjvFZ7eEQqbVr5oOBNTZAWfcwrAw=;
        b=f36IRgW6vvtmNDNYug6jK+P8kRBN2ZdXRm2OHC6biGuWzeBzcWuJ0UCKJO5g8CR8Hz
         /FAno76Juv+lJu19dV1UZwRwS3cRVCSujTJottutSaitmN1qV4e/niOuSE714fASx4wc
         zz/HsX5Rv4NaxMaWsj55CqIMEL43ElLNooCbu7+0T7P2ZQvRflL/XX7vD1W21kWFfL/H
         yV7RM6XgyQmXLPDTnBuHgvOaMHMpOBvbZXitPh7tQUYoMVMOg+8NKwq5ZTNej355z13Y
         4/qLQroXUGjKRIzGT0FzG20cqUw7BM0n+CjqCPzdHM1WO5MeUYFW0JStim5DcMF3FKwM
         dM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763673226; x=1764278026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNS/Y+KcMoFHGp9tjvFZ7eEQqbVr5oOBNTZAWfcwrAw=;
        b=SOXg43TrqLhdFG2SBfeB64a2uyofyfEyYWMCgG049xz7HDJl49FvLpTqLOCCNQgm9z
         igT8ztDiFp8jQ2gmU5sXeYLwpeSmb4S40WM6E2oolbIJ0WIxoag5tPakyTdztltzvUnx
         uVQiSg0URwYE5f6m//eqMBMI8bMPoqAs7D1ibdu1NHNFEjZEQjFv6YcSH1mRqH+X7AIp
         sXi18+RJcJW4B4us++HJIGlhjCT5QxqORLuOchDTC7+x0lGbCw7YsJUuVOCaLmYqgW64
         15BT4TDHdCRhv2uGjNn/rUPl2/NoUY+FUde5kZZbKXFKCYeu9T1IvV2v6fAyKyMB9feG
         jVMA==
X-Gm-Message-State: AOJu0Yx1vEqMJ5XyOW5lJmAHFd5iQ+E0SLTCa9oZjo5vtfRz0T8osbO4
	4W+VIzkDHj3f1uMVfJP8IYJXrPPkjyoQP6OcuYQKWnAJu8YCvcI5lTJmY9mjjPSy31urivOUAI1
	eqxvj
X-Gm-Gg: ASbGncs7YRXysfXJIrRiIxipZ1O6nnRkdXQmGm8QnviBQ0sOwNF+UgNI37feAvpqLJp
	/p6sfdZ05v8aPxv80a8T0viK8AtLbdnKekWvC+56e09Q4cWed0a0UdgGIvoU1j5MKcaaihBaNqK
	vIwKsT4AqpP6dByY88t+QdnpKRM84GdU9iwUIKa3XSxrr9Cu4NLYPEHLwqBS+kkGo80CZog4Wrw
	IvUX0NzbrEbIW9uglgwF4yE1zFkJZCXwIlfwzSFyjmBs0RxfcjmHZ/K5mzgzQu30L0uVA472L6b
	T28VOONWZtktOTMANGtEKiP8m9v1a4Sn4ovZc9K1mpL+zAhAm55ESVa1U9saWOnORyFhfcyD8su
	czv0eMIDBJ51QsghXWJDNhYuZu4E6KYsLNl5oqa0rGCYZBm3rYSi3iaiZjHyK3H7xTSQx+OrmbG
	uxLcX1dvpvhFJ+YATlUff/KbYd4PdoHMS7MytQjwzG6e8O8w7BYjnSPCBhMGgC5Upttg==
X-Google-Smtp-Source: AGHT+IEL97NYNDWn+/3PU3JMG6J+CUTsgaqRtGV65OIgCX4XftURpHcWH9smypQCv8kNKzzvRrh4rQ==
X-Received: by 2002:a05:622a:cf:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-4ee58836b1emr1046891cf.3.1763673225917;
        Thu, 20 Nov 2025 13:13:45 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b32953735dsm225958685a.24.2025.11.20.13.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:13:45 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] spi-geni-qcom: don't set max clock in setup_fifo_params
Date: Thu, 20 Nov 2025 16:11:59 -0500
Message-ID: <20251120211204.24078-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120211204.24078-1-jonathan@marek.ca>
References: <20251120211204.24078-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_se_xfer() already sets the correct clock (xfer->speed_hz). Setting
the clock to max_speed_hz here makes the driver change the clock rate
between speed_hz and max_speed_hz for every message (if not equal),
slowing it down significantly.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/spi/spi-geni-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index ed80f49c7b2f3..c33d79d9afaf8 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -379,7 +379,7 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		mas->last_mode = spi_slv->mode;
 	}
 
-	return geni_spi_set_clock_and_bw(mas, spi_slv->max_speed_hz);
+	return 0;
 }
 
 static void
-- 
2.51.0



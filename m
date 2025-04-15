Return-Path: <linux-arm-msm+bounces-54428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE1A89FFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 843323BBD39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE65328A1C8;
	Tue, 15 Apr 2025 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uX7ePMb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C51CAA85
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724887; cv=none; b=WZLWIvAXjCQyIJnmnNyfvintljPZrRi1Tox4JOHQunRBQ5QoQnP5yrT69AYMaRTuWzSX1aleSoKBvzwVZMeH1ztDukiSPX1EmDRuQ/AGQqg3VYaI0kGFzCIODejy3KjJFwtL7pfGq76eDSaxWBktbXprE8v8l3ulgN5Smn8hpvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724887; c=relaxed/simple;
	bh=TF5iaiyVF7pffStsTB0GQItBgvhj+hCdhoNBSo25fFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6y1LwZ72Xf3XCw6EXN1CW53XFUgbR3zOvYyyRXcHf8jM6GHs3vNxurNko82/macubu3rYm8Pu//v22fmKdG3ti8O4vhbSwpCxnx+Sel7UBIh5x8UK5FMyGOMzHHq+iaXuIseAmb4BLi30EOPJowiIN8Yv72lmcqEHaAchPqNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uX7ePMb5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso46677575e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724884; x=1745329684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLxtG9RCmepkYDqnM9TbB2c+xw9+ALwx6QUQs/1V+xA=;
        b=uX7ePMb5Uk8f/4Nbg1fyOupeVHlvF37RkslCB4lmE9VZQ1lbw68mrjGhiKIWhaKVJq
         F17xrkKCZvt3KGCj9VBT8risEIpqooqaOPO50nvZ8Fzm4c0FcG+rYO+GAJeAAoa2I4z7
         3YHg1Ibg5p3hztjbNAgCgdxSyABz07rz0VU/ncsz7+hJI9UvyFECnLDYbZXtm8AbHR15
         u7IBGNbw39sK9ODk5043SvOHzlqUkSjapOE0MdHRuUj2lAagSSbE8u1seU9Pjnjiw+6/
         hjdUZp7qYP/iws/pN67aKM399nePmJ1V5+L0vy3y5ZHtXYu+vn5GkYLm/bPEBXLPSdhr
         5GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724884; x=1745329684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLxtG9RCmepkYDqnM9TbB2c+xw9+ALwx6QUQs/1V+xA=;
        b=vSmT+WPo+TuBnyu484CVVaTpEVDKKG7YWkaSdVUOIhLKpH5kdw/HKODqpzdx7DVoKb
         no0z/r2m2NeXQgXEQPOuMFzIYsFDUqK7bGrl+3/sPnOpyVjuGLe7SBwKvw3WQH2I3vJD
         85XytagTH4BOZfpza0jzX3TFH6xqkA4l3Z23KanD5HDflf/Zaot+rp7pz/iZzGrz0jvT
         fJXPjCEO+TIFYGfRV1xW2LL2uePWZ2gfSXfvbeTrPX1UraLRkF6D0GNdRKZguAqj+IoE
         tscxYKomhF89xz+ozlSPCJntBHE3Cb8ofquDeCwk37i7wtANvGytVWMXWLmLUq5OaMJR
         gm2w==
X-Forwarded-Encrypted: i=1; AJvYcCVFxYUoO7RrxII++oRWycAAo2tqdQym5B+kFZ1XBoxPPIvQLLYKvZMCIFXAP1ba24Yfx29b8TXfp8OvMlLA@vger.kernel.org
X-Gm-Message-State: AOJu0YwrEzh7fk9MGhySLGRBsEHYpLqNX55GUs6DOT8O+4uGxsEwbOQi
	LoQ9BbYzlUdTMHIQI/a/gdiMW6zFHLjzf20O+Q9BmxuYodOsWk0GOLp6PhHaTpU=
X-Gm-Gg: ASbGncsnTkjhTERWPW5MuTdpAwrUaOHKWQYS3PGv3Sa7JIPauh3rHtEatgEHmQ6ev7h
	taEPV1tHyLv2MZeA1mGUsu4fYTnl4hoUL9q1GlLh6D7jDG5VCA2Yprzlh3OAPuZRxNvT13AJk75
	TUoHIQl97hM3AaaiUBmPRf7mqtGOvkp/8rWTBjSprkFZsjQa2wEJsqKKpyNEo/cT6O1ejoy2zGf
	jTcgwwGFntDXB8nz4RGtzOz+RmQqVNUtAjm0NgIPRocCqDAb5Zz4s+9r/X/JkYdNuK1qlHuQlY8
	yCt6NxGV706rzagiOpYadF6mfT4i24yY98/gwO/Mhqr4fVtVGmEtgeG/RfqALA==
X-Google-Smtp-Source: AGHT+IHX8LyCdt3HsfySnPiUJg+yyAZ+504sur7Q5LuGp99/7EULmDAuVPHP2u2hRNONJRiXw3yvqg==
X-Received: by 2002:a05:600c:1e28:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43f3a959967mr150937515e9.18.1744724883552;
        Tue, 15 Apr 2025 06:48:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:48:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 15:47:58 +0200
Subject: [PATCH v6 6/7] media: platform: qcom/iris: rename platform_sm8550
 to platform_gen2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-6-8ad319094055@linaro.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TF5iaiyVF7pffStsTB0GQItBgvhj+hCdhoNBSo25fFM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mONdlcCMlu6uM2Mkezm5KHDQQEBq87XseQjCD4m
 ebhAdSeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jjQAKCRB33NvayMhJ0XbSEA
 CWeDCdZKIYhCBBipC+hUx4GM80SEgfREUg6dogk1aic91bynv0R0TSVT4C2Q18k51z90+2WvBzzd82
 PIcmdyvTaWnyw2uPGd660DAYUOgQpmTLZp7rigQDE/3nAhIjVhjaCicGlkjL8nxaOtRffwswMfwGFM
 vgKDIXlzMV+2LmTXHnlSpRHXLbuakrhthKA0Jnr1jDh3+SxjJgBG+zcADVngUMio5xS0xBiPPxaxAr
 cSWKCFO4sTXHZ/sB3bK9nrSBYuSlRy0Luh1vj9zkcikuai4aSl5M10TGiOYlwLZ244sd8IXO/Alq1q
 sc0sBtlyZxdPLPJYLR+4zpZFWNFgrUYRa/hzjsYAp4/gmY4C3Qk2uXm3hwYQX2NRThDigvAWAt9Jmm
 ZiQG4U4KpCvRizroJwPDqWH9ru+tof8Qk6bfaFOf5GY2BhL8MEdBsMLbVMU7pixKCk8PrbgJ4qtGAv
 YEkdueYbhOOENyFATZxQuWiJDKp0zOlMWAsi+K+jw71UzeBTXIqVFInX4pB06Cm+t87+hv++YdooZH
 ttKhBnIhDWZ5QNRfM87omdRVTzs4owVxKx6b+55pJCh5YsOk7NiKFho+MXt3J2Fvm7h5WagcbSm1ox
 nkE5sO9qyHp6uq/GY4HP55pYlXbj4do5XfAdJW+sT0wCNOtHzkuit4KijXaQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to prepare for supporting the SM8650 SoC, move the
iris_platform_sm8550.c file into iris_platform_gen2.c that will
contain all the common HFI GEN2x structures.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8550.c => iris_platform_gen2.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 473aaf655448180ade917e642289677fc1277f99..e86d00ee6f15dda8bae2f25f726feb0d427b7684 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,7 +10,7 @@ qcom-iris-objs += \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
-             iris_platform_sm8550.o \
+             iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8550.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen2.c

-- 
2.34.1



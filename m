Return-Path: <linux-arm-msm+bounces-36549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC719B79B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 12:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D50283469
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4378A199FDA;
	Thu, 31 Oct 2024 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XB82F7HY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DA178370
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374255; cv=none; b=nXFKMZEHiixlnDUD4YPXX22mrW1sn+40BbEiANYJL3g/u4QOEnrkQokTEDICYKvn+z6kBw+ykjIyI5yYUgmmS8AHsolnARhB+QlI5YU0T6aH40RKtxKBZyzm5s6fYJVHDPzEQFXpD5/0zyR4l8sh4cGArKZtj4WoFwU9p74dBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374255; c=relaxed/simple;
	bh=LUa7C7g0QrvcTJ6ecZrB2+nNPUtGBDcBNIs/gsuLoTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MyMWcKwmMys4xlg0nPdBCXsZ9lOMRKyWxTwLdVuQkLj5uJ7Pjg58KmOtLuA30eRmuAdvo46jrTlAVHY0F0YgrlTTqhA4DX9u+K2ErfGZcopcxvuy1mkHFqZ1lUCkOOBfsQJHScAYoDBusM43pz+XC7OIEJmcXJUQBE1OHdDc+5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XB82F7HY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f4fb6312so117556e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730374251; x=1730979051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33lSaDbRZQ5sH9Z4gmYMee4EuZ4/DPP78HtNc6a+dQQ=;
        b=XB82F7HY/0JmXmTEg4GTw45PBCvZ92lB8e3XDpISLddXDayuRQYmblxZHZfmX+9WJ+
         7HYqBssBIVHOIXvok5AY35xJn8Ix5M3nVVl6Ditzofk43zzlhlSLWT6b5Y/RkXE8Wsa7
         aoHSze2+xXvbLUZtxyY+A+CEcRiw4bWsW0f5PH9B0wjJbwkBb+rFLxPhhPzvLP4wn1kD
         w4gvK9q3iazyc0sx9donqTn86UilUYKwsoA+7dyyFlNnynj+8oYCyzAGmvaZFByf8eO5
         zgVkKEFZz9OKGNaP8fKFdrY8Qi9Cbyjo4gTAmWE4zPSPH9/dKKT0sDQqm8Y3BThoDZ9F
         GJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374251; x=1730979051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33lSaDbRZQ5sH9Z4gmYMee4EuZ4/DPP78HtNc6a+dQQ=;
        b=QyXq+aI6+iu1BzIB9epnQXt8nqy/llUsMm18qPv70gAy43lyP1gN0h2Ix3YTo2ZLG8
         UyvJG4SYS5OvMkd9znEzg2iIceVoPgfPNSyNpMsquiPolfY8zxYsjSpzwWWA+7tQ04f0
         kcJcTfG8PBq8rhiRTDs/7q9whtevAC/wRaWnPVbvswrWnOdoguNtmcgOSr0ZY2woRbRm
         KDtMRqcWUyqSpNognXUim27y/E+YDHPOqO3cRJTLwjiH3QvWT58SDgYk8iGmizwxn6nG
         1nuxLT0XXd0e9li5CAyx9OhyZJz0qWsWqOXDDCexBB/4Y7J+radT7ycXWN/R3C5DfS15
         q/yw==
X-Forwarded-Encrypted: i=1; AJvYcCV8hlgbdSOAsPXdEIMMVUfAHJ4jbMVBqIrDH52Mm6yk82f6kaXgx3nsgDQludDm6G53oGQ2euQ36n4NZ9VW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+xPBvlWk3tsGknLk9sWkGDMwKBTipN7x9q7O1wz4DPZvbr++C
	9GKTYoFtbMW3vDia6dj+Gv+ahp94aBbQvbjimO49ecGs34+2WPrBHBOo3MHJHcs=
X-Google-Smtp-Source: AGHT+IHlgC/Jj6hKg+7Xd+FvbputVd964qt+155jPDW9bpptHglI3HHLBTSZsFGr6+CxmtpPp02rsQ==
X-Received: by 2002:a2e:b8c9:0:b0:2fb:48f6:27af with SMTP id 38308e7fff4ca-2fcbe0676c2mr32128991fa.7.1730374251153;
        Thu, 31 Oct 2024 04:30:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef3b8c91sm1811841fa.18.2024.10.31.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 04:30:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qcom-cci: Remove unused struct member cci_clk_rate
Date: Thu, 31 Oct 2024 13:30:43 +0200
Message-ID: <20241031113043.523385-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The removal of the supply clock rate check implies a need to remove
some unnecessary left-over data from the driver as well.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a0ef43e99751..05b73326afd4 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -120,7 +120,6 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
-	unsigned long cci_clk_rate;
 	struct hw_params params[3];
 };
 
@@ -682,7 +681,6 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.cci_clk_rate =  19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
@@ -716,7 +714,6 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.cci_clk_rate =  19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
@@ -750,7 +747,6 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
-	.cci_clk_rate =  37500000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,
-- 
2.45.2



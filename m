Return-Path: <linux-arm-msm+bounces-78234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A731BF9463
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E4D54F2D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53DE1C8611;
	Tue, 21 Oct 2025 23:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKvckq98"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F124677D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090323; cv=none; b=dCdNQpHmBSbOZG7nHOF358QNkJ2pFYBSqA5MKfpf7oo1wHk7vr8J9IPPY5+5Ble2wr5WryLr7v4N/nfDEXBdLjgKTwNKIyKH7zBgywErhW86hqBNHeaq78pUAsAPwGfceop9tIcBXQ/S+FytRfrzmBMuxZcG5LECV+RkKIED9to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090323; c=relaxed/simple;
	bh=zsNiK+YXZK6bgzsLA2X36+lXT6QqOv60pIxouRkvuag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Inu43/xM8cLL0oKRu/Afy0oJt4Zql+VaEWxlvAkgYTtVKVEXswLfANEEU9ERfBFVxvZ+cVDD8BaYN2Rd8CtPxRQ4YJ7cl3av7GFvXlQALNzZARv3iLcv2ZjDeUd05BlEOr0C0kC5tEJLl8Nz3ySXRjLA1Kmz57ktDnwS+tGAxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKvckq98; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37777f72838so6871021fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090319; x=1761695119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvLSFIpu8j0k49O1nyWcmlYBWnO05KhDwpdtEYBI5GE=;
        b=MKvckq98u6rHr51UeKgrA9i83JRmLXrOBopC+W469PxOflcj9bJnpTibfdiSmpkZVG
         GgKQfCIoAr5wtGaG2y6ZSYDJ23nAPa8LXBF8l2EnA+/ltOARGgkh8AWDHM61JjAV8zsw
         IGoM0FVirsfSrK2H2N+UDoaMvkhfNiZ+JvhfVuPbHjlKt/6lKllSxcQ7d3IAx3MlLYsn
         Rd2Si0xFwXwAQCI/mTyZ5ns10hwhcz3T7jzFVUHTIU1XLL7U3AHc4q6PK/8txKI6V2lm
         445vFdW60OjFwxbKc6NnDhLKhEArlRm6HBVEA+MQvPuXmURJ0WZHIoUFlhOc/0cZljlH
         eWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090319; x=1761695119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvLSFIpu8j0k49O1nyWcmlYBWnO05KhDwpdtEYBI5GE=;
        b=OIST9Tt8EGvTywQP9COecoKoV/Ifnu9IMUIMR8pIWklWY5ccXVqnR//5+BvFv6djsD
         dXTHyd7YWjQ0jniW64Qx0Gm8zV7nIKPXJLQC+gPN3ZKhobcbvsgCWJ9NIPxGMHI7FHez
         Rc3cTSR3TdMvVrbFhnbBB/BM8lHyn4LAZb4MDAWJ4TGHSUycq9wdZ47uQ9XjR053LRIf
         pnvapa6GnWDzWvwPabR7/7MEYkmpCAX/awXGV//FJgHkE4HFxeBODyG20Y/4Ylp/QFOQ
         9CJ3LJKI7Wvr4Lf1CmPy7lIdBAxjaWU7LbGqpkh3K9CqC3PxfFm/09GqJxWKy0IxrAsf
         FIHg==
X-Forwarded-Encrypted: i=1; AJvYcCXa7shb+pm/JWQuGpvNEoA9uQT4XxJMFjXqjXbNkythfBPg/GEaWSI3Cg4LIrGPpZhSGepVo93KjIZaRl5D@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLC82vW+UthCSIv+1isVg6Fm1geFfb5VOcRNZZ/dJeNS8bn79
	Zlqo1rD0lvxTKJft9pO2QlljlMx02Nn117kAODSTSoAsIpNBstFq+vfDvQRtrOIrnBI=
X-Gm-Gg: ASbGncs6stX+fAVf7ofH/ZbqHbe1h1r+X3xXX9IulkUvUDHGEqa27IXL1azEOdsfYye
	vKIcx+NAuJk4CbnL9Kv/3FSk6BgIEeMlsWxem2EOD5CoxSQOWaVy1dGvD58r5JPYsPmTWkM6fSS
	F7C3SVJX/NCq4a9XdVBasoVdb0mz0kiJlODfRAAsBkmO1cAEbSw957Km+pc/s5Oxi5jQJmARsQS
	SwVNutfyDkuAh0HYxJQlScYLA3iOc7568mQvIzK3L80opE5W/aMcb08o3gDUBb9l+GQoRv/nrwV
	AtjaIjk0FYEzva8nwZE4TuPN1wHnE4l5X3uyorMjK27jSPtZ/0r3bmnxl4ZNtA9na3SHA285NQb
	5vbrICLrVebFGzmQejZK4HlBqFTgAv5aT79ixaL7fsN5JJhQiGOGhKUL0w6uP2I0wQNJe89jisq
	oUWO3HeZOCGlI4CQZDGJYdFKJZfuipK4J9hFU0NANPmmGfB2ecBSz3WA==
X-Google-Smtp-Source: AGHT+IHZ6UEE7vqJIzNffO69BijgNnh6huZ6XpFUynVwOevLlfwN5ShT5ZL286eIOV8doCmHp815nA==
X-Received: by 2002:a05:651c:541:b0:36b:d9d2:7357 with SMTP id 38308e7fff4ca-377cacc5029mr9682641fa.1.1761090318969;
        Tue, 21 Oct 2025 16:45:18 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:17 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
Date: Wed, 22 Oct 2025 02:44:47 +0300
Message-ID: <20251021234450.2271279-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be properly described in the power domain provider driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SDM845 camera clock controller,
including IPE0/1 and BPS ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index cf60e8dd292a..fb313da7165b 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
 		.name = "ipe_1_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0



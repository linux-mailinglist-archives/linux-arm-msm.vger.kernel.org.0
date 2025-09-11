Return-Path: <linux-arm-msm+bounces-73037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654AB5259D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3F81C26CE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8676D207A0C;
	Thu, 11 Sep 2025 01:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QoGFXVmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACD204C36
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553153; cv=none; b=TkvWlEhB5037qkAoTgyvJCPCf3oPk8DASa2fmd9oyXhsdLIF7VqTyQ+7KNJvcFxESXBVJu7DLFlIQ5hyBp44eMlpLSgKRbtiKMfaILQTDUndK1Gids8sPG23qNPlQ/7tzxZID7eouEc8k2M6avLUPawNBjfKr6kdYctY6NJVxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553153; c=relaxed/simple;
	bh=FnxEbEOc+nsIC239eB+3B4+pf9VVJ2J8NGFalpoerd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6GdyIElqtoXp7bk23e0BwTvdVWnzZMN3Rj2JW3Pzfr8xQ6Hz+zQhc08t7p9dFNd7DMkOvs+c385Fj/d8kDV/ZO2+xVrYTVyDgmbh26cCGXLd7RG9wMJ+3CxyEEgU/WSSjC/V5lJl4hipYf5pMLm0rRwzwmDcfYkXBb42ojG3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QoGFXVmi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336cf210e36so289201fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553150; x=1758157950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnFo41Qd8fmh/jWtJnBRHmh4dFJOe7lHqW/iccp8TEc=;
        b=QoGFXVmiQBd/grU/W2UCT3MHhZpgecqSe04xxsh+KDIUl8hZhCfT90j5xVckAnD54c
         z0WQsN8+9K6NqATW3fdfoxwKQ9RF4dsQ+/CqlZ75L6emF8KNzRayytASs+nKz74koo5s
         nWD6bylN96bGcauzeXf4XEPLpgjHpKb0hzBurId8md2gDuZa/xmngi3YoVja1AlYFwn1
         LoYa09cJx41cbQXlDIsIYjICekNsdNelH0oEyBpR9TjHxmkDN1fvZLAWulVOZoyVxovu
         YlK0xlHd6QwfGoJOpvQeeJVqET2waRt12rZ0TaUE4TtJoD68VGw1kekctSVHavM9ZF8q
         aD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553150; x=1758157950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnFo41Qd8fmh/jWtJnBRHmh4dFJOe7lHqW/iccp8TEc=;
        b=BjBm8ELJkWpBmu8JP6mXirnGZjywiUHAILRL9VFqrgoTRUPrUtAcmsFc24K3jWDdO6
         v5fIgjQteNMdd6reYCvuvY69Uj7HSo0WWgAhJJEbfQfKqHu83yfWnres15rHGHYfgKfF
         gqG5vca7MfAkm3BkVjqSe8pr2kJYCe96FcDWq+PKsokCE7e3VSokog25Mh1x+yGeHGOW
         nuYTG0+03852nebOVFSIDQAWmuDNWY3MY1u4SUG/FMqpIdMQzJWIJ1QhL1HHUcJfxGKd
         3jo2h2faZ3n/RJz8uDqirupauxzA/mBvVG512EZn9gPddyxIKzdoSog6QhLUrqo9iqzM
         h4ow==
X-Forwarded-Encrypted: i=1; AJvYcCV6hhFFj+dVkoWivtWErsJVDdAaCvSyZ5MSnpO+EWpWXw5mSGPHhCxYd8Wwc8OtdOOqSlBeYrcM5vWXFNcT@vger.kernel.org
X-Gm-Message-State: AOJu0YwtVFQi5gaHoSjIUtvOPJG+Hrg+1q2OZnw2GJfW+hMZ0PNhc2/S
	dnJegGPRrpjn3VAqcFzrBPjtv7CgMca6XhnD65hTsQKMnrXf9uuDhz1dJIcSCo+430o=
X-Gm-Gg: ASbGncu9Cx4UNJtytage9WmkcNlp32kiXxQpD8iReV4C+pKVIEsfE+aTw+NGcU1RuML
	GV16kD3pAWyekduSRuRuG+yPcrJUwAbKhiZRVTp63GbqsCqWQX6SdbipGQXOb5hB3yCnPQ0RGr0
	4ilJlom/KptUlbHMl2GbeIPPQBS9EzuFz4BA2k69eCRQZxDWKJyUf4n0I69DKUvhDKc8Euh99ok
	bwi+U2lWdvCzJz4SoBHTyUiNGdS+G7YQXryBvm4nm/fpauAyxOpWVMW1Bcin4H+tDWuO15P/Sq0
	IuFeaLJLeVixcSExIDEtfOR90DfQEsTtgucjc1HfvLGafJ+KnO/B4Igz7GPc3g0WUc144BFN9n0
	EyUMeGsYzKkWtmFnv3GhZOWCDk+sNvkYVADdDc4LbakiJfzYSv9p7ljVGdzwKvZd2nNHAisXXgZ
	DMI4k9Kg==
X-Google-Smtp-Source: AGHT+IEAIGphXh5PwfQ7vCWA0KiJYY4ExBqJAXve7vfOeFgO/8YmPYLLQtERoTOeFE7mkFfMp55DQw==
X-Received: by 2002:a05:6512:2209:b0:55e:a69:f4a3 with SMTP id 2adb3069b0e04-56262853bf3mr3050530e87.6.1757553149939;
        Wed, 10 Sep 2025 18:12:29 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:28 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
Date: Thu, 11 Sep 2025 04:12:18 +0300
Message-ID: <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SD8450 camera clock controller, and it should include
IPE, BPS and SBI ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8450.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4dd8be8cc988..ef8cf54d0eed 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2935,6 +2935,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2944,6 +2945,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2953,6 +2955,7 @@ static struct gdsc sbi_gdsc = {
 		.name = "sbi_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0



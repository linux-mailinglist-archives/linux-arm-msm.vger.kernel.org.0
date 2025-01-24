Return-Path: <linux-arm-msm+bounces-46052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EEA1B231
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A01237A232F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 09:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC30521A427;
	Fri, 24 Jan 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qFutLe9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D1219A73
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709158; cv=none; b=UozqqiRtbTenLt5jt6P9sEsXH3ZutObSwEnOYdivghPNLJojX+mX3MGFugqP7hk8YZQbKc0uSSwlTJ5n51rwJLq3wAzbd6Tu7ptwt9u0FeqbVf/Zwcff8G9HKiSHFKuc8uTIBBARSYFxLSsnbPByy9B0WQAW9zGuGfk2l60cFTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709158; c=relaxed/simple;
	bh=Gx5tAkuM3tQafFNc5Mhe6PmrPMAavPP6iPSppEjU5/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZEdxpRFivwFwK8w1etB9GdI+GPeTOvz/t6cjyWTPqpF6cmCVWYJAVqZwV+89ccZVMOIywryQbMLUHrtTK/RW9Zu/Pi29m5J9TL4RBO6Klceo4O7e7Ph3aejvvY69ZttElyQrhlauXfLn0WRcDiKxXnxNzyts7CjMZAaozZMjxms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qFutLe9o; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so29935715ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 00:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709155; x=1738313955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s94rBGytqIBo4tekti3AaboReTxXzjmT35D71HaGAY0=;
        b=qFutLe9oOhB3lpPmToxh/n6n6lHObAtWO+of6rVF1ON1/nxpLisgqaWc457GEgeoFr
         DWerTDRNEXWe5PbKGbgOfStRMaEG8kf6UbB1dZCGKLlQG01KTsG58fjqELWFgbhnkW+7
         PoZUO0doDyf4PN/11pwA3RbzVUOLMMAEO5aa3UGCDwGLH714hVy6RsiGMlG5DQiWLAzv
         HuVQrNE4eUamLKyEm4OLbXcFnQh+jZrGZhXFV6+UXUQ3kJ4Sd+XAUXoY+kb4oxru1kK2
         KX0/wSdgCgBoNICgLEgaZWGC9U2TxpSqAV6LnWvv882GQNIXPaqJWN8Di4rGq4WGTO7p
         5VEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709155; x=1738313955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s94rBGytqIBo4tekti3AaboReTxXzjmT35D71HaGAY0=;
        b=UEdZ5jkTL4UDdcRNfK09ReX+m7a5t3pyNr33YYJ334r77RanEGkanV/E6NXbkcdTWo
         gQefIzBUiJrOzswJpYzXrLvuyA7rJX2IBO4aT/VhntXVecW3RYw/FV+6Wu9RmAjo9GQM
         pdxyWlRa89jfUfFvezD++tjvhYgP3QTQBuaxVpBTOhB6R3guSBjmD87vSL94jmkXZQFB
         jyaglNuPa/26CdMylrljwmu+OlhmIrVE0ouReEHmxM8TBuR/63bnSPAserYTveS17DPJ
         /gQvKiLJczIqD3dPO6EnS9eWSTbTXCYEciBX9aJSrm+6yfUOEjZzv+j+gaR3YbZKih2U
         ZRTA==
X-Forwarded-Encrypted: i=1; AJvYcCUjp2xZw3GF0QOimekem9OY0OcnqRWvJBvKFmVGhD6CYx5lPQZwZz0/8dGNadfH7oezemHMCmACsRFsSrAn@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsthsrlVSZcpP88YUM+LXXJUFWWPHJd2R+Tz7PsjOF1he0ha/
	C50XrhD0VKus9PxCxPegCiTCAbwDgAnmJpXMNEavafVgjEuoH5X9jOVe+iljsmE=
X-Gm-Gg: ASbGncsQNidqPD2befB0dA8QkBk35qtkdNDPocK5tnqalXdT/ki+sbVq+02Q0QBJvcf
	Nb/LA0JfLHxSU9vby1QjVC2tbigC7OCnQ676l3C3/pTW9XgYvmEZMwSuICYwNAsm6DqFs0hQpEJ
	WAanji6jyDjI7c85uiGC35CgDxeT9V5SScx6QB7B7LXEcNonNvcw+digSO3DAFvyGB++g0hstKX
	8BicFMT2U9Pt7YB2bmzXGGUAMpUQlSslVe/pCb98QtXn1+ZbVxqhiCpfSUyiuK15wMbmWdRQpjm
	PnST/aHke/rFo2Yy+A==
X-Google-Smtp-Source: AGHT+IGd324gk3vUxN6Dj/7u4RkiZpPJbthb1QKDynr38KHf328GZ4u/AOfJCn10b0DpZhUS9hZTMg==
X-Received: by 2002:a05:6a00:1412:b0:71e:4930:162c with SMTP id d2e1a72fcca58-72daf94f6a5mr41280675b3a.6.1737709155304;
        Fri, 24 Jan 2025 00:59:15 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78e3e5sm1358044b3a.172.2025.01.24.00.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:59:14 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] cpufreq: qcom: Set .set_boost directly
Date: Fri, 24 Jan 2025 14:28:17 +0530
Message-Id: <c59085ea0f1e97791f5ecc255886c2bcfa7a7b34.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently the driver enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets
called for each policy and then there is online/offline path too where
this gets done unnecessarily.

Instead set the .set_boost field directly and always enable the boost
support. If a policy doesn't support boost feature, the core will not
enable it for that policy.

Keep the initial state of driver level boost to disabled and let the
user enable it if required as ideally the boost frequencies must be used
only when really required.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 7d83d7d2ccc8..4b3b3dbc7d38 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -566,12 +566,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 		return -ENODEV;
 	}
 
-	if (policy_has_boost_freq(policy)) {
-		ret = cpufreq_enable_boost_support();
-		if (ret)
-			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
-	}
-
 	return qcom_cpufreq_hw_lmh_init(policy, index);
 }
 
@@ -610,6 +604,7 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 	.fast_switch    = qcom_cpufreq_hw_fast_switch,
 	.name		= "qcom-cpufreq-hw",
 	.ready		= qcom_cpufreq_ready,
+	.set_boost	= cpufreq_boost_set_sw,
 };
 
 static unsigned long qcom_cpufreq_hw_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-- 
2.31.1.272.g89b43f80a514



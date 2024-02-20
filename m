Return-Path: <linux-arm-msm+bounces-11874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210B85BF53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 16:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2096B2397D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5A976020;
	Tue, 20 Feb 2024 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="znmVRaGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2BB7602C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708441203; cv=none; b=KkeyWsdWc3ZWC/PQUHlPk7QW6GUlhnkchFh7zX72Q+YU+uyBJUpUnEJS4cverqS3DjvgpU6+GaDeaAIZfTINts92KriVTDXf2jstWiORPxxrjnQfMkUME+LvhflXRqIjIaUU17DvfQgYDKakWjxZ9xwplEGXJt/So7NUhSgKYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708441203; c=relaxed/simple;
	bh=RkjU3Ub4ClpkOSSOEN84+hu/XY6PSH0IWTUar1yt9s8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pf1weQFFkaJYawTplTwa0nQ5wONqULK9N8YxJQd9N3KNaljZlO55qObMrW8byl5mJxjzNe752cV+khjEaXpStvZbq1SIXh2nXFRk0GwMLV/qbLZRLKMwBP93GhsHD13Iznpg3CRUTsspWdLh6mhy5pWt6VBAsiiiGY+lgGUJ/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=znmVRaGS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41271096976so2994215e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 07:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708441199; x=1709045999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJN21V1bop2AoQQK03hl+NSFZtBSAxp4abYemrkmzIE=;
        b=znmVRaGSJ6JJlCDRmvJMD0FoWz4wH7Io0JTJVv1GpGtNarkmgou1jwAvuzZmOo5MCI
         HCd8PBeBjeLbGtcijb43T+SdLsYkQw3q6BcNXCWO9rmQlHHxaUzul+kB/L+84LaS5xBl
         gsvTH1G8EwlkLnA0Af+vFZiILbyuAw1t2WJGmOjsElm6NaJL35wEJMffdMBwYe/SZfEu
         2n29Fq94TWG15u/qBUD/ivGqc3RW/zBAKaslQCHLVQ89+i83h2qu2TpXRjb39a3XE5bD
         W9abNXLuCGLXTP3hJrROU//oxwC0oRBladnYYXehiP+ihZVOxVkhtnHqLSFS+pmB9zUo
         frKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708441199; x=1709045999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJN21V1bop2AoQQK03hl+NSFZtBSAxp4abYemrkmzIE=;
        b=iWsrjhUnU0f+Q4vxI7fx5iEiBq+xs/byfcZtbhI4k0Tn9FuUSj+z3jkWcCrbgLaVzx
         MJ+uERcgwV2SXibBD2c13MqhXQVVEv+rUrMHWfXP3yY1Wr3qIkKIuaF6/TlbK3+vCFdp
         3iwFbfw9vtw1TvqMq3StaxSrS9t+I7ingaTMobDWJwDJ3vr9x99CBEcw16KDOM+7bFHE
         lk+DwehKAcW0UTwk3WcEYVDrgWxbn6N5G2cTAK8w+7hKzGMlrLN2fBIATyjWQK9X8J4e
         0+yordfI5i6YQvvEyKiUhjT7W9mjhSLZftf/29yQAbfCLFd6IijoUTmQE11Och8GwNna
         pbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH6z0hruwzu2biFjQVXlGiHzWHIokh4p7h8rqjvsltpQQs2MPNhLpz3owEEjYWHw/D4XFT3idlPEdf8Yyqh9GbKf/k4sQv81pP9MmFRQ==
X-Gm-Message-State: AOJu0Yw/2nfg9TeX0+tSURjarsEemxsx6VY6Dhzkrs7YH4r2hI8wDDDT
	NOZDANLYfF7kuQESaza3GYJmViBxMDM43iPJaKOlZuOLg0JmLGRgzktheGnRGeo=
X-Google-Smtp-Source: AGHT+IF9tJG6cYo5kMgHAyXSW6LLub4Cy4QdsaVLmULHXyA1+3Ik6b0caALozs4YQUihhJTnKqZHLg==
X-Received: by 2002:a5d:64a7:0:b0:33d:ed4:5c86 with SMTP id m7-20020a5d64a7000000b0033d0ed45c86mr13698111wrp.63.1708441199370;
        Tue, 20 Feb 2024 06:59:59 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:8deb:bfb9:b028:6d5c])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6784000000b0033d39626c27sm9304405wru.76.2024.02.20.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 06:59:58 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	lukasz.luba@arm.com,
	rui.zhang@intel.com,
	mhiramat@kernel.org,
	daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v5 3/5] thermal/cpufreq: Remove arch_update_thermal_pressure()
Date: Tue, 20 Feb 2024 15:59:45 +0100
Message-Id: <20240220145947.1107937-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220145947.1107937-1-vincent.guittot@linaro.org>
References: <20240220145947.1107937-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_update_thermal_pressure() aims to update fast changing signal which
should be averaged using PELT filtering before being provided to the
scheduler which can't make smart use of fast changing signal.
cpufreq now provides the maximum freq_qos pressure on the capacity to the
scheduler, which includes cpufreq cooling device. Remove the call to
arch_update_thermal_pressure() in cpufreq cooling device as this is
handled by cpufreq_get_pressure().

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/thermal/cpufreq_cooling.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index e2cc7bd30862..e77d3b44903e 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -448,7 +448,6 @@ static int cpufreq_set_cur_state(struct thermal_cooling_device *cdev,
 				 unsigned long state)
 {
 	struct cpufreq_cooling_device *cpufreq_cdev = cdev->devdata;
-	struct cpumask *cpus;
 	unsigned int frequency;
 	int ret;
 
@@ -465,8 +464,6 @@ static int cpufreq_set_cur_state(struct thermal_cooling_device *cdev,
 	ret = freq_qos_update_request(&cpufreq_cdev->qos_req, frequency);
 	if (ret >= 0) {
 		cpufreq_cdev->cpufreq_state = state;
-		cpus = cpufreq_cdev->policy->related_cpus;
-		arch_update_thermal_pressure(cpus, frequency);
 		ret = 0;
 	}
 
-- 
2.34.1



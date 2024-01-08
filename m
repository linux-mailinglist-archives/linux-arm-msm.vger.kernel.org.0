Return-Path: <linux-arm-msm+bounces-6641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0B3827042
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 14:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18FF41F232BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EA44643F;
	Mon,  8 Jan 2024 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Em02rRXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B945BFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d8909a6feso23185075e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 05:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704721731; x=1705326531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJN21V1bop2AoQQK03hl+NSFZtBSAxp4abYemrkmzIE=;
        b=Em02rRXn+3J9jMD/AppbzoJ4QFqjU4oxQ7S9qiP7GNly4hMlL6HXTw+PDG8PZdPwpX
         Pw9ULyi7lj8nOFoez6LJTloSU5oNO1RDwCWGP4H04TZ2fhivlMbDqe32ej8dxmQ5KDOb
         2HfHaI8qswLT0khu7VtQwkWIoJowIxzdaWoZozj0S1LR3lIAeYd1Z/C1nkWCQ931XWGO
         p+OPCnLNYXmY+lwbpMIe5oASDFBN8Ya8PMYNYeYs2yZn4ZsdXVZ75MyJjoqli4+hwr1+
         0gdycFVRfJ2sltVwYK3a7CY6nz9PtegqFigvY1Oh1f4Wrfs22bY2Iuo0CPDvcYKZMtNV
         7DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704721731; x=1705326531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJN21V1bop2AoQQK03hl+NSFZtBSAxp4abYemrkmzIE=;
        b=WmY8fjTHwZLIFkUWKFEe7kmaPi1Rt75nhw9EqOLrULSQsXje4TBf0ilgk24MxLqZxp
         dgeyG/xgVU1uMQPYBxei63vlbHGvBqROORFbcjwA9MzmeS5kaODCnoo3A7xp9MBZk7bW
         QNsg37kzggx9leci5/t7k9zJY/jZCr+VHnJlmvhhJlxGa5mMFpS66n2hTp7HmUOjv/B1
         eRFYu7R8ZGtILPWGs1Nl4UuOyV7P1mFWYJy+m7odPf+9Q+/7Ip3+RcKehV8D+T9MJbq4
         /Lo8TOxNIhTotaVh3XNUIPIP28lJ7Jat/u6oAJCizsiGQd1pwZiuCZk4zx7dB64HhKyr
         1X9w==
X-Gm-Message-State: AOJu0YyUzLKcMPQHGMQ/vfFYSK81KVZLEn8X5KhEWh2pFjrmogybg0gk
	nqm/OmvjxvA8koRmoDsA8+Qi6joMuqaDGw==
X-Google-Smtp-Source: AGHT+IFs585/T72EchvOGQyxErrlQA+vkBx+XnjFO06KpF6r3sFwHsV0pXDbwX3BrYTLnyZ+Iur3YA==
X-Received: by 2002:a05:600c:601d:b0:40e:49c7:aca2 with SMTP id az29-20020a05600c601d00b0040e49c7aca2mr220462wmb.146.1704721731089;
        Mon, 08 Jan 2024 05:48:51 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:53aa:59bc:34ea:bb2c])
        by smtp.gmail.com with ESMTPSA id n34-20020a05600c3ba200b0040d5b984668sm11165003wms.9.2024.01.08.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:48:50 -0800 (PST)
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
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v3 3/5] thermal/cpufreq: Remove arch_update_thermal_pressure()
Date: Mon,  8 Jan 2024 14:48:41 +0100
Message-Id: <20240108134843.429769-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108134843.429769-1-vincent.guittot@linaro.org>
References: <20240108134843.429769-1-vincent.guittot@linaro.org>
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



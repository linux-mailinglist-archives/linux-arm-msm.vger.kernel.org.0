Return-Path: <linux-arm-msm+bounces-46051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1625A1B20F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 09:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0468216D6AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF13218ADC;
	Fri, 24 Jan 2025 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiupq5x5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B511DB134
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709113; cv=none; b=MCh0rR2nRDBX728Y9zOveo6g3k/DgTUJY9m23KhVqhbCVmM+gONjcMRaNJwcKUh7IiJGevDnZJH2dSwf2MYRMDwERzthVUAvVcidyTfL+qboUpci2yxQ3SeSNt6eLon51LBwppNCe2VuqnJeL5ZVJuhQS3EqcwvgqKaTsA6n9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709113; c=relaxed/simple;
	bh=fNI4UdDtZI4AVcTD8TnjHEnynSXd6Y+lcwnBOlUgb0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MBtUMqtinb+iRCWHVz5lN2e+pwINayv1AmPl6Uu7o7EojAviD3wX4wGwqKX1ybcntb3WyJMgib4lcXnCa3Q0IHdV9rpVBLtx9j3C7zaaye9H9mSulBienzHjclkvubbUC8sSVctchegiLxM6YCadtAdy3Zm1SG8tJtj/tulRBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiupq5x5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163dc5155fso33170325ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709110; x=1738313910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=qiupq5x5QB9lQevzihRGuBXv0IfAAG2rlaNizZukib61T7eXb9WMGdVg8sHx3prPyF
         pyALGugpO90wpX+VaZdylLtGFOvcgTro9iWGcc0WHV6/lrgkQZW0N2/o1YVYtaudmZxT
         ftm0jDg57UibfG6PZfifqu7fLPSSGy7P83EOarbhJwSpqCEn5DC5qU13poN99eJINn0e
         idbknwz4Dn8uwZ+tuCKNgGPwaiD8hEh8ikaLCFO+kPyaDMxMtgjLsm7vIx0FI/XGXGx1
         CjNeU1oUtS06Rc8zc4t9RYL+Xf9unljTMXzuL8AqMOSU311AbW1urLdye61TVSungj2H
         GTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709110; x=1738313910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=Lgkk+qbRH7ro7hQPFA8kuB7Q2ltzcupeLBwhMS9/R+BUVwZfzLfxy10xu//9YDbMNM
         2Nklm+gHIbMgZq4ZragD+tiK02P36mbhNDh7fe6DG6PsMXVzBzK9XomXWDQhNE1WdxQY
         KfTCzD3Cc1iaaeJhzuORMJ+laR43IxpitkBi1NtNmNQYgFJ9z4c5ML9KPtPiD3KtoKgQ
         +rww1t3ZZZIC9/ib3CqjIyK1mHPS+Sfd4cq52Fj3ObBTVBNxAAL7UqG7yqjgBc16bJG4
         /nWoZ9nx8BBRH8Tv4lVDedCrywbvjHBFQwMGz1+9Br7jyw2gaASL7svQWyI8wcSs9Z6s
         akzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZSkkTXcDMyOJ9hMhiI9KQx+xUPLha6AeJhxydpOr6J628owta8ieEQw0PS+MlZwIwMH+f9Nbdp6Yx98Td@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9kvoyQCKq3PaAH61rNyV4xB8LFnIEX5UO+xDXl7z0JZRixkr
	Tn1Xab3lRpgveW4BjlT6XLS+n9gPjqyEpU1VyGYZCI0qsbRZ2wmukoLXneI0btw=
X-Gm-Gg: ASbGncv+p6bSX81pdnOgwLpvmIpoYWJqkolteeQqAUG/6qmirc382+Udq7sWd6QPbum
	WYJSRFohQBf2vcDW+lEF4XITX/7bCTE0AnE4QqVE6hzvJPUE/AL+5vuhtThHCljkKJnCuqTFYtl
	t5Z3PvuBvb3IyORUrCjxOcdVsV4uCxUdi/7PCJuwBKKNjtLS3jMoVxj+NhIHvfC9PbfYZNcjbR8
	ClDFGzYhxZSLWNWEbyCp1WA4+tyDQofYmGCwNaWzcJiltlPPU+veHW0xWct87psGkbxp8GBALOy
	ho6N58Y=
X-Google-Smtp-Source: AGHT+IGaLv3P86dnfhfsz8clY+KvPxRH7m/1Pd0NzNkAaLxjGYIDOwn76y4qMRrSSuP3v13w1OIdqA==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr480084755ad.22.1737709110054;
        Fri, 24 Jan 2025 00:58:30 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e1b2sm11621015ad.17.2025.01.24.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/15] cpufreq: simplify boost handling
Date: Fri, 24 Jan 2025 14:28:04 +0530
Message-Id: <cover.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently most of the drivers enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets called
for each policy and then there is online/offline path too where this gets done
unnecessarily.

Also it is possible to have a scenario where not all cpufreq policies support
boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
feature for that policy isn't correct.

Simplify and cleanup handling of boost to solve these issues.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boost

Rebased over few dependencies from PM tree, will push to the arm-cpufreq tree
after merge window is closed.

Viresh Kumar (15):
  cpufreq: staticize cpufreq_boost_trigger_state()
  cpufreq: Export cpufreq_boost_set_sw()
  cpufreq: Introduce policy->boost_supported flag
  cpufreq: acpi: Set policy->boost_supported
  cpufreq: amd: Set policy->boost_supported
  cpufreq: cppc: Set policy->boost_supported
  cpufreq: Restrict enabling boost on policies with no boost frequencies
  cpufreq: apple: Set .set_boost directly
  cpufreq: loongson: Set .set_boost directly
  cpufreq: powernv: Set .set_boost directly
  cpufreq: scmi: Set .set_boost directly
  cpufreq: dt: Set .set_boost directly
  cpufreq: qcom: Set .set_boost directly
  cpufreq: staticize policy_has_boost_freq()
  cpufreq: Remove cpufreq_enable_boost_support()

 drivers/cpufreq/acpi-cpufreq.c      |  3 +++
 drivers/cpufreq/amd-pstate.c        |  4 ++--
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
 drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
 drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
 drivers/cpufreq/freq_table.c        |  7 +++++--
 drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
 drivers/cpufreq/powernv-cpufreq.c   |  5 +----
 drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
 drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
 include/linux/cpufreq.h             | 20 ++++++-------------
 12 files changed, 35 insertions(+), 95 deletions(-)

-- 
2.31.1.272.g89b43f80a514



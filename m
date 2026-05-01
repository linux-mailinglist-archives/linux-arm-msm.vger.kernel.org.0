Return-Path: <linux-arm-msm+bounces-105552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIG9Glb49GnkGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 21:00:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA0B4AEFF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 21:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFBFF30120EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 19:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC3C3F787E;
	Fri,  1 May 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL1DKeSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087D3D47C1
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662034; cv=none; b=hLe9Zw6Rkch2pEgg1bnPxpsM8iWFRHRnDs/zxDYbGOv8IGX5J7FJuvkGeALPvvIo4HBxmvsLL3k4RU1DpM1ILQyZJ0q6xKy2iM68f1r2OdQJHxDMIt0v1aJzXig9ciwBs5OOYtUVzFYTjs3vpm8xecUZPFBSuOY+nC0qUHwmBYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662034; c=relaxed/simple;
	bh=J6D9KYDFjB2m0D4tZGtKNFNFDOx+6/Y/naS4pbb+Knw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXLEUxl33anebeE0fo0Y5ezxSS+Jk+wkViSCsLZjozp8xPFey2cb1yrb0NDb1eoOWIrIfDSxafzTnQzZ93HcUrrVmz3HxvT9oGNtY9qikpq8wngzmKOGUNRC1z8k1idpeOcQerbdBF7WNI79miO9RHDaQx/nTa2SsunfsYvWSvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL1DKeSM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-827270d50d4so2102346b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777662032; x=1778266832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqfXSrQ/LcVyuHZiK19DFrhGz1VJgx9L+sEeQ6hZEtk=;
        b=XL1DKeSMzJhnJgu+XAvs7NLlKAVPPUNpND8U+YTPf9fUT2esF2h9b5pHCtvzKUFm+M
         qeH2gpgqtAXCrC6cIX1qjKRvvTTaJcEG/DgHxhgfh3Os65piDOrP7LAEUfI+0YcDOiEQ
         h7BPMhn6F77ZuwYwEoqQQ3inHS6PX/F/36x7bXm3J2Tko8qRjRbkesZuOtdYa/DOdz1S
         YgNar2Us/nZODFQRovEv+asGsTfOx8NbIsWmRFxN8snLAL1Yq7qi6G8gr7BcSspnISlW
         lSakbrAJPw7+1jjhAHNuin3qzfAa5MwtwnBOQwVwENsTRC8sFrZwfjWbuBcFNTGkZ2vN
         zYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777662032; x=1778266832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqfXSrQ/LcVyuHZiK19DFrhGz1VJgx9L+sEeQ6hZEtk=;
        b=KPnrOdhN9NYE/z2vEV3UdFDatH2GdjxGUoOsJbqSO1W/qRm7DsxqOrXDGZ+iMbV6NN
         9vVBv8XAgXgSr9WfdDUjgDlNtMMtgUcw3843ssiMdyDvNk5TKPSc/IaemU4pBv+Fi7ck
         w8xz9IuJyvZOfl8RbIzDWceD8MjtbJfhkdpBP5q44NAdoWazqfX2OftmItORk6C/RI9T
         x62SmjylqIPaILvZU1ou1QdGXjrM0VVY/sj6r5ZfcttMqWSP9lTtGBNyly+6Emcz0DPa
         H58sfW9teggwOZZ202HmCVeOHEmRO+bce4zQe4yzjrgfYjkffaLnayTlzxP0AocD23QY
         BuXA==
X-Forwarded-Encrypted: i=1; AFNElJ9tBeXI5gQ7X1omQJjbgfyPRuuqu2u6AtoWCVh1IaqsspzuWbMpFJCG+zlwsKago/rBs22TolzAOh60Gjxd@vger.kernel.org
X-Gm-Message-State: AOJu0YwcwBUK+q7EErXCYYd7uxMsNYM9Ok0SrdAUFSJxV9E9VSihy2vR
	Ii3KGHHKHPwbU6q5vsGbH1DR/V2pa7SpqMAU68I8ibkedl6innmICDiI
X-Gm-Gg: AeBDietAPdp3Sn5ER1A2sJuseYuaqHNFEksuDbcfomnLUKPQ9sNU+9luRYbPZr1WIRF
	Kwf3KTLQ53Ppx1HQJej8Ey/exM5Qw0C57TMW7ioitDE4h3xSsj9uBDXY4fVH1qMrlSYlJmfnw93
	85LOD/62PWic6JK8jxhahLkZ8oWDMH9+CKzcVu0zk7LVnOfJmdePpzQYeAIyELtR4BwrBJCicAb
	UTUcKuerpl8SwfAixqlSkc3R5y/TydhypvOGKcsFzzzm/h3+M+r0Alo4+aavnU3BXs/EtQzePJR
	aWmxswwP5UiCtzBYAAQ6dLTH+K81RO+uRMkfETMJUt5riCTG2VUUlYHHl1wFabjF6BCb+GguJZ5
	Kx6z1jZq2aiwPIRUZzzWxUbku4+i7kodTYZubCG0ZKNTos1s/hcOD7MWVNqPt2WRVQcAKclbKvw
	0hVBypocak/ONhKb9iN5rjI+8=
X-Received: by 2002:a05:6a00:883:b0:82f:6dad:7b75 with SMTP id d2e1a72fcca58-8352d25e95fmr398194b3a.33.1777662032246;
        Fri, 01 May 2026 12:00:32 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b87869sm3543691b3a.61.2026.05.01.12.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 12:00:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-cpufreq-hw: Fix possible double free
Date: Sat,  2 May 2026 03:00:05 +0800
Message-ID: <20260501190005.504962-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EBA0B4AEFF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-105552-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qcom_cpufreq.data:url]

qcom_cpufreq.data is allocated with devm_kzalloc() in probe() as an
array of per-domain data. qcom_cpufreq_hw_cpu_init() stores a pointer to
one element of this array in policy->driver_data.

qcom_cpufreq_hw_cpu_exit() currently calls kfree() on policy->driver_data.
This is not valid because the memory is devm-managed. For the first
domain, this can free the devm-managed allocation while the devres entry
is still active, leading to a possible double free when the platform
device is later detached. For other domains, the pointer may refer to an
element inside the array rather than the allocation base.

Remove the kfree(data) call and let devres release qcom_cpufreq.data.

This issue was found by a static analysis tool I am developing.

Fixes: 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ea9a20d27b8f..ef19faedbfec 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -578,7 +578,6 @@ static void qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
 	qcom_cpufreq_hw_lmh_exit(data);
 	kfree(policy->freq_table);
-	kfree(data);
 }
 
 static void qcom_cpufreq_ready(struct cpufreq_policy *policy)
-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-45957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BFA1A359
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C841662BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFFC20E6FA;
	Thu, 23 Jan 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HlMEm15d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD8215F5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632354; cv=none; b=hufuod588KFt9QrWmIH5Kz2NHw5/ULECBF0qPz9swXX7wSEWhz2XYbI2UIaaRN4HKyZu2mEAKsxpuElEagz0hD/p9nG/w3vQjzkuGbXeEx2qaXKk3jzm16XjkeHeAoOLpRmwlB2GavLi6/+Izmg3EOyP2QBNvGmTO5RlT8L+QfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632354; c=relaxed/simple;
	bh=0vuFyrpowJWXJ+EgmQo075OCUAokbqO688arZlJgNwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZuFX72xgwYEjNOsw5PO57lBBFmpRYkc917QPXyquuAkh4zUWUjGWalt4ibYTbsSOcsWl60cPfB2reFTIKgQPXoJMHuXwE6WQTmUqxIQQ7zHvqautxP7nrcBS5DxFvbMj/R1CGXjX8pBM1BIXeDmeh0XCAOrjNfoL17Lv9F3nujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HlMEm15d; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso1137534a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632352; x=1738237152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfFWpe84qglq/TtVYEMV6ZHL0gX6mGnPHNUCBfXIIJs=;
        b=HlMEm15dy4WZlJDIFyZD3ccFVVQ8zml48ro3I4mFTiykgduqdehXhBkf50wkI6lDyR
         tUXp1EpGnwNGRs/1sD98wnosfM/CT4CgLF7StQE7/MF+U0B4B97xyxfTGqj04lSFfmSh
         oA9mt3ONYLMMGYWwtEVyIlLviAuFB3gOAbVu1SwBRwtIbG7191lRpubwP1G6Iomhp07S
         UOi06IDJNlN/Q0cOuQOA1cJkwnc9QOwAINH1Th/l3f75AGgcOzCacgM5TrI+pVaFWmPJ
         7oAWddiKxJOrVEKPiyA1UyvjGzyJLuaEv0AU5WjQmD+zG6iDNBvnLi4wGcuKOGH89oc0
         ZVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632352; x=1738237152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfFWpe84qglq/TtVYEMV6ZHL0gX6mGnPHNUCBfXIIJs=;
        b=qs8vOrtzSTaDzVKrPvPZDM/zEgXMKcA1pGQX+f0BweAbWIWWMmrvLvtOwHI+0P6sdV
         nrAUgbVogUlwTxEjFs8nDTVqOxz2aLToDLtapCHOYiMcqOiXJ8UfPG2CBr7Gd9qSctBp
         qYJj4UK4dF3oT0G5tcApwVZM6CEofVo3lE4dK6bBSBBFYFv0EDT72HawE/EWKj3VOrsh
         N5FaGUfo2LOFXF+6Ui+zjXpKvNapCAOqSxFzuayoxDvwB/cxqsDBNoo7/h9oPMug45Hn
         jXleuN9WKquBlQws3t5hWjGJeoGTFXYYZaJipTWZdpBVw8MspW179rYxmHfcIADXweKb
         bDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNKqJ/WPu4aMW6H6SBB2zetN0IUU7mTxZMwS3XFFRqPIhBh2nWfiE7yTjyVBCEMqN/IUvR18Vrk2f3n7N7@vger.kernel.org
X-Gm-Message-State: AOJu0YxXDr7+iA7V/CanF54fmeyH1jv811RchQwwUWMXhMDmySzkObA6
	r2BVvF3RB8L2HcF/Shcf0O7BSMnama1hwr1QnRFyg00cZN8Nl1Sy9s5QPZmQqKM=
X-Gm-Gg: ASbGnctM0K8ZxrVleqpIf+RB1xT/YkwDoxRmNkFDc53+Ion7WBpP+huugWu/HYSoDea
	tpSaLHYUci8Bt59C+P21Ne5D4Lmq01wWoDOjjA+mDq4DfMzAIJ7LcDyOn7MS5zLgDYD6LCulqyB
	JCN36j28TsMvOYY3+Cu1fG/Le0C3oVMykq1tvMBRsEZZ7LyJIv2iS5vBnW21DpwobjLLg8FMkeK
	xvA7axxlvzkl4Dnhs3GFkinutWMOHAbzLzmwBi9jZqbOK1OqJGq4At84gEBf7jDuObBtw/s7VNi
	sYohOX4=
X-Google-Smtp-Source: AGHT+IHlclUl4YrIQK3CJ0/Pzuudje5vfVTFEO6w99Udj/Vlk9RQblNRiPVYs/2jxiDc+XWZQoS5zQ==
X-Received: by 2002:a05:6a00:2e9e:b0:725:e1de:c0bf with SMTP id d2e1a72fcca58-72daf9483fdmr33058325b3a.9.1737632352436;
        Thu, 23 Jan 2025 03:39:12 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f1ae0sm12995670b3a.24.2025.01.23.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:11 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/33] cpufreq: qcom: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:57 +0530
Message-Id: <2e582722386a1ea89ecd8b174e758e054da86555.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index b2e7e89feaac..7d83d7d2ccc8 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -595,12 +595,6 @@ static void qcom_cpufreq_ready(struct cpufreq_policy *policy)
 		enable_irq(data->throttle_irq);
 }
 
-static struct freq_attr *qcom_cpufreq_hw_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	&cpufreq_freq_attr_scaling_boost_freqs,
-	NULL
-};
-
 static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 	.flags		= CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
@@ -615,7 +609,6 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 	.register_em	= cpufreq_register_em_with_opp,
 	.fast_switch    = qcom_cpufreq_hw_fast_switch,
 	.name		= "qcom-cpufreq-hw",
-	.attr		= qcom_cpufreq_hw_attr,
 	.ready		= qcom_cpufreq_ready,
 };
 
-- 
2.31.1.272.g89b43f80a514



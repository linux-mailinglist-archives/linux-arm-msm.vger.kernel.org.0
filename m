Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9A145152E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 21:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344156AbhKOU1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 15:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347867AbhKOUJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 15:09:25 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DDEC0613B9
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 11:50:13 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id jo22so12102426qvb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 11:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fiy4fKk+JWUYzM3sM7rUSAQAs9pCHP/QKriv/BYK8hA=;
        b=gk9LfVEOImYYa1CioSFFSSMzZVUAiBwZCGW2cuaJe0ozEvcFRBGpjeAOW41pNWebC7
         Hj7OBTfPW5lJk097K5yeSR1gB1hZRO8g4qEuoT7D35lOSyhQ8AAKWBxmvakxSJh1CJ5O
         JjvGROpbOSIaZaNCRJhYLzM60gISlKMGKIlLQre23001QYEbIMXid9uWV+Y+hxdJXjHQ
         MHayVm4Boe7Un3DN5DMT6l1UUiTIOpg0TZkeB5khN5FULchSP0hB+FmlUYBzq1VC2Hx4
         A4CL311x/H4zygXUWlXOHSfsqUfkElPskwN6qmUcyukDg6ee4ihmOt/Bz1Sa33egFtR0
         MRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fiy4fKk+JWUYzM3sM7rUSAQAs9pCHP/QKriv/BYK8hA=;
        b=LOxlgMZYJgv5xXiyrxOPbpTXlr/X9rV5g6YEkxtLJTV3dGzR9+OegevveX3woWOGDv
         F5x/a94GlyFZxOTl40NTnJk+ISXKwu4ZS2FW2LU3rGwhqbrdgFigROeJrjGyhavWoegg
         na2kGjlLKLPWhwgSDhfwlLR+58d+fNFbOkW4a6Y00KoAM4FLjSsOYeSqX3hMKQW3YLKI
         z8Ymgioh9x5qLEAr15c7t7uKmjNyfBsS9MN2HYnb+kdEsI9qgZ1Gop+Cc6qKZ3RXs37V
         8WfPicfDmR9G7Dsm1c5rMZYPoDFjhTfFe3AoIlqeUCFPbKWwPDhs6FAdi3is2b8Tac2D
         WvpA==
X-Gm-Message-State: AOAM5325pdkVAVHo/NxyF94yhvIiQ5MZeN/v7SGgkhCdp6FdU74KroNT
        m8oxoGAtQC18mV7X2KyxE0T5Hw==
X-Google-Smtp-Source: ABdhPJz70KRLOsJ2/GnmqamfbgLj8uYO0S2OY9Bhubic5iGyFlT1yY4i8EtbNqbayOzmYRuvUbQp9w==
X-Received: by 2002:ad4:5e8b:: with SMTP id jl11mr39766278qvb.18.1637005812495;
        Mon, 15 Nov 2021 11:50:12 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id bi6sm5822882qkb.29.2021.11.15.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 11:50:12 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rafael@kernel.org, viresh.kumar@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] cpufreq: freq_table: Initialize cpuinfo.max_freq to correct max frequency.
Date:   Mon, 15 Nov 2021 14:50:11 -0500
Message-Id: <20211115195011.52999-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cpuinfo.max_freq reflects the maximum supported frequency of cpus in a
cpufreq policy. When cpus support boost frequency and if boost is disabled
during boot up (which is the default), cpuinfo.max_freq does not reflect
boost frequency as the maximum supported frequency till boost is explicitly
enabled via sysfs interface later. This also means that policy reports two
different cpuinfo.max_freq before and after turning on boost.  Fix this by
separating out setting of policy->max and cpuinfo.max_freq in
cpufreq_frequency_table_cpuinfo.

e.g. of the problem. Qualcomm sdm845 supports boost frequency for gold
cluster (cpus 4-7). After boot up (boost disabled),

1.  cat /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq 2649600
<- This is wrong because boost frequency is

2.  echo 1 > /sys/devices/system/cpu/cpufreq/boost  <- Enable boost cat
/sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq 2803200	<-
max freq reflects boost freq.

3.  echo 0 > /sys/devices/system/cpu/cpufreq/boost <- Disable boost cat
/sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq 2803200	<-
Discrepancy with step 1 as in both cases boost is disabled.

Note that the other way to fix this is to set cpuinfo.max_freq in Soc
cpufreq driver during initialization. Fixing it in
cpufreq_frequency_table_cpuinfo seems more generic solution

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/cpufreq/freq_table.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 67e56cf638ef..6784f94124df 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -35,11 +35,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 	struct cpufreq_frequency_table *pos;
 	unsigned int min_freq = ~0;
 	unsigned int max_freq = 0;
+	unsigned int cpuinfo_max_freq = 0;
 	unsigned int freq;
 
 	cpufreq_for_each_valid_entry(pos, table) {
 		freq = pos->frequency;
 
+		if (freq > cpuinfo_max_freq)
+			cpuinfo_max_freq = freq;
+
 		if (!cpufreq_boost_enabled()
 		    && (pos->flags & CPUFREQ_BOOST_FREQ))
 			continue;
@@ -57,8 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
 	 * it as is.
 	 */
-	if (policy->cpuinfo.max_freq < max_freq)
-		policy->max = policy->cpuinfo.max_freq = max_freq;
+	if (policy->cpuinfo.max_freq < cpuinfo_max_freq)
+		policy->cpuinfo.max_freq = cpuinfo_max_freq;
 
 	if (policy->min == ~0)
 		return -EINVAL;
-- 
2.25.1


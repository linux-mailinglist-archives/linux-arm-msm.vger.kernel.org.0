Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DC42099BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 08:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389693AbgFYGNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 02:13:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:52190 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727800AbgFYGNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 02:13:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593065634; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OokbzRGBh4vM/wAytBHd5gph7Yx4DvpSixDVA2ZxHJ4=; b=LRUs5CEqZU6046Y8yCVVmc+wUOh/uxrb2H/cBpaOGw2bVPg8jvUNFP95asJXNu6OgHdEkkr1
 KGjQxsceBeSzKCRmmD5b9VbJqYQNT39w0idhcPSSh+faeRw0+1WYu0IS/sl1Lx9XXEvk2lSK
 MzNm64P/x2ih77g6RBtm/CYptzY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5ef4408ba6e154319f53344c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 06:13:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6ABCC43395; Thu, 25 Jun 2020 06:13:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from snimmala-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: snimmala)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EECCCC433C6;
        Thu, 25 Jun 2020 06:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EECCCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=snimmala@codeaurora.org
From:   Sai Harshini Nimmala <snimmala@codeaurora.org>
To:     mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Sai Harshini Nimmala <snimmala@codeaurora.org>,
        adharmap@codeaurora.org, shalagra@codeaurora.org,
        dickey@codeaurora.org, satyap@codeaurora.org,
        pkondeti@codeaurora.org, clingutla@codeaurora.org,
        aiquny@codeaurora.org, rgottimu@codeaurora.org,
        Puja Gupta <pujag@codeaurora.org>
Subject: [PATCH] Revert "sched/deadline: Remove cpu_active_mask from cpudl_find()"
Date:   Wed, 24 Jun 2020 23:13:15 -0700
Message-Id: <1593065595-17794-1-git-send-email-snimmala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The original commit 9659e1ee removes checking the cpu_active_mask
while finding the best cpu to place a deadline task, citing the reason that
this mask rarely changes and removing the check will give performance
gains.
However, on hotplugging, the cpu dying path has a brief duration between
the CPUHP_TEARDOWN_CPU and CPUHP_AP_SCHED_STARTING hotplug states where
the DL task can be scheduled on this cpu because the corresponding cpu
bit in cpu->free_cpus has not been cleared yet. Without the
cpu_active_mask check we could end up putting a DL task on such cpus
leading to a BUG.
The cpu_active_mask will be updated promptly before either of these
states and will provide a more accurate check for the use case above.

Signed-off-by: Puja Gupta <pujag@codeaurora.org>
Signed-off-by: Sai Harshini Nimmala <snimmala@codeaurora.org>
---
 kernel/sched/cpudeadline.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/cpudeadline.c b/kernel/sched/cpudeadline.c
index 5cc4012..0346837 100644
--- a/kernel/sched/cpudeadline.c
+++ b/kernel/sched/cpudeadline.c
@@ -120,7 +120,8 @@ int cpudl_find(struct cpudl *cp, struct task_struct *p,
 	const struct sched_dl_entity *dl_se = &p->dl;
 
 	if (later_mask &&
-	    cpumask_and(later_mask, cp->free_cpus, p->cpus_ptr)) {
+	    cpumask_and(later_mask, cp->free_cpus, p->cpus_ptr) &&
+	    cpumask_and(later_mask, later_mask, cpu_active_mask)) {
 		return 1;
 	} else {
 		int best_cpu = cpudl_maximum(cp);
@@ -128,6 +129,7 @@ int cpudl_find(struct cpudl *cp, struct task_struct *p,
 		WARN_ON(best_cpu != -1 && !cpu_present(best_cpu));
 
 		if (cpumask_test_cpu(best_cpu, p->cpus_ptr) &&
+		    cpumask_test_cpu(best_cpu, cpu_active_mask) &&
 		    dl_time_before(dl_se->deadline, cp->elements[0].dl)) {
 			if (later_mask)
 				cpumask_set_cpu(best_cpu, later_mask);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


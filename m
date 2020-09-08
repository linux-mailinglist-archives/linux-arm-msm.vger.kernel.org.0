Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC232614D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 18:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731645AbgIHQib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 12:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732079AbgIHQhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 12:37:36 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE070C061A1B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 07:09:31 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id di5so7817466qvb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kA7YBuYMq9b3mZzCv9QQfgvbcIlMMupkbIGoGou1wKo=;
        b=DgR0IsQjxrfz3z5ThPdVC/EGBKu1Cil2pH0g/Pfa0AUeKE5hMigysm6ESL863n4gSW
         ZFelUzvaCcKKt+R+vd3kVgnbR87hZPYasZ9DG1QkrhGu9kBZy1QhQWT1dbmJhLRleTl6
         0bqm2gKnliloULfvqnwEcNpa2e8VSxe8qQGwMAz1MDJLWFwu6nLPpEiIFrJJyq7wMvdd
         CMZy7v1PRgsLtziIdbnzOTSWT9OkvrhZsvc03OxKLr7HCwlv1ZNdBnZh8+oQeT8psZ3E
         Ki7Yaz6n+VL+ZMiMJDEhBz7VDZ0OFChwHRZPHUb+QJ3GeH0h7aZb4l/g3U3b0Ub3y2QV
         dq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kA7YBuYMq9b3mZzCv9QQfgvbcIlMMupkbIGoGou1wKo=;
        b=UCJVKYY/+AnoSEbvsj4vRErjuThI4MnEfx98k+2D5LqvN1ky/jNHLBpi8m0XL8PRnz
         hIOKDtv73ZABFWbNObXSpvNSNvrPDvmWwHkEJQrcXqbwTXBk5zsu9bavvvD9vnURsn9/
         RQzBRwvpByG4Ns+oN/5tHpAtJ+hsWQ5eJxQ8T6Yk4si0Fmufn+bst5xTfQ6+lAoDMS4o
         gWu7mOIIr/VUG5dFoKEplyY1rO1GBMOq0owxIkvf0IZnfOwUg3ZhKB57dfOpMq41JhSB
         HyVSUXtL/PfAYXfJbmgEnxGhU7UJXq37rAHrSO7Leba1bdW0pA40t03yvwb7szAliTlL
         zZ1A==
X-Gm-Message-State: AOAM531/N9hByWIlD/9cqV9OGs9KdkBqqGxYtsMG/7/iUFb8wGb0bbCP
        g0x2FE6m5WmAthWRSCaty/lE8kDmvkIYJnuHxgE=
X-Google-Smtp-Source: ABdhPJwDTbXK3AYjXreftxuSFRet1m2rtpDGlXYZDBJkXYObWLBHJ8LTS7P+wSPf/tV6q4xpuTYdsA==
X-Received: by 2002:ad4:534c:: with SMTP id v12mr270078qvs.14.1599574170698;
        Tue, 08 Sep 2020 07:09:30 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id r24sm14447276qtm.70.2020.09.08.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 07:09:30 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org (moderated list:SOUNDWIRE SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soundwire: qcom: fix SLIBMUS/SLIMBUS typo
Date:   Tue,  8 Sep 2020 10:08:17 -0400
Message-Id: <20200908140818.28373-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix slimbus case being broken thanks to a typo.

Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
This should be squashed into the problematic patch if possible,
but I'm not sure if that's possible since its already in linux-next?

 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 100af93a5eab..c406a079d237 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -780,7 +780,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
-#if IS_ENABLED(CONFIG_SLIBMUS)
+#if IS_ENABLED(CONFIG_SLIMBUS)
 	if (dev->parent->bus == &slimbus_bus) {
 #else
 	if (false) {
-- 
2.26.1


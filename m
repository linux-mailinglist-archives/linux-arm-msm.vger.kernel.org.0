Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD56F27A1D2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 18:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgI0QUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 12:20:25 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:10026 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgI0QUX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 12:20:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601223622; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=NwY+9pyXoa+omO25i3/YebXXaYhAzcyQec10Z2afrhQ=; b=I30z4y/Tcl9xBgUpIJF/Jvv641NCPukTaKn+oWaYwtI5G11CRv81PFjdLMhVXtjGd8YrUNzl
 GHwyxDHEdwqIYkwvnaMaSrSGYMUahSvjyfPzlRPStdUFkLK0F/mHuEQTo+0lSECiwS6vF74h
 NjUdZnlKVu/orBS7/rYOZwy42YA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f70bbc49cd44bf51a66a567 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 27 Sep 2020 16:20:20
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0BFDC43395; Sun, 27 Sep 2020 16:20:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC36DC433CB;
        Sun, 27 Sep 2020 16:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC36DC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>
Cc:     Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, denik@google.com,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/2] Coresight ETF NULL pointer dereference and ETM save/restore fixes
Date:   Sun, 27 Sep 2020 21:50:02 +0530
Message-Id: <cover.1601222348.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This 2 patch series provides fixes to ETF null pointer dereference crash
and TRCVMIDCCTLR1 register save and restore fix.

Patch 1 is an RFC since I am not sure of the fix provided since it looks
more like a band-aid than the actual fix.

Sai Prakash Ranjan (2):
  coresight: tmc-etf: Fix NULL pointer dereference in
    tmc_enable_etf_sink_perf()
  coresight: etm4x: Fix save and restore of TRCVMIDCCTLR1 register

 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++--
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)


base-commit: e209e73bee253afe969410150248f0c300c13d84
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation


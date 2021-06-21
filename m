Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAF63AF30D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 19:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbhFUR6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 13:58:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:14985 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbhFUR4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 13:56:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624298069; h=Content-Transfer-Encoding: Mime-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: From: Subject:
 Message-ID: Sender; bh=YMQMAwOqFuGAKYEcUbxg8xQ3V/Jt37rWw7E2YHXipcU=; b=cJxfrJFVf+TfCUbdzlmotbGJHRrBQq+72vmktEzPgSWINy6rEhm7oL9/dr6oRoTb9FTWShla
 avqsqRZYqrj/huGEpLY4xTtq/IzCs2B8WRa85hqr+j0RF1kXp0GRZG3KRHcqw/g/7f7BqPxY
 jXPIs19aKGeKyCUKBv4GQQRzMQc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60d0d250abfd22a3dc78e3b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 17:54:23
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 259E6C41622; Mon, 21 Jun 2021 17:54:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hemantk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68389C00916;
        Mon, 21 Jun 2021 17:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68389C00916
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Message-ID: <1624298053.10055.18.camel@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: core: Disable pre-emption for data events
 tasklet processing
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Date:   Mon, 21 Jun 2021 10:54:13 -0700
In-Reply-To: <20210619074442.GC4889@workstation>
References: <1624054985-31365-1-git-send-email-bbhatt@codeaurora.org>
         <20210619074442.GC4889@workstation>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 2021-06-19 at 13:14 +0530, Manivannan Sadhasivam wrote:
> On Fri, Jun 18, 2021 at 03:23:05PM -0700, Bhaumik Bhatt wrote:
> > 
> > With spin_lock_bh(), it is possible that a tasklet processing data
> > events gets scheduled out if another higher priority tasklet is
Needs some re-wording. What we observed was threded irq storms and in
the past we observed some RT tasks preempting MHI tasklet for long
time.
> > ready to run. While the tasklet is sleeping, it can hold the event
Not allowed to sleep in tasklet context.
> > ring spinlock and block another tasklet, for example, one
> > processing
> > an M0 state change event, from acquiring it. This can starve the
> > core which blocks in an attempt to acquire the spinlock until it
> > gets released. Fix this issue by disabling pre-emption on the core
> > processing data events and allow it to run to completion such that
> > other tasklets do not block for long periods.
> > 
> Are you sure?
> 
> IIUC, the tasklets priority is only used while trying to schedule the
> next pending tasklet. But I don't think a high priority tasklet can
> preempt the low priority one.
> 
> Please correct me if I'm wrong.
> 
> Thanks,
> Mani
> 
[..]
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5C1144BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 07:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgAVGiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 01:38:17 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25344 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbgAVGiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 01:38:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579675096; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BTMKD1kC1hneaJuLFHdKQBVHUfBZ4mFs37EkrltHpA8=;
 b=DbgiU9UjrV5d3f7N+DkeQ0gJGxxU7I+C6WGhIy83Pw/qw8s53yGYofMXC3SlkNi7g9K193QV
 34iD4wf5qn38xw+VTHaZ1xiket+h2X/AsM5O+HduB0aC1uchECxcMvQPepk/BpAYhivZeSx/
 o8zZYDAxxhrEqzpKN8/6f4DpgyM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e27edd7.7f0d7ee9f810-smtp-out-n02;
 Wed, 22 Jan 2020 06:38:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 896FBC447A1; Wed, 22 Jan 2020 06:38:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8A42C433CB;
        Wed, 22 Jan 2020 06:38:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Jan 2020 12:08:13 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ohad Ben Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom: q6v5-mss: Improve readability
 across clk handling
In-Reply-To: <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
References: <20200117135130.3605-1-sibis@codeaurora.org>
 <20200117135130.3605-3-sibis@codeaurora.org>
 <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
Message-ID: <4663ec41c6e8dec0a2504aa1ddcf838d@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Evan,

Thanks for the review!

On 2020-01-22 00:52, Evan Green wrote:
> On Fri, Jan 17, 2020 at 5:51 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Define CLKEN and CLKOFF for improving readability of Q6SS clock
>> handling.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> It took me awhile to wrap my head around how this new define,
> Q6SS_CBCR_TIMEOUT_US, sometimes replaces HALT_CHECK_MAX_LOOPS and
> sometimes replaces SLEEP_CHECK_MAX_LOOPS. I guess they're conceptually
> different but set to the same value for now? And you've fixed up a
> place where the wrong one was used? If you thought the distinction was
> meaningless I'd also be fine merging these two defines into one.

They really aren't that different
both are Clks with the same timeout
the previous naming was just plain
bad.

SLEEP_CHECK_MAX_LOOPS was used
probably because it was referring
to QDSP6SS_SLEEP CBCRs timeout.
HALT_CHECK_MAX_LOOOPS seems to
taken directly from CAF code. So
we should be fine with merging
the two defines into one.

> Either way, assuming the above is intentional, this looks ok to me.
> Thanks for renaming that define.
> 
> Reviewed-by: Evan Green <evgreen@chromium.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6761AEAC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 10:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgDRIMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 04:12:44 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:25125 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725857AbgDRIMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 04:12:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587197563; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xxwDid+GegRp2XEwGHjjbsx9T5wGtL4IDO6vWAN+KzQ=; b=aPe7GxGM/9OD4Pqr9oV1wFVt+SqOYcmBn58KcmY71e2g8C+s7fbwqbYZRrMT/3YBzekBdsvG
 Wch6jL/i5bbFNmZ7gqRCqPfiZpbjLol8m5w/zC/fDGTMmB7IlMjx6c5h0MQrICe8tLcQ7g5M
 MgPyCSzGVE3cFlVIbWYbh9cBVtA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9ab672.7f7bb7283b58-smtp-out-n01;
 Sat, 18 Apr 2020 08:12:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3E79C433BA; Sat, 18 Apr 2020 08:12:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.205.89] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50856C433CB;
        Sat, 18 Apr 2020 08:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50856C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-6-git-send-email-rnayak@codeaurora.org>
 <20200417181724.GE199755@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c4313eab-3f48-4817-5507-7e846a5e1eb8@codeaurora.org>
Date:   Sat, 18 Apr 2020 13:42:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417181724.GE199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/17/2020 11:47 PM, Matthias Kaehlcke wrote:
> Hi Rajendra,
> 
> I have essentially the same comments as for "tty: serial: qcom_geni_serial:
> Use OPP API to set clk/perf state" (https://patchwork.kernel.org/patch/11495209/).
> about error handling of 'dev_pm_opp_of_add_table' and misleading struct
> member names 'opp'/'opp_table'. Please apply the requested changes to the
> entire series unless you disagree (we can keep the discussion in the patch
> referenced above).

Thanks, yes, I will apply those changes across the series and respin.
Will wait a few days to see I get any more feedback.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

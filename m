Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F231A0A5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 11:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgDGJqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 05:46:37 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41421 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726767AbgDGJqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 05:46:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586252796; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ul3YhDd1rPscgFpO4CCJ18JVqPLmuQ5bBOiQ1R8owsk=;
 b=V9j7NvrkmWPKQd6ECIQqP6Xxc/2RryYtFG1ePOcuHNZLYkwuTRldCtKTQ3Xl9YXSUCiD4S4I
 G2/Bng8yf9b6aIPm78wqmYi/pdRSdsxBK5TFZKn2mokBSh5ZkEGgUVHy9DihsKow+nH6w6Z0
 KIyvCj0lMHpcFY5hng3BMj0UaPc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c4bfb.7fc0072c6490-smtp-out-n03;
 Tue, 07 Apr 2020 09:46:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB59AC44788; Tue,  7 Apr 2020 09:46:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38318C433F2;
        Tue,  7 Apr 2020 09:46:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 07 Apr 2020 15:16:35 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
In-Reply-To: <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
Message-ID: <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

Thanks for taking a look.

On 2020-04-06 16:25, Mike Leach wrote:
> Hi,
> 
> The programmable replicator hardware by design enables trace through
> both ports on reset. (see 1, section 4.4, 9.11)  The replicator driver
> overrides this functionality to disable output, until the Coresight
> infrastructure chooses a path from source to sink.
> Now given that the hardware design is such that we must be able to
> allow trace to be sent to both ports, a generic patch to prevent this
> does not seem appropriate here.
> 
> I think this needs further investigation - to determine why this
> appears to be failing in this particular instance.
> 

Yes, this probably needs further investigation, but CPU hardlock stack
trace doesnt help much. I could always trigger this hard lockup without
this patch on SC7180 SoC and this is only seen when ETR is used as the 
sink.

The only difference I could see between non working case (on SC7180 [1]) 
and
the working case (on SDM845 [2]) is the path from source to sink.

SC7180 source to sink path(Not working):
----------------------------------------

       etm0_out
	 |
   apss_funnel_in0
          |
  apss_merge_funnel_in
          |
      funnel1_in4
	 |
   merge_funnel_in1
	 |
    swao_funnel_in
          |
        etf_in
	 |
  swao_replicator_in
          |
   replicator_in
	 |
        etr_in


SDM845 source to sink path(Working):
------------------------------------

       etm0_out
          |
    apss_funnel_in0
          |
  apss_merge_funnel_in
          |
     funnel2_in5
	 |
   merge_funnel_in2
          |
       etf_in
	 |
   replicator_in
	 |
        etr_in


[1] - https://lore.kernel.org/patchwork/patch/1212946/
[2] - 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi?h=v5.6#n1910


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93693FD269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 02:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfKOBZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 20:25:24 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:36490 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfKOBZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 20:25:24 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B46B461162; Fri, 15 Nov 2019 01:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573781123;
        bh=JdRtZkJ8mhdpbkZNjuHT294B/fO/LejmbNspGfybIec=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m1uJxKeHvTi23WPCBcWrBd49odfWETyuI7t0kaPzC0gwJ4ecvLvElMGHwTcMIGwuV
         GtdGFNqscYrFXptgWHTxTr64G30lf25YiQ8J98HW0y9plylEkmpp4bUniBOn24OYRY
         KTO6OfI/dDDtRFiCUlPbfx0gorW8n85ET5Rzyq+o=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 72D2A61016;
        Fri, 15 Nov 2019 01:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573781122;
        bh=JdRtZkJ8mhdpbkZNjuHT294B/fO/LejmbNspGfybIec=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G+RgoiJ6wg810RWm+kCImOhVwAIprIQP0JIgp9aGdSLHVOqvIpyjhbR2WSmp5yVkQ
         sQfuoGwiAxew0643MC63rUWrBD24ik/TVtWXoJQaKuNorL+FYShukwp48HYSHXYt8n
         G9v05Zqd4Ypv3rJN04j1wWX1v8EUJsQ3IA1tuRJU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Nov 2019 09:25:22 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] scsi: ufs-qcom: Add reset control support for host
 controller
In-Reply-To: <MN2PR04MB69918A580EC558ECF3FB2748FC710@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1573627552-12615-1-git-send-email-cang@codeaurora.org>
 <1573627552-12615-3-git-send-email-cang@codeaurora.org>
 <MN2PR04MB69918A580EC558ECF3FB2748FC710@MN2PR04MB6991.namprd04.prod.outlook.com>
Message-ID: <c52906ce2d8b97aa394d347955dfd8d0@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-14 17:03, Avri Altman wrote:
> Hi,
> 
>> 
>> 
>> Add reset control for host controller so that host controller can be 
>> reset as
>> required in its power up sequence.
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> +       ret = reset_control_assert(host->core_reset);
>> +       if (ret) {
>> +               dev_err(hba->dev, "%s: core_reset assert failed, err = 
>> %d\n",
>> +                                __func__, ret);
>> +               goto out;
>> +       }
>> +
>> +       /*
>> +        * The hardware requirement for delay between assert/deassert
>> +        * is at least 3-4 sleep clock (32.7KHz) cycles, which comes 
>> to
>> +        * ~125us (4/32768). To be on the safe side add 200us delay.
>> +        */
>> +       usleep_range(200, 210);
> Aren't you sleeping anyway in your reset_control_ops?
> 

For our cases, reset_control_assert uses the reset_control_ops->assert() 
we registered for
node &clock_gcc. There is no sleep or delay in Q's 
reset_control_ops->assert() func.

>> +
>> +       ret = reset_control_deassert(host->core_reset);
>> +       if (ret)
>> +               dev_err(hba->dev, "%s: core_reset deassert failed, err 
>> = %d\n",
>> +                                __func__, ret);
>> +
>> +       usleep_range(1000, 1100);
> ditto

Same as above.

Best Regards,
Can Guo.

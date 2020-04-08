Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65B21A226A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 14:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgDHM6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 08:58:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:28443 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727077AbgDHM6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 08:58:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586350718; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=rDotgWx7+QnovFlw+0TZ4RXvaXTL+HaoABydwwavrc0=; b=bw7lpThJWfu8eEufupBgjVNASFSNl9rly7nxF0pfopJpBdBgPZa6SeT6fpxhZC+OTci1SmH1
 z272PHsdArvvzzIliwOgKHg/cuPhv7aPzRHUbYFHnWlEz3M6sRkMDW2JXynTwMVLPQEBEHM5
 rPNsYhN9ja+53QLXfDYJrRGqub8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dca72.7f930f153c38-smtp-out-n03;
 Wed, 08 Apr 2020 12:58:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52DF5C44788; Wed,  8 Apr 2020 12:58:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pragalla (unknown [203.109.108.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ppvk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28783C433D2;
        Wed,  8 Apr 2020 12:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28783C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ppvk@codeaurora.org
From:   <ppvk@codeaurora.org>
To:     "'Doug Anderson'" <dianders@chromium.org>
Cc:     "'Adrian Hunter'" <adrian.hunter@intel.com>,
        "'Georgi Djakov'" <georgi.djakov@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Ulf Hansson'" <ulf.hansson@linaro.org>,
        "'Asutosh Das'" <asutoshd@codeaurora.org>,
        "'Veerabhadrarao Badiganti'" <vbadigan@codeaurora.org>,
        "'Sahitya Tummala'" <stummala@codeaurora.org>,
        "'Sayali Lokhande'" <sayalil@codeaurora.org>,
        "'Ram Prakash Gupta'" <rampraka@codeaurora.org>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Linux MMC List'" <linux-mmc@vger.kernel.org>,
        "'LKML'" <linux-kernel@vger.kernel.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>,
        "'open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS'" 
        <devicetree@vger.kernel.org>, "'Andy Gross'" <agross@kernel.org>,
        <linux-mmc-owner@vger.kernel.org>,
        "'Subhash Jadavani'" <subhashj@codeaurora.org>,
        <sbhanu@codeaurora.org>
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org> <1573220319-4287-3-git-send-email-ppvk@codeaurora.org> <CAD=FV=WGUasS=UZxFeSS0Cg=9WxHPMWVFyYae7CFmOxV2_yhJw@mail.gmail.com>
In-Reply-To: <CAD=FV=WGUasS=UZxFeSS0Cg=9WxHPMWVFyYae7CFmOxV2_yhJw@mail.gmail.com>
Subject: RE: [RFC-v2 2/2] mmc: sdhci-msm: Add support for bus bandwidth voting
Date:   Wed, 8 Apr 2020 18:28:05 +0530
Message-ID: <001601d60da5$630168d0$29043a70$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHo/qvz39tvwFARdq04gcBr6mq1JgIkxMVEAUfxRSCoLeR7IA==
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

You no longer seeing this warning stack with the latest patch set.
https://lkml.org/lkml/2020/3/23/407

The latest patch set is based on OPP framework and no workqueue's used =
to queue the work.
Can you give a try with the latest patch and check if this helps ?

Thanks and Regards,
Pradeep

-----Original Message-----
From: Doug Anderson <dianders@chromium.org>=20
Sent: Friday, April 3, 2020 10:34 PM
To: Pradeep P V K <ppvk@codeaurora.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>; Georgi Djakov =
<georgi.djakov@linaro.org>; Rob Herring <robh+dt@kernel.org>; Ulf =
Hansson <ulf.hansson@linaro.org>; Asutosh Das <asutoshd@codeaurora.org>; =
Veerabhadrarao Badiganti <vbadigan@codeaurora.org>; Sahitya Tummala =
<stummala@codeaurora.org>; Sayali Lokhande <sayalil@codeaurora.org>; Ram =
Prakash Gupta <rampraka@codeaurora.org>; Stephen Boyd =
<sboyd@kernel.org>; Linux MMC List <linux-mmc@vger.kernel.org>; LKML =
<linux-kernel@vger.kernel.org>; linux-arm-msm =
<linux-arm-msm@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Andy Gross =
<agross@kernel.org>; linux-mmc-owner@vger.kernel.org; Subhash Jadavani =
<subhashj@codeaurora.org>
Subject: Re: [RFC-v2 2/2] mmc: sdhci-msm: Add support for bus bandwidth =
voting

Hi,

On Fri, Nov 8, 2019 at 5:45 AM Pradeep P V K <ppvk@codeaurora.org> =
wrote:
>
> +       if (msm_host->bus_vote_data->curr_vote !=3D VOTE_ZERO)
> +               queue_delayed_work(system_wq,
> +                                  &msm_host->bus_vote_work,
> +                                 =20
> +msecs_to_jiffies(MSM_MMC_BUS_VOTING_DELAY));
> +}

Drive-by feedback here without any full review of your patch...
Someone had your patch applied and sent me a stack trace with a warning =
on it.  That warning showed:

workqueue: WQ_MEM_RECLAIM kblockd:blk_mq_run_work_fn is flushing =
!WQ_MEM_RECLAIM events:sdhci_msm_bus_work

The trace shown was:

    check_flush_dependency+0x108/0x110
    __flush_work+0xa8/0x1e8
    __cancel_work_timer+0x130/0x1c4
    cancel_delayed_work_sync+0x20/0x30
    sdhci_msm_bus_cancel_work_and_set_vote+0x3c/0x8c
    sdhci_msm_bus_voting+0x40/0x7c
    sdhci_msm_runtime_resume+0xdc/0xf4
    pm_generic_runtime_resume+0x34/0x48
    __rpm_callback+0x70/0xfc
    rpm_callback+0x5c/0x8c
    rpm_resume+0x3fc/0x534
    __pm_runtime_resume+0x7c/0xa0
    __mmc_claim_host+0x1f4/0x230
    mmc_get_card+0x34/0x40
    mmc_mq_queue_rq+0x18c/0x244
    blk_mq_dispatch_rq_list+0x27c/0x560
    blk_mq_do_dispatch_sched+0xe0/0x140
    blk_mq_sched_dispatch_requests+0x138/0x1b8
    __blk_mq_run_hw_queue+0xc0/0x118
    blk_mq_run_work_fn+0x24/0x30

I believe the way to interpret this is that you need to be running your =
work on a workqueue marked for memory reclaim.  That means you can't use =
the system_wq to queue your work.  Without being an expert, a quick =
guess would be that you should be queueing your work on the =
"kblockd_workqueue" using one of the functions for this.

-Doug

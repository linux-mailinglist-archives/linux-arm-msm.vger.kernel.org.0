Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B11419DC74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgDCRML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:12:11 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34435 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgDCRML (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:12:11 -0400
Received: by mail-qk1-f193.google.com with SMTP id i6so8797158qke.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eKwWwj3eqf+cZzC5JrJMT4a43JvCqUM+JiOzX9deVL0=;
        b=hlm6P03s/Sq5PDxZkKnjNhsRznuMMud9tkThiDgQeV7G1rL6qquyi7rq7iMdnRCfLa
         eWAY/+MOlyXrktAih6k/dfz5ql/Vw70D8AgPa/ajBudMfEzf400Q4yG9I1r7eVo/sMOu
         OpTDl1bhUsTqqoiyOoYnCzV5tFYSc7pHf6vmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eKwWwj3eqf+cZzC5JrJMT4a43JvCqUM+JiOzX9deVL0=;
        b=pMYzVvoCdNO7wDKRtEmCGVW87qgeijHf6S456TmMCakGA4Io/1eqG24TorZrJYymd1
         n/sx+2AgchvUs+D7F6sFFChbRZ5UyHjweMJZe787MdbqJJGYvgQ1FMKucD91iZ/8iDCj
         yBhJmnZtHIbeYKmcDpZwlB7DjZ1s2fcoYHqZ7SbkP2Kh1NryMw5YOcuLvavdRIjfT/5v
         d3lDZyu/nXC7DBO+VAuwk/YSv0DYg2RDxpUR26v53/Uy3X8g0rf9qBq6VW9p/zlRKi0q
         xONClHVasuxKG111ot5mPRSYC5MxKRoPe9RJf8NGCArat1GJRMAmovD3ImcLGk4g2OWI
         OocQ==
X-Gm-Message-State: AGi0PuYGAUGsWAN7czyTL7+3LNVI/OCz/JCLpcx0FL7QnWzXPuBkm41d
        9iEq0HOdqJYXXNwC70xsD5W3VsKcWv4=
X-Google-Smtp-Source: APiQypIIXF3vE8F4amjvp9hSQfXtQuYkfksaaTRImUZKSLaqzoTO7MQerIlkDBWFqZZg5gloxCFX8Q==
X-Received: by 2002:a37:a84c:: with SMTP id r73mr10188447qke.370.1585933928618;
        Fri, 03 Apr 2020 10:12:08 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id e17sm3805291qtw.1.2020.04.03.10.12.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:12:08 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id x63so4640284ybx.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 10:12:08 -0700 (PDT)
X-Received: by 2002:ab0:1d10:: with SMTP id j16mr7491766uak.91.1585933475285;
 Fri, 03 Apr 2020 10:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org> <1573220319-4287-3-git-send-email-ppvk@codeaurora.org>
In-Reply-To: <1573220319-4287-3-git-send-email-ppvk@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 3 Apr 2020 10:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGUasS=UZxFeSS0Cg=9WxHPMWVFyYae7CFmOxV2_yhJw@mail.gmail.com>
Message-ID: <CAD=FV=WGUasS=UZxFeSS0Cg=9WxHPMWVFyYae7CFmOxV2_yhJw@mail.gmail.com>
Subject: Re: [RFC-v2 2/2] mmc: sdhci-msm: Add support for bus bandwidth voting
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        linux-mmc-owner@vger.kernel.org,
        Subhash Jadavani <subhashj@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 8, 2019 at 5:45 AM Pradeep P V K <ppvk@codeaurora.org> wrote:
>
> +       if (msm_host->bus_vote_data->curr_vote != VOTE_ZERO)
> +               queue_delayed_work(system_wq,
> +                                  &msm_host->bus_vote_work,
> +                                  msecs_to_jiffies(MSM_MMC_BUS_VOTING_DELAY));
> +}

Drive-by feedback here without any full review of your patch...
Someone had your patch applied and sent me a stack trace with a
warning on it.  That warning showed:

workqueue: WQ_MEM_RECLAIM kblockd:blk_mq_run_work_fn is flushing
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

I believe the way to interpret this is that you need to be running
your work on a workqueue marked for memory reclaim.  That means you
can't use the system_wq to queue your work.  Without being an expert,
a quick guess would be that you should be queueing your work on the
"kblockd_workqueue" using one of the functions for this.

-Doug

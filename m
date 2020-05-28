Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68C71E62EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390605AbgE1Nxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 09:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390556AbgE1Nxu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 09:53:50 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6545EC05BD1E;
        Thu, 28 May 2020 06:53:50 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id a18so171687ilp.7;
        Thu, 28 May 2020 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PLslgLPnR8Y3hUCC1IVbsxu7nCYCKRf2I9pQNybG4iw=;
        b=ZI4OG95s12fs6duy/N6GO+aP1nLDrDpPTqcEI+BBaZ/62gH07ZCHspb5o346ycdUB9
         rkQTQ5trZ258WzyAYipr54oCSuyqWkdyHJh+DY2uqA1R9hA8gklEXgpEMCHT0GBBNOlG
         OlwmXGnemC8O3/n8u3wDiYZG0+im3X7sky2Q6J10n3UttfoO2KRN9BYumCweKV8/4d79
         nUiRIOUJYRtpX/F5u3P3NXh9/FZ4+NUzNeDmuzzzznK54ZeNTp9DLIn8AhmoGd9uZlLB
         EXjCl9eLG6vLHOGZa3nPxMC1igEKQaDvv1NImtywFk4HPv3kPjqmqyt+RZwNDhT1OXkt
         RzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLslgLPnR8Y3hUCC1IVbsxu7nCYCKRf2I9pQNybG4iw=;
        b=J3tNDZUF8ThhcZynqxZLu4DsdWX5QtmlE4sizv4Dve0xvMPpErMfwUkYV2fIvN+4OK
         ibP6VShH4fD/TBEP+M8tBciPb3cfavCET5BEV0nDoiBgFXf1AG4GNskRsPXQp7Bz2z8Z
         /Ya6S+rdG454N0dLchtnvL8DAFSfoRsPWN+TvETqx6gwWkn1BOIxef7vf0x541qamLfp
         BBGKS9/0yqxGTeBC//RKkM++wIaruLQrGALlyBD/iWAM6pzmrVuWleA9vEHMfiedDsx5
         JfnuxK99iE+3h/07APyMswNSvLknO78dxPZMlbccheWmzGu3XJpp95Wsw5Op8Jlcw2TS
         VGqA==
X-Gm-Message-State: AOAM530u8zAQdu2EaNV1Bmp/JP4MLK2O5Ru3LzcNuPoY/LMGvf/BgWOL
        /HyEU6tc1x08ppOuhVS8OvfR6fUuvZEi5mqbfHI=
X-Google-Smtp-Source: ABdhPJz3pvsvF3vDZQHDZZARSic+cjjWuwrrrczg7rXeFCBhcYnxfSVnTCNBGgfPQxBCstbjZmlY6QUq4VyklDrFv/Y=
X-Received: by 2002:a92:5b99:: with SMTP id c25mr2977848ilg.42.1590674029756;
 Thu, 28 May 2020 06:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585160616.git.asutoshd@codeaurora.org> <d0c6c22455811e9f0eda01f9bc70d1398b51b2bd.1585160616.git.asutoshd@codeaurora.org>
 <CAOCk7NrrBoO2k1M7XX0W6L2+efBbo-s6WVaKZx4EtSqNpCaUyA@mail.gmail.com> <f52a59df-5697-9e82-d12d-292ee9653f45@codeaurora.org>
In-Reply-To: <f52a59df-5697-9e82-d12d-292ee9653f45@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 28 May 2020 07:53:38 -0600
Message-ID: <CAOCk7NrR1dhr47audXYQr4gBQAYNqEP9-N9-1rPNWwApqib3vQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] scsi: ufshcd: Update the set frequency to devfreq
To:     "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Cc:     c_vkoul@quicinc.com, hongwus@codeaurora.org,
        Avri Altman <Avri.Altman@wdc.com>,
        Can Guo <cang@codeaurora.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 26, 2020 at 11:17 AM Asutosh Das (asd)
<asutoshd@codeaurora.org> wrote:
>
> Hi Jeffrey
> On 5/25/2020 3:19 PM, Jeffrey Hugo wrote:
> > On Wed, Mar 25, 2020 at 12:29 PM Asutosh Das <asutoshd@codeaurora.org> wrote:
> >>
> >> Currently, the frequency that devfreq provides the
> >> driver to set always leads the clocks to be scaled up.
> >> Hence, round the clock-rate to the nearest frequency
> >> before deciding to scale.
> >>
> >> Also update the devfreq statistics of current frequency.
> >>
> >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> >
> > This change appears to cause issues for the Lenovo Miix 630, as
> > identified by git bisect.
> >
>
> Thanks for reporting this.
>
> > On 5.6-final, My boot log looks normal.  On 5.7-rc7, the Lenovo Miix
> > 630 rarely boots, usually stuck in some kind of infinite printk loop.
> >
> > If I disable some of the UFS logging, I can capture this from the
> > logs, as soon as UFS inits -
> >
> > [    4.353860] ufshcd-qcom 1da4000.ufshc: ufshcd_intr: Unhandled
> > interrupt 0x00000000
> > [    4.359605] ufshcd-qcom 1da4000.ufshc: ufshcd_intr: Unhandled
> > interrupt 0x00000000
> > [    4.365412] ufshcd-qcom 1da4000.ufshc: ufshcd_check_errors:
> > saved_err 0x4 saved_uic_err 0x2
> > [    4.371121] ufshcd-qcom 1da4000.ufshc: hba->ufs_version = 0x210,
> > hba->capabilities = 0x1587001f
> > [    4.376846] ufshcd-qcom 1da4000.ufshc: hba->outstanding_reqs =
> > 0x100000, hba->outstanding_tasks = 0x0
> > [    4.382636] ufshcd-qcom 1da4000.ufshc: last_hibern8_exit_tstamp at
> > 0 us, hibern8_exit_cnt = 0
> > [    4.388368] ufshcd-qcom 1da4000.ufshc: No record of pa_err
> > [    4.394001] ufshcd-qcom 1da4000.ufshc: dl_err[0] = 0x80000001 at 3873626 us
> > [    4.399577] ufshcd-qcom 1da4000.ufshc: No record of nl_err
> > [    4.405053] ufshcd-qcom 1da4000.ufshc: No record of tl_err
> > [    4.410464] ufshcd-qcom 1da4000.ufshc: No record of dme_err
> > [    4.415747] ufshcd-qcom 1da4000.ufshc: No record of auto_hibern8_err
> > [    4.420950] ufshcd-qcom 1da4000.ufshc: No record of fatal_err
> > [    4.426013] ufshcd-qcom 1da4000.ufshc: No record of link_startup_fail
> > [    4.430950] ufshcd-qcom 1da4000.ufshc: No record of resume_fail
> > [    4.435786] ufshcd-qcom 1da4000.ufshc: No record of suspend_fail
> > [    4.440538] ufshcd-qcom 1da4000.ufshc: dev_reset[0] = 0x0 at 3031009 us
> > [    4.445199] ufshcd-qcom 1da4000.ufshc: No record of host_reset
> > [    4.449750] ufshcd-qcom 1da4000.ufshc: No record of task_abort
> > [    4.454214] ufshcd-qcom 1da4000.ufshc: clk: core_clk, rate: 50000000
> > [    4.458590] ufshcd-qcom 1da4000.ufshc: clk: core_clk_unipro, rate: 37500000
> >
> > I don't understand how this change is breaking things, but it clearly is for me.
> >
> > What kind of additional data would be useful to get to the bottom of this?
> >

It turns out that the unipro_core clock had no parent, and thus no
ability to scale.  Fixing that in GCC seems to have resolved this.  I
suspect the UFS clock scaling code attempted to scale the core clock,
didn't check that the clock could change rates, and went along
assuming the new rate was effective, thus putting the hardware into a
bad state.

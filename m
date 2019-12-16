Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5921D1219B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 20:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfLPTMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 14:12:32 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:39066 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfLPTMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 14:12:31 -0500
Received: by mail-io1-f66.google.com with SMTP id c16so6266743ioh.6;
        Mon, 16 Dec 2019 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZessK4RCkLAmekHW0Wl1a8wj13gMExX3b9NCfcOgXbo=;
        b=U82ohaIZN/w0MFLAlUAwnbAq0JLNa9b2Fc5jgR4UC1odAYjoFiSSuhSTulYDO9cFBE
         R9BrKmpEkNDOv84a5xQLnfghs/wE6mTA28qib4+YfVlcCE3wdAnxXhH2+zH5zsDSX/MS
         8SuCjoa1hIz3fOGELmnYL9LFhQ8EELx9Epu5IHHl4smBmdwKk3sVE5ykGFHMvDucpqZ4
         TZjoWbpxNVmZ71umMvCtPte0QTgIpnp431KI0PP2b5sNYLO5AICGO3P+M+PMCoUvPOLv
         TU6gL0x0lIkV20eAzbnfXA+VgnGYzM9dqt2bfEaYbKW3BQv4Sd55sRfr3PzBCfX24+VN
         5m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZessK4RCkLAmekHW0Wl1a8wj13gMExX3b9NCfcOgXbo=;
        b=lVgrtWG09sLBFVa3U9G+pQ/YM4wEVMC3ru6MKrhs3f+EtMYm7yTb3IqTffSUbdCWKQ
         q9AYvzIkbZr0MwGzHG8pMEhAPwn/oQn3kX9i3Ve5PQZSej7feVObCFHCdBm4qUAw0MrI
         AdYPPoTuMb0ZPRHEFtbmKs7cIyZxAxRWnxxHqOSDVPt2Znd60w0t/uE2KEqjkKVbRbnS
         xo6XppWQtSCZnUdlhQU/+bG9gbU8DnEoL0liWNddJoPdXaPysNDG0mDsntU3Oo7fz5ZJ
         oG4QIFOhb0Ac9WraRqOTpC+oC/qu2OHz4YZW5Fl8mfmrJUVoY0aVipxudPWX6E7u9IQS
         kCMg==
X-Gm-Message-State: APjAAAVDHHxBBiuAU1P7mXt66hxpjN1HWMyNlbo/0wbewfeB3wPQ37jV
        Z+P0oqzKM/jylqsoxQmvJ7DH0ddz8ySAZgZdlss=
X-Google-Smtp-Source: APXvYqwRYJHzqvLl44ZQm8vLb4+2mcus3NnTtVojmPbDyZomPUuGFA2ryD/F41TNtoy2rA10QFUmE8jsaxK3mAVMyw4=
X-Received: by 2002:a02:ca56:: with SMTP id i22mr12783297jal.140.1576523550596;
 Mon, 16 Dec 2019 11:12:30 -0800 (PST)
MIME-Version: 1.0
References: <1573798172-20534-1-git-send-email-cang@codeaurora.org>
 <1573798172-20534-3-git-send-email-cang@codeaurora.org> <20191216190415.GL2536@vkoul-mobl>
In-Reply-To: <20191216190415.GL2536@vkoul-mobl>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 16 Dec 2019 12:12:19 -0700
Message-ID: <CAOCk7NpAp+DHBp-owyKGgJFLRajfSQR6ff1XMmAj6A4nM3VnMQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for host controller
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 16, 2019 at 12:05 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hi Can,
>
> On 14-11-19, 22:09, Can Guo wrote:
> > Add reset control for host controller so that host controller can be reset
> > as required in its power up sequence.
>
> I am seeing a regression on UFS on SM8150-mtp with this patch. I think
> Jeff is seeing same one lenove laptop on 8998.

Confirmed.

>
> 845 does not seem to have this issue and only thing I can see is that on
> sm8150 and 8998 we define reset as:
>
>                         resets = <&gcc GCC_UFS_BCR>;
>                         reset-names = "rst";
>
> Thanks
>
> >
> > Signed-off-by: Can Guo <cang@codeaurora.org>
> > ---
> >  drivers/scsi/ufs/ufs-qcom.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/scsi/ufs/ufs-qcom.h |  3 +++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> > index a5b7148..c69c29a1c 100644
> > --- a/drivers/scsi/ufs/ufs-qcom.c
> > +++ b/drivers/scsi/ufs/ufs-qcom.c
> > @@ -246,6 +246,44 @@ static void ufs_qcom_select_unipro_mode(struct ufs_qcom_host *host)
> >       mb();
> >  }
> >
> > +/**
> > + * ufs_qcom_host_reset - reset host controller and PHY
> > + */
> > +static int ufs_qcom_host_reset(struct ufs_hba *hba)
> > +{
> > +     int ret = 0;
> > +     struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > +
> > +     if (!host->core_reset) {
> > +             dev_warn(hba->dev, "%s: reset control not set\n", __func__);
> > +             goto out;
> > +     }
> > +
> > +     ret = reset_control_assert(host->core_reset);
> > +     if (ret) {
> > +             dev_err(hba->dev, "%s: core_reset assert failed, err = %d\n",
> > +                              __func__, ret);
> > +             goto out;
> > +     }
> > +
> > +     /*
> > +      * The hardware requirement for delay between assert/deassert
> > +      * is at least 3-4 sleep clock (32.7KHz) cycles, which comes to
> > +      * ~125us (4/32768). To be on the safe side add 200us delay.
> > +      */
> > +     usleep_range(200, 210);
> > +
> > +     ret = reset_control_deassert(host->core_reset);
> > +     if (ret)
> > +             dev_err(hba->dev, "%s: core_reset deassert failed, err = %d\n",
> > +                              __func__, ret);
> > +
> > +     usleep_range(1000, 1100);
> > +
> > +out:
> > +     return ret;
> > +}
> > +
> >  static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> >  {
> >       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > @@ -254,6 +292,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> >       bool is_rate_B = (UFS_QCOM_LIMIT_HS_RATE == PA_HS_MODE_B)
> >                                                       ? true : false;
> >
> > +     /* Reset UFS Host Controller and PHY */
> > +     ret = ufs_qcom_host_reset(hba);
> > +     if (ret)
> > +             dev_warn(hba->dev, "%s: host reset returned %d\n",
> > +                               __func__, ret);
> > +
> >       if (is_rate_B)
> >               phy_set_mode(phy, PHY_MODE_UFS_HS_B);
> >
> > @@ -1101,6 +1145,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> >       host->hba = hba;
> >       ufshcd_set_variant(hba, host);
> >
> > +     /* Setup the reset control of HCI */
> > +     host->core_reset = devm_reset_control_get(hba->dev, "rst");
> > +     if (IS_ERR(host->core_reset)) {
> > +             err = PTR_ERR(host->core_reset);
> > +             dev_warn(dev, "Failed to get reset control %d\n", err);
> > +             host->core_reset = NULL;
> > +             err = 0;
> > +     }
> > +
> >       /* Fire up the reset controller. Failure here is non-fatal. */
> >       host->rcdev.of_node = dev->of_node;
> >       host->rcdev.ops = &ufs_qcom_reset_ops;
> > diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
> > index d401f17..2d95e7c 100644
> > --- a/drivers/scsi/ufs/ufs-qcom.h
> > +++ b/drivers/scsi/ufs/ufs-qcom.h
> > @@ -6,6 +6,7 @@
> >  #define UFS_QCOM_H_
> >
> >  #include <linux/reset-controller.h>
> > +#include <linux/reset.h>
> >
> >  #define MAX_UFS_QCOM_HOSTS   1
> >  #define MAX_U32                 (~(u32)0)
> > @@ -233,6 +234,8 @@ struct ufs_qcom_host {
> >       u32 dbg_print_en;
> >       struct ufs_qcom_testbus testbus;
> >
> > +     /* Reset control of HCI */
> > +     struct reset_control *core_reset;
> >       struct reset_controller_dev rcdev;
> >
> >       struct gpio_desc *device_reset;
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
>
> --
> ~Vinod

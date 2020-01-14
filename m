Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974CE13B0E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 18:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgANR3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 12:29:13 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34913 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgANR3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 12:29:13 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so10477270lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOPoDyHHe7c/QrCl65j4vL8tiyrDQaiPvJ1cy+BrJy8=;
        b=R6l/wPkAwLaqTFmLQ5g4E4C2zNwYsVHlYye65aXueZZG0RJf/bWtt5T90zPqXT9SPJ
         x2Fyj/sbTy0xpxGqjnCEi9woHbbY8pfBVDGaa/mQoQ3g/IlHZugoHPv5x59825Guaal4
         tZ+22HyB/vklOnk4e1rDHHMR/yePT3mZPYR6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOPoDyHHe7c/QrCl65j4vL8tiyrDQaiPvJ1cy+BrJy8=;
        b=c8PUmAN0D6RizwW02zSaHpuH5rMTEVSWtgrEI8JhQOOgp868xGfnHE7r1INHTbT2po
         3SdiQrrf7PMw24+ByArMaDqyQIJnq+xgkzC/gOTGU2gHBCASoXeLWhUPv6I2eoC0iXg7
         nWr8qZzfD2zdTnz5UsB3W5ItxiN8TKskvUNBQ4Z6I6BfxYLwatYh4PER+uBurwBLmst/
         mFXOvRL0maeI1VrCiEBigIZerTjhbg2N//nPBafLKQmEpCLvckINl9aJ5agmHjlYCP7c
         +3JWWbiuba4NVYZhIeeLSajqox25+s6y5ARl2zt3wVa9tHnMl06u49X+mqcNWwPSKb5g
         IyHQ==
X-Gm-Message-State: APjAAAXgAY+5P1zOtnoH0Qa5wB8EI/AEtFQjHP94RCpkKWT7kbV9CrTD
        B+8J8R2XEwOclDm1MTAcEYDKaItfqI8=
X-Google-Smtp-Source: APXvYqxauT40yyh21JyniAxSLtzLK9EnsGcuVJ7FJHsy01PYAEZeK+/HZtVqfBv9J3yTqx8X6Wg3kw==
X-Received: by 2002:ac2:5498:: with SMTP id t24mr2543729lfk.84.1579022949232;
        Tue, 14 Jan 2020 09:29:09 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id l64sm7603419lfd.30.2020.01.14.09.29.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 09:29:08 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id h23so15286489ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2020 09:29:08 -0800 (PST)
X-Received: by 2002:a2e:b017:: with SMTP id y23mr15701704ljk.229.1579022947877;
 Tue, 14 Jan 2020 09:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20191219054506.20565-1-sibis@codeaurora.org> <20191219054506.20565-3-sibis@codeaurora.org>
 <CAE=gft56MhTCBX+EQt8=DMdK96Wj8Kg4ww7TbLjj_oON0zbKyw@mail.gmail.com> <4a72f7691f9ee1d887bca9b1109da6df@codeaurora.org>
In-Reply-To: <4a72f7691f9ee1d887bca9b1109da6df@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 14 Jan 2020 09:28:31 -0800
X-Gmail-Original-Message-ID: <CAE=gft4Mys6qLVRb9O3YrXhcBM+YQYovHK51ZJRSgSvv3UDpfw@mail.gmail.com>
Message-ID: <CAE=gft4Mys6qLVRb9O3YrXhcBM+YQYovHK51ZJRSgSvv3UDpfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: mss: q6v5-mss: Add modem support on SC7180
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 11:06 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Hey Evan,
>
> Thanks for the review!
> sry for the delayed response
>
> On 2020-01-08 02:51, Evan Green wrote:
> > On Wed, Dec 18, 2019 at 9:45 PM Sibi Sankar <sibis@codeaurora.org>
> > wrote:
> >>
> >> Add the out of reset sequence support for modem sub-system on SC7180
> >> SoCs. It requires access to an additional halt nav register to put
> >> the modem back into reset.
> >>
> >> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> >> ---
> >>  drivers/remoteproc/qcom_q6v5_mss.c | 199
> >> ++++++++++++++++++++++++++++-
> >>  1 file changed, 198 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> >> b/drivers/remoteproc/qcom_q6v5_mss.c
> >> index 164fc2a53ef11..51f451311f5fc 100644
> >> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> >> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> >> @@ -68,6 +68,9 @@
> >>  #define AXI_HALTREQ_REG                        0x0
> >>  #define AXI_HALTACK_REG                        0x4
> >>  #define AXI_IDLE_REG                   0x8
> >> +#define NAV_AXI_HALTREQ_BIT            BIT(0)
> >> +#define NAV_AXI_HALTACK_BIT            BIT(1)
> >> +#define NAV_AXI_IDLE_BIT               BIT(2)
> >>
> >>  #define HALT_ACK_TIMEOUT_MS            100
> >>
> >> @@ -101,9 +104,11 @@
> >>  #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
> >>
> >>  /* QDSP6v65 parameters */
> >> +#define QDSP6SS_CORE_CBCR              0x20
> >>  #define QDSP6SS_SLEEP                   0x3C
> >>  #define QDSP6SS_BOOT_CORE_START         0x400
> >>  #define QDSP6SS_BOOT_CMD                0x404
> >> +#define QDSP6SS_BOOT_STATUS            0x408
> >>  #define SLEEP_CHECK_MAX_LOOPS           200
> >>  #define BOOT_FSM_TIMEOUT                10000
> >>
> >> @@ -131,6 +136,7 @@ struct rproc_hexagon_res {
> >>         int version;
> >>         bool need_mem_protection;
> >>         bool has_alt_reset;
> >> +       bool has_halt_nav;
> >>  };
> >>
> >>  struct q6v5 {
> >> @@ -141,9 +147,14 @@ struct q6v5 {
> >>         void __iomem *rmb_base;
> >>
> >>         struct regmap *halt_map;
> >> +       struct regmap *halt_nav_map;
> >> +       struct regmap *conn_map;
> >> +
> >>         u32 halt_q6;
> >>         u32 halt_modem;
> >>         u32 halt_nc;
> >> +       u32 halt_nav;
> >> +       u32 conn_box;
> >>
> >>         struct reset_control *mss_restart;
> >>         struct reset_control *pdc_reset;
> >> @@ -187,6 +198,7 @@ struct q6v5 {
> >>         struct qcom_sysmon *sysmon;
> >>         bool need_mem_protection;
> >>         bool has_alt_reset;
> >> +       bool has_halt_nav;
> >>         int mpss_perm;
> >>         int mba_perm;
> >>         const char *hexagon_mdt_image;
> >> @@ -198,6 +210,7 @@ enum {
> >>         MSS_MSM8974,
> >>         MSS_MSM8996,
> >>         MSS_MSM8998,
> >> +       MSS_SC7180,
> >>         MSS_SDM845,
> >>  };
> >>
> >> @@ -396,6 +409,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
> >>                 reset_control_assert(qproc->pdc_reset);
> >>                 ret = reset_control_reset(qproc->mss_restart);
> >>                 reset_control_deassert(qproc->pdc_reset);
> >> +       } else if (qproc->has_halt_nav) {
> >> +               /* SWAR using CONN_BOX_SPARE_0 for pipeline glitch
> >> issue */
> >
> > Can you elaborate more in this comment, or remove it? Right now it
> > doesn't help me since I don't know what SWAR is, I don't see a
>
> SWAR -> software work around
>
> I'll have to stop with the dumb
> abbreviations

heh I've never heard that one before. SWWA?

>
> > reference to CONN_BOX_SPARE_0 in the code, I don't know what a
>
> conn_box_spare_0 is at an offset
> 0xb3e4 in the conn_map which is
> described in the bindings.
>
> > CONN_BOX is, and I don't know any details about the glitch issue :)
>
> lol, yes I get that the comment does
> not give details on the glitch. It
> was targeted towards explaining why
> there is a deviation in the reset_
> assert sequence from the other SoCs.
> If you still feel the comment does
> not add any value I can get it
> removed.

Maybe just infusing some of the clarity you described here would be enough.

>
> >
> >> +               reset_control_assert(qproc->pdc_reset);
> >> +               regmap_update_bits(qproc->conn_map, qproc->conn_box,
> >> +                                  BIT(0), BIT(0));
> >
> > Make a register name #define for this bit?
>
> we'll have to make one up for it
> since conn_box_spare_0 does not
> have any predefined bits and seems
> to be used to implement some missing
> functionality.

Hm, so its functionality is controlled by firmware? Or was just
defined super late in hardware so as to be termed spare through many
earlier spins of the hardware? Making one up sounds fine, it's just
nice for readability to get a sense of what exactly this bit is when
we toggle it.

>
> >
> >> +               regmap_update_bits(qproc->halt_nav_map,
> >> qproc->halt_nav,
> >> +                                  NAV_AXI_HALTREQ_BIT, 0);
> >> +               reset_control_assert(qproc->mss_restart);
> >> +               reset_control_deassert(qproc->pdc_reset);
> >> +               regmap_update_bits(qproc->conn_map, qproc->conn_box,
> >> +                                  BIT(0), 0);
> >> +               ret = reset_control_deassert(qproc->mss_restart);
> >>         } else {
> >>                 ret = reset_control_assert(qproc->mss_restart);
> >>         }
> >> @@ -413,6 +438,8 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
> >>                 ret = reset_control_reset(qproc->mss_restart);
> >>                 writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
> >>                 reset_control_deassert(qproc->pdc_reset);
> >> +       } else if (qproc->has_halt_nav) {
> >> +               ret = reset_control_reset(qproc->mss_restart);
> >>         } else {
> >>                 ret = reset_control_deassert(qproc->mss_restart);
> >>         }
> >> @@ -499,6 +526,54 @@ static int q6v5proc_reset(struct q6v5 *qproc)
> >>                         return ret;
> >>                 }
> >>
> >> +               goto pbl_wait;
> >
> > Ick, this could benefit from a refactor that pulls those sorta-common
> > steps "Remove IO clamp" through "Start core execution" into a helper
> > function and then calls the new function from each case that needs it.
> >
> >> +       } else if (qproc->version == MSS_SC7180) {
> >> +               val = readl(qproc->reg_base + QDSP6SS_SLEEP);
> >> +               val |= 0x1;
> >
> > It'd be nice if there were defines for these magic 0x1 values in this
> > hunk too.
> >
> >> +               writel(val, qproc->reg_base + QDSP6SS_SLEEP);
> >> +
> >> +               ret = readl_poll_timeout(qproc->reg_base +
> >> QDSP6SS_SLEEP,
> >> +                                        val, !(val & BIT(31)), 1,
> >> +                                        SLEEP_CHECK_MAX_LOOPS);
> >> +               if (ret) {
> >> +                       dev_err(qproc->dev, "QDSP6SS Sleep clock timed
> >> out\n");
> >> +                       return -ETIMEDOUT;
> >> +               }
> >
> > This toggling of the sleep bit is the same as sdm845, it could also be
> > put into a helper function.
>
> https://patchwork.kernel.org/patch/11250301/
> https://patchwork.kernel.org/patch/11250317/
>
> I did club ^^ a portion of the out of
> reset sequence together reducing
> code duplication initially but that
> made the entire thing unreadable.
>
> The general consensus at that time
> was to introduce a patch for sc7180
> that is most readable and have a
> cleanup later with a lot of helper
> functions and less branching like
> you suggested.

Sounds good.

>
> >
> >> +
> >> +               /* Turn on the XO clock needed for PLL setup */
> >> +               val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
> >> +               val |= 0x1;
> >> +               writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
> >> +
> >> +               ret = readl_poll_timeout(qproc->reg_base +
> >> QDSP6SS_XO_CBCR,
> >> +                                        val, !(val & BIT(31)), 1,
> >> +                                        SLEEP_CHECK_MAX_LOOPS);
> >
> > Nit: SLEEP_CHECK_MAX_LOOPS isn't a loop count, it should really have
> > been named something like SLEEP_CHECK_TIMEOUT_US. Could be done in a
> > separate change.
>
> I'll skip this for now. I'll
> make sure that this gets named
> appropriately during the
> planned refactor.

Thanks!

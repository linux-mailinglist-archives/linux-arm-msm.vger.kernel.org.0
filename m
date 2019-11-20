Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69408103966
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbfKTMBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:01:33 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:37806
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728728AbfKTMBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574251292;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=El049u7tCGzDe5ipAq+bw8vZByg4+Fsfl1Rvr4xP2x8=;
        b=dV4p6MhVGGACGz75mYFMnHRwBDcyoBx/VYRWPKm1rcN5I5OvPsO/uF5UikWAf1j+
        VHzsC6bhfm/pyoo4CVHFa/aONfkteCwjylPfgMC80iOGkbyd5CG4ttTT64xcukaxo8q
        Mw2im1fKn37vt9G1j4dxhrgowLLzDBo8AXDendiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574251292;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=El049u7tCGzDe5ipAq+bw8vZByg4+Fsfl1Rvr4xP2x8=;
        b=VFGE5yrCv7KxegOW50Za6ItCaL9OYCZK7txENonLtiA2Bb9RJZJGoAthmSV6EqYV
        NAALIzQ+Idoa1nmKJ9Koqb+kV11jU22zzqampgt/b7kXCxUgA8Z3lGwv9XVrGNXm8NU
        SQOoU991hqbxsnTPtByQs0gtNboOOnW9w0Yj4Yd0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 12:01:32 +0000
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 01/16] remoteproc: q6v5-mss: fixup MSM8998 MSS out of
 reset sequence
In-Reply-To: <CAOCk7NpVDNRxkPUTHbsG_WC4MrjU8_JcdgiuyYbb36RPTMrOWQ@mail.gmail.com>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
 <CAOCk7Nou94bxk_48JArrXhQw2KR+3bKanLe+hb2=d7_j6y3VbQ@mail.gmail.com>
 <0101016e844504f1-d8bd27a5-c0bf-4b0b-8301-7bd8a890be80-000000@us-west-2.amazonses.com>
 <CAOCk7NpVDNRxkPUTHbsG_WC4MrjU8_JcdgiuyYbb36RPTMrOWQ@mail.gmail.com>
Message-ID: <0101016e88b065a2-7d2941bb-711f-460e-a7cd-84fdff7ba181-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.20-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-19 21:13, Jeffrey Hugo wrote:
> On Tue, Nov 19, 2019 at 8:25 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Hey Jeff,
>> 
>> On 11/19/19 3:24 AM, Jeffrey Hugo wrote:
>> > On Mon, Nov 18, 2019 at 2:43 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>> >>
>> >> Fixup the following in the MSS out of reset sequence on MSM8998:
>> >> * skip ACC override on MSM8998.
>> >> * wait for BHS_EN_REST_ACK to be set before setting the LDO to bypass.
>> >> * remove "mem" clock from the active pool.
>> >
>> > Why any of this is necessary isn't explained.
>> 
>> Honestly the above two fixes didn't seem to have any impact when I
>> tested it on MSM8998 MTP just making sure that we allign with the
>> out of reset sequence found on msm-4.4.
> 
> That should be mentioned in the commit text then.
> 
>> 
>> > Seems like it should be 3 separate patches.
>> > Regarding the mem clock change, wouldn't it be an issue if we don't
>> > vote for that?
>> 
>> we already proxy vote for it though.
> 
> Ah, so we do.  That should be mentioned in the commit text.

okay I'll add more details in the
in the next-respin :)

> 
>> 
>> >
>> >>
>> >> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> >> ---
>> >>   drivers/remoteproc/qcom_q6v5_mss.c | 23 ++++++++++++++++++++---
>> >>   1 file changed, 20 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> index 471128a2e7239..2becf6dade936 100644
>> >> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> >> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> @@ -100,6 +100,11 @@
>> >>   #define QDSP6SS_XO_CBCR                0x0038
>> >>   #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
>> >>
>> >> +/* QDSP6v62 parameters */
>> >> +#define QDSP6SS_BHS_EN_REST_ACK                BIT(0)
>> >> +#define BHS_CHECK_MAX_LOOPS            200
>> >> +#define QDSP6SS_BHS_STATUS             0x0C4
>> >> +
>> >>   /* QDSP6v65 parameters */
>> >>   #define QDSP6SS_SLEEP                   0x3C
>> >>   #define QDSP6SS_BOOT_CORE_START         0x400
>> >> @@ -505,8 +510,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>> >>                  int mem_pwr_ctl;
>> >>
>> >>                  /* Override the ACC value if required */
>> >> -               writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> >> -                      qproc->reg_base + QDSP6SS_STRAP_ACC);
>> >> +               if (qproc->version == MSS_MSM8996)
>> >> +                       writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> >> +                              qproc->reg_base + QDSP6SS_STRAP_ACC);
>> >>
>> >>                  /* Assert resets, stop core */
>> >>                  val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> >> @@ -534,6 +540,18 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>> >>                  val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> >>                  udelay(1);
>> >>
>> >> +               /* wait for BHS_EN_REST_ACK to be set */
>> >> +               if (qproc->version == MSS_MSM8998) {
>> >> +                       ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
>> >> +                                                val, (val & QDSP6SS_BHS_EN_REST_ACK),
>> >> +                                                1, BHS_CHECK_MAX_LOOPS);
>> >> +                       if (ret) {
>> >> +                               dev_err(qproc->dev,
>> >> +                                       "QDSP6SS_BHS_EN_REST_ACK timedout\n");
>> >> +                               return -ETIMEDOUT;
>> >> +                       }
>> >> +               }
>> >> +
>> >>                  /* Put LDO in bypass mode */
>> >>                  val |= QDSP6v56_LDO_BYP;
>> >>                  writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> >> @@ -1594,7 +1612,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
>> >>          .active_clk_names = (char*[]){
>> >>                          "iface",
>> >>                          "bus",
>> >> -                       "mem",
>> >>                          "gpll0_mss",
>> >>                          "mnoc_axi",
>> >>                          "snoc_axi",
>> >> --
>> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> >> a Linux Foundation Collaborative Project
>> >>
>> >
>> 
>> --
>> Qualcomm Innovation Center, Inc.
>> Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

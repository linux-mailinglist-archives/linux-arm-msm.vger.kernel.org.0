Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFFE41B512
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241959AbhI1RZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:25:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24810 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241995AbhI1RZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:25:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632849804; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mb/o+TU/jtzYpiRKctEI+EzDEsfd4AjUR8iTNCtSlZo=;
 b=ALr0f1nbVmeAEN3NoJr5yCnEkLfmXcfVUFpXTxYuZW0ATDqo5F1/aBdtcHvFVQYlpDM/oDqM
 tEhXyPTvozm+Poz9SqGR90ikd2KDsl9UyKB6r2ksYJ73F9JcbmVgvH0F2JDglCTVJa9xUze2
 LW5V0yPKC4W9gxo/SB97vubWR40=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61534f6447d64efb6d51911a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 17:22:44
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9223C008F2; Tue, 28 Sep 2021 17:22:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7904C008EF;
        Tue, 28 Sep 2021 17:22:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 10:22:41 -0700
From:   khsieh@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
In-Reply-To: <YSkdaljt7DPbyTDe@builder.lan>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
 <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
 <YSkdaljt7DPbyTDe@builder.lan>
Message-ID: <66f0f29e449b02e30678ed2e3487c7f2@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-27 10:14, Bjorn Andersson wrote:
> On Fri 27 Aug 00:20 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-08-25 16:42:31)
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> > index 2c7de43f655a..4a6132c18e57 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> > @@ -78,6 +78,8 @@ struct dp_display_private {
>> >         char *name;
>> >         int irq;
>> >
>> > +       int id;
>> > +
>> >         /* state variables */
>> >         bool core_initialized;
>> >         bool hpd_irq_on;
>> > @@ -115,8 +117,19 @@ struct dp_display_private {
>> >         struct dp_audio *audio;
>> >  };
>> >
>> > +
>> > +struct msm_dp_config {
>> > +       phys_addr_t io_start[3];
>> 
>> Can this be made into another struct, like msm_dp_desc, that also
>> indicates what type of DP connector it is, i.e. eDP vs DP? That would
>> help me understand in modetest and /sys/class/drm what sort of 
>> connector
>> is probing. dp_drm_connector_init() would need to pass the type of
>> connector appropriately. Right now, eDP connectors still show up as DP
>> instead of eDP in sysfs.
>> 
> 
> I like it, will spin a v3 with this.
> 
> Regards,
> Bjorn

Hi Bjorn,

Have you spin off V3 yet?
When you expect your patches related to DP be up streamed?

Thanks,
kuogee
> 
>> > +       size_t num_dp;
>> > +};
>> > +
>> > +static const struct msm_dp_config sc7180_dp_cfg = {
>> > +       .io_start = { 0x0ae90000 },
>> > +       .num_dp = 1,
>> > +};
>> > +
>> >  static const struct of_device_id dp_dt_match[] = {
>> > -       {.compatible = "qcom,sc7180-dp"},
>> > +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>> >         {}
>> >  };
>> >

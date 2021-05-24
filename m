Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7932B38F3EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 21:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhEXT64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 15:58:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12316 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232517AbhEXT6z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 15:58:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621886247; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3PgdOwZHHK2LbackkccgQl1/jIrQovrjITcU10//viA=;
 b=N30lvOukRKqJGC4vQ7QqNq8zwR0djxVz/y0sXGTJ/tx9EienMdgcFnsiF1qKHxmIOS7tt6lF
 S/pw3ETC2IZYTzYFej6hrfCybO8pguErVZZuaypZoBQt5NzrB3TOiAA+Z+ZL2HggYQsp80Rf
 OoCPwiqUJzax7jpHwR/p03EHN1A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60ac051f60c53c8c9dabb976 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 19:57:19
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25CC1C4323A; Mon, 24 May 2021 19:57:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA6DFC433F1;
        Mon, 24 May 2021 19:57:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 12:57:17 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        aravindh@codeaurora.org, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 3/3] drm/msm/dp: Handle aux timeouts, nacks, defers
In-Reply-To: <CAE-0n51G2NGyE4w1ebdBd1svVPA3QvPZX6kivKA1m9o1XhE26A@mail.gmail.com>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-4-swboyd@chromium.org>
 <1133b2c21eb8f385c16c610638a17d9c@codeaurora.org>
 <CAE-0n51G2NGyE4w1ebdBd1svVPA3QvPZX6kivKA1m9o1XhE26A@mail.gmail.com>
Message-ID: <6ed169ecd2d1c91005b848fc486afa75@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-24 12:19, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-05-24 09:33:49)
>> On 2021-05-07 14:25, Stephen Boyd wrote:
>> > @@ -367,36 +347,38 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
>> > *dp_aux,
>> >       }
>> >
>> >       ret = dp_aux_cmd_fifo_tx(aux, msg);
>> > -
>> >       if (ret < 0) {
>> >               if (aux->native) {
>> >                       aux->retry_cnt++;
>> >                       if (!(aux->retry_cnt % MAX_AUX_RETRIES))
>> >                               dp_catalog_aux_update_cfg(aux->catalog);
>> >               }
>> > -             usleep_range(400, 500); /* at least 400us to next try */
>> > -             goto unlock_exit;
>> > -     }
>> 
>> 1) dp_catalog_aux_update_cfg(aux->catalog) will not work without
>> dp_catalog_aux_reset(aux->catalog);
>> dp_catalog_aux_reset(aux->catalog) will reset hpd control block and
>> potentially cause pending hpd interrupts got lost.
>> Therefore I think we should not do
>> dp_catalog_aux_update_cfg(aux->catalog) for now.
>> reset aux controller will reset hpd control block probolem will be 
>> fixed
>> at next chipset.
>> after that we can add dp_catalog_aux_update_cfg(aux->catalog) followed
>> by dp_catalog_aux_reset(aux->catalog) back at next chipset.
> 
> Hmm ok. So the phy calibration logic that tweaks the tuning values is
> never used? Why can't the phy be tuned while it is active? I don't
> understand why we would ever want to reset the aux phy when changing 
> the
> settings for a retry. Either way, this is not actually changing in this
> patch so it would be another patch to remove this code.
ok,
> 
>> 
>> 2) according to DP specification, aux read/write failed have to wait 
>> at
>> least 400us before next try can start.
>> Otherwise, DP compliant test will failed
> 
> Yes. The caller of this function, drm_dp_dpcd_access(), has the delay
> already
> 
>                 if (ret != 0 && ret != -ETIMEDOUT) {
>                         usleep_range(AUX_RETRY_INTERVAL,
>                                      AUX_RETRY_INTERVAL + 100);
>                 }
> 
> so this delay here is redundant.
yes, you are right. This is enough.


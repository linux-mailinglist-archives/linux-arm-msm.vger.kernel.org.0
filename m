Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFD038D1F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 01:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhEUX1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 19:27:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16912 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230178AbhEUX1m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 19:27:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621639576; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MQjZZTznmIzLxACeImlgWQKlmNBvEGN7+1JvqdoN7cc=;
 b=CMWcv0FQZTfC6Xn1QroyQTmLPld3xUY1LhIEEmm2dJc7utyif0u4x9Z1xiPpRi58VNtGDF7E
 UMKDVwKnRE0hna8M189PRiHeRw6GJaJ6ApPVYXT2irdmnhVmhGHZL6qJbWzeiGJSBiitM7nU
 3xY32yxRsMo24iJjWx0kjCi0RXg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60a841947b5af81b5c7e5aeb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 23:26:12
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7CDD6C433F1; Fri, 21 May 2021 23:26:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25451C4338A;
        Fri, 21 May 2021 23:26:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 16:26:11 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        aravindh@codeaurora.org, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 0/3] drm/msm/dp: Simplify aux code
In-Reply-To: <CAE-0n53jA7xPctEU9TkBf=eot4SGs85gpGMjUiDn_ZiMvVLvKw@mail.gmail.com>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <CAE-0n53jA7xPctEU9TkBf=eot4SGs85gpGMjUiDn_ZiMvVLvKw@mail.gmail.com>
Message-ID: <be37b36782a747f350ea512f69393c57@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-21 14:57, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-05-07 14:25:02)
>> Here's a few patches that simplify the aux handling code and bubble up
>> timeouts and nacks to the upper DRM layers. The goal is to get DRM to
>> know that the other side isn't there or that there's been a timeout,
>> instead of saying that everything is fine and putting some error 
>> message
>> into the logs.
>> 
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
>> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
>> Cc: aravindh@codeaurora.org
>> Cc: Sean Paul <sean@poorly.run>
>> 
> 
> Kuogee, have you had a change to review this series?
> 
Sorry  missed this one.
Will review it now.
>> Stephen Boyd (3):
>>   drm/msm/dp: Simplify aux irq handling code
>>   drm/msm/dp: Shrink locking area of dp_aux_transfer()
>>   drm/msm/dp: Handle aux timeouts, nacks, defers
>> 
>>  drivers/gpu/drm/msm/dp/dp_aux.c     | 181 
>> ++++++++++++----------------
>>  drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
>>  drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
>>  drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>>  4 files changed, 80 insertions(+), 113 deletions(-)
>> 
>> 
>> base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
>> --
>> https://chromeos.dev
>> 

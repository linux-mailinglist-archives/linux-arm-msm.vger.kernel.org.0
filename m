Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE281F6E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 22:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgFKUHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 16:07:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:17578 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726441AbgFKUHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 16:07:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591906055; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2LcVzRPJEhV4O10eqHRYEY4V6niPeDTAOUYJlix3ses=;
 b=TjzaJSFavw1y4t94vmSdsDMQNi7bi3hvO/bVsRcKHNK64Br3mUUyogOk7DZ84T9lT41FwLa9
 dw/dP1ObNvISlaP3nJ0mSezg5oEk82926HoMkLvtac+tWrRGRNXZS4SWAOH48w15R24aKFYo
 GVz57lwvj1ampH/Gj/BAyDIbArA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ee28efe117610c7ffda6af0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 20:07:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF3A7C433CB; Thu, 11 Jun 2020 20:07:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66EBBC433C8;
        Thu, 11 Jun 2020 20:07:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Jun 2020 13:07:25 -0700
From:   tanmay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        sam@ravnborg.org, seanpaul@chromium.org,
        freedreno@lists.freedesktop.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, linux-clk@vger.kernel.org,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v6 2/5] drm: add constant N value in helper file
In-Reply-To: <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
References: <20200609034047.9407-1-tanmay@codeaurora.org>
 <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
Message-ID: <8b8d06e7331a0b8cbe3e674864c16f0c@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-09 19:20, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-06-08 20:40:47)
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> The constant N value (0x8000) is used by i915 DP
>> driver. Define this value in dp helper header file
>> to use in multiple Display Port drivers. Change
>> i915 driver accordingly.
>> 
>> Change in v6: Change commit message
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Can you resend this series as an actual patch series? None of the
> patches have the proper In-Reply-To headers so it is hard to track the
> thread.
Sure. Should I keep Message-ID of v5-patch-1 for in-reply-to header?

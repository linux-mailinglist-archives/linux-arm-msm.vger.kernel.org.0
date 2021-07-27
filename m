Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7435E3D6B27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 02:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhGZX7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 19:59:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14243 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233580AbhGZX7p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 19:59:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627346413; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PPZzWsj9t1GaVOo/Sz9vj2rWvXeIR9LfpuAnWqpczlk=;
 b=eMLT5gkyvjod45zre/UcddSTwSlsiGeZj46Zh0f0XNfcfnUa7nM5920HX+KWzQdcQysYo8/j
 5eDKzlFf9lkrIGpxMMMsdpJBrx1xx3u29qiIyEFBpHA9n1ZotN4Mr23pDLLrJEQAk4J82UTB
 cXM9EZoWub8kJhLsDIjViO/ywr4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60ff55d538fa9bfe9c622132 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 00:39:49
 GMT
Sender: maitreye=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D334DC4323A; Tue, 27 Jul 2021 00:39:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: maitreye)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A7ECC433F1;
        Tue, 27 Jul 2021 00:39:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Jul 2021 17:39:48 -0700
From:   maitreye@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Subject: Re: [PATCH v5] drm/msm/dp: add logs across DP driver for ease of
 debugging
In-Reply-To: <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
Message-ID: <e3a560813463d54d35d8f381e35f4ea9@codeaurora.org>
X-Sender: maitreye@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank you Stephen for reviewing.

On 2021-07-26 14:31, Stephen Boyd wrote:
> Quoting maitreye (2021-07-26 10:36:26)
>> @@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct 
>> device *dev)
>>                 DRM_ERROR("invalid dev\n");
>>                 return -EINVAL;
>>         }
>> +       DRM_DEBUG_DP("sink_request: %d\n", sink_request);
> 
> This one is bad. sink_request isn't assigned yet.
> 
Yes, thank you will fix it
>> 
>>         dp = container_of(g_dp_display,
>>                         struct dp_display_private, dp_display);
>> @@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct 
>> device *dev)
>>         rc = dp_link_process_request(dp->link);
>>         if (!rc) {
>>                 sink_request = dp->link->sink_request;
>> +               DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", 
>> dp->hpd_state, sink_request);
> 
> Should that say sink_request?
> 

Yes will fix this

>>                 if (sink_request & DS_PORT_STATUS_CHANGED)
>>                         rc = 
>> dp_display_handle_port_ststus_changed(dp);
>>                 else

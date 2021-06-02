Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE9923980B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 07:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhFBFk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 01:40:27 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37900 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhFBFk1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 01:40:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622612325; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=g2jQLvmNDkv0M+pVgOjszfDqwE56kNAfKvmEEL+w9Uw=;
 b=ch+xbNAHLLRBVPunNBNbXgEjHnae/S41ZetTpa6xB/UcI9149/WaCKaT32WZxfpUxgiWc/OL
 VWh1r3f5vUwGsz/5e3+KElO22WXwWh3PtRiJ2cfko7ppFGcPYqCSwuNxbK5UoEtNPC6XdyR5
 m4qPsur5Prz1lOJ8NC3/LUQXkYQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60b719646ddc3305c4d4f549 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 05:38:44
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D95B5C43144; Wed,  2 Jun 2021 05:38:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28564C433D3;
        Wed,  2 Jun 2021 05:38:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 02 Jun 2021 11:08:42 +0530
From:   rajeevny@codeaurora.org
To:     Lyude Paul <lyude@redhat.com>
Cc:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, robdclark@gmail.com,
        dianders@chromium.org, jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
In-Reply-To: <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
Message-ID: <5baa08346ac035a9b72098b1e514b7d6@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-06-2021 03:50, Lyude Paul wrote:
> oh-looks like my patches just got reviewed, so hopefully I should get a 
> chance
> to get a look at this in the next day or two :)
> 

Hi Lyude,

That's great!
I have updated v5 [1] of this series addressing Doug's review comments 
on v4 [2]. 
Please review the v5.

[1] 
https://lore.kernel.org/linux-arm-msm/1622390172-31368-1-git-send-email-rajeevny@codeaurora.org/
[2] 
https://lore.kernel.org/linux-arm-msm/CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com/


Thanks,
Rajeev

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AF92F56F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 02:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbhANB4S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 20:56:18 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:58431 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729590AbhAMXpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 18:45:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610581502; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8vGGmTsigGzkFUAuddb3DTMDXkW08K6re37CVJR/miI=;
 b=wTXancm2RcMhPdlTV2FC2FQOPTncQWk5YIAid3bQhrhHuF6GWnG9pHzcY8mGvtsQNXe3zigC
 0G/M+sIBk3YFbR9G8gCthLxOCrZ+ElwWU+CINyfik4dkh/pOoYVbn7k1t/MFC8tLcWBcNWIs
 aeJuKBYGx/6BPpc0nB5jn+wnefQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fff85e18fb3cda82f07e804 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 23:44:33
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8845C433CA; Wed, 13 Jan 2021 23:44:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A44AC433C6;
        Wed, 13 Jan 2021 23:44:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Jan 2021 15:44:32 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
In-Reply-To: <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
 <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
Message-ID: <b4a6e7695d12c3191bff75668f386da9@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-13 12:22, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
>> On 2021-01-11 11:55, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
>> >> irq_hpd event can only be executed at connected state. Therefore
>> >> irq_hpd event should be postponed if it happened at connection
>> >> pending state. This patch also make sure both link rate and lane
>> >
>> > Why does it happen at connection pending state?
>> plug in need two state to complete it.
>> advance to connection pending state once link training completed and
>> sent uevent notification to frame work.
>> transition to connected state after frame work provided resolution
>> timing and start transmit video panel.
>> Therefore irq_hpd should not be handled if it occurred before 
>> connected
>> state.
> 
> Sure that's what's going on in the patch but you didn't answer my
> question. Why does irq_hpd happen before connected state?

I have no idea why it happen this way.
during debug 
https://partnerissuetracker.corp.google.com/issues/170598152
I saw two different scenario
1) irq_hpd followed by unplug with less than 20 ms in between. this one 
fixed by this patch set.
2) plug followed by irq_hpd around 300ms in between. it does not cause 
problem. but it should be handled in order (after connected state).

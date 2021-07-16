Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9B93CAFD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 02:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhGPAEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 20:04:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11349 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhGPAEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 20:04:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626393699; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=erJIzto7qZXuzK61BLf7SS5WdFm+Xt4zEFeRyvOUY1o=;
 b=OKfcrfNLSrN240NduilDL1hxQUM5T0hSPp+WmxCnovzO+nJyaW6+ogJ3lT1mGKx5v9YXWsVH
 iJIpm//m30VugS0/8vBjo0DqB9Ten0i39LdVgqsYugMQUYsE/F5p9g6dJnr+FBm5v4yGJVGP
 /XMMw4D0j1ZcWRuGR9AjkP4jVoQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60f0cc4617c2b4047d417e60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 00:01:10
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4FBA5C43217; Fri, 16 Jul 2021 00:01:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E2DEC433D3;
        Fri, 16 Jul 2021 00:01:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Jul 2021 17:01:07 -0700
From:   abhinavk@codeaurora.org
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
        dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: add support for dsi test pattern generator
In-Reply-To: <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
 <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
Message-ID: <f6235d170811ad02bf6321dcb5ef3568@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marijn

Sorry for the late response.

On 2021-07-13 02:10, Marijn Suijten wrote:
> On 6/29/21 9:04 PM, Abhinav Kumar wrote:
>> During board bringups its useful to have a DSI test pattern
>> generator to isolate a DPU vs a DSI issue and focus on the relevant
>> hardware block.
>> 
>> To facilitate this, add an API which triggers the DSI controller
>> test pattern. The expected output is a rectangular checkered pattern.
>> 
>> This has been validated on a single DSI video mode panel by calling it
>> right after drm_panel_enable() which is also the ideal location to use
>> this as the DSI host and the panel have been initialized by then.
>> 
>> Further validation on dual DSI and command mode panel is pending.
>> If there are any fix ups needed for those, it shall be applied on top
>> of this change.
>> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> [...]
Thanks for testing this.
>> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host 
>> *msm_host)
>> +{
>> +	u32 reg;
>> +
>> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
>> +
>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 
>> 0xff);
>> +
>> +	reg |= (0x3 << 0x8);
>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
>> +	/* draw checkered rectangle pattern */
>> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
> 
> 
> How about BIT(7)?

You mean BIT(7) of REG_DSI_TPG_MAIN_CONTROL2? Thats what this is right?
Did you mean some other bit?

> 
> On SM6125 this seems to change the color intensity of the pattern; it
> is always colored lines of a few pixels wide alternating R, B and G
> from left to right.  Is it possible to document the meaning and
> available values of these registers, especially if they differ between
> SoC / DSI block?
> 

I have requested access for SM6125, will check this register on that to 
see if there
is any difference.

Are you saying you are not seeing a rectangular checkered pattern while 
testing?
Also are you testing on command mode or video mode?

As requested by Rob, I will add the bit definitions and update the 
dsi.xml.h in the
next patchset for the registers and the bits which I am using here.

With that the meaning of these bits will be more clear.

I dont think I will be able to document all the bits because the goal of 
this patch
was only to draw a test pattern to help with validation. Different bits 
of the REG_DSI_TPG_MAIN_CONTROL2
register only draw different patterns so the goal wasnt that we can draw 
any pattern, it was just to
draw some pattern on the screen.

When we add support for all other patterns, we can expose those bits as 
well but it should not
be required in my opinion.

> Kind regards,
> Marijn
> 
>> +	DBG("Cmd test pattern setup done\n");
>> +}
> [...]

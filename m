Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D616472DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 16:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiLHP0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 10:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiLHP0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 10:26:45 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D5AE032
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 07:26:44 -0800 (PST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1p3InK-0007h7-O9; Thu, 08 Dec 2022 16:26:42 +0100
Message-ID: <5ca179d5-51de-c776-057a-ff3a733907a5@leemhuis.info>
Date:   Thu, 8 Dec 2022 16:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE #forregzbot
Content-Language: en-US, de-DE
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <0Co5PrfVEsYkXu9wz6ixpiFl0aWmXfIng6NSPOiYNcrAfHZx0w2crkWN7InPdtR-YTAb1IxLovgcEHCmFpmaqA==@protonmail.internalid>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
 <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
 <be931b00-01a4-7ff4-26fb-e9b248e27048@leemhuis.info>
In-Reply-To: <be931b00-01a4-7ff4-26fb-e9b248e27048@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670513204;688fba06;
X-HE-SMSGID: 1p3InK-0007h7-O9
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.11.22 11:23, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> Hi, this is your Linux kernel regression tracker.
> 
> On 11.11.22 16:30, Caleb Connolly wrote:
>>
>> This patch has caused a regression on 6.1-rc for some devices that use
>> DSI panels. The new behaviour results in the DSI controller being
>> switched off before the panel unprepare hook is called. As a result,
>> panel drivers which call mipi_dsi_dcs_write() or similar in unprepare()
>> fail.
>>
>> I've noticed it specifically on the OnePlus 6 (with upstream Samsung
>> s0fef00 panel driver) and the SHIFT6mq with an out of tree driver.
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 007ac0262b0d
> #regzbot title drm: msm: DSI controller being switched off before the
> panel unprepare hook is called
> #regzbot ignore-activity

#regzbot inconclusive: reporter MIA


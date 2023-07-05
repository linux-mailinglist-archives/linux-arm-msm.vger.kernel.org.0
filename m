Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA81747E48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 09:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjGEHcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 03:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjGEHcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 03:32:23 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC82171B
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 00:32:11 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 21F6885241;
        Wed,  5 Jul 2023 09:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688542319;
        bh=NsgHjHOtkMUFlzu/DAehFea6k3vOfcJfJ2pn8Oy6jmw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iibcjsyndHS6YsbCOJG8wfHKBJxzFPkcWJAF4LH3pAmy1Ak+bOWkFoIifBlXaNA96
         QLD1WC8DFkvBo/t6KZHwV0IIC8HVP6Qq/sIdq6AToRy5gtwiYCq8X49drt2VVEWcIl
         +3Tbex9gba1cU3qJ7f8pi74tZlVsHFW6Vzh2RLiDcbIIfbxOpGziGo5D1OVUUydUMP
         srfKG7ikJ/loPcb1Buo152RyuDeIRLvyxVl6jdJdFs5v5uOO8zgrmq/IYAUJicY5tx
         v2WWiSoSzqQ5s0krgZ9tSFzqfZi9Sqj40tmvwHrVv4meFxnU+t4eAbXpyx67dT0OPb
         Vxsj2OCQet4OQ==
Message-ID: <707c8123-f2be-a803-f4d7-5406c8f32a6b@denx.de>
Date:   Wed, 5 Jul 2023 09:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMty3ZBQajyg0SNz+AjQzth_O_EmrZ9cUyfM--0ptJQ5F0MRfg@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBQajyg0SNz+AjQzth_O_EmrZ9cUyfM--0ptJQ5F0MRfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/5/23 07:46, Jagan Teki wrote:
> On Wed, Jul 5, 2023 at 11:09 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> [Adding freedreno@ to cc list]
>>
>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>
>>> Hi Amit,
>>>
>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>>>>
>>>> Hi Marek,
>>>>
>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>> EOT packet, as these packets are not required. This makes the bridge
>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>
>>>> This patch broke display on Dragonboard 845c (SDM845) devboard running
>>>> AOSP. This is what I see
>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>> Reverting this patch fixes this regression for me.
>>>
>>> Might be msm dsi host require proper handling on these updated
>>> mode_flags? did they?
>>
>> The msm DSI host supports those flags. Also, I'd like to point out
>> that the patch didn't change the rest of the driver code. So even if
>> drm/msm ignored some of the flags, it should not have caused the
>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>> additional programming is required to make it work with these flags.
> 
> True, But I'm not quite sure, most of these mode_flags were handled
> more on the host. Maybe Marek can comment on this.

So, we have the same flags, but two different controllers produce 
different DSI streams ? Do we have any way to analyze the stream 
produced by each controller, to figure out which one is wrong and which 
one is right ?

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC15576CC95
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 14:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233788AbjHBMZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 08:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjHBMZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 08:25:27 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7CE269E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 05:25:25 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4F8BE86839;
        Wed,  2 Aug 2023 14:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690979123;
        bh=lG/SL2bAOZTbz6YJmrIJViDYuRVyF1NDlcj3sZIb0iM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hnE8WtIASiyatRx+LvqTvUNOLL0QRQW2sNai260TIls9FJC9uTMxxc08WUm/H/doT
         uszoDbblktLiWpcTFRUPrQfU5/ih7QivweZQx3cu+LFurZ2AOXVl4gVVV+rjgQUJ0B
         O/p3rGExvUB9ImkX+0QYglUzNjpPTtjQSdKSTI8SBqwL90A4n7/mb/NK2o/K7dukzg
         NLy+Ql/C7mJJJ4jgI8KyudSirFx+NraolBxLKS099Lph682K3BhRqEoc3Ddrh7dCaD
         c6zk9QT8OiRDbVvTtHAp0Kwt98PVDXNb5pIDe9novcx4mpUba+HYFsXJhKPsVQylyf
         2FGGdDn34uITQ==
Message-ID: <88a49ed7-8132-3212-1f7a-9378eb640d68@denx.de>
Date:   Wed, 2 Aug 2023 14:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To:     neil.armstrong@linaro.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
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
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
 <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
 <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
 <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/2/23 10:39, neil.armstrong@linaro.org wrote:
> Hi Marek,

Hi,

> On 13/07/2023 20:28, Marek Vasut wrote:
> 
> <snip>
> 
>>>>
>>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by 
>>>> DSIM.
>>>>
>>>> Maybe there is a need for new set of flags which differentiate 
>>>> between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>>
>>>
>>> No, the section of the MIPI DSI spec I posted below clearly states 
>>> there are two options:
>>>
>>> 1) send blanking packets during those periods
>>> 2) transition to LP11 during those periods
>>>
>>> There is no 3rd option in the spec of not doing both like what you 
>>> are suggesting. So DSIM should also be only transitioning to LP11 
>>> during those periods if its not sending the blanking packets with 
>>> those flags set.
>>>
>>> So, there is no need for any new set of flags to differentiate.
>>>
>>> The flags and their interpretation is correct in MSM driver. I cannot 
>>> comment on what exactly DSIM does with those flags.
>>
>> How do you explain the comment in include/drm/drm_mipi_dsi.h:
>>
>> 128 /* disable hback-porch area */
>> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)
> 
> Can you specify how you determined those flags were needed on DSIM ? a 
> vendor tree ? a datasheet ?

The following upstream commit:

996e1defca344 ("drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags")

> In the meantime, we should revert this patch because it regresses some Qcom
> based platforms until we figure out what's missing to make DSIM based 
> boards
> happy.
> 
> I'll send a revert change afterwards.

That change would break existing use case on i.MX8M then, I disagree 
with that revert.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB1476CDEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 15:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjHBNIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 09:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjHBNIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 09:08:46 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27D42695
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 06:08:44 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso63493605e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690981723; x=1691586523;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gKqfx6Ptiw0IBGAk/3SH2zWXJ1w9LfF+qPC02xaE30=;
        b=P/EWJoARx3LF+9GRRrMNDO5ED5UI+uBEVUm/4dN9aG/einEUFd3LJPgFt6J1yY2A1R
         21KN7UiekIiFUxocGJ8aX0bfEzvP+bqAXKZMQrugVgu/2m0dOnBnEi9W4G4tTSFDjbej
         Kqjcm94Qs3QYQRvgvW01wYn9ySkuBCm9qoeycc5TMTPfSQdF8XoR64AhaR5z6r/9GLxb
         qJ9jFJN7CKIaYSOcUJfopvQsXpgDVrOM3UAb2mYBwt52S6bQQQ4ZgN15T1L3mBCN23Ku
         JAQA8XjpaVIKQiPRj66vCrsRfOQQf0RoT2vsnLeWMI8dwfynmRG00J3d6tgnuig29I9C
         SKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690981723; x=1691586523;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gKqfx6Ptiw0IBGAk/3SH2zWXJ1w9LfF+qPC02xaE30=;
        b=BTnof/2TgwKeGLM70PITa+Q9ZKUJkoFJ+UlNe+amUsSU0OYp6e6Kdoe7gmJirrs3ST
         yNQ3kN3E1Ky1/Xiaq9S5Pp4MJ6MKS9KD5wYXvAwuLbCH89X9WnNQLLofhEdWjxxzFZox
         wzqncNTMQDfydTztzCkdPUp+Y81UGTkLdaHm4/dfQlpcppHPuw3DpaROyYbs7oOH4TGz
         SW1QTv4PElDsC4A34xzNb5XT9npSs6P+SMInDAoPXQG3SUksDlu9apVGQpFvxbDlsUWV
         Hgc330+M+iXMsrH/HBqD+ECPXpbfd2H+1gl0ygOqg+mZfgQyl6Et+qLXhhJYnEy/LakV
         GTQg==
X-Gm-Message-State: ABy/qLY3UYVJZVfmUpm9eYXYa+mptNCytpRyNsR1C16o/vXBQCgyLZAp
        C3QSkjmMOnyKmTHlsezk29Bv5g==
X-Google-Smtp-Source: APBJJlG8sr5jUWBVjL3BRFAbmn29x9oHMrYNBecenH9BIKBdXscxcFgCB56BCi9tNLKpz3rMG31rBg==
X-Received: by 2002:adf:face:0:b0:313:f07b:801f with SMTP id a14-20020adfface000000b00313f07b801fmr4563714wrs.44.1690981722963;
        Wed, 02 Aug 2023 06:08:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196? ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b00313f031876esm19063623wro.43.2023.08.02.06.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 06:08:42 -0700 (PDT)
Message-ID: <d4b778f6-35b6-fc1b-014d-eaa9b3b900a4@linaro.org>
Date:   Wed, 2 Aug 2023 15:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
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
 <88a49ed7-8132-3212-1f7a-9378eb640d68@denx.de>
Organization: Linaro Developer Services
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
In-Reply-To: <88a49ed7-8132-3212-1f7a-9378eb640d68@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marek,

On 02/08/2023 14:25, Marek Vasut wrote:
> On 8/2/23 10:39, neil.armstrong@linaro.org wrote:
>> Hi Marek,
> 
> Hi,
> 
>> On 13/07/2023 20:28, Marek Vasut wrote:
>>
>> <snip>
>>
>>>>>
>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
>>>>>
>>>>> Maybe there is a need for new set of flags which differentiate between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>>>
>>>>
>>>> No, the section of the MIPI DSI spec I posted below clearly states there are two options:
>>>>
>>>> 1) send blanking packets during those periods
>>>> 2) transition to LP11 during those periods
>>>>
>>>> There is no 3rd option in the spec of not doing both like what you are suggesting. So DSIM should also be only transitioning to LP11 during those periods if its not sending the blanking packets with those flags set.
>>>>
>>>> So, there is no need for any new set of flags to differentiate.
>>>>
>>>> The flags and their interpretation is correct in MSM driver. I cannot comment on what exactly DSIM does with those flags.
>>>
>>> How do you explain the comment in include/drm/drm_mipi_dsi.h:
>>>
>>> 128 /* disable hback-porch area */
>>> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)
>>
>> Can you specify how you determined those flags were needed on DSIM ? a vendor tree ? a datasheet ?
> 
> The following upstream commit:
> 
> 996e1defca344 ("drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags")
> 
>> In the meantime, we should revert this patch because it regresses some Qcom
>> based platforms until we figure out what's missing to make DSIM based boards
>> happy.
>>
>> I'll send a revert change afterwards.
> 
> That change would break existing use case on i.MX8M then, I disagree with that revert.

As I understand the timeline is :

- 996e1defca344 was merged in v6.2-rc2 and caused regression on NXP platforms

- 8ddce13ae696 was merged in v6.5-rc1 to fix that but caused regression on QCOM platforms

Did I miss something ?

I don't know how to handle this apart reverting 8ddce13ae696 and trying to find a proper fix that doesn't regress QCOM.

So, The main issue is around the real meaning of the IPI_DSI_MODE_VIDEO_NO_* flags,
Exynos DRM removed the HSA, HBP and HFP packets, Qcom DSI moves the DSI lanes
state to LP-11 during the period.

The behavior is significantly different and the naming doesn't suggest any
correct behavior.

The only solution is to find out why :
- On Qcom platforms, having the HSA, HBP and HFP periods is OK, but not on DSIM
- On DSIM, removing the HSA, HBP and HFP periods is fine
- What's the exact requirement of the lt9611 bridge concerning those periods

Neil

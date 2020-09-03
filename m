Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9157025CC62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 23:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgICVfp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 17:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbgICVfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 17:35:42 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE2EC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 14:35:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d2so2763010lfj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GUH01GJNkmpwTNEIiIANzztrhMZxBNiHJsVHosSJw60=;
        b=xilnljvqFDpmSPO7l1ELp/Jm5nmMQwd1TkOJ7L3JEMiGA7IDiu00rg+reLDgD957OI
         xmUjxjbJLGdKix8NAvjYImA0zcCJYxFoJYERvmyQLjLpdGEwd7KjVWcaM8RlB00wE4G/
         GeFu6Xg46II2/Rsiu4knTm8jA6CuQRSkTLvH2ZP6KBOWv/HEzJ7F2XkaIy+My3I0b1CN
         AHwE7vJts1qTqQ2CCDuttwCF/cSQuzzN1quZUqd5qF0Bfk+tPZQebdrorqkY4+3dJxVp
         DmR/+PKGc2Vtasu0nyXXkuhvxRSSCfe4EE3bVbpuv3H4d7xUesZ64w3Vi19/Zt09hTM/
         kfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GUH01GJNkmpwTNEIiIANzztrhMZxBNiHJsVHosSJw60=;
        b=lQg4l1RB6lr2KdyGUhEtWKPI08lZrqbZ6TxgwICpuVd10JyNbe/eeRJFuiCaPDgYGR
         FXkgiUblD9++5RA9Z0PUI2J4iZNE/A2S/mcgveGLp5lpPNqpBAJgkLwT6Cp5SFVqWef4
         WF14f/uSRd4aEZ0IEE+xn28bHfEyIeZ8rIHSwm4duBD3vOML704g2wW0/+DrAt6ASw3R
         LCG0bho5kAVr3pk5fHM/Mh1JlT5JHrZyTwlom6qYrj4aK9wThQINu302z8/LjpEvJyXS
         UyWnTc0N/xqIEGjEvMf+E0uI9Ej2Fk9X3IWLMvxmnU8vP5tVC2qUOUHMN5lQQ6d1eTql
         a2zA==
X-Gm-Message-State: AOAM532TtcBKZPy6W0yZ50p5kS0UpT/hnMqp1io3gEW/GR2OQAZAxZB/
        DQwHh7gBQHZNAZtEXCg0ME/8uQ==
X-Google-Smtp-Source: ABdhPJy0DYnbKhmQ3wGnHKtvvvj4uDhDngU9agy7/YR+ke7YffxvHO0hgzBVYox29/nY7e2c3ynsEA==
X-Received: by 2002:ac2:4e82:: with SMTP id o2mr2344640lfr.170.1599168940730;
        Thu, 03 Sep 2020 14:35:40 -0700 (PDT)
Received: from [192.168.43.7] ([94.25.229.50])
        by smtp.gmail.com with ESMTPSA id h13sm839636lji.134.2020.09.03.14.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 14:35:40 -0700 (PDT)
Subject: Re: [PATCH v1 6/9] phy: qcom-qmp: Add support for DP in USB3+DP combo
 phy
To:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20200826024711.220080-1-swboyd@chromium.org>
 <20200826024711.220080-7-swboyd@chromium.org>
 <335a0660-40e1-0c1e-3f7d-87f7024de18a@linaro.org>
 <159900847014.334488.14041376759905055412@swboyd.mtv.corp.google.com>
 <62bdac87-b886-58c1-f071-095ec9945f68@linaro.org>
 <4165cdc6-dfa6-1ff2-f317-753292a068c2@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fb16b8f9-91c4-8844-3a4a-55de3901490c@linaro.org>
Date:   Fri, 4 Sep 2020 00:35:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4165cdc6-dfa6-1ff2-f317-753292a068c2@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/09/2020 15:41, Jonathan Marek wrote:
> On 9/3/20 8:37 AM, Dmitry Baryshkov wrote:
>> On 02/09/2020 04:01, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2020-09-01 06:36:34)
>>>> With these functions I'm struggling between introducing
>>>> PHY_TYPE_DP_V3/V4 and introducing callbacks into qmp_phy_cfg. What 
>>>> would
>>>> you prefer?
>>>>
>>>> What about the following struct?
>>>>
>>>> struct qmp_phy_dp_opts {
>>>>          void (*dp_aux_init)(struct qmp_phy *qphy);
>>>>          void (*dp_configure_tx)(struct qmp_phy *qphy);
>>>>          void (*dp_configure_lanes)(struct qmp_phy *qphy);
>>>> };
>>>>
>>>> I'm not sure about dp_calibrate().
>>>>
>>>
>>> Is there v4 code somewhere that I can see? Another level of indirection
>>> is always a solution, so it is probably fine. This driver is currently
>>> written with many conditionals instead of function tables so I'm not
>>> sure it fits in with the style of how things are done though. The
>>> alternative is to use an enum and call different functions?
>>
>> Downstream DP driver sources can be found here:
>> https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/dp/dp_catalog_v420.c?h=LA.UM.8.12.r1-13900-sm8250.0 
>>
>>
>> https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/pll/dp_pll_7nm_util.c?h=LA.UM.8.12.r1-13900-sm8250.0 
>>
>>
>>>
>>> The calibrate call is there to "turn the crank" on the aux settings.  I
>>> need to cycle through the different values for that aux register so that
>>> aux can be tuned properly. The AUX channel really has another phy that
>>> needs tuning so we're sort of combining the aux and DP link phy together
>>> here by letting the calibrate call tune the AUX phy and the configure
>>> call tune the DP phy. I don't see any sort of concept of an AUX phy
>>> though so this seemed ok. Does v4 need to tune more registers?
>>
>>
>> It looks like four values are written to AUX_CFG1:
>> 0x20, 0x13, 0x23, 0x1d
>>
> 
> AFAICT, it only writes 0x13 to AUX_CFG1, in dp_pll_7nm_util.c, and the 
> qcom,aux-cfg1-settings in dts only has 0x13. Same for all other 
> AUX_CFGn, which only have one value written. Am I missing something?

Firmware sources.


-- 
With best wishes
Dmitry

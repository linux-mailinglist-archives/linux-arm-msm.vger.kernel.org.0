Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9393B3D5DFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 17:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhGZPEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235997AbhGZPEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 11:04:30 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAFFC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 08:44:59 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id r18so12433819iot.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pbRvFeE3V8H7xDoGykMRI3aEDOBUlE9euyeCQx8JWcU=;
        b=ZLPTBrBaqdFweht2hYWT414CbI1wA994+4yGI5mDqtyzYoYttzxRJOUkULAtmnvu0S
         sQAQ85ltSEVq94oC4e7vInWp4wFALfZ0AB2EXpL89NR2eEEzXBcJJ4QVVCS8IfpIlvji
         ABHdaebki48MiXLSArnt77v6H9NhzXaeVqgrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pbRvFeE3V8H7xDoGykMRI3aEDOBUlE9euyeCQx8JWcU=;
        b=sygCJooDeYqrtguyHP0LxpIzG6COXl/6T2JeFmFfpYE+y4FEDLj8kMkqiaz0WzcMb9
         vtY/qcihaRkvXe/bN4Dv2mPKuP6b2s1Qni8MqW6k7S8shCbt/XAPVUpX2NZZeJNQBW3m
         96DoULFWVugE7zzlrPEsdZbw09m7Kk6hQGB3yHcheXuSH5JD7mawjnRcrEdFKfvCSCEK
         EOuw2QpOVXC5CeMP03Ft8ihE6G/TOy+N0knndk4Ut5DaVej2P1Zz1ZJ7rQNIaEhCSYWM
         IQ1U5F5ZjY8H5BahHLvOK9ERwJUR0c3ZRD95ksIJTdR8yUejc6niN48m+XVzKt5zPWYi
         iv4Q==
X-Gm-Message-State: AOAM5339V95AoIsR1c40cGAbjCHYS50T5hhg6prG1ki95a6ozriF5bm5
        UgRMjNjtrCVuANG+zRUrNaq0iA==
X-Google-Smtp-Source: ABdhPJwbAAipgxvf4CJ2zY0+vEwMgJvuywJpYy7Riel+0d9+gmasyJdYUyXwDFsmxESgFmkuj7qepQ==
X-Received: by 2002:a6b:c90f:: with SMTP id z15mr14867286iof.183.1627314298767;
        Mon, 26 Jul 2021 08:44:58 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id i4sm122034iom.21.2021.07.26.08.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 08:44:58 -0700 (PDT)
Subject: Re: [PATCH net-next 0/3] arm64: dts: qcom: DTS updates
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, davem@davemloft.net,
        kuba@kernel.org
Cc:     Alex Elder <elder@linaro.org>, agross@kernel.org,
        robh+dt@kernel.org, evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210719212456.3176086-1-elder@linaro.org>
 <162679080524.18101.16626774349145809936.git-patchwork-notify@kernel.org>
 <YPby3eJmDmNlESC8@yoga>
From:   Alex Elder <elder@ieee.org>
Message-ID: <01beb264-0f25-fb50-29fc-15b6941de422@ieee.org>
Date:   Mon, 26 Jul 2021 10:44:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPby3eJmDmNlESC8@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/20/21 10:59 AM, Bjorn Andersson wrote:
> On Tue 20 Jul 09:20 CDT 2021, patchwork-bot+netdevbpf@kernel.org wrote:
> 
>> Hello:
>>
>> This series was applied to netdev/net-next.git (refs/heads/master):
>>
> 
> David, Jakub, can you please revert/drop the two "arm64: dts" patches
> from the net-next tree?

David, I intended for this series to go through the Qualcomm repository
rather than net-next, to avoid any conflicts with other updates to the
affected DTS file.  The only indication I made was by having you and
Jakub in the "Cc" list rather than "To" list; in the future I will be
more obvious in the cover page.

Would you please revert the entire merge, so that these commits can
go through the Qualcomm repository?  These are the commits (in order):
   6a0eb6c9d9341 dt-bindings: net: qcom,ipa: make imem interconnect optional
   f8bd3c82bf7d7 arm64: dts: qcom: sc7280: add IPA information
   fd0f72c34bd96 arm64: dts: qcom: sc7180: define ipa_fw_mem node
   b79c6fba6cd7c Merge branch 'qcom-dts-updates'

If there is another way you think this should be handled, please
explain.  Thanks.

					-Alex


> 
> DTS patches are generally merged through the qcom and ultimately soc
> tree and I have a number of patches queued up in both sc7180 and sc7280
> that will cause merge conflicts down the road, so I would prefer to pick
> these up as well.
> 
> Regards,
> Bjorn
> 
>> On Mon, 19 Jul 2021 16:24:53 -0500 you wrote:
>>> This series updates some IPA-related DT nodes.
>>>
>>> Newer versions of IPA do not require an interconnect between IPA
>>> and SoC internal memory.  The first patch updates the DT binding
>>> to reflect this.
>>>
>>> The second patch adds IPA information to "sc7280.dtsi", using only
>>> two interconnects.  It includes the definition of the reserved
>>> memory area used to hold IPA firmware.
>>>
>>> [...]
>>
>> Here is the summary with links:
>>    - [net-next,1/3] dt-bindings: net: qcom,ipa: make imem interconnect optional
>>      https://git.kernel.org/netdev/net-next/c/6a0eb6c9d934
>>    - [net-next,2/3] arm64: dts: qcom: sc7280: add IPA information
>>      https://git.kernel.org/netdev/net-next/c/f8bd3c82bf7d
>>    - [net-next,3/3] arm64: dts: qcom: sc7180: define ipa_fw_mem node
>>      https://git.kernel.org/netdev/net-next/c/fd0f72c34bd9
>>
>> You are awesome, thank you!
>> --
>> Deet-doot-dot, I am a bot.
>> https://korg.docs.kernel.org/patchwork/pwbot.html
>>
>>


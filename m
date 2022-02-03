Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3AB4A8309
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 12:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350136AbiBCLW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 06:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240602AbiBCLW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 06:22:27 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6312FC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 03:22:26 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id k9so2232490qvv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VFgYrjPaXbaCyhiJtjuKM14hRfwmOgSRClt+H9UQLmM=;
        b=Rs0L00p9DTqKBRCpB5LQwSRqcoStwt4JefJjetRROuDj99tI4OJD14ySouAxTzRCx5
         hiUmfmcqoEW5sXcI/8d2+lekHOzMEoHAkXfT/ePaorxBq+3tiO0cCvl+4PQ5QwOt/vlG
         D1MYEkgg5VEzuZQPUPss1HOxHTTUsNvAQV4lKgp8aSczf8qiLNe6bjKrx6vZjIlSyA4a
         l6OPGgpIvAurUPA+yfMIeH4jquVSnVRkAvoy66PJMFvLyOyPS72ouOo+gQHk81V0hIqN
         pS5JY6xaVH2H0fbZkbSMUW3j+LCt5hWMrpeY7KqNIOGOHVPPgsJz5ihI+tSAmlhQnpvJ
         K0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VFgYrjPaXbaCyhiJtjuKM14hRfwmOgSRClt+H9UQLmM=;
        b=bA9WFULTeTKcJzUVMIDqUQJ4yhw0kSI2RXwvDAB9m8q6tK90PRu4MG02LjTbKdh+TW
         EPygW/SE2DgCxWWgpfN/myCpkkf5mkW2MTmJllD1ManTUvwxn4VQJnPXu0yPkXGSENj1
         q89bDeiMG1Sffguu+reecEh+qeukQQ8PmOwnd4tQyytMSe3UXWO/AWuOjFNLU+dqP0z+
         iNXEU+8JzdjMDANDiPin+oAp3wY8gh5nwaqxO/qWoXbFsXJ3APGxBoMzblEL7y6t4rjL
         uOxI7sXU9iS1Id0MgTgnrL9YVzA4vEMnBR0gOwR0hxDQ+SKM+6jbLjUV470L38EYIw2z
         ItOw==
X-Gm-Message-State: AOAM531WCvMejlKRd8k6PqQkZC3a5kfq7lm9tkY167r7SRRftjO/LdY2
        U5YYipZJQtWzHleF2Ambjlqbyg==
X-Google-Smtp-Source: ABdhPJzKYiRB01G1IrJ36Wu5AeAMpjN8WUwgRuzoB5Tjgwh1/Ur32+CaEBwWaGPCMhSAfOe37748/g==
X-Received: by 2002:ad4:5969:: with SMTP id eq9mr30207343qvb.93.1643887345503;
        Thu, 03 Feb 2022 03:22:25 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id c14sm12586791qtc.31.2022.02.03.03.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 03:22:24 -0800 (PST)
Message-ID: <6d303dbb-bdbc-bac1-526d-be593f329d23@linaro.org>
Date:   Thu, 3 Feb 2022 05:22:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH net 2/2] net: ipa: request IPA register values be retained
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220201140412.467233-1-elder@linaro.org>
 <20220201140412.467233-3-elder@linaro.org>
 <20220202210248.6e3f92ef@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220202210248.6e3f92ef@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/2/22 11:02 PM, Jakub Kicinski wrote:
> On Tue,  1 Feb 2022 08:04:12 -0600 Alex Elder wrote:
>> Fixes: 2775cbc5afeb6 ("net: ipa: rename "ipa_clock.c"")
> 
> The Fixes tag should point at the place the code was introduced,
> even if it moved or otherwise the patch won't apply as far back.

The problem was not "activated" until this commit:
   1aac309d32075 net: ipa: use autosuspend


And that commit was merged together in a series that
included the one I mentioned above:
   2775cbc5afeb6 net: ipa: rename "ipa_clock.c"

The rename commit is two commits after "use autosuspend".

The merge commit was:
   863434886497d Merge branch 'ipa-autosuspend'


Until autosuspend is enabled, this new code is
completely unnecessary, so back-porting it beyond
that is pointless.  I supplied the commit in the
"Fixes" tag because I thought it would be close
to equivalent and would avoid some trouble back-porting.

Perhaps the "use autosuspend" commit is the one that
should be in the "Fixes" tag, but I don't believe it
should be back-ported any further than that.

Re-spinning the series to fix the tag is trivial, but
before I do that, can you tell me which commit you
recommend I use in the "Fixes" tag?

The original commit that introduced the microcontroller
code (and also included the clock/power code) is:
   a646d6ec90983 soc: qcom: ipa: modem and microcontroller

Thanks.

					-Alex

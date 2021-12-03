Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DEC467A36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 16:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245353AbhLCPas (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 10:30:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245140AbhLCPas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 10:30:48 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DFBC061751
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 07:27:23 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso5140185wmr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Dec 2021 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+/WsUz2NTIgYD+0d+sIqCIUoU6+JU4Z8FYQ1kybTzX4=;
        b=krS4Kv9VlHaHrmYsa7ufkpHVjItqqFKwaj6kYw5aV7Jo1OJuKnQtvDrCGS2MlXWNOT
         UUGe+bzL98777Ddv0kXFvU2z61ZFH8N5KfRfG4uaKG0hWYtZUr3oArkrR53R0XHu9POv
         lqOdAvZxyhVT/svsBvrBAw8OoJhdm9Ahx+UCVi1Rll2kW4pFAGf6IbTid0EVkdm3sODN
         ioi7kWVcXQ7KIE3apRQwsSwOsycIV5sQanVFqcI3PD3hf1XtYj7HcFOT4EOlfPMWefB3
         Uk3QFTc2ST+Vjfp+0TPx6NgiJl13YK7GjjNDAkuEalSP2bHhbhL38XsGOGMjZQFcmAWB
         WORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+/WsUz2NTIgYD+0d+sIqCIUoU6+JU4Z8FYQ1kybTzX4=;
        b=0osSgf9+qwwtWAOELHmZ3Ex+0kqy87/QTd0esVhZcPqVB3UeuAAkhjO9fKldZOYA82
         RsUgxpEgvNKehBSjbwr9qjynqt7uxT/77VPsVmGcwpwHBeRgmXi/tmszhCOZ0NNx3sjK
         MbRB7dS7sZDVOJ5BslVwEZAHnCNDb9H2u2q1gl0Ty5u87xUWthtfwVK6pNHea8BnPO8r
         vahi9WRRtyd60a/iUObvLen2hXqVPtrJNGqOWJC+jGc5Ey6B9upow/ov/2mK5Kv81ABC
         q/LK5EJfq5Ee9fHBFtKjJIcARYYy0qFPyOv783TLz408q17ldoL+F772XfOGmFqxWFg5
         4MZA==
X-Gm-Message-State: AOAM530Zs283hzxT4RAbe6j2IgplD44kinh+EM1IBsdlcIvULefx4LtU
        leObFNHGo/zUWU2ZKetc0QHIkw==
X-Google-Smtp-Source: ABdhPJzZndjAR05NjRsNKVtozMTDOwXN05e0sTIFj1OKkNnYpcltMY5p9KkMLuUvnX3IhzBu19oRYg==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr15558639wmf.185.1638545242530;
        Fri, 03 Dec 2021 07:27:22 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id n32sm6264740wms.1.2021.12.03.07.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 07:27:22 -0800 (PST)
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
 <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
 <YaorZnQTwvXo6vrO@gerhold.net>
 <5c6607cc-ad2a-6f90-e087-78ef3bd39e80@linaro.org>
 <YaozGfiaL2RjeY9W@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <36c175c5-7c6a-5271-0330-c4320ddbfb50@linaro.org>
Date:   Fri, 3 Dec 2021 15:27:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaozGfiaL2RjeY9W@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2021 15:09, Stephan Gerhold wrote:
>>>>> +	add_ops = device_get_match_data(&pdev->dev);
>>>>> +	if (!add_ops)
>>>>> +		return -EINVAL;
>>>> We will never hit the error case here because without a match we can not
>>>> even enter the probe function.
>>>>
>>> Theoretically it's possible to create platform devices through other
>>> ways than the device tree (think of old board C files for example).
>>> I agree that nobody should do that, but having this check here
>>> at least avoids a NULL pointer dereference in this unlikely scenario.
>>>
>>> Please let me know if I should remove it anyway, that's fine for me!
>> TBH, I don't have very strong opinion on this.
>>
> Great, can I assume your Reviewed-by: applies without any changes then?

yes sure.

--srini

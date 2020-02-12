Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D6615A81B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 12:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgBLLnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 06:43:43 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40461 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBLLnn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 06:43:43 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so1945209wmi.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 03:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KOvpD7jZ6dU2lykqqwZ1WffWjcj24MrFs0WAUYdtKH4=;
        b=lDfQr6Liipb++iFWX6iJLPM9MLax/98YrjUMx2NSCP8nRQEJxYPjeazAW44phauv1J
         zDMSgxErIqX4lltTO8KyGkxULwpxH6e9bJjady6qCsW+AebfdzEjQF+Mcss/P6lo3+OS
         FF91PfU0aV/URWm4wh3GjSVnh613RzCiGx7tWGzzdRYi6ewXTPYxFjEv1efuDc7Jqwge
         zn5xpPgaLdj2zpQqUiy9CKCUKgX907JZl8MXHgLWLPzbAIeBDfLt3go9I+tWL4EHPVdP
         006LMBAjbJpqTAWatWWABjuhtYLmX8EQ7svmcDYwPWKzjX5P+6qeN/fAarriHxmM6Zfn
         q7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KOvpD7jZ6dU2lykqqwZ1WffWjcj24MrFs0WAUYdtKH4=;
        b=KyPhRufX9t1wp3uEjaRtZs4QPoeGA/W6DB2fPLZ07sdj8/LvGL6C5bytQX6YSpiEUL
         x5NRZlJCOwU4YtrQssswWSX/yGc/WSexX8Zbsv396uNn2oxFPKuXCk3Do9BgSri2OjiR
         bAnNjomGuRaA4v8NwGQ7HW8RcQ0BPcl+ePFUq5tcJZWesJRfUzodp3ElfWwdI52Nehzh
         Qvdcaf/9/7h3D8TWVfMRNaCn2K6Q6PC6hG0Jj1RauvTwiW6NpgtFyAuZe54uM+w7WQWW
         xcJnjBVJ6zPlVah6CeiXQXHZfruKFDr0cRsYwZCo12PBsi7bfdMUEAoV7j+VIIhhAEpZ
         ztsw==
X-Gm-Message-State: APjAAAVtJYP+adQ8WXfBT9C/Y57SlOZI83sbDQeHM/LHmc7ONEtueGGw
        8C1goTjVr2t3ro/ayygw3eyYM9WNi2k=
X-Google-Smtp-Source: APXvYqzE17zeWea41ReY8EYtUfOouJpQCc5O05qfY1oQPGPCmX9DhPfP9NiRKKy53KgUTk1hUJxU6A==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr11846557wmg.167.1581507821024;
        Wed, 12 Feb 2020 03:43:41 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id q130sm473499wme.19.2020.02.12.03.43.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 03:43:38 -0800 (PST)
Subject: Re: [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
 documentation
To:     Adam Serbinski <adam@serbinski.com>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-7-adam@serbinski.com>
 <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
 <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b5c1328a-e3ca-826d-9ff0-f2bbce24ac22@linaro.org>
Date:   Wed, 12 Feb 2020 11:43:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/02/2020 11:01, Adam Serbinski wrote:
>>>
>>> +
>>> + - qcom,pcm-slot-mapping
>>> +    Usage: required for pcm interface
>>
>> Are these not specific to 8k and 16k mode ?
>> We should probably list values for both modes here.
> 
> No, this is just the offset that the audio sample is placed in with 
> respect to a maximum of 4 slots, 16 bits wide, beginning with the sync 
> pulse.


That's not true atleast by the QDSP documentation,
according to it we will use more slots to transfer at higher sample 
rate. ex:
16 kHz data can be transferred using 8 kHz samples in two
slots.

Also there are 32 slots for each of 4 supported channels for PCM AFE port.


> 
> When switching between 8 and 16k sample rate, it is just the sync pulse 
> rate that is changed. The audio sample will be delivered in the same 
> slot, just at a different frequency.

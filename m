Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B0E294C1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 14:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439880AbgJUMBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 08:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404943AbgJUMBA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 08:01:00 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B5DC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 05:00:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d78so1797764wmd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2fJBIpEa92kQMJ5/9beWt+N555m7+v1D1vPnkJrcT60=;
        b=SenAqoqlLi2aW37fpwhuD9srFzhLzrEbBnol9BebPsYEEI+KDFkpx8T7/egwqBcrXA
         VKXMHj3+b41FIQ4eI7Myj0Na0a6bAyVKcAbDSlj32qMfgAeqpfHG++isqgO4Ii89gzJ4
         JdpTeaZZGUhg4QPD0sGFy9Z/DF5jWisVimMRkRKV/T6oPAt4/20N1owP7yvOCZriHz6X
         MlMQSoxh+Jwwv/iMBlIRdYWmeReU1RJKhiIFKPGCzvTcp2zrd+oHDfQmGvVCJFr7YPR+
         vQuoHN7O+rf4SXzK+HkSZwxDxt11IINm8k11O5XS/rsp4h9RtxIkDu8YGDJoy3daSq3j
         kHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2fJBIpEa92kQMJ5/9beWt+N555m7+v1D1vPnkJrcT60=;
        b=bg6qXldYjQcfrulOOBEp+eswf37HWYoIGCSKrCKIIw2no3b8VGjDSSMKq44bTseXdF
         TOW9MB/MAH7Y6oVO9wSvzkYoKQ5XzT5M/sdjYm5rYIYDoAWlPkO8H66sguQXp8VlSQ+G
         bm9on+emSTzDHMwPvt4J1ZN7KFeHy3qi8EdtXiVLvSTEIbQuVZ7lQTuHG8EgTdmLbQ5s
         GPyRukJM66DSm1j4frPw1MwsInSLdEncopCQq/EMxwQZ4RQKj3ja6POx2IZIlabieMsG
         kn0aPE4bSrj5TtK9oFP1RuIlmo1Y+cVX5yCGUlav1/69t+KaXVPy2HbdjHCB20fO+7Fw
         OPwQ==
X-Gm-Message-State: AOAM5328EHM0ypvC7IuQxmKEP7zTzYIsBrPkwp+muAplfDrAUlgQ7DDD
        2QEbJ4E+46HunlzxFHpz7hAsIA==
X-Google-Smtp-Source: ABdhPJyBuNQJw//BB7VhJ/IyfJhB0D0zjEufDlMEYNH8dKwZxjKPNA+bODFYfmYhr9qj+l9595JgRg==
X-Received: by 2002:a05:600c:d3:: with SMTP id u19mr3261018wmm.150.1603281657485;
        Wed, 21 Oct 2020 05:00:57 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id h16sm3896356wre.87.2020.10.21.05.00.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 05:00:56 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To:     Cheng-yi Chiang <cychiang@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
Date:   Wed, 21 Oct 2020 13:00:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/10/2020 19:54, Cheng-yi Chiang wrote:
>> Not with the compatible string!
>>
>> Currently card name, and long name are exactly same in all Qualcomm
>> soundcards, which makes it very difficult to identify how those boards
>> re wired up at UCM2 level. So the plan is to properly populate card long
>> name with "model" property which can include details on how things are
>> wiredup on that board.
>>
>> --srini
> Hi Srini,
> Thanks for taking a look.
> Let me try to clarify your comments in case there is any misunderstanding.
> 
> I understand your request on having different board variations using
> different sound card names through model property, and I totally agree
> with that.
> As for compatible strings, do you insist on having all the board
> variations using exactly the same compatible string ?


For example if we set below property for sound card in Device tree
model = "RB5";

We will end up with

#   cat /proc/asound/cards
  0 [RB5            ]: RB5 - RB5
                       RB5

This is totally not very useful w.r.t UCM2 and makes it very difficult 
to common up parts of the configs.


My suggestions are.
1. set card->driver_name to something more sensible in your sound card 
driver.

ex:
	card->driver_name = "SM8250";

2. set long name in model DT property and set it as card long name
ex:
in DT:
	model = "Qualcomm-RB5-WSA8815-Speakers-DMIC0";

in sound driver or common.c:

of_property_read_string_index(np, "model", 0, &card->long_name);

With this set:

now
#   cat /proc/asound/cards
  0 [QualcommRB5WSA8]: SM8250 - Qualcomm-RB5-WSA8815-Speakers-D
                       Qualcomm-RB5-WSA8815-Speakers-DMIC0

This also means that in UCM2 we can have a top level SM8250 directory 
which can contain other board variants something like:

ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf
ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8810-Speakers-DMIC123.conf
and so on!

Finally Only comment I had regarding compatible was not to encapsulate 
the connection details in it!. these can be made more sensible, 
something like
"qcom,sc7180-trogdor-v1", "qcom,sc7180-trogdor-v2".. and so on.

This compatible has nothing to do with driver or card short and long name.

Does that makes sense?


Thanks,
srini


with




Currently if

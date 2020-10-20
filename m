Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C074293F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 16:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731470AbgJTOzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 10:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgJTOzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 10:55:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27817C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 07:55:49 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d81so2106005wmc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uf/L+N0SXiT5GxWzSMpW76s8MjBMaRe3gnVIlCSIR5M=;
        b=cK9G7+OH/TUQCyR8rfJv0QoQ3SjEQsnF9XCjVN6xqr/O8yU3IlDfbvmsbTfkhxQ06f
         q4IpVZ8VlQ3fVXlWWHGSfLpylD2IH5P4NE25315km3BTplz4wROeM/cLeRnrZhnHb/v5
         PyAaPitLsRWmdVTipbLqX4Out+F21VmQJ/X09y763klLznhk8Wjph5Dm6ltToTwu1GKi
         6cF9SRXzSOe+CnDRgo2LkN4n5tkvfZ7EpQsA7EkHbGt3NkoE1mD/PmAfdxkXt8UbFE9X
         RN1mqjge119zJMoJpTqXMa+rN2apg4iQxVK+dpL4RLHKRIlCnNkTt3EAvl5wmXLl4Uz1
         eT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uf/L+N0SXiT5GxWzSMpW76s8MjBMaRe3gnVIlCSIR5M=;
        b=LQgHi4VVFAdKDQER0OT4kitjkRtse/gY3UFAg9WiAhz4I25N1zIFASKWumHhLvifMw
         +OewHp5Vyp3NoEgiN/c4Z9BugOU/oGTuZT/1Ctkf54A30sddtDmIfO2YmvJ3fE2GRqzK
         qQqMgnzR/Odgbhzka7lzTH+HipSOzpWR3KXe2MfIgUUzg1LgSiQerQW0vW2Ks/MGyMva
         NTXqOyuhdQ+pBThI3t1Ska+tf9qsVZ6kjkfaRs5h+LxnrNYsMgW6YHSNby/oyGwIH1He
         H+gWd4QVHmhgyezyiKWadXXcAcQrPCyN3ZR5RB9P8lXB3FCpIlkGeH+XeJOykGwapB2m
         WN0w==
X-Gm-Message-State: AOAM533A5pbTcGkq2CIMEhEd9zJKT675hd5tliKvn+/iS1nBfMI74hnh
        UEhrhbfpKGXH/ndpE/vYhPaQTw==
X-Google-Smtp-Source: ABdhPJwZTIfXIjPLWWjL97y1NfJTXN0Y2s/to/X10G0kOS41vqvGeaVeSXPhf5OZA0t9DHJLkiPgNg==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr3351776wmj.88.1603205747699;
        Tue, 20 Oct 2020 07:55:47 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 1sm3868599wre.61.2020.10.20.07.55.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 07:55:46 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To:     Mark Brown <broonie@kernel.org>,
        Cheng-yi Chiang <cychiang@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
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
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
Date:   Tue, 20 Oct 2020 15:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201020143711.GC9448@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/10/2020 15:37, Mark Brown wrote:
> I don't understand what "logic scattered in various dtsi files" means,
> sorry.
> 
>> Yes, that should work to describe the dailink we are using.
>> But a more tricky issue is how to do calls like setting PLL in dai startup ops.
> ...
> 
>> I think that asking a generic machine driver to do configuration like
>> this with only a limited interface of device property
>> might be too much of an ask for the machine driver.
> Richard was looking at some basic configuration for PLLs.
> 
>> Would you mind if I simplify the compatible string like Srinivas
>> suggested, and send a v12?
>> As for other two kinds of variations that I am aware of:
>> 1. front mic / rear mic
>> 2. replace alc5682 with adau7002
> The CODEC change is going to be described in the DT no matter what -
> you'll have a reference to the CODEC node but it may make sense if
> there's enough custom code around it.  For front vs rear mic the
> simplest thing would just be to not mention which if this is a hardware
> fixed thing, otherwise a control.
> 
>> We can set different board names and different compatible strings to
>> achieve such variation.
>> So that it would make sense to describe configuration in compatible
>> strings like you suggested, and also provides UCM a way to distinguish
>> different boards.
> I don't recall having suggested distinguishing these things with a
> compatible string, especially not the microphones.  UCM can already use
> the display names for the boards to distinguish things.


Not with the compatible string!

Currently card name, and long name are exactly same in all Qualcomm 
soundcards, which makes it very difficult to identify how those boards 
re wired up at UCM2 level. So the plan is to properly populate card long 
name with "model" property which can include details on how things are 
wiredup on that board.

--srini

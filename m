Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB47295C7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 12:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896398AbgJVKM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 06:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896384AbgJVKM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 06:12:56 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77454C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 03:12:55 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b8so1539885wrn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AVYqBwFNeS8pknHZcG1tJcoDoQAS4sJ1OEwl1v423e8=;
        b=FHx9aWm9FktJEtNY/lWrc3MGLVVQTVRPkaKpE/BrIvI65HE1/l83fZFIYH41tRBW5/
         HKpKCopsEU3q8T3e3RTCblClXa64BkmrSnDKUmEoPNCVOcIgrYGplAj9LWAKZ+88ul3F
         lShjw/BQ54t6I7EfHNGaZ+p78XcoqGFpJD0s1hDHX1X/G8PgJdwsSPIC6OZyB6i5yCqL
         gdjFYC4gh/xNnO8/pYQEZW78XHILWr7IPoR8M97YTNxfst2lz5YZ+orcSJCZTZA7XUgH
         eyA+LqsmkQUZMZWg3e26x9FmT7iYAi3exYSCwVAw2BYim7sgprHx7allxCYqNPMTgCdF
         vp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AVYqBwFNeS8pknHZcG1tJcoDoQAS4sJ1OEwl1v423e8=;
        b=ZFO+cMZ4ks5+JM/64cS2t/6re5bhe7dWBRyGzaCoCSAjQ1BW6IruqZAmnuflUGS/t9
         uejGkKZhepn0Q+E+noiCr5jv7l4DA4QMkwOFWNHN7g8beHmps7y8LPXIzlgxea+ncS59
         ZIyaKslO2yxiu+K5dFwpGPwrLAtXb9xQoKtyN3gxunTbDMLGkG7BXKR4b/ffF2NbdAOk
         tFuXS4Cy5a/BAjjphM5SWdr7vMdUsgWyQOfxnOIPYuy3GaAGp+xFmDsFlxRlfqpsA9hB
         Ri510q2VbMI6uOvi23GWu2fVtLtpaBAveSh6C4vUFOGz8U3S68aK2qVr2LzxRPBNcOIp
         hb9Q==
X-Gm-Message-State: AOAM532G8HvdLx2b2dP7946XVegybw1bQdbV/u+5UDuRYUB5S8F+RHLX
        r2o2Zp1d8o12rp6wXGWKZXEysg==
X-Google-Smtp-Source: ABdhPJynoIRUVGmbBNtiBqCFMZFtDduY5X7CJApEBX+q08WHFZubdBFJCCYOFMWx5UVgG0TeQNEdlA==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr1777892wro.381.1603361574107;
        Thu, 22 Oct 2020 03:12:54 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id j13sm2935385wru.86.2020.10.22.03.12.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 03:12:53 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To:     Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>
Cc:     Cheng-yi Chiang <cychiang@chromium.org>,
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
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
 <20201021123913.GD4497@sirena.org.uk>
 <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <14e7db29-4825-6e9d-22a0-5121bb7006e2@linaro.org>
Date:   Thu, 22 Oct 2020 11:12:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/10/2020 04:29, Tzung-Bi Shih wrote:
> Hi, sorry for jumping into your discussion but I am trying to
> summarize them to make sure we are on the same page.  Pardon me to
> manually copy-and-paste partial sentences to quote.
> 
> ACK:
> - Don't expose DAI connections in compatible strings.
> - Use "model" DT property to make the card more UCM2-friendly.
> - Expose new DT properties to distinguish different DMIC models.
> 
> NACK:
> - All the board variations using exactly the same compatible string.
> => This is less realistic.  Although the CODECS information can be
> retrieved from DT, it is inevitable to have some custom code for each
> CODEC.
> 
> Per Mark's words:
>> a different CODEC is something that often justifies a separate compatible
> I think we should use different compatible strings for new CODECS
> combinations.  And we should try to reuse the machine driver if they
> share the most code.  In the worst case, introduce a new machine
> driver for the new CODECS combinations.
> 
> - Srinivas's suggestion to set driver_name.
> e.g. card->driver_name = "SM8250";
> => This sounds like a new DT property should be parsed in
> sound/soc/qcom/common.c.  For example: "qcom,family"?  But as we do
> less care about UCM2 for now, I would prefer to just leave it as is.
> 
No, you can just hardcode this driver_name in your machine driver rather 
than getting it from DT, this is how everyone does!.
So need of adding anything to common.c

The thing that I suggested to add to common.c is setting card->long_name 
from "model" property.

> 
> I would expect the following variants in DTS (just for example):
> 
> sound {
>    compatible = "qcom,sc7180-trogdor";
Make sure that vendor name is correct here, am not sure if trogdor is 
qcom board or Google own board!

>    model = "sc7180-rt5682-max98357a-1mic";
> }
> 
> sound {
>    compatible = "qcom,sc7180-trogdor";
>    model = "sc7180-rt5682-max98357a-2mic";
>    dmic-gpio = ...
> }
> 
> sound {
>    compatible = "qcom,sc7180-pompom";
>    model = "sc7180-adau7002-max98357a";
> }
> 
> 
> Please correct me if there is any misunderstanding.

Looks good to me!
thanks for doing this!

--srini
> 

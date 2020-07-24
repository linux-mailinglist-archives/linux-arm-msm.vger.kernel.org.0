Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C1022C457
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 13:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgGXLWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 07:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgGXLWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 07:22:36 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6410CC0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 04:22:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f18so7994953wrs.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=j3TiABU4YuyYeNKrOelGmkwg1BeSirg/J0P8Tu+QTf0=;
        b=dkXWHWOOWMb8eHYcmzpjB3sEbqJzwpgXN1Z1yQXFSl91hmPZH/QYYnX+yF6sUVqrsp
         VT/YaS0mAQikyAiLbPv4Una6PBi6aguSKM/RthldXb0+X594+o4sbHxXcXmT+Oe0GK9h
         vO2pglNCt4zr/+n3lPTZtb30iKibnEbva3oBIX+q3XR6zbIifa2FzXLbawQG116bpXvN
         MtOISIP7vHDtWV4OZahSf1AoarVh9dE/B8wIePtstXEkcQMRJwcxKuJH11oPtUiF5FgC
         Uqiw97oolglLdvTCaI1CokjzOMzsDcEUiCY0DG3UliMCvGaKYaqvFrJp3W7QwGYjfhd4
         AdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j3TiABU4YuyYeNKrOelGmkwg1BeSirg/J0P8Tu+QTf0=;
        b=EfLUUR81BcJ0y/Z+2zJa6nXAteGv2dbwqm+IRSmJ0xTMDTYE083fGKjG830Woy11NX
         aU9Y2dr72eGcnppM6+qe91697bvsnn4xgvZsCBqsDa84Csh3VCRuX8brEr9qmes74pPe
         74cspUUy/vcfqH/MuH8ttZrvrLWCFXFYXnbUsjxyiKOUkjtWHrwmzwaCckwKDYbkGPzm
         2sexAV8/A24VOhOOd3Rk1J139Bg77Oyg54xRec6Ks6ZfKEVEHa7a1YwQHF1ySfELiYOT
         6d76KEGjcViowVxu6e85geu9a14zUC2oeQETvBWQY0U11j0jKyW3pAwRHh3rHvNQj/RV
         1yow==
X-Gm-Message-State: AOAM531leEK8RMEu2t5k/Daf3k5lCxiakajoNe29W/mt1e1U3y3mznJv
        EXcf13v6nNNosm1JlwciSzeZUw==
X-Google-Smtp-Source: ABdhPJx+JCHu39HcLo1ayDmJtm5ehJ3SrPKS1CL4dDAtwBX9f1TUc3Ogbt/Vj+aMmITJ4Q1mOcrGUQ==
X-Received: by 2002:adf:f247:: with SMTP id b7mr8705570wrp.128.1595589754114;
        Fri, 24 Jul 2020 04:22:34 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id x204sm11429590wmg.2.2020.07.24.04.22.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2020 04:22:33 -0700 (PDT)
Subject: Re: [PATCH v4 00/12] ASoC: qcom: Add support for SC7180 lpass variant
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d1e6d60b-9f00-266d-74ad-8c18bbf8d142@linaro.org>
Date:   Fri, 24 Jul 2020 12:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/07/2020 11:31, Rohit kumar wrote:
> This patch chain add audio support for SC7180 soc by doing the required
> modification in existing common lpass-cpu/lpass-platform driver.
> This also fixes some concurrency issue.
> 
> Changes since v3:
> 	- Fixed yaml documentation comments and make dt_binding_check issues.
> 	- Moved general fixes out of sc7180 specific patches as suggested by Srinivas.
> 	- Update clock-names to make it same as existing platforms.
> 
> Ajit Pandey (4):
>    ASoC: qcom: Add common array to initialize soc based core clocks
>    ASoC: qcom: lpass-platform: Replace card->dev with component->dev
>    include: dt-bindings: sound: Add sc7180-lpass bindings header
>    ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
> 
> Rohit kumar (8):
>    ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
>    ASoC: qcom: lpass-platform: fix memory leak
>    ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
>    ASoC: qcom: lpass-cpu: fix concurrency issue
>    dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu node
>    ASoC: qcom: lpass-cpu: Use platform_get_resource
>    ASoC: qcom: lpass-platform: Use platform_get_irq
>    dt-bindings: sound: lpass-cpu: Move to yaml format


Tested this on Dragon Board 410c!

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> 
>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  79 --------
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 ++++++++++++++++++
>   include/dt-bindings/sound/sc7180-lpass.h           |  10 +
>   sound/soc/qcom/Kconfig                             |   5 +
>   sound/soc/qcom/Makefile                            |   2 +
>   sound/soc/qcom/lpass-apq8016.c                     |  86 ++++++--
>   sound/soc/qcom/lpass-cpu.c                         | 204 ++++++++++---------
>   sound/soc/qcom/lpass-ipq806x.c                     |  67 +++++++
>   sound/soc/qcom/lpass-lpaif-reg.h                   | 157 ++++++++-------
>   sound/soc/qcom/lpass-platform.c                    | 155 +++++++++++----
>   sound/soc/qcom/lpass-sc7180.c                      | 216 +++++++++++++++++++++
>   sound/soc/qcom/lpass.h                             |  63 +++++-
>   12 files changed, 930 insertions(+), 299 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>   create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
>   create mode 100644 sound/soc/qcom/lpass-sc7180.c
> 

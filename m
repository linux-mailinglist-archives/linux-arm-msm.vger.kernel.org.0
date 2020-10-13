Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5B928CBDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 12:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbgJMKgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 06:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgJMKgh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 06:36:37 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819E5C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 03:36:37 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 13so20438211wmf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CiWCv3BMnudQFt/Kh0EA1mCHFgkrHwPIFYjOeIiiAgM=;
        b=rrHdIIkHJ4RWluKR74GDVBCXZ3fHa+2GckpSDJAnPQr3LIihHVRnyUP0B3Pyy3ZhiX
         8rSJA7CHd4bBwm+paLicw3yVKCUd7p47cqxTVZOMI8KQTToQQIRbcEkKYaCAJv5rCfEc
         1bgA/vc4KEWcOYZ4uNSULZ7vzptJAjV8I6Yt5FQdZdfVDCfUWFaaYLymlxMbvCLnuB5g
         k4Q1OxKAiRD5UMQFq/jNfia58Icqaqxjn9Zw637CxWxICuvMpdldIxOsG31VbTFTfcjx
         fcwjAwQt64YG5s9nbZkfQG7kDKS53uzrSfQJevNyaAgzQJP/OvC7fnfI1m0PztItBYpx
         0bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CiWCv3BMnudQFt/Kh0EA1mCHFgkrHwPIFYjOeIiiAgM=;
        b=ImN7xLzs91GXdbm0VHFg1cc/kvS360AgYVUKaVRC2J2Qr75gcD+xIRhe5Q78eMNdpo
         5umvp2Bsy+cBqlaM+moNdXSKc3s6xHY6H3STDl/uW9m7xMTR2L//2O/Soq2Tbt6dVSa+
         CYrtv+T+S8/Bzlzv+foB36uCreKCMRFvhhwerxvyYM9/wdGj9Z+/eyH8mNji/7B/KZjw
         S9rYIYe/1ik5hUv3N0DcmPtytNYOGRH0QyUYtHGo5m89hncw0qEO2/0wS1Dib5g0T2xU
         OnjgUg2dWt0mkDTMb9dq4qygS7wha7hD/JIJeFmKvr185t9BT+4z3WyNcikuKbL5Sqlw
         FyzQ==
X-Gm-Message-State: AOAM530qjf4nRVhuCCR0X/Zfe6j48Hq/CBZ/a0aPG6bvhAwbIAQSJuwe
        I1l1yiUWCAUFTvj0qn0MwhsfyA==
X-Google-Smtp-Source: ABdhPJxiYcDKpnTqq5SWY21dPvFP7GNAu3f5Em/slUL6EOVBNEG9+t+pGtCNV4M0EgkRnYKNBcGB0w==
X-Received: by 2002:a1c:1905:: with SMTP id 5mr15466149wmz.32.1602585396171;
        Tue, 13 Oct 2020 03:36:36 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id t6sm31809439wre.30.2020.10.13.03.36.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2020 03:36:35 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To:     Cheng-Yi Chiang <cychiang@chromium.org>,
        linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
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
        Srinivasa Rao <srivasam@codeaurora.org>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
Date:   Tue, 13 Oct 2020 11:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200914080619.4178587-3-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Cheng,

Sorry for such late review w.r.t compatibles,

On 14/09/2020 09:06, Cheng-Yi Chiang wrote:
> +---
> +$id:http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar<rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang<cychiang@chromium.org>
> +
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic

This information can come from the dai link description itself, why 
should compatible string have this information?

Can't we have better compatible string with actual board name or use the 
same compatible name as used by other boards?

Can you give us some details on the advantages of doing this way?

Or am I missing something?

AFAIU, you should add proper board name / model name to the compatible 
string rather than describe how its connected. Connection is already 
part of dai link definition.

On the other hand model property can include variant information.
This can also be used to set card long name which will help in UCM2.

The reason I had to bring this up is because the use-space (ucm in this 
case) will not be in a position to differentiate between different board 
variants to select correct mixer controls, so its going to be a pain!


Thanks,
srini

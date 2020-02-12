Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7018115A57E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 11:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgBLJ77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 04:59:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41714 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728715AbgBLJ77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 04:59:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so1419585wrw.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TgdHUqu43QugB+XJry+tdyUlOnTQbDHzldNID7DKlTY=;
        b=vNmQgvcBd+artf/9LPE/bD4l5LGoyC7mcQ8eWEnPD2c9BJ+S0YBX6l6t6NQUVqekRD
         d9eJvrgCNzevsgfSw1LSeTea18i9CBlJTtw+tBATGKp0V3lgO2xdn7YGBdzbQAgMKnhC
         zhHNqxJTFZLTFivI+lAZU6IKyoD6BKFZ/3P0TVsW7WhfahXuS68v+iFlA9BMlNupGZWm
         28B+5W8qtN+alZHPotZySvmBg3gBx6+jAMHZ3ogJXXqCwrTTLfQjGtpbjhrAxaToIxOF
         nHKuTg6/srC6vAcUDSVrFz7wYvbLXCQ3UApDKKEVAeWK+rz70hr7fPyoS3uHqZ8QlRHZ
         fgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TgdHUqu43QugB+XJry+tdyUlOnTQbDHzldNID7DKlTY=;
        b=bs1ZQz09VWANvz54hFYIsc09Q2jXIzYhaAczNtRyz31cr0u+eLMBgeOG2upDdi9jik
         ANwlT/CzXuKU+KMJneR4h3bXBZPrjKWV9FJKZA0cwgDT8aheZsDVghQP1Svvfm35lVxc
         UNEKRNFdCuWlEMeJszbKLyPz+yYe/Sz8UKayCR4PDuBXEfggDH0p8q1e725myZhYKOX3
         bGtf8CfGjzalSlJj3WyUwVeonEnKBTKuE4ZljxyKTVtbfe1s0/6v3yuoBxni5xs3m3R1
         k+URGhtnK938DtLZnqPmnjwRWUL+6JWyomJSoQHhHwcbVnFZt4bE9ZaFofm6F7hDAPI8
         pcPg==
X-Gm-Message-State: APjAAAVZyWV5a3usiwTgPWWzXCV+AW5l+SLZ4wmxMQdpVB8vdaftMJoN
        SytgkhWOBGgw5HUsE9ITZ1X+MQ==
X-Google-Smtp-Source: APXvYqwWhJvMF+JERj9lJ5S96xuxaaQT7YqaxjBM5IG5LhDeP1ZB8cANLTbQQGoG5DVj5KHNGWum3g==
X-Received: by 2002:adf:a389:: with SMTP id l9mr14229912wrb.411.1581501597101;
        Wed, 12 Feb 2020 01:59:57 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id t128sm38157wmf.28.2020.02.12.01.59.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 01:59:56 -0800 (PST)
Subject: Re: [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
 documentation
To:     Adam Serbinski <adam@serbinski.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
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
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
Date:   Wed, 12 Feb 2020 09:59:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200212015222.8229-7-adam@serbinski.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/02/2020 01:52, Adam Serbinski wrote:
> This patch adds documentation of bindings required for PCM ports on AFE.
> 
> Signed-off-by: Adam Serbinski <adam@serbinski.com>
> CC: Andy Gross <agross@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Patrick Lai <plai@codeaurora.org>
> CC: Banajit Goswami <bgoswami@codeaurora.org>
> CC: Jaroslav Kysela <perex@perex.cz>
> CC: Takashi Iwai <tiwai@suse.com>
> CC: alsa-devel@alsa-project.org
> CC: linux-arm-msm@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   .../devicetree/bindings/sound/qcom,q6afe.txt  | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> index d74888b9f1bb..6b1b17d31a2a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> @@ -51,6 +51,24 @@ configuration of each dai. Must contain the following properties.
>   	Definition: Must be list of serial data lines used by this dai.
>   	should be one or more of the 0-3 sd lines.
>   
> + - qcom,pcm-quantype
> +	Usage: required for pcm interface
> +	Value type: <u32>
> +	Definition: PCM quantization type
> +		0 - ALAW, no padding
> +		1 - MULAW, no padding
> +		2 - Linear, no padding
> +		3 - ALAW, padding
> +		4 - MULAW, padding
> +		5 - Linear, padding
> +
> + - qcom,pcm-slot-mapping
> +	Usage: required for pcm interface

Are these not specific to 8k and 16k mode ?
We should probably list values for both modes here.

--srini

> +	Value type: <prop-encoded-array>
> +	Definition: Slot mapping for audio channels. Array size is the number
> +		of slots, minimum 1, maximum 4. The value is 0 for no mapping
> +		to the slot, or the channel number from 1 to 32.
> +
>    - qcom,tdm-sync-mode:
>   	Usage: required for tdm interface
>   	Value type: <prop-encoded-array>
> @@ -174,5 +192,29 @@ q6afe@4 {
>   			reg = <23>;
>   			qcom,sd-lines = <1>;
>   		};
> +
> +		pri-pcm-rx@105 {
> +			reg = <105>;
> +			qcom,pcm-quantype = <2>;
> +			qcom,pcm-slot-mapping = <1>;
> +		};
> +
> +		pri-pcm-tx@106 {
> +			reg = <106>;
> +			qcom,pcm-quantype = <2>;
> +			qcom,pcm-slot-mapping = <1>;
> +		};
> +
> +		quat-pcm-rx@111 {
> +			reg = <111>;
> +			qcom,pcm-quantype = <5>;
> +			qcom,pcm-slot-mapping = <0 0 1>;
> +		};
> +
> +		quat-pcm-tx@112 {
> +			reg = <112>;
> +			qcom,pcm-quantype = <5>;
> +			qcom,pcm-slot-mapping = <0 0 1>;
> +		};
>   	};
>   };
> 

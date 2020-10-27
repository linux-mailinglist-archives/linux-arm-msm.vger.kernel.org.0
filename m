Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C5B29A91B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 11:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438674AbgJ0KIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 06:08:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35186 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438681AbgJ0KIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 06:08:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id n15so1204791wrq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ei3u24rIHuUlXFN659f6wxEdLp7W3x7O+DS6Q5fs7ws=;
        b=vwX17LkFQN9VmSk/zsSEQ9SxEJQDJ1JMaJs+RIlkwFQEf8BtkIDogxkC8/t6kyWU0v
         /CwB8tyGJ6i4O6Xem4VotrXV/uNJawEstv4Yn2RYmspGd7zL1sf1sbngmLvxDXxB8GQ1
         dtrfpW8+AzdqfUXI4E/LTFGw1dQmg0GgzOeWnygoEs3Sdoom7CGu3hxhcghgadqPNvwD
         jeyx1ag8UrJgIFlbvVhaX9CYZgHMI92OB1w/7xtexYykY6E4+pPFpPqjD9ej1lPlinLJ
         rmzy62ttsrCoHyo/5DD84nM7F2/B/ApC/Vpu3uB8JuY3ziXSFdGxLSlaUqTUmHq19ESa
         FcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ei3u24rIHuUlXFN659f6wxEdLp7W3x7O+DS6Q5fs7ws=;
        b=lyR/MNIeL1JXuecuxvRCfvI1X++PKX1wm0zDNHGEzPwdx7qaYruJoSNq1gSL4iRJgh
         HDhoRPd1oCR+ymYyTMHTvZdOWfXK3YS/BWsP2R2AaQV+aFJ4i4FZluvsuYk/1KflYCsH
         kkBcyR3cfmMFEtKNh/xGKZ6UKS2d0jjpmFL4PJQW70y7Fw1LiYo9Dn8++/altLeQ6c06
         4kCWIr3VImRopI/mLFUAnglwmGZG7a5V/8v26nS/xSrqESww8YcChHAKmT7fW+v9HmNJ
         RkPl3KEv/VolzuOoaqZvmsBbN5hVTxYIot9XoyfvP9Q6Rgp6HrX+3ReSqedpJZ/3eW18
         H3Ug==
X-Gm-Message-State: AOAM531B3bWQZU2o/lidV2iSHbOiLmUZi9/Ap7BBi8wqy9D6jFIYJKDL
        CWWIImL08rL7lFiqbn2QiHtoOg==
X-Google-Smtp-Source: ABdhPJzc7V2HgcIEkvba+6199zd1BCJe8hFyMd14K8tTvw55Goq1lfkLy50L41t3mH0cpHB5Sr7eWQ==
X-Received: by 2002:adf:e751:: with SMTP id c17mr1229850wrn.345.1603793277117;
        Tue, 27 Oct 2020 03:07:57 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i33sm1463259wri.79.2020.10.27.03.07.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 03:07:56 -0700 (PDT)
Subject: Re: [PATCH v12 1/2] ASoC: google: dt-bindings: Add sc7180-trogdor
 machine bindings
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
        Srinivasa Rao <srivasam@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        xuyuqing@huaqin.corp-partner.google.com, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20201027032234.1705835-1-cychiang@chromium.org>
 <20201027032234.1705835-2-cychiang@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1f5f9ee9-f77c-7142-efe4-7e845fe54953@linaro.org>
Date:   Tue, 27 Oct 2020 10:07:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201027032234.1705835-2-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for doing this!




On 27/10/2020 03:22, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>

Looks good to me!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
> Changes from v11 to v12
> - Documentation:
>   - Change the file and title name for new compatible string google,sc7180-trogdor.
>   - Change the example of model name.
> 
>   .../bindings/sound/google,sc7180-trogdor.yaml | 130 ++++++++++++++++++
>   1 file changed, 130 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> new file mode 100644
> index 000000000000..efc34689d6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google SC7180-Trogdor ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang <cychiang@chromium.org>
> +
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    const: google,sc7180-trogdor
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^dai-link(@[0-9])?$":
> +    description:
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.
> +
> +    type: object
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
> +      reg:
> +        description: dai link address.
> +
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - model
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +
> +  - |
> +    sound {
> +        compatible = "google,sc7180-trogdor";
> +        model = "sc7180-rt5682-max98357a-1mic";
> +
> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai-link@0 {
> +            link-name = "MultiMedia0";
> +            reg = <0>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&alc5682 0>;
> +            };
> +        };
> +
> +        dai-link@1 {
> +            link-name = "MultiMedia1";
> +            reg = <1>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 1>;
> +            };
> +
> +            codec {
> +                sound-dai = <&max98357a>;
> +            };
> +        };
> +
> +        dai-link@2 {
> +            link-name = "MultiMedia2";
> +            reg = <2>;
> +            cpu {
> +                sound-dai = <&lpass_hdmi 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&msm_dp>;
> +            };
> +        };
> +    };
> 

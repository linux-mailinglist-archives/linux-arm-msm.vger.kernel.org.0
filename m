Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781C42A8641
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 19:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgKESny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 13:43:54 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41169 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKESnx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 13:43:53 -0500
Received: by mail-oi1-f195.google.com with SMTP id m13so2713815oih.8;
        Thu, 05 Nov 2020 10:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d5oADnBeNIpIvCSojwrBHVdlvDCR/O5IS/nZKIy1ndA=;
        b=rQh0dLRBpOY3jvj+AoG50Zg5RY3ZMjtUV5lTdXMx7Y2jy3Nbkq6731eui2AaTO8bT8
         a9+w0RgxJSwOo/wRGlz1emgvGG6EK4Jg1t8XolAz/n1Egn6Lz0A15U7szeqYAtF9Q1+B
         dRigCzQq/sPzQWNv47Evf2ImxXAD33i0kaeGACUnYynlLLC/Fh3Q6dw3gvP8n60s7IF8
         q4g8BxjWZKvR5kFcDFDu/MFZwFQg+QZctBuKXZ4ez+dZxI54UkCYrdp2nbVF9K9x8EsV
         4TBsnLxXbj5Wdy5XzHMRZ4Fm2w3PZFtUUbn9uXJEyHrIUAUbt2QV2HiAaNGpSIpWQYyQ
         z06Q==
X-Gm-Message-State: AOAM531L93jEaDKjjmUitlwZe67MJDPFQ7o2RjIkNpek75mxo0SbciZP
        sjf9mCsT//IhxT3Mk/4gAzIB4K1tSLW+
X-Google-Smtp-Source: ABdhPJyYXmS7UjH4bUE7XXBl0KWexDWJQoYRb48zVqEn7FRn3jqT1JFDBgJKqsHgp8p6dVQEG+M/+Q==
X-Received: by 2002:aca:c084:: with SMTP id q126mr506299oif.129.1604601832353;
        Thu, 05 Nov 2020 10:43:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k10sm497430otb.81.2020.11.05.10.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:43:51 -0800 (PST)
Received: (nullmailer pid 1613991 invoked by uid 1000);
        Thu, 05 Nov 2020 18:43:50 -0000
Date:   Thu, 5 Nov 2020 12:43:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v5 1/2] ASoC: google: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <20201105184350.GA1611477@bogus>
References: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
 <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 03, 2020 at 06:30:50PM +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index efc34689d6b5..9e0505467e57 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -34,6 +34,9 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  dmic-gpios:
> +    description: GPIO for switching between DMICs

Need to define how many (maxItems: 1).

> +
>  patternProperties:
>    "^dai-link(@[0-9])?$":
>      description:
> @@ -81,6 +84,7 @@ additionalProperties: false
>  examples:
>  
>    - |
> +    //Example 1
>      sound {
>          compatible = "google,sc7180-trogdor";
>          model = "sc7180-rt5682-max98357a-1mic";
> @@ -128,3 +132,57 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    //Example 2 (2mic case)
> +    sound {
> +        compatible = "google,sc7180-trogdor";
> +        model = "sc7180-rt5682-max98357a-2mic";
> +
> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dmic-gpios = <&tlmm 86 0>;

Do we really need another example for this? Can't you just add it to the 
existing example?

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
> +
> +...
> -- 
> 2.25.1
> 

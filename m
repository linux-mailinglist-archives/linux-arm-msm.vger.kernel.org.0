Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87331252327
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 23:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgHYVxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 17:53:01 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:43739 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHYVw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 17:52:59 -0400
Received: by mail-il1-f195.google.com with SMTP id e11so55619ils.10;
        Tue, 25 Aug 2020 14:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z862RBqRInU1jmo+k1WEqk2fp00qEJO4pngR/l2zG04=;
        b=IJOk15H2QDh0m5biEKrvgWBAqGzxW39Iq6BRxw7dfl6mvwjiPLxeiAb1YtSUQCQQpm
         gzCAGSsY5liF3CCXc2JXtTKuidG0Zli5zHcu3Qw4S+fA42mUpVvT7Q5ymP5hc6Dk3WMO
         k8Cf/6LB3NxDmPFZ8WtvgDPRTH5MxF4WlBzIZJV1z2cU9UU0+g3mNXR3LeLjbqDWmU7C
         XCCCH445M1ehDGRZG+6GmaTqwC22QaqLsqveKqEhUqVXXmCGIAOvF5wEn93q8J0F2g28
         n/B5w5Q8WrphW2pFFs+uJs0rALPDzNH4fnTlY5KMFyfEp2DdpkAcb3unb+zgzXr7/Nhv
         pGDw==
X-Gm-Message-State: AOAM5339O6xfv58cH5Su4LdleJvvb0LI7rPCSQ41aP9xLcGbrhL0zf6A
        l6DheIbN8tMTD3TdPZrL3w==
X-Google-Smtp-Source: ABdhPJx3VbGqokXyWzIiTWH+YZW0T23M3rLSC5vTwacOnJTPXEiL3A51zhWfOq6sV0mmYmWUyNoC2Q==
X-Received: by 2002:a92:5bd5:: with SMTP id c82mr11194112ilg.166.1598392378364;
        Tue, 25 Aug 2020 14:52:58 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id k18sm174461ils.42.2020.08.25.14.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:52:57 -0700 (PDT)
Received: (nullmailer pid 1403055 invoked by uid 1000);
        Tue, 25 Aug 2020 21:52:53 -0000
Date:   Tue, 25 Aug 2020 15:52:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Message-ID: <20200825215253.GA1397515@bogus>
References: <20200819091533.2334-1-stephan@gerhold.net>
 <20200819091533.2334-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819091533.2334-2-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 19, 2020 at 11:15:32AM +0200, Stephan Gerhold wrote:
> In some cases we need to probe additional audio components that do
> not appear as part of the DAI links specified in the device tree.
> Examples for this are auxiliary devices such as analog amplifiers
> or codecs.
> 
> To make them work they need to be added as part of "aux-devs"
> and connected to some other audio component using the audio routes
> configurable using "(qcom,)audio-routing".
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
>  Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
>  Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> index 84b28dbe9f15..23998262a0a7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> @@ -34,6 +34,13 @@ Required properties:
>  			  * DMIC
>  			  * Ext Spk
>  
> +Optional properties:
> +
> +- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
> +			  amplifiers) that do not appear directly within the DAI
> +			  links. Should be connected to another audio component
> +			  using "qcom,audio-routing".
> +
>  Dai-link subnode properties and subnodes:
>  
>  Required dai-link subnodes:
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> index c814e867850f..248df5056fec 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> @@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
>  	Value type: <stringlist>
>  	Definition: The user-visible name of this sound card.
>  
> +- aux-devs
> +	Usage: optional
> +	Value type: <phandles with arguments>

How do you know how many arguments? It either has to be fixed or needs a 
#.*cells in the phandles. For the latter, you'd need to come up with a 
common binding.

> +	Definition: A list of phandles for auxiliary devices (e.g. analog
> +		    amplifiers) that do not appear directly within the DAI
> +		    links. Should be connected to another audio component
> +		    using "audio-routing".
> +
>  = dailinks
>  Each subnode of sndcard represents either a dailink, and subnodes of each
>  dailinks would be cpu/codec/platform dais.
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
> index ca8c89e88bfa..3d5cbe953cf7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
> @@ -24,6 +24,14 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
>  	Value type: <stringlist>
>  	Definition: The user-visible name of this sound card.
>  
> +- aux-devs
> +	Usage: optional
> +	Value type: <phandles with arguments>
> +	Definition: A list of phandles for auxiliary devices (e.g. analog
> +		    amplifiers) that do not appear directly within the DAI
> +		    links. Should be connected to another audio component
> +		    using "audio-routing".
> +
>  = dailinks
>  Each subnode of sndcard represents either a dailink, and subnodes of each
>  dailinks would be cpu/codec/platform dais.
> -- 
> 2.28.0
> 

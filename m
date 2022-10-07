Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DF45F7B34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Oct 2022 18:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJGQMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Oct 2022 12:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiJGQMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Oct 2022 12:12:34 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89422FC1D4
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Oct 2022 09:12:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bu25so7995117lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Oct 2022 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8tlFzRr5PaJFwlIwm9GBuMbfRHqOtAY2JydGxcD8TM=;
        b=AsBMu4d7kHj3ZjKHzmYBUDwyc/ovOkWmCo6Y556oJZzIZwOdUQBVbWOqxapV3gLBFn
         AjGpKKgyZavDkAQA62JesgQLYg0doJC+0o/jIfKl023od/xtfn83WGfIOs2Zb/chziYb
         MuSHsDNWFO+GSlRrb0Qeuk7D1JUdAaftiSbjZdiHOp0onK2UcrApPuneKhKOcYNhp/Md
         OyAckksPuV7v6eswvxBIZ/d3v/Rad/swjKkUYmx9ukacLv04TsBMPt31jduKclArFNuY
         LG6efbZKLpAVWZAUw9M82iL0FbeYc/s2WUc1xEeLzCQOj2910oQVEiodHQdWsFTZrqCc
         8xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8tlFzRr5PaJFwlIwm9GBuMbfRHqOtAY2JydGxcD8TM=;
        b=inKeI/4DXOVM/R+sEoCtbDxTyJ1hewE+/tuRIytMF0N+zAxJnRGeQVr4PivvhQGnUB
         bpiFdq1JQGka26Ew5Ikhya9Ru/q4HCPOLstXcatFgWPduMola3Laiiu/ncRJZSLMNNo9
         eWPcl5rt4n6zxXjCvLPq67cvlYF8GAYJdSbyUM2kNyC9RwG46SvQVQv2s1GznLAwgGOb
         fXxD5lmM9539F8fT1/WGW1Qs/oTvIEnZf2YKJfZndG0ZbwzFjsaoFY68fpzDGrd37onm
         Tbho9vNNFzTpGJr/Qo9+36hA9n7aw2fD7SO0E1BcZxxIKs7DrqFjcWmBTOOcl4NbKR2t
         HAxg==
X-Gm-Message-State: ACrzQf2UsRlmw7zPd7Ty9OubHryf4h0jjsGKDjIZaHZ/r73pQYCYSHe/
        E1ybkfG/EoIscjhpu5Lx+jDqmg==
X-Google-Smtp-Source: AMsMyM7EC1svtAnzEBYUfnBsoQ1ddsfwAE50qB7frYZPgOYvwHe2G/NccZx7R7BLXhAaS3Nx4KEFHw==
X-Received: by 2002:a05:6512:3606:b0:4a2:71df:7938 with SMTP id f6-20020a056512360600b004a271df7938mr2209143lfs.279.1665159151676;
        Fri, 07 Oct 2022 09:12:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z15-20020a2ebe0f000000b00261e2aab7c2sm319999ljq.58.2022.10.07.09.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 09:12:31 -0700 (PDT)
Message-ID: <4f44c3a8-13e6-4062-86f3-f3721df71a44@linaro.org>
Date:   Fri, 7 Oct 2022 18:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add
 sc7280-herobrine-audio-rt5682.dtsi
Content-Language: en-US
To:     Judy Hsiao <judyhsiao@chromium.org>, bjorn.andersson@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220930152613.2018360-1-judyhsiao@chromium.org>
 <20220930152613.2018360-3-judyhsiao@chromium.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930152613.2018360-3-judyhsiao@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 17:26, Judy Hsiao wrote:
> Audio dtsi for sc7280 boards that using rt5682 headset codec:
> 1. Add dt nodes for sound card which use I2S playback and record
>    through rt5682s and I2S playback through max98357a.
> 2. Enable lpass cpu node and add pin control and dai-links.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> new file mode 100644
> index 000000000000..2dbdeeb29ece
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *

Skip empty comment line.

> + * This file defines the common audio settings for the child boards
> + * using rt5682 codec.
> + *
> + * Copyright 2022 Google LLC.
> + */
> +
> +/ {
> +	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	sound: sound {
> +		compatible = "google,sc7280-herobrine";
> +		model = "sc7280-rt5682-max98360a-1mic";
> +
> +		status = "okay";

No need.

> +		audio-routing =
> +			"Headphone Jack", "HPOL",
> +			"Headphone Jack", "HPOR";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +

Best regards,
Krzysztof


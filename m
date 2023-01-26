Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A37667CA85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 13:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbjAZMFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 07:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236801AbjAZMFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 07:05:43 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFEE4685
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:05:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bk16so1521971wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73ycqz5Vr3+tOURurZAagwhA0jCPCZF47oym0B2wObg=;
        b=zxk3G06qdF/I2uUN1Fxy0Ib1meLLbwiy+FUznNmkeOJDeTot3WNnzI+b7fum/2ng27
         HLeTSiylgez9NZQU8lHAav3shXV2URLW5Lo3N5Pb5hiHxCinVuE9q1hsMalmjWg2rhRd
         7vrjU15UhVm+K/hDKM9sAq29nbjbXrvqvlGFbxZLuKmik3r+pMwmyW0sZdN59EGEvMvI
         H7cXVwmYrRb4V9v6O11nMFNbCoLU0Hx7n9/5dUOfKJbvW6+kMkW5+20eU8JxwH7CwX9Y
         /HHuBFQ9GMQQSt9f+BpJIZqdMINkoBzZoMcL0GGW6WfGXeFLZQcSdelU0PkNmNK/c/DL
         6cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73ycqz5Vr3+tOURurZAagwhA0jCPCZF47oym0B2wObg=;
        b=rIq+qRudFACMvcayAzslLuZlb/SXCRDgdQ/2NLAbQfedIdnfY4/58V77BSLwaU6fk9
         aIN588D/ZuOWp2ZyEGoFUtDBY2v+GT9kYT03ySEef6nzJkNDrPyG/5kH17a+/ap1wFpP
         G/hdErtTdXE1YkyMLmOp4T+m0LHlRFo8NGMEuITgvgdpIuor8Cbn6diUtumI3kFD1cfn
         3l+FGJEAnldgR0Oks1v3PdLt/SrVsvtCjZlB0mVM/MvFTaBvg4Fnu6vG/qBwZwrVF9m4
         Q2wv6tuynXFExz9dOsH3ywnJOHp/0MVdg4ya3yC/0sbzsbSOK7CX8jXv8nyhID/zEoR6
         7vSQ==
X-Gm-Message-State: AFqh2kqFwVxVS047ls07Os1h+ILlDO++JX2gWFbYKFosMBYCbiRZisgW
        ALRr3wouIobVGXKsBuBP/0LTfg==
X-Google-Smtp-Source: AMrXdXshQ57vEOT3LPS1eQ3YLZssnfmBDJVIwVtYoUuqSuUrdKv1clQP4CPZX1GEx+hl/WwpY9ADNg==
X-Received: by 2002:a5d:6b42:0:b0:2bc:7e6c:7cd8 with SMTP id x2-20020a5d6b42000000b002bc7e6c7cd8mr30098482wrw.26.1674734741293;
        Thu, 26 Jan 2023 04:05:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d488b000000b002be5bdbe40csm1345948wrq.27.2023.01.26.04.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 04:05:40 -0800 (PST)
Message-ID: <77b189f7-18ba-a8ec-20f7-a5d1287ced4b@linaro.org>
Date:   Thu, 26 Jan 2023 13:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 22/22] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com, broonie@kernel.org,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-23-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126031424.14582-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/01/2023 04:14, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching). Missing piece is "qcom,sm8250:"

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 70080d04ddc9..60cd84e6727a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -216,6 +216,19 @@ examples:
>                  sound-dai = <&vamacro 0>;
>              };
>          };
> +
> +        usb-dai-link {
> +            link-name = "USB Playback";

Keep consistent blank lines between nodes. Other nodes in this example
have them, haven't they?



Best regards,
Krzysztof


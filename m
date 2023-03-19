Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDCC66C0172
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjCSMLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjCSMLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:11:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E609EA246
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:11:12 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h8so36778757ede.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=YPJ23GJS68bHBKG4Lbftaa433ttaZ0fmgXWZavsD06SmvrkmP2bgMH4ZLnBwl6VCnL
         VyqUN1h/aFU66uitwhc7mmIJwVl1V75JwDTO8aWroziQidAPSGwK94ygGgVmHq1Myeez
         ZZPLV9PPMLY8vKzjNR/X/+SWIqceYA8uh5KCRcmfFxAGXC2f64yUD0YHdQtZ31BBIslc
         LVot5ds9HxvFApvkrRoBdHJV6vUKdtrZWckT/jbsbKs8aMmuWIStZoADGI7l2/Gs9Dz+
         L68xZXQ0avUn82L8p9Wnyc4n9eCRVwIc2cSR56TIcx+BbgUm/abMIMtcRSh88kd5yGP/
         x24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=If06hSah7dQ2Ze6jay13p5u0XMbhPOtffkY1SCGpi04blQjvJs4ovKCOzUUo20020Q
         aQFHB7oVRnDPSnEPHVd6DMBppoA4mSPR89Ui3D9FPyZrSmNvevaYWbXUh3cDxc2TsjOY
         aw2pkFhInlpyIWYYYxbO4Hu1AlKHFb6Bs3F5rwE81l7x85HZFArXQyNNNUYGIiDB9IF1
         OL2ZbPBttGBnfH55Z5eNApW/PGB+GqfOL/f8opvDF6a5pBYu9cq5zUnsd1acswuoGOos
         99iZosOkQBz6L5yG3OZ4LdZHLdZuyA6nkXdZ9A6LFJ2ksLq5ps04FFPK14PAWi7ebMRl
         wTmw==
X-Gm-Message-State: AO0yUKVMYAY3nniYLxJScVO3pLq05ni4xYlTGnUfFEIsJA74Ta3ZQDVn
        yBsEV0Ba4H+7XpqsXWk9Inu3Tw==
X-Google-Smtp-Source: AK7set9WzyI1z5lQWWxZo0wQXPTsHSNQOCCESkzp15F0cQQ58oHgw0u/pfpIMQ8+fDIp4WxeSPrUEQ==
X-Received: by 2002:aa7:cac8:0:b0:500:4c0e:cb8d with SMTP id l8-20020aa7cac8000000b005004c0ecb8dmr6350943edt.5.1679227871464;
        Sun, 19 Mar 2023 05:11:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id k2-20020a50c082000000b005002daeb27asm3423673edf.37.2023.03.19.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:11:10 -0700 (PDT)
Message-ID: <bee7bd83-1d49-199f-de6d-d43e089e4c01@linaro.org>
Date:   Sun, 19 Mar 2023 13:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230317233612.3967849-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233612.3967849-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A317455FDB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 12:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiF2KqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 06:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiF2KqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 06:46:09 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC81E3E0CB
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 03:46:07 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id mf9so31833646ejb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W6PblvzjwJsUNdixxqPbFxxCesgaMuSRJo0IV7rsaEE=;
        b=oWCshr8Sig4TgVaJI44cjK1triaw06iiT8JAoWmlY1sjQfkCy17eatc59Jx6qxZY9F
         nSEVq0Ubkl3k2gorW3qn2Hp2wT766fZDPbxzBlXLwPj8nT05qDLS+RXlGz5283sV3Tlw
         Qq8VqoFTyvRSfQGVJJbipigiP5Pc8z2gQvii/wqSIZL5eiTjNCpi5FmjyfvlgFCNYnKP
         cFabpf9ZIDR5hEye7dgEOThDXekIQyTivRKFe6WXNOlSPz7FMKNYeSePaZdzkJ8p2bjK
         PSCWQb4E5dB9uuOTEWb+FMNRf50WZd2oNP+rCZyl9ydW59zOZa7RlIa0vsfWaIfIsAEb
         qxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W6PblvzjwJsUNdixxqPbFxxCesgaMuSRJo0IV7rsaEE=;
        b=UljoNByb3ZuCS/XYZw4A8DakZKluD+igbbdaRmkbP53PZ0948Lo0pzNzb42LESuvMv
         d5jg+moVX/MNXwn6CDS7nk/agB1bp4suSpEC1m2Iutwcc2hF4k/DhNik35cHln0W4+dX
         ZEbH2c3eDZr+ymwCynTNvSx3Q/QLZ00FkIrXj2tlMGE9oPzusI3KBahzKutgGgym44Z3
         g7V8/EH8pCx8KC55RrxZLtt/9IG7t1G5oAHCeg7KU+f9Lh2/0vcKIxc8Uv0ClBwDInIm
         RbhR+ymYXTgJvVu5i+cX6miZJirJcKJ7uDoyYS9KdwNImIC6OOUsW/j4eQm/7/Wwga1F
         iwaw==
X-Gm-Message-State: AJIora8ppEjUEo/Dh0T3B0n30l0Rk2lwZzY0wzL5PVnjWlYLmnhobZ1Z
        dGqVO0f6gTF1D2Po0AYIMu9oHQ==
X-Google-Smtp-Source: AGRyM1tyS2WfFfYASPJC+t6WUWS3hSdUIOTkd3TViReO0HxUsV95x9yb99WnVOW139Oas8rdXvfyxQ==
X-Received: by 2002:a17:906:9508:b0:726:9589:6da7 with SMTP id u8-20020a170906950800b0072695896da7mr2531593ejx.505.1656499566304;
        Wed, 29 Jun 2022 03:46:06 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l3-20020a170906078300b006feba31171bsm7673762ejc.11.2022.06.29.03.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:46:05 -0700 (PDT)
Message-ID: <269146ad-7b4b-9d8f-23c2-2b0443ab62ec@linaro.org>
Date:   Wed, 29 Jun 2022 12:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: thermal: qcom-tsens: Drop redundant
 compatibles
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
References: <20220627131415.2868938-1-stephan.gerhold@kernkonzept.com>
 <20220627131415.2868938-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627131415.2868938-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/06/2022 15:14, Stephan Gerhold wrote:
> Since the SoC compatibles must be followed by the IP version compatible
> (e.g. compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";) it is
> redundant to list all the SoC compatibles again in the if statement.
> It will already match the IP-version compatible.
> 
> The list has already become inconsistent since for example
> "qcom,msm8939-tsens" is covered by the if statement but is not listed
> there explicitly like the other SoCs.
> 
> Simplify this by dropping the redundant SoC compatibles. ipq8064 and
> msm8960 are still needed because they do not have an IP-version
> compatible.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

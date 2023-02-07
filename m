Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E59468D417
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjBGK2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjBGK2b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:28:31 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CFB279B8
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:28:29 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so41967645ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts0acRxUBjbRENNqOH3ml+/mZlOaH3hAaRGG4xxO/dA=;
        b=LUHCt0+T2Hf0ZKwD43H5lkjLO6ulP5eagMt47wgdb69tnWD89AQ/JExXLTGnhvzQ2t
         ue9Jzr2h+XtHybrUklYYZXOZ53YxaIvgACuEvFuXIQZ1GlRIITUK5Sn1+8d/6AyTkz1d
         pW7c2KM1Dvcfx6R443sEW5NP6+7q/1hFp02tRVTTIKWFZSk+0nkGQaaUpiJVuEq2ufxG
         8EvMaE1bvTC0jMA8qSgzFEMgyQH4/1iTMkT7ndg6MDsVs/PY2vjegnUBMXTRk6GeiVvv
         GK8a5m/kYH9ngXdCB5HqR3WvjbGJ9hLfKBhpiOAIxNkbBbqLmmwheUPI+6JePtroVSa3
         B9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts0acRxUBjbRENNqOH3ml+/mZlOaH3hAaRGG4xxO/dA=;
        b=iAkCEncmosDH9ms3AgYp/oDde7UI8t3nexQNmR8dm41EEPy2JiJn/POP4IZUCU60w8
         jqyrVfFia0xTYuxPFgSSeUrq44AajXawaPxNBa+ulF6I/wBhq8QJzO1eKqavkQN+wUMW
         myVVNdNkjzChYYjviWBhk7rJQfEdWuC7PC+RAfQ4fI4m/d5D3KCY29aoepbGjwvjMC9+
         gE/wLdoFZlxD9nkqlGTPdEF8jyyJu/r+rBihaYjCtqEpQ+SX8qKtTErThgoDwyKgBk44
         OME3aR5XV/jMrBjhOTSV45Asm1ZGuz0V76xvMl3HxnjdL2ksPSfssz7OTFjnG+qTOh98
         tvCg==
X-Gm-Message-State: AO0yUKU+FV+UjKFjhhwWc26keZiSTrhgIuwnE6MIfIZFxs7S+bqWRFOo
        TFAHJQ0XOyAuXdXWpP9j9MbjaA==
X-Google-Smtp-Source: AK7set9/juo6jZwynfeVJKi6dbEl+eEIfDse1Ww3gi5cTUFdnPobV93AbPuSQ2zBPXVlSBoFdRmWtA==
X-Received: by 2002:a17:906:1d44:b0:889:b6ae:75ff with SMTP id o4-20020a1709061d4400b00889b6ae75ffmr2792898ejh.53.1675765708568;
        Tue, 07 Feb 2023 02:28:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y19-20020a17090668d300b00880d9530761sm6652434ejr.209.2023.02.07.02.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:28:28 -0800 (PST)
Message-ID: <2649a9f2-236b-7108-8f68-7eeaf7f1a0fa@linaro.org>
Date:   Tue, 7 Feb 2023 12:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] arm64: dts: qcom: ipq6018: align RPM G-Link node with
 bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 07/02/2023 11:08, Krzysztof Kozlowski wrote:
> Bindings expect (and most of DTS use) the RPM G-Link node name to be
> "rpm-requests".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


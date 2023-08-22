Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7228C7839F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 08:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjHVG3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 02:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbjHVG3p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 02:29:45 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6CA199
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:29:43 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c0290f0a8so514514866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685782; x=1693290582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkLNgj0W2RyzdJzFcU2Wj3EcP7seGY37Syy7WTjTt9Y=;
        b=CZWs0JtZyrgGDMRaqFriWT/Eh0rFVolKJ/u74n4Oyfof2roHpPvvkLvDmRQPQ5TeX6
         vq5pUETlRG9bgmx9fRRxgmKLRChqvO2oySoe+nJLyKESwqHb9/t6/LsN/At/IXYdYzhs
         ThiLvSajNIF3VIbXQKSZhUX9kojvyG0awyHhjVf1a2YiXYrV0HyCK8QVQbXHPbgH4Kga
         nScrqY3tNttRYsKjpAxvHdl2isyxcKUzdqSX7yoVPQWePY+9F0GuLA7rpgpd6MIMSOkI
         vFc8IyxiFw+ltkQV0nkGGgbcL924yc8xzldZs91mgArpri3lnWSzofsPoc/eePXyisBT
         gaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685782; x=1693290582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkLNgj0W2RyzdJzFcU2Wj3EcP7seGY37Syy7WTjTt9Y=;
        b=FHDuBIaI3fvqd7dUcSl35T8w7+5evOVrgjcxWSCU7fbtRsAD6grPnhoJRFpBCqw/mQ
         12mOIdpH83Ppe1iq3RL0G2AJYygKU/OBwDnr412Ec9UNmc8br8cvnS6X/a6vVCO84WGT
         G6DJkXOfCdATQZrpj11pk9izy/Oe/cvrXzbx/cxJyVaTjEDp9GVntAF+MzZ1yRHhYmIp
         oLCun6SpWSvNlWKv4NraiGD1+iXuZNM6FTOVwyOQFsr0OFrpM+MU0TbFhp6WiG9VyEv1
         HCEkqsLrqL503RqVVqIxaL5fwkoVaxoKVX662kBhPGr5YfumdlbfwzsvddZsKBKANKoo
         1M+Q==
X-Gm-Message-State: AOJu0YypD7b5IFQaqCsJXusW75CGsWd0O5gEjleQt6R2TVnsFkWSAA+o
        /BKdhqKlf/6TfciR8lNwyD+OHw==
X-Google-Smtp-Source: AGHT+IFOJlmrmICOr7xLsm1O+Y0EPcFbXjw5iH9PuqH0VJkCZ/HYouXo45g3/jQ/V0hPauvff334bw==
X-Received: by 2002:a17:906:7390:b0:99b:499c:ddb6 with SMTP id f16-20020a170906739000b0099b499cddb6mr7000406ejl.68.1692685782210;
        Mon, 21 Aug 2023 23:29:42 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090666cb00b009926928d486sm7661672ejp.35.2023.08.21.23.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:29:41 -0700 (PDT)
Message-ID: <17530463-ee96-7122-0bf3-60cf711604e1@linaro.org>
Date:   Tue, 22 Aug 2023 08:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 02/32] dt-bindings: mfd: qcom-pm8xxx: add missing child
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822001349.899298-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 02:13, Dmitry Baryshkov wrote:
> Add gpio, keypad, led, mpps, pwrkey, vibrator and xoadc as possible
> child nodes of qcom,pm8xxx, referencing existint schema files.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Satya Priya <quic_c_skakit@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


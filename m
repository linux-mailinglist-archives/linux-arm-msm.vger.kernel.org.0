Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B67D6DAA4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 10:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240247AbjDGInQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 04:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbjDGInO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 04:43:14 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C71D4EED
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 01:43:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n21so6978747ejz.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680856991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adkU32LsCttVRXNpLdmBB653haYtpyR0pGsnlxBxnUU=;
        b=E5+8ob5dlTczC769PGAH+hjeScmR7sm3H0x17B5f0YjL9yuxMTqfBWfouUFtNfn09k
         MaOcNMHwm3pKf0lpbnC+rlUhVmDLG7v9nPqG8IwIVAdBQ/gHD0p7fiv7f0GvPZrRYfv4
         114xuT8pSK6PNPb5QPrS5HOeIefiMyY802APGwoHHP1HXh8w/FEs+Rqw+MjmD6yljGz2
         qWs8bboBFISJ5xiXdCf3J/YQA6nxtZ6OK6tVfJ8abvT1Y//Oc21OcgDYx2yhZTWWQLhy
         0gyIRkiyF9lfdQZwXIooAeg83KINemFpaREKt0T0Eaeyz+pYEQRtQkRvS5kuqtd5rFp6
         9zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680856991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adkU32LsCttVRXNpLdmBB653haYtpyR0pGsnlxBxnUU=;
        b=b8ULXX3p4SxHxiLjicjFXCJoIEBDguVdpDURYvKYdLK+tHXAVdja8bWyPW8fTLrunw
         scF2S2eJEDjSHU+bYv9ThKNWEVXyksGtNKiurp/GLKUsJW/uBHkp+Z9Fm6431I3a013i
         PRjKpD3F8lq4aC1kDLiyscDSu+eX33uj/9g2CDYG0ZKib0No5p1NVdHdXrjxoV8hyc1M
         4FctVu5N0jEHXAx27T75VPB3wcxx3wXDwvADjb2BAGYPJekWIkArf5+Zqu4TFNcyUByL
         2+Ayw8JWplXo32ysGiBLLXLMeyoTi7/wHauvofFFfKaFVDfYYMZufu/j//vlccGIZh1l
         nvYA==
X-Gm-Message-State: AAQBX9f/STYueqlnDeT6cByGi/3TUukMuWD+NjD/IZPkTd4cXbbo3ojO
        jOx3oJenhum4xG4vCjnG5TB71Q==
X-Google-Smtp-Source: AKy350YKKdnjBy0BXE+xCLGnRNN5aa6bX9Vn63qnzwUCqM2PvBFepFb7lyn+md3qnjpO+ScTgh0AbQ==
X-Received: by 2002:a17:906:66cf:b0:8ab:b03d:a34f with SMTP id k15-20020a17090666cf00b008abb03da34fmr7731487ejp.12.1680856991672;
        Fri, 07 Apr 2023 01:43:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906b30500b00930445428acsm1859041ejz.14.2023.04.07.01.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 01:43:11 -0700 (PDT)
Message-ID: <e6aa04b2-d83f-80f6-19f7-0aa18622eb89@linaro.org>
Date:   Fri, 7 Apr 2023 10:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] dt-bindings: regulator: qcom,rpmh: add compatible for
 pmm8654au RPMH
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230406192811.460888-1-brgl@bgdev.pl>
 <20230406192811.460888-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406192811.460888-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2023 21:28, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the compatible for the pmm8654au RPMH regulators present on the
> sa8775p-ride development board.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


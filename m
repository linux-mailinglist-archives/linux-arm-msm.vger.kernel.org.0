Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D542F6A9204
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 08:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjCCHxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 02:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjCCHxx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 02:53:53 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDE54ECDE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 23:53:43 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id o15so6751779edr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677830022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+r2Y1mBDby7aVQnbTwtbpLmjlWLf2d5n3BkzjQVXgSI=;
        b=XyBtkllDYiCNUjE1gazak+mQX0pZIZIXf2gX1hSREHnZj9nWyleeyXhqxkWWOjhgh7
         cMtbMwUp/tcHprhI2hyKjuWtrYTVEpNcXvXqXweHbKE5LYVP1FsUQ2EFE3XKe7xusNfI
         jFUSJqIO8VH4doMadXJ+GtP+IR+PcA9qacpAE7obHkrPobGkrdvtFEyMMbxsaj85upJQ
         ShsikIkO8AiyAp3sOapkcx5a8u38b0XAMTLj6/h94+WWZ3RAzUm6jVooeHmPGX1zk5Tk
         AMvbISzgQbhUnFanPwpezkbbc9LxYn3mDxkkmvKQwCcd0Ppih7b2xyYdJOYLqCXY4fzS
         +Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677830022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+r2Y1mBDby7aVQnbTwtbpLmjlWLf2d5n3BkzjQVXgSI=;
        b=ZA7QGqJssh4bi/xOn9DmC8O5bLgbgz9Mhklx2QG0JgAoRXcR2kgKRhZ/OqqFqtQM/Z
         UXwcdaN782TaZeQ5ERelcNHvwkQLp+3+qJ0NaAun4dnzFY7f5cRFaS/cHzRubvscdq3B
         kLHcxnLk/q1wDRKiZnqls4CjON65Pr3CqVBHaw0sL/mN6ja2mlTv4Wc6AUCv2O+i6GIQ
         X6G6tJKXMYoIR+DryRcH2H9StCdg9ezxop+mJn1LRl5ZnkVOvjx2h/H8n7Z7koKYq+da
         97p/1FXRYhIDMhzt9k3LOi94jS6xDI+W/HRdP6MgiS6tZDgr02l/2EYTG9UpTpy40gAw
         ImkA==
X-Gm-Message-State: AO0yUKXiuek1N6qzh0j2OtfCWsqZmpkyFc2dJyWym3U2vLHqpmu5sTd5
        ZRQTHdP0OyrwiDUCt1LhtZc44A==
X-Google-Smtp-Source: AK7set9xU2KIgJlNOgTiFPSGyIDxZrRN7izbaKivU4u3vFdXN414uPQ1nYZHLj11rPp3LY9csZGtig==
X-Received: by 2002:a17:906:700f:b0:88d:79df:7cfc with SMTP id n15-20020a170906700f00b0088d79df7cfcmr722073ejj.62.1677830021898;
        Thu, 02 Mar 2023 23:53:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id va26-20020a17090711da00b008e9c79ff14csm667201ejb.96.2023.03.02.23.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:53:41 -0800 (PST)
Message-ID: <35716c45-d715-df0a-02e1-f36f04a8918e@linaro.org>
Date:   Fri, 3 Mar 2023 08:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Cortex-A78C and X1C
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        Conor Dooley <conor.dooley@microchip.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230224130759.45579-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230224130759.45579-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2023 14:07, Konrad Dybcio wrote:
> Add compatibles for the Cortex-A78C and X1C cores found in some
> recent flagship designs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


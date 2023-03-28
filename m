Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E106CB760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 08:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbjC1Gm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 02:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbjC1Gmo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 02:42:44 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA623C15
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 23:42:41 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id er13so4382949edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 23:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4USwIO7rQUMdTt0AvopWzJfAqIt2lpjOmFwk/o1NlOc=;
        b=ngtTT0iRYVCM4ZmXXvc+yseTWLI4wIQU2+APRsRBPySpZFVA1MwZnkwLGEEKrFgCfw
         LvnXxESZbnMMkqwDMUhTGPmaXlu6SI6lnRmDARnCW63t1a4FYZ3qKt5yfYh3VfPhFlWF
         ygbLWiqgv8fRRbBXPfQu4oBCEM/AMk695VCbusjPjNrz8MEQCOdgfTd2y82fOjPn8vTl
         j2AT2JOB11J2vU1CivPHbhvpRwBIEDm6ccYQ8gnJ+aruDoFgf97niPi0Hwcb1U9VA+cG
         lJQqjIGM1LepCTAMvEKQItzrKG9yRdLovpq1Qx52ZBSMLEEZGjo4zA2YEDMvcbr4S6Tg
         jhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4USwIO7rQUMdTt0AvopWzJfAqIt2lpjOmFwk/o1NlOc=;
        b=c07ZTXiz96lMFAZ2lCN4xKXttV5m1WGGeyiYMXBugD0lt7pbOSog34wVayUoUvdUj7
         HpLTG08oo+WvsUcY7iwCRRhUybXmoMkcioxSBwnC3HXTwLWj4YeyWyUwgbjAlv3IO9o8
         jRbWNqrB/gMnKFR+1Hb+Dg6ukE+ZGobB4LUDfngkqhvBO8+1r5xH1Uc7fFR6ERAdT4+d
         U+DSTvFejzkpp889tOlD5Omk//Yk2y36Q/drwMzCh8Moi45DbFiWGQrke+2oN/BJqdH0
         SQPpRM9kBQ3WvvqIK4sM6WysDXG7ZApQDFxaJLBKlKOgon4PgEyhwHEBCvJA3tF1tHhu
         vrIA==
X-Gm-Message-State: AAQBX9ebz5Vgaebab48frLepQB4LdBJB0L4EF0vvFm2HMdaaBorSCHzH
        6ddKH9SOi1Hfufb7KwPiI01yVA==
X-Google-Smtp-Source: AKy350a81urn20Et8YB+owcqnHygl1VpRFKCDJT6BT6dQnx9oNwzuS8eEcPoFHWDcWPPvJ2ZjBACyA==
X-Received: by 2002:a17:907:10cc:b0:932:2874:cc5 with SMTP id rv12-20020a17090710cc00b0093228740cc5mr13989964ejb.16.1679985760090;
        Mon, 27 Mar 2023 23:42:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id xh1-20020a170906da8100b0093f83562f09sm3860161ejb.87.2023.03.27.23.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:42:39 -0700 (PDT)
Message-ID: <33448f1a-ff6d-46b2-b181-d4e57983fbd4@linaro.org>
Date:   Tue, 28 Mar 2023 08:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: soc: qcom: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230327170205.4106310-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170205.4106310-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 19:02, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F308777DA53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 08:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242064AbjHPGPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 02:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242117AbjHPGPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 02:15:09 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7264F2689
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 23:15:05 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so55883175e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692166504; x=1692771304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTUQHvk6nMPNqeWY6wjgN795gkMb2j9jEUIFdAG4LqY=;
        b=xO7Z5WcoLupf7WKGjXnm0+2JGKVIp+cZFnQW8qQQUX+vL1sMACIBIoFNaOSViPQ14a
         UHJWJ2K87aax2Dd0w9aiBwD8VUPcehzUU/C1kdQpQSDDsiBJNmOQiSmx/CYU+BkizcTX
         mscN1bNSQA1cC+Hvmg9TNKYwS6ExADhhO5BWlp4JNCfIuF55JUL3hQG1nyoLcAJlBfM2
         WYvXyXs1HgxJMlF15emnRH/wHuQ7vwi7UGdR44Dr76G5QR6uB0rf7ahScIKYQxrNXbjR
         kWBwlJocmwayctKWjiVkfWbA5zs1pIirENmfQGmsI6fVzE4i8pa2TE/V1KuSTWiD/hkO
         aFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692166504; x=1692771304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTUQHvk6nMPNqeWY6wjgN795gkMb2j9jEUIFdAG4LqY=;
        b=H0h8KIoF9tTJI5F9U/D4wQdMlyaIS1sUFR12qQRaqR4ES8ULX0kiTP7Tg6zDfZWvKt
         bEdBFfVll8KyUVxDOSZZvt9xe2a9W2sb3x0PSMNyRckp7aN/u8Y4yFV3tHmCBFGJpmi/
         r8g2DxKyiEIUCb9/wSOy2WF/612lF7YIlK3W8dqVTMQHxTbY709PIhiIXF6wPnWPrsZh
         CcQTxWw5ugYxO3kjCIJCYHngg6N8Ml8oCXKCLxE518TmH/c4fLhsGgPOtcB6E5AXv7Xz
         k0HzrRZFU513UB70WhUTPHcttxuvEeCmm48cf+MN5/VgFg8KDKPZuKr774uypBTUvHMs
         pHqw==
X-Gm-Message-State: AOJu0Yzyg+BzBImPwBJt6Pmo0CQV77AvzpoO30W9t+cODfkaX94Mr6/K
        KhFK1Zvada1uGH5hGHk7KBYaCA==
X-Google-Smtp-Source: AGHT+IExivCJdkDf6HyiYHESX10/DHxdo5RQNph3ghItuTm+BBL36Ju2Zk/LPgvSP3sBJ03330hYSw==
X-Received: by 2002:adf:fc8b:0:b0:317:5d60:2fea with SMTP id g11-20020adffc8b000000b003175d602feamr784010wrr.52.1692166503982;
        Tue, 15 Aug 2023 23:15:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d684a000000b0031758e7ba6dsm20004076wrw.40.2023.08.15.23.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 23:15:03 -0700 (PDT)
Message-ID: <90acb8cc-b2b6-0fd1-6512-c17502c9d0f6@linaro.org>
Date:   Wed, 16 Aug 2023 08:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/5] firmware: qcom: scm: Add SDI disable support
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     computersforpeace@gmail.com, Mukesh Ojha <quic_mojha@quicinc.com>
References: <20230815140030.1068590-1-robimarko@gmail.com>
 <20230815140030.1068590-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815140030.1068590-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2023 15:59, Robert Marko wrote:
> Some SoC-s like IPQ5018 require SDI(Secure Debug Image) to be disabled
> before trying to reboot, otherwise board will just hang after reboot has
> been issued via PSCI.
> 
> So, provide a call to SCM that allows disabling it.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/firmware/qcom_scm.c | 23 +++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h |  1 +
>  2 files changed, 24 insertions(+)

This should be squashed with next patch. Adding local function without
user is useless.

Best regards,
Krzysztof


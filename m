Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2019F77DA04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 07:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjHPFyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 01:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241904AbjHPFyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 01:54:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164ED1990
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 22:54:04 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5234b80e9b6so8318362a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692165242; x=1692770042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkzrRsAYqrGofyJHqddcC4Cgi7d2HxMzD8UKMfbqpyA=;
        b=zdyH7p8r1t+d7AodepeRORQf9lv8n693thNDOqgqgKacJ8Gkd3CprrEcZ25D+0Ae34
         n69WmK24u4a7Ekjca1g8YBEROjM4gognKgAvZh8mFXWVMOa1losPxbwKiTbDhd4sbRpS
         v0fnixlrVBFsNMviJsNB8GKlXWySsbu+yBZdwNX++s/V5K1a4FgvVHZ4o1s5mIJDbKnm
         ytQAfVqC0rpfZ/jUTAtKFyfgS2nakoZnuf8WrYysR/40cpnbsFEGk891b3PyS2rrUa+T
         /5zQl4+k8Da5kkuSCZ7wMc4toIhjhvanwsz3DBO4b/aTMNlNlvCeF0jvWThKhCgUUNdN
         +aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692165242; x=1692770042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkzrRsAYqrGofyJHqddcC4Cgi7d2HxMzD8UKMfbqpyA=;
        b=KEpQ/vUHORlmViYa/SGocEOGNjvfHmXF8a33FKIQC5luLf1HtC/QwsQxoZYFssPjAw
         i7RC+xJo31B8dbvyGRa9PQW9HCKdHXC8lZBk2rsvRXCEeU2Qvwlw61ODu11ZA0PijlrU
         tS9v29Ysj1xe+8zWw82kY31NKmQDi4vaMHi2/txzXiyXNbFOum08esfY2rdTsE0s3MLU
         ZBPSdZMRnU6gYSjyY/6SUhhD3IwlXII56tOh9jL3rRsHB5C5OYCMKSJB5o30LFOrhp6L
         o7omgzNFEoBJ5tcShrg9OpwmYnG+l650U91s7D0ZDXUYOOrKEE8TqxyyIzg3SI7JOgJr
         zQEg==
X-Gm-Message-State: AOJu0YyblFtCp8ZjQxI7Nrl5FnAno3CykiAOIGtLqwK1uqew812BQ5t2
        3bX6bg2EsrO6eUTZzLWzRDYWTg==
X-Google-Smtp-Source: AGHT+IH8gmG+hio/x9+oLX/5LuYk2m5XfXtmHrNThBUEMthCRZbysoAmJfuRw8UWaizg01Hv0d8QBg==
X-Received: by 2002:aa7:ce14:0:b0:523:69bf:2bd3 with SMTP id d20-20020aa7ce14000000b0052369bf2bd3mr778982edv.13.1692165242622;
        Tue, 15 Aug 2023 22:54:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id b5-20020aa7c6c5000000b005224d960e66sm7804334eds.96.2023.08.15.22.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:54:02 -0700 (PDT)
Message-ID: <87111632-f032-87a4-159f-1dd5357bac70@linaro.org>
Date:   Wed, 16 Aug 2023 07:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] bindings: mfd: qcom-pm8xxx: add a property for rtc-pm8xxx
Content-Language: en-US
To:     Anvesh Jain P <quic_ajainp@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Rao Kakani <quic_vkakani@quicinc.com>
References: <20230801115143.27738-1-quic_ajainp@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230801115143.27738-1-quic_ajainp@quicinc.com>
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

On 01/08/2023 13:51, Anvesh Jain P wrote:
> Update rtc-pm8xxx bindings with disable-alarm-wakeup property.
> 
> Signed-off-by: Venkata Rao Kakani <quic_vkakani@quicinc.com>
> Signed-off-by: Anvesh Jain P <quic_ajainp@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> index 9c51c1b19067..e4f1d2ff02b6 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -42,6 +42,9 @@ properties:
>  
>    interrupt-controller: true
>  
> +  disable-alarm-wakeup:
> +    description: optional, disable alarm wake up capability.

This was no tested. Missing type, vendor prefix. Additionally the
description says absolutely nothing, just repeats the schema.

Sorry, does not look like hardware property with such description.

Anyway sending it without DTS or driver is also no-go, so NAK, sorry.

Best regards,
Krzysztof


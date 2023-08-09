Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65F4775E8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 14:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjHIMLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 08:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjHIMLK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 08:11:10 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB2A1BDA
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 05:11:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe1c285690so10505621e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 05:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691583068; x=1692187868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7Ry1wvi8+J9JTgKiYPmLWP0JVIew2LaXJPJcmj20s4=;
        b=jjQGkbpI6JylvrPoA6Hp3df1w6TIn266pQYTbPNOrDViuok5D+/PLfTncfoAbejBZS
         n0YyPwiTfxNY3WHVApYeEvnzFXncfv0dyJyf84lR6q+NVlpgv999WbcxwtF2bQLZjpOu
         V5st7vyj8/e8WKFRINzeIcj3XiQIgwtY0Qjfaeko/wRyLQ2KNVUSBmFDYzz+d0Rcg26X
         SJ4Iq9pBC+uNN4Bd6XSL9vcWbTa8W2qQYEjqiLCEePPBRi2CNjbTs6qUhxGTd5duQcey
         f7/TG+Ake4I8SoYr9Asloeys/Rm2B7Y8nSKnT/QC9cg7bACH5R04ZrP8Gyp7w8bqrz7M
         sJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583068; x=1692187868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7Ry1wvi8+J9JTgKiYPmLWP0JVIew2LaXJPJcmj20s4=;
        b=HH0ekXajcGj/oe33BLWI+sjuhTsJSXUKbyCElANGSTssonJ2REL/A7gEdSwYP7/PEh
         oIGovlC4ZG3ldpSQTD3H0jHAqfOWvewI1kDtQdglJqTO3E0dSblMZIrzPPzi6NwbujgA
         DitR8mSLhi3uScHXPvLT3xi+4ZYjiKUaUVrpOERd3GE/eNggMLSFWpZgaKKRQyjvHmvr
         OvxSfjfZNsqcmGxoxXzbptg4iMSj0hcU0GsA4fQEuLrlDzPeEXNwNHLqZ5c/S9dztVLD
         Eij6K9qH5yUPfS+0r6IUZiIUlWrGEOIACQxARH+WFFulo/OCPv4jcbNswkDaHSKW+sst
         pTpA==
X-Gm-Message-State: AOJu0Yz3VJZKP9BD8C2D9uH482chyPGeh2EDFnCaMs2Fla3erRJ662OO
        lvePgCim1pSmtn3FGHGxm9A+gQ==
X-Google-Smtp-Source: AGHT+IFsKBycWfaF92XoOSq9ZeNyf2KrueJWYoVM+T7FgyDFCsf+5hrYEOMmJGk0EAf0Q/KD3vIfww==
X-Received: by 2002:a05:6512:202c:b0:4fd:d538:b97b with SMTP id s12-20020a056512202c00b004fdd538b97bmr1517469lfs.29.1691583067870;
        Wed, 09 Aug 2023 05:11:07 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id c6-20020ac244a6000000b004fb8603f6e0sm2304491lfm.12.2023.08.09.05.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 05:11:07 -0700 (PDT)
Message-ID: <7f30b5a2-37d1-4b1c-8f8d-4a4782534b2f@linaro.org>
Date:   Wed, 9 Aug 2023 14:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: apq8016-sbc: Enable camss for
 non-mezzanine cases
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
 <20230809120432.1036405-8-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230809120432.1036405-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9.08.2023 14:04, Bryan O'Donoghue wrote:
> When we have no camera mezzanine attached it is still possible to run the
> test-pattern generator of the CSID block.
Wasn't it broken?

[...]

>  
> +&camss {
> +	status = "okay";
> +	ports {
Again, please add a newline if there's gonna be a resend.

Konrad

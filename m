Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEE9789712
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 16:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjHZOBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 10:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbjHZOB0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 10:01:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9691A2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 07:01:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4ff9abf18f9so2847640e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693058482; x=1693663282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sG+ykakkkDpjr4OKm8qU4Pv12nVdVlkpxc/7F+D8mBg=;
        b=i/Fe4bHVC1LL90URoXJJWTLhU8f85Fq7c5HuPE/nVn3bewA+KaYU58Ou1gCZLllCW+
         p+KlKo3tBxI6UnLXVhwAAoAy9hko3fmRqXuGm6GFZMiHocgGJKYwzlShnJvcjzHTYUlh
         Chjh9c1EY2LP6NcNlTZ6UFr+bMBV6yqozMVZ5ylRyBoZrknYZPNQNDYmd7sdavg+5HbN
         BNPZtzjmwFVOjGDAM/+wvxzLnF7QndNHtUE+FBZjvdm6U2xl51VwAhSaaWrlnnLEVQRd
         c4MuNwcNn5O5ntMkjA4tz7GbmPFEjY48rTvChkRZ8vZcRmTCtmzRkcXiHsDmp9ImbvXr
         V7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693058482; x=1693663282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sG+ykakkkDpjr4OKm8qU4Pv12nVdVlkpxc/7F+D8mBg=;
        b=jnxMaOm6OXmF169MUyqNKYqHvI/QVFas/rDPjYiyHM/8Z49pmREATUso03aCFXzpHa
         Pp9NJ2tA8BHCwjgRfPNU+3fsjxUEchYIu+ZsTWfJHb4ERKgGu7ND0B5LT5imf3Gnotxa
         4/xwIzFAwSMRnntQxSl5bUmiEl8P6ZFGOGojgMDnpKicfmzv6b0QsRpbf5d0mXI298gI
         BnPqOdfn5DfphHpuJ9EKxQy6oD1UeKtLfeMEE5arUa1I/xabYUiheY3r5Is9cTuInEX8
         WjNY9KDKX0sO2u+XjOyXB6YAi3aBZcvQ/DDIWE+lh7J7DTtcqN8kt0Gh1tH1hTVaKb6X
         rnEA==
X-Gm-Message-State: AOJu0YwYc7RvVnkcNUJFfPTbjdoE1qCZTqeLntRcGst4mwp4ef6QiMXD
        gkRJzNNzsXYzUAanF4rVXtJxCg==
X-Google-Smtp-Source: AGHT+IHheLhh98NdaDC8lLb2Sx8APVLkTMq4a2ys4wWVCcrTErIpQMjRfM0n+GPqBsqaFlqDlKB07g==
X-Received: by 2002:a05:6512:3ca1:b0:500:7d05:552a with SMTP id h33-20020a0565123ca100b005007d05552amr16732505lfv.53.1693058481420;
        Sat, 26 Aug 2023 07:01:21 -0700 (PDT)
Received: from [192.168.1.101] (abyl74.neoplus.adsl.tpnet.pl. [83.9.31.74])
        by smtp.gmail.com with ESMTPSA id b9-20020ac24109000000b004ff973cb14esm715131lfi.108.2023.08.26.07.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 07:01:21 -0700 (PDT)
Message-ID: <fac8c6a5-b90f-4955-a5ef-e1c49e815174@linaro.org>
Date:   Sat, 26 Aug 2023 16:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230825220854.1655162-1-dmitry.baryshkov@linaro.org>
 <20230825220854.1655162-3-dmitry.baryshkov@linaro.org>
 <3bfc87d0-2d68-47e2-969f-28300afa7dfa@linaro.org>
 <CAA8EJpqTvqF5oSV9g_eWwPXxR+b+GfQpjetSHS+JYDm5kMhoxA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpqTvqF5oSV9g_eWwPXxR+b+GfQpjetSHS+JYDm5kMhoxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26.08.2023 15:57, Dmitry Baryshkov wrote:
> On Sat, 26 Aug 2023 at 12:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 26.08.2023 00:08, Dmitry Baryshkov wrote:
>>> We have switched most of devices to use mbn (squashed) firmware files
>>> instead of spit mdt+bNN. Even this DT uses modem.mbn and a630_zap.mbn.
>>> Let's switch adsp and cdsp firmware files to use .mbn format too.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Looks like 845 was mbn from the start
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/qcom/sdm845?qt=grep&q=
> 
> sdm845-mtp predates these files. So is there an r-b?
Yes, I hit enter too fast

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C616869CA6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 13:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjBTMCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 07:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbjBTMCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 07:02:08 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AB11B330
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 04:02:07 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id eq27so8376154edb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 04:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msVs8JA1LOOg5WAvEHyNxyn8cBfxjxzBjlkKQHc4Sz4=;
        b=FoTiEeF7ggEN47LyaT9onUDRuLpxTBP10YrE9yn/t/ykulJR+LxmEshr2Vd1vVLjel
         0hyfdorngwQ2FAOFd8nbda8T9qykuiLGek4t+Q7ZIYx5qUfOkI3dWxtrYLvL9gLUyZm8
         SnpXgDtj9lJ5iycfzuvrQFWxOdwF4wfjhh4MoBerjQPr1/zTM+8byuS1PtywlSPr6An+
         1tqwt8Nu64CT3LmQ6B5eYJ11ZXZSmmxkDPs90G/ONLOPcST4tYk5B3ICAOHJmfntr93v
         rMkwTRi0o0rH37mHu7uqC5Mi3sfq/jE/EjJhvbRfjWpRbSWT/1hNjCoWeWK11+eAP4hr
         I/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msVs8JA1LOOg5WAvEHyNxyn8cBfxjxzBjlkKQHc4Sz4=;
        b=k5iwNugKSRuyoSUnrTRIPCO0aBDstZejoulieOteEt2ZxHraU11a2n16M25P8n1Iau
         cS1VTr0P54l5bOaqUnFo5gzY8MUKvTnDqf+MCbmLb1Ia4TiUGeQlV1mYhW6j/GjU3w2n
         QfOHbBpycnoE3YOZtzSiVs15Ia5Tw0/isP5OVp4HMBjoLz1NyfhZ/7bh9XiOnfhakY3V
         IIkqlYPYG/HnKKuBJNeG6EEGc+Q7UPKNN0b/B6rn8UvLC+nfgfamVvLDK/uRgUDLL/BI
         Ahbo24uWaEJvIWe+OJtQGe3Zi9n/iGLm+F2vBsycg8T+HB858S3oR9XUzb9DzF9PBLOc
         9HVA==
X-Gm-Message-State: AO0yUKVN70pDni/b/t1m3AuKJMs818RGcKK7x5Lg+6eTxE+s1roFVv1W
        Qe9L2P8DjRVB2cDeFiAHNWz2Fg==
X-Google-Smtp-Source: AK7set/n+A2MTTWxIqtXy2xIDdZLE/ajyiSDi7/oejIjQh79j2y0QBrm44kwvOHAwazvgphv06Bp7g==
X-Received: by 2002:a05:6402:2485:b0:4ab:1681:b99e with SMTP id q5-20020a056402248500b004ab1681b99emr1962657eda.4.1676894525845;
        Mon, 20 Feb 2023 04:02:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r19-20020a50c013000000b004a233e03afdsm1432463edb.46.2023.02.20.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 04:02:05 -0800 (PST)
Message-ID: <6d07e524-bec7-9aa5-d530-3fa316ba10e9@linaro.org>
Date:   Mon, 20 Feb 2023 13:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
 <61e8eb1b-f3ff-df76-c47f-b2c27442519b@linaro.org>
 <0592adc9-14b1-6c8c-09e6-2b7786386aa0@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0592adc9-14b1-6c8c-09e6-2b7786386aa0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/02/2023 13:00, Kathiravan T wrote:
> 
> On 2/20/2023 5:20 PM, Krzysztof Kozlowski wrote:
>> On 20/02/2023 12:47, Kathiravan T wrote:
>>> <snip>
>>>
>>> Bjorn,
>>>
>>>
>>> I don't see the change got picked up v6.3
>>> https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/.
>>> Please help to understand what is missing to get it picked up?
>> Did you receive email that it was picked up? Lore does not have it.
> 
> 
> No, I thought Bjorn might pick it up before the pull request. But it's 
> not. That's why trying to understand what might be missing from my end.

Then it's not a problem of a pull request...

Best regards,
Krzysztof


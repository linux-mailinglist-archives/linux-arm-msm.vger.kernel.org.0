Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8EB5F28A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJCGqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 02:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiJCGqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 02:46:48 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DE832077
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 23:46:47 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c4so202067ljj.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2tVQpUJpmbKtrPXhPjqRTAdA3Rm2oiD9OFSaFi8ZE8k=;
        b=yI0wJVVP2N4DAVOagSsdSod29/ujUc/oCeH4LACWmRAV8mVc7XCy0jXeWvLmRBG7Vq
         62Nixd2opVvJctw+VTchTAtTNiTtPYq7r8rjraoQNx2EDHBGJp6Prv0uwObZpYao9wP1
         7832PipahvSdz+YRJH7/u3f6KqlF9Qj2rTwONY1LawYm4vAMMVY92+X+1pQaJ9aVw/xo
         TzjAE3Md0NdTGh8FCganuyz6fkw26JDrEnzKF0qK9Fv/ZLlNXuqhyCrjiv28qpT5jjjR
         lP+U19j8hQaQjSDCMfo5LIlUNf8ibkTRlqYvu+fHijqrsF2ky1oNZUXoMhxwbtSr55gi
         dB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2tVQpUJpmbKtrPXhPjqRTAdA3Rm2oiD9OFSaFi8ZE8k=;
        b=GUfTbWT7p8MvAauNnBNPKeeMstUdhqD9X6Xk4DYTWLd2ECKgGGo3aUYknicj1PCco7
         pHMwf8hL8p1gzHInVQgDyKd5B0c9zvRngIJyzo1FHxpkht6ca5jrnOwXyGvyCTS49tpE
         GtERVtWSaOPj0bb6mqT7JU677PbJUYqf3QJv2oQ7TYRbnLS7bPO6kMslv1ToU6s8Lgp2
         LfVo9fB4Qw1Ka7tvOkgBrX4kXw7Nr8JrxYR+us6ZeWXTU6sZNiaEckV1KhticbF7jHjp
         pu/fx6ARvy8YVPCAoCqImmyWYRLi9upomVjK5PjbVZ0D78IwUGC1ytn9QsZnlohyFgdF
         7yAg==
X-Gm-Message-State: ACrzQf0eqXteMGWQ2gh5cO2EqZmNDJhTg0kgmU7PgT3M2fOpCucTRWw0
        2epel3UcCSyn8xSwPxaDuVtVl7iGNcw0ag==
X-Google-Smtp-Source: AMsMyM4R1MavA8WjpnVwp2tQuKzHKLFv4BqmC4HdeD3hQNoBXaIeudIfy0A7B0UzG08eFIJfTvT0NQ==
X-Received: by 2002:a2e:a791:0:b0:26c:4fad:957 with SMTP id c17-20020a2ea791000000b0026c4fad0957mr5783992ljf.263.1664779605571;
        Sun, 02 Oct 2022 23:46:45 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 2-20020ac24842000000b0048b3926351bsm1339977lfy.56.2022.10.02.23.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 23:46:45 -0700 (PDT)
Message-ID: <c391981d-8c7e-ab86-11cb-adde44d568e4@linaro.org>
Date:   Mon, 3 Oct 2022 08:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: mdm9615: drop unit ids from PMIC
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <20220930212052.894834-2-dmitry.baryshkov@linaro.org>
 <b3b2dc79-30cc-a768-e7bb-d5e8ff3f6ba0@linaro.org>
 <CAA8EJpqA5uO+Nfo571qAbQ5KxatsVcp4Mkyxn0h5NR5dEot1eA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpqA5uO+Nfo571qAbQ5KxatsVcp4Mkyxn0h5NR5dEot1eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/10/2022 15:20, Dmitry Baryshkov wrote:
>>> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> index b47c86412de2..bb17a57a2b90 100644
>>> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> @@ -283,7 +283,7 @@ qcom,ssbi@500000 {
>>>                       reg = <0x500000 0x1000>;
>>>                       qcom,controller-type = "pmic-arbiter";
>>>
>>> -                     pmicintc: pmic@0 {
>>> +                     pmicintc: pmic {
>>
>> I think several other platforms, also with PMIC over SSBI, have the same
>> problem. If that's correct, can you fix them in the same patchset?
> 
> It was a part of my previous patchset, but yeah. Let's get it done in this one.
> 

Ah, if you fix them in separate patchset, it's also ok.



Best regards,
Krzysztof


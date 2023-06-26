Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA50473E090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 15:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjFZNYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 09:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjFZNYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 09:24:10 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2916C186
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 06:24:08 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a01so11999965e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687785846; x=1690377846;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/eB5w0T++roZBh+uzEzkt9zkvpr7sL54Saw0syelHU=;
        b=fvGZjS0RQ5WOB7+EjfoCOjhk8WIu9tOqvgFmVBjAPWqv/RghY+6gvFf6SybO54KnSi
         LyXjNyFHn+J7zHaoRS0kv7eFVeXhU6UfJ6Tu/3Is056P+MXQiJlwg1FVIfYfVY8XUHV9
         pNS3eFFVHh+z2e1Ceqt8WwVfEVjkYIWcMR2TLEwJ98PEMwUG4vNcoWl6U6EUFxmL0eDd
         u1slTx/prmSUr7G9iDdUJy+GN2zUmyLQcnI0CVqV+oDiO4Ae6Nd8AW9epIyW8RQ7uyz0
         A1DyPD/a+6RxajK2HD6JMn0AmhrgkivISnwu4PuNJyOsg2aa4vtj5BNDNCsq0Om4QopJ
         +TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687785846; x=1690377846;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/eB5w0T++roZBh+uzEzkt9zkvpr7sL54Saw0syelHU=;
        b=kaYJELt6hhqRI5gDX7DzXGnPGm5UM4Un0L5EwAp/C0Pci1ApyHSUP6XlmJ7ucKNXAq
         1/XlNI7YZUVzvDozTDV13zFk+wk3SqgO82MqiKz6N6qD3BJZjYDPitEp/L4EaZB2vwPD
         ArB563oMlWLRIeGQMvllk7SGH+Y9AEOPdZ3fIsEmik6glvggLPAZ7EzkqOH7RpPweiQV
         UCQXYkx6oCUK4nS7BkXmIW5XowaQq+7VB2/At//zaAWUi8QB2E45gIN/u5GQtQf+xvs1
         pWw7TQ+hjrZmReggLxKFUg0ucKHgYXaJfIgCJhwYAaNut61UE8bDF7djkmptknJkjEYx
         OEqA==
X-Gm-Message-State: AC+VfDyvKUTAJh+JXqLEb49ELaVPDoehH/1LE/5rMEJXjjig7BXpSr/n
        mInib/p52ym4kPQaDdqxMpn/4g==
X-Google-Smtp-Source: ACHHUZ4sPU7y01URWpreF9TFsqUuknCWlTyLtL2t0vKebDsyEz3U1hHoFGyXcoFTZ6qEXhUXVGf0QQ==
X-Received: by 2002:a05:600c:2903:b0:3fa:7fa9:4f9a with SMTP id i3-20020a05600c290300b003fa7fa94f9amr7278546wmd.16.1687785846598;
        Mon, 26 Jun 2023 06:24:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c25-20020a7bc019000000b003f819faff24sm10654601wmb.40.2023.06.26.06.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:24:06 -0700 (PDT)
Message-ID: <593b3b3e-7613-734d-91a9-9a48bbe5a9da@linaro.org>
Date:   Mon, 26 Jun 2023 15:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: fix BAM DMA crash and reboot
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20230621143627.189134-1-krzysztof.kozlowski@linaro.org>
 <CTMJRMN2K8AY.20TQJE584A453@otso>
 <7b909a56-1b3d-79fb-0286-b10117982dc3@linaro.org>
In-Reply-To: <7b909a56-1b3d-79fb-0286-b10117982dc3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 14:46, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:32, Luca Weiss wrote:
>> Hi Krzysztof,
>>
>> On Wed Jun 21, 2023 at 4:36 PM CEST, Krzysztof Kozlowski wrote:
>>> SM8350 HDK and MTP boards were silently dying and rebooting during BAM
>>> DMA probe:
>>>
>>>   [    1.574304] vreg_bob: Setting 3008000-3960000uV
>>>   [    1.576918] bam-dFormat: Log Type - Time(microsec) - Message -
>>>   Optional Info
>>>   Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
>>>   S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.0-00637.1-LAHAINA-1
>>>   S - IMAGE_VARIANT_STRING=SocLahainaLAA
>>>   S - OEM_IMAGE_VERSION_STRING=crm-ubuntu77
>>>   S - Boot Interface: UFS
>>>
>>> It seems that BAM DMA is locally controller (not by firmware) and
>>> requires proper initialization by the driver prior to use, at least on
>>> HDK8350 and MTP8350, but probably on all boards.
>>
>> Are you sure that the bam (and subsequent the qce) actually probes with
>> this change? From reading the code I don't see how the bam should probe
>> without either qcom,controlled-remotely or qcom,powered-remotely but no
> 
> Why the binding does not require either this or that? Eh, buggy stuff...
> 
> 
>> clocks supplied. I think the probe just fails with this change, right?
> 
> I will need to double check. I was happy enough to be able to boot my
> device instead of having crashes, but indeed it would be nice to fix it
> fully.

You were right and my patch is not correct. I checked downstream and
there are no clocks there. Therefore I assume something else is wrong here.

I will send v2 disabling this.

Best regards,
Krzysztof


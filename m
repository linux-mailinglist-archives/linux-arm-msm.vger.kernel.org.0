Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEDF65BC89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 09:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbjACI5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 03:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236939AbjACI5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 03:57:08 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE951DBE
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 00:57:06 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id p2so15576838ljn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 00:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVam3FPvVcVUPkFARUn9WWGX9bvQ9k6HzVFVKcvWyZE=;
        b=tbfh3qioo77N98XjSFjd7PWy0XS7UHqQ0rnPICB/GFgnLr36lA59Nnhk2zRCgNwf3E
         yZfUrCAVxeP05N4N6KGfR+8H84WM+ckoAFIxPQlFOhVaJEc/2zev65dxW4n2if7eR/RB
         Q76GsIylyfR9RUSXCXRyZyyj94MSAp2Us7ZP+TTLNv+NFUfQXAzu48phTLoc2x1YxADn
         GzPuByvzjlv2WY2cs+5nocxxigfu99C5WmdAmD3ns4tKA1CA2O5w/6BhM2lgeSCWFxiq
         5Dv6IJ3fvjIzabxCErbEWBLQ5C5cFq6iyXb21tkmYiFFkkgIAgh4JdN/yPOb782/X7yw
         kqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVam3FPvVcVUPkFARUn9WWGX9bvQ9k6HzVFVKcvWyZE=;
        b=3oePcxotetqs14Qmu0LZPVZxEFwmQjlB0gavLo4nGwzV9dOyJ+gQRrSvQxCLip3qp9
         +bIspW8tT/GPKobxuNx91xWb2PvwI/p0lXOSyIcUMnxVORUg/LRckXP24YPvjWoRpGXb
         zx6ey9aa6hzqNkRboYKSQA3HeZUhsFAzTDMs72uogP9nv8H8dmMPdvGso0kn3wrd6rWT
         x5n1SdiUnEBbIdQ2izzyk+0NIfsYzTL7pQkXwN+j1QVhbnKQ4r+Q3+pELIz3zHwhBTcM
         pM0Tro1wV/e3Iw48CCrdfWEVuWOagxf+NjVd5QrOunNr9ATgcDmCpuXhfobD0z89EjGJ
         zznw==
X-Gm-Message-State: AFqh2ko+6g5YiDnz5KyAgrNwyu/9jLaO10e4Qh4+CmJvFbrIVPKbsDy7
        zK9QgO/yFC+nUBH/leT8F85KBg==
X-Google-Smtp-Source: AMrXdXsAmGHVUPFl2qLHgz7MtYi89rEbq9xWFBU46j9e11S6S1IWHRAtPUrkkcXlHtb2NXJtGJ+4xw==
X-Received: by 2002:a2e:aa9f:0:b0:27f:cb0c:fd1b with SMTP id bj31-20020a2eaa9f000000b0027fcb0cfd1bmr7425321ljb.8.1672736225351;
        Tue, 03 Jan 2023 00:57:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f13-20020a05651c03cd00b0027fea3a3318sm608902ljp.23.2023.01.03.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 00:57:04 -0800 (PST)
Message-ID: <3267da40-5c53-0b79-fd65-3009ee17c7ee@linaro.org>
Date:   Tue, 3 Jan 2023 09:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom,sc7280-lpasscc: Remove
 qdsp6ss reg property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1672407799-13768-1-git-send-email-quic_srivasam@quicinc.com>
 <1672407799-13768-2-git-send-email-quic_srivasam@quicinc.com>
 <0d225fb0-7bc7-4de0-0f07-039502926e6b@linaro.org>
 <ca053156-7da1-f0f4-e23c-7c515a1e6afe@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ca053156-7da1-f0f4-e23c-7c515a1e6afe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 06:51, Srinivasa Rao Mandadapu wrote:
> 
> On 1/2/2023 9:33 PM, Krzysztof Kozlowski wrote:
> Thanks for Your time Krzyszto!!!
>> On 30/12/2022 14:43, Srinivasa Rao Mandadapu wrote:
>>> The qdsp6ss memory region is being shared by ADSP remoteproc device and
>>> lpasscc clock device, hence causing memory conflict.
>>> As the qdsp6ss clocks are being enabled in remoteproc driver, remove
>>> clock controlling in the clock driver.
>>>
>> That's an ABI break change. You cannot just drop it because the driver
>> will fail now to probe with old DTS.
>>
>> This ABI break (and Fixes tag below) requires extensive justification
>> where is the bug and how it affects users. Otherwise, I see no reason
>> for ABI changes.
> 
> As ADSP path is not used so far due to various vendor requirements, we 
> haven't seen this conflict till now.

The device is used in sc7280.dtsi (and it is not disabled), thus it is
available in every board.

> 
> Actually, in the below commit,  clock handling in remoteproc driver has 
> already up-streamed by Bjorn.
> 
> If we add PIL device node and use remoteproc driver, qcom_q6v5_adsp.c, 
> it's mandatory to remove it from clock
> 
> driver.
> 
> Also the memory region is used by clock driver is part of 
> LPASS_QDSP6V67SS register region.
> 
> Here is the commit 0c6de4c299cc8f3283c38f3778777e00ed7e4b69 
> ("remoteproc: qcom: qdsp6-adsp: Add support for QCS404 CDSP")

The commit introduces qcom,qcs404-cdsp-pil which is not used in upstream
DTS...

Anyway none of the reasons above explain to me why ABI has to be broken.
To remind - valid reasons are usually only: "it never worked" or "I was
introduced recently so there are no users".

> For ABI Break resolution shall I include, device tree changes also in 
> this series? Or Could you please suggest better approach?

Lack of DTS changes causes upstream to be broken. This is independent of
ABI break. ABI means supporting users of the binding, so firmware, other
OS, out-of-tree DTS users etc. All of them are broken.

You need to keep backwards compatibility.
Best regards,
Krzysztof


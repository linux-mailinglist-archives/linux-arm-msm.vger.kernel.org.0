Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3586020D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 04:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiJRCGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 22:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiJRCFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 22:05:47 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2DE1A3B2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:04:23 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id i12so8535067qvs.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVyi5PVQNv3F8w1xp80kMe6Ib2NG2Y9FxoJE2eHyRKY=;
        b=m+Kx4QpA01PKOOmGYOtlKOXg51ZtAxVOUFbJDmNiax8aHQSYpsTt6k1kGkTcOzMFOD
         QHZ+E4l1/AmC3bHBW1iLGDfovOq9tsW6+0bsosKcdvbdcM95X2oAfrKGoXKUMsOyWv+S
         UXnUJLzahnGg9tPcbwyGWCTuIF47GGGdTvkEuzDwKwH4DKhS0gTp7fxhb9CtlMCy29Nb
         NH5gSCUugnN3/Wb7Swcumm9HXDlCh+vtRgHAMbQOAFK5QeG0FljVTx1bLUz1YB8v5rHk
         yZjImxMTehLQ97fSMfua6VBhXCEDMsHTAS3Ug08P4NbW+VbZ6GXioA+TXGFLFUac7fXa
         SWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVyi5PVQNv3F8w1xp80kMe6Ib2NG2Y9FxoJE2eHyRKY=;
        b=risaRCkvrMqgiP2bxHkH9tzsq0CHYZuMFjZ968zBJgR4zjBD25/r5drmPiiiCi7aru
         R/4/TptSPyTa2zUGhkL5RI/WXmHIEyIlV5siF3Z0cF7L0XQNlcwZefLz8/G98+Uo9B+y
         +O4uBQw1bQqoswJGJejeOobcEjxDZY8d+dnIAYToTQxnda/XhAs67ecaPNA/UTDKW+FW
         dxQLdbD4OW+lPO6fR92mS3gTyIerxWWOalNn+5YKmxukKAFZvuJmJU0itX424aJ+QfUf
         P4N0EDVkjtbKMTusLKXc1Ze6TKyjbEzJ29QFGs0ccoUJRYeVUk+5wKmV/dvn6hIolign
         VG2g==
X-Gm-Message-State: ACrzQf1zGDJdAKJbyjG65tp5INg82ZVbExtUhHiX2AhXZR+ZWKuZnTrw
        1dn22ezEwkmyyqaeUeymbGSlhA==
X-Google-Smtp-Source: AMsMyM5aCAXfdkRU0CwAatX5ppnsMYQaVnFvVFTGbW175A9gq2nXM1rYqsYorG+7SqvmRcRMmJf7rQ==
X-Received: by 2002:a05:6214:20e2:b0:4b1:77b6:1555 with SMTP id 2-20020a05621420e200b004b177b61555mr437967qvk.51.1666058647826;
        Mon, 17 Oct 2022 19:04:07 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m21-20020a05620a24d500b006bb82221013sm1315824qkn.0.2022.10.17.19.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 19:04:06 -0700 (PDT)
Message-ID: <cef4dea2-9892-971f-5dbc-62eaac478d62@linaro.org>
Date:   Mon, 17 Oct 2022 22:04:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: add samsung,starqltechn board
 based on sdm845 chip
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221012185411.1282838-1-dsankouski@gmail.com>
 <20221012185411.1282838-2-dsankouski@gmail.com>
 <99652775-8921-9d4a-193e-20d1487e6759@linaro.org>
 <CABTCjFDDEhNo0OVk+87kU93xwvXNR3tMuinfLXzZ6PeyweCpag@mail.gmail.com>
 <8c773f11-1c00-1856-daa7-250a4ec37d23@linaro.org>
 <CABTCjFAajiT7QpyA9mG7i4XzWxtLsvRsDLPtWTvwmJbMYEr1SQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABTCjFAajiT7QpyA9mG7i4XzWxtLsvRsDLPtWTvwmJbMYEr1SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/10/2022 04:02, Dzmitry Sankouski wrote:
>>> I've been told it's easier for maintainers to resend all patch series,
>>> even if only 1 patch from the series requires change. So I decided to
>>> keep versions equal in all patches, to clearly indicate those patches
>>> are from the same series. Please, correct me if I'm wrong.
>>
>> This is okay, but you wrote here there was a v1 and v2, and you changed
>> nothing against it. If there was v1 and v2, we would ack it, I think.
>>
>> Or this changelog is for some other patch? Not for this one?
> There's no previous versions of this patch, since it was born in the
> v3 patch series. The empty changelog for this patch indicates that
> there's no point to look for previous versions. I think I'll do it
> differently next time to avoid confusion - just a sentence that vN is
> the start version for patch.

Yes, please. Something like:

Changes for v3: New patch.

Best regards,
Krzysztof


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DB5566CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 14:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbiGEMUZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 08:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237494AbiGEMTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 08:19:17 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F01D0EF
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 05:14:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j21so20269716lfe.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=eL+08v8Oi5zgvZaTmHJaJqmfpDb3pg+GRYdgzapfaeA=;
        b=IlbN2EKy4yQqYZ6TvuHxuB4Brfc58jz2COGInOXdqWYrxosn56LD8j38tIpCLG+ifF
         O4hd4lyK4J+FilFcGOge/0dt6N2OQ/8ClL09bZ1CTBK5jhppv/EUnvSV8jitc1OMFVqh
         0V3GML79t3b42q12UUevZQ30e/m4KFt2PwjMWBMNJQhYow/6/kD4dmrRovGPowydnBdo
         CsRijzBCJLV0+witJNk/3iPbzuM7Px2532fhidb2oljMhB2bwptWF+dafPlMb9jt08M9
         F04VWDAC2OdUnbcNOuzOr6Y2UaKVUYwPCjBZht6u6QvbU/+zKAr45qwH0yH/XyAnDS0U
         42MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=eL+08v8Oi5zgvZaTmHJaJqmfpDb3pg+GRYdgzapfaeA=;
        b=C3KhdVA3VG4KKL4dywMNQKPKy9rin5auWMYPJezCpy48Ud8dFoTug163fPB03Ix1hF
         aljOjK0iI9ittEU35Tuj5MxagP7Uz/Aj3XDIuAU4TbjJm2YM27StuIbiomkAgE5Wa4AC
         cd8KDiKtPqWmY+53rd/twqGxaI9J7KVwMMn0KIg11ml7F9gz7DyLgCA+vO43Sw9gyQbC
         tam2XLRjae51KOFNckQ4fzJuJVYUIyJ+18IsXz4tsppLew0eBHRrfiUIYLONzD0UGfxL
         yupHtZASNSi6HsOrt5v5EzUc6Vg9lZqgyudDIGLmD+L6kqMYnUMcD/0euQXHl/5e7WPz
         s++w==
X-Gm-Message-State: AJIora/5vTv6eaX27CkMIP/9sn577fJteDd0yC+b7KIjLw30WQioiwZ/
        12/1jgn3/tbLXRZz3Z/fVjtrl5nd+xXKsw==
X-Google-Smtp-Source: AGRyM1s/yOEIUzQU+X3pSlzpw0EltRXDz7KCK5C05eZnuBOHpHDEuKwOWuFuqLLMSl7dgCD4X8Ap2w==
X-Received: by 2002:ac2:4c19:0:b0:47f:9f39:768c with SMTP id t25-20020ac24c19000000b0047f9f39768cmr21990330lfq.285.1657023290040;
        Tue, 05 Jul 2022 05:14:50 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id t15-20020ac243af000000b0048295a41b0asm1990198lfl.302.2022.07.05.05.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 05:14:49 -0700 (PDT)
Message-ID: <57aca768-18f4-6b79-9490-c57123d71232@linaro.org>
Date:   Tue, 5 Jul 2022 14:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] rpmsg: qcom: glink: replace strncpy() with
 strscpy_pad()
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>
References: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
 <640d2a3d-4c38-b921-45c1-048c255b5a9d@linaro.org>
 <d4972a70-8ddf-a394-3e8f-08fb778622d8@linaro.org>
In-Reply-To: <d4972a70-8ddf-a394-3e8f-08fb778622d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 20:37, Krzysztof Kozlowski wrote:
> On 09/06/2022 10:56, Krzysztof Kozlowski wrote:
>> On 19/05/2022 09:33, Krzysztof Kozlowski wrote:
>>> The use of strncpy() is considered deprecated for NUL-terminated
>>> strings[1]. Replace strncpy() with strscpy_pad(), to keep existing
>>> pad-behavior of strncpy, similarly to commit 08de420a8014 ("rpmsg:
>>> glink: Replace strncpy() with strscpy_pad()").  This fixes W=1 warning:
>>>
>>>   In function ‘qcom_glink_rx_close’,
>>>     inlined from ‘qcom_glink_work’ at ../drivers/rpmsg/qcom_glink_native.c:1638:4:
>>>   drivers/rpmsg/qcom_glink_native.c:1549:17: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>>>    1549 |                 strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>>>
>>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes since v1:
>>> 1. Split series per subsystem.
>>
>> Any comments on these?
> 
> I sent first iteration in May, then on 19th of May. There is review from
> Stephen.
> 
> On 9th of June I pinged but the patchset is still waiting. Anyone minds
> me taking these?

Hmmm... These are all fixes but wait for quite a long time. Shall we
make the rpmsg subsystem orphaned?

Best regards,
Krzysztof

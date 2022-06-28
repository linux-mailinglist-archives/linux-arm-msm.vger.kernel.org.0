Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F19755C53B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243539AbiF1JwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 05:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237556AbiF1JwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 05:52:17 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826EA2D1EA
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 02:52:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id f190so6706910wma.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h0dx8b2m9emaFg28RzQYMub6uEPgbsswWWeNTpjU7qQ=;
        b=yGhCsGSHTA94c6E1fD9v92SudyesEEv8gdzs/101JV5D0Ff9ufUgbZQdcj9G2EoTi4
         XQT2FgGPEbIgNV9KQ9HTch9hvUBUyMlDn4BaeB610u61u0UZDM80Xa3uoWKCOhRk3IdP
         3/PyKzFXM7oeZ8XPWzKEm16LTWp6DTY9zbaCesElDFH1UH2Iwc+6Lqy6vmcDZnqes1hK
         RQPrPypCIzpdUYbuwXuAiyP2iEx9DCkut2nyzMEbEBicIwSzwXe04Ue4QRv/m6BZMeQ0
         nBI2o2nfxEWhHYfg3ak56VKsstMzUevktyKDeh+DRgK7XIbeVRWsSN2YO9hFpB7bBuLB
         C4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h0dx8b2m9emaFg28RzQYMub6uEPgbsswWWeNTpjU7qQ=;
        b=dmvlTB3rLjI8xgULduaz5ani1WMpHdIj3yan9Yy05kvh8WjOlRKII8Al6ojRjFfpMO
         aUtItrakOmvCBlLjuOodL3uN4D2ksAuMNNAoJwSqLrMi18pm+8M0XVxj8dDidfmly5FH
         lV0YI5yw0b32rgMrsH4ElOlADEZwVtvR5ZFiSwQu5oAkBDEMT4WG51EESG9Xu7WOEkuV
         J0Tln1UqKrPPi8BIrVAtiA+ZX8TxwgKG2lR8laW0wh+Dxx+stOEOfLAa2deHuL/5Jtay
         un4RRIaiQwqFRuMOJfnvsnNanGcs0WQdlsRhP+th2GO9KkDu4PW4Zu8/3L4fTt3iVk7q
         alkA==
X-Gm-Message-State: AJIora83Ml9vHmWXKPExfBUTQemwPziflfzG7Z0bW1eGvvVkiuoq2JaZ
        gSw0P6RF9pgAuVL/rXCCX9qSiA==
X-Google-Smtp-Source: AGRyM1uapA977RluRFtVzd0TSebkEw2JE1FoN9JKJR+3Yxjz50DUatvzSM6CR/sdeF92mRVFkjDrOA==
X-Received: by 2002:a05:600c:3d10:b0:3a0:4956:9a84 with SMTP id bh16-20020a05600c3d1000b003a049569a84mr12695330wmb.133.1656409935070;
        Tue, 28 Jun 2022 02:52:15 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c304800b003a04b248896sm5853940wmh.35.2022.06.28.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 02:52:14 -0700 (PDT)
Message-ID: <575ac859-377d-8ce0-70e0-827a3d75baca@linaro.org>
Date:   Tue, 28 Jun 2022 11:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] soc: qcom: cmd-db: replace strncpy() with
 strscpy_pad()
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220519073301.7072-1-krzysztof.kozlowski@linaro.org>
 <CAD=FV=VQ_O2eH2+bnEegOQuBmqMhD7ixiRV3=ukuU9SnPaBSDA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=VQ_O2eH2+bnEegOQuBmqMhD7ixiRV3=ukuU9SnPaBSDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 01:06, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 19, 2022 at 12:33 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The use of strncpy() is considered deprecated for NUL-terminated
>> strings[1].  Replace strncpy() with strscpy_pad(), to keep existing
>> pad-behavior of strncpy.  This fixes W=1 warning:
>>
>>   drivers/soc/qcom/cmd-db.c: In function ‘cmd_db_get_header.part.0’:
>>   drivers/soc/qcom/cmd-db.c:151:9: warning: ‘strncpy’ specified bound 8 equals destination size [-Wstringop-truncation]
>>     151 |         strncpy(query, id, sizeof(query));
>>
>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Split series per subsystem.
>> 2. Add tag.
>> ---
>>  drivers/soc/qcom/cmd-db.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
>> index dd872017f345..c5137c25d819 100644
>> --- a/drivers/soc/qcom/cmd-db.c
>> +++ b/drivers/soc/qcom/cmd-db.c
>> @@ -148,7 +148,7 @@ static int cmd_db_get_header(const char *id, const struct entry_header **eh,
>>                 return ret;
>>
>>         /* Pad out query string to same length as in DB */
>> -       strncpy(query, id, sizeof(query));
>> +       strscpy_pad(query, id, sizeof(query));
> 
> Sorry to report that this breaks booting on
> sc7280-herobrine-herobrine-r1. 

Sorry to break booting and thanks for the report.

> I believe that the function was
> actually _relying_ on the "unsafe" behavior of strncpy(). Specifically
> I think:
> * The source string (id) was a '\0' terminated string.
> * The destination (query) was a fixed 8-byte string and doesn't need
> to be '\0' terminated.
> 
> So before your change we could actually support 8-byte strings. Now we
> can't because you'll only copy 7 bytes to the destination to leave
> room for the '\0' termination...
> 
> Looking at printouts, I see, for instance at least one ID that looks
> like "lnbclka2".

Ah, crap... I did not expect that.

> 
> Given the requirements of this function(), the old strncpy() is
> actually _exactly_ what we want. Is there any way to disable the
> warning? If not, I guess we could make "query" be 9 bytes bit, or
> "sizeof(ent->id) + 1" bytes big... Happy to post a patch, but it's
> basically a bikeshed for how you want it fixed (there are dozens of
> ways) and I'd rather you just tell me instead of me guessing.

If the source was not a string, I would propose memcpy(). Since it is a
string, I would prefer to have safe copy, so increased size. However I
see you sent now patches, so let me actually respond there.

Thanks for the analysis, much appreciated!


Best regards,
Krzysztof

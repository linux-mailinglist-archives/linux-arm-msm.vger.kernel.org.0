Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3000A76415C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 23:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjGZVpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 17:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjGZVpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 17:45:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999F0FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:45:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe0e23a4b1so425244e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690407930; x=1691012730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OI9rfaCd8Sb0V/MSoJvSxIu6W33z9/KDlVvMfFsQ31U=;
        b=IGutNdAdDqmmW8BuVEtVQG2sY2tZ7vYpmRHmP20glt9uf9fQcQG+Z8Y51xZlIlJbBz
         BUKBnCkGPwvbQaz5g+VFz7yk1z8VLcb93vWi9c8xc77nfwg/hYaNzA8h1pxn9QJ540n1
         y0gPqHnhWjVGnxjw7F2YJQGQ/cmOeqwg21lXml08D/nEA01gP0BJ2f1miI3sMvNc8LMv
         SjWdXZE8V94FwtoaduKOQgyAdNs0cHAnxf9jPgaqy1k5GInNqY8lGSwN2SlfFzuVBDwi
         nqHCyJbBjY5neoBRA0A8uGWSGgTUG00WO29wJm9cgOG13xkniC8QjCdXDzsJE1Fl22ew
         vHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690407930; x=1691012730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OI9rfaCd8Sb0V/MSoJvSxIu6W33z9/KDlVvMfFsQ31U=;
        b=Lrq/9KM13ZV2L10QJaRcCTAaiZxa1VD0jbqi/xQ2u6hQ1E5IxXn7EBLZe4xlu8B/dO
         Q4Zamkj+82kDwFjgY1w2kzfNheJ/4OzeusivV5y5YbFWZNw6xKfMvbyAzfwHlw7qwCCe
         rQxPwxEnMFzYcZS0iM/98nyfobLwIK8IQwPjxroQb+0KzJQuREowWGXchVsf2EfFCkMZ
         SaUpivg5Zr6CFVunc9i8LFURvPTQyXPpGJro2B5Q7FnLcPP7LL0tLi19FO5mJ5Wl9ENU
         1wYoT17jvPQMN3ynVIzqp+aHzhwyRNdPr3QPBGj7T6ovcycmn1BUsgC7/BePfzr2j7Jx
         tnvg==
X-Gm-Message-State: ABy/qLbdfXsmYCuWPs4uapkC9QTgs/GzHVwo33h17bSzcG3KnT4+7H9s
        alAOAE5GrFvRiAZYalz6MpCePA==
X-Google-Smtp-Source: APBJJlGEMliqQqZmf6e7t7gnzFcTrok+yCdeHlSTbva+vvcK1+HpVnAcDQsqUNp8JJIACffMd9u+Rg==
X-Received: by 2002:a19:504c:0:b0:4fd:f7a8:a9f3 with SMTP id z12-20020a19504c000000b004fdf7a8a9f3mr309758lfj.38.1690407929699;
        Wed, 26 Jul 2023 14:45:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d13-20020ac25ecd000000b004f9c44b3e6dsm2545lfq.127.2023.07.26.14.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 14:45:29 -0700 (PDT)
Message-ID: <f37d1a3e-93a0-c9f1-59c6-963fe7e27a22@linaro.org>
Date:   Thu, 27 Jul 2023 00:45:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Freedreno] [PATCH 12/12] drm/msm/adreno: Switch to chip-id for
 identifying GPU
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <ab9f2c65-deb4-1762-4a32-a7046608311e@linaro.org>
 <CAF6AEGtqw0Pj42jucV7H==81WckYQZxBLSwb_ksB+=6pFmC6fQ@mail.gmail.com>
 <b9806e33-2094-dd4b-ec63-06dd8dbbd224@linaro.org>
 <CAF6AEGvGUpte3KJqXE=dVrTf873XZ61xkgeQj+CxRTweETBxyQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGvGUpte3KJqXE=dVrTf873XZ61xkgeQj+CxRTweETBxyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 00:44, Rob Clark wrote:
> On Wed, Jul 26, 2023 at 2:38 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 27/07/2023 00:37, Rob Clark wrote:
>>> On Thu, Jul 6, 2023 at 8:45 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 07/07/2023 00:10, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>>     /* Helper for formating the chip_id in the way that userspace tools like
>>>>>      * crashdec expect.
>>>>>      */
>>>>>     #define ADRENO_CHIPID_FMT "u.%u.%u.%u"
>>>>> -#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
>>>>> +#define ADRENO_CHIPID_ARGS(_c) \
>>>>> +     (((_c) >> 24) & 0xff), \
>>>>> +     (((_c) >> 16) & 0xff), \
>>>>> +     (((_c) >> 8)  & 0xff), \
>>>>> +     ((_c) & 0xff)
>>>>
>>>> So, we still have some meaning for chipid?
>>>
>>> Only enough to do the inverse of what userspace does when parsing
>>> devcoredump to construct chip-id.  Basically it is just a different
>>> way to represent a 32b #
>>
>> What about passing it in the direct form? The macro adds assumptions.
> 
> It is uabi
> 
> I wouldn't call it adding assumptions as much as just a funny way to
> format a number.  In some cases it might work out to something that
> vaguely resembles a marketing name (6.3.0.2), in other cases it won't
> (12.34.56.78).. it's just formatting a 32b # to match the way existing
> userspace parses it

I see. Sounds fine then.

-- 
With best wishes
Dmitry


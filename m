Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F371E6A7FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 11:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjCBKax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 05:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjCBKaw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 05:30:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE1B3347B
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 02:30:51 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bw19so15978243wrb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 02:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677753050;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HwOZUGKJ+t9xe2A8iPH5J+XMLtNu9Kocbw3QWISBg/Q=;
        b=rnUUn5sP1r2EjF/AbEZsiOH35KiPKcSVRw3zrhLUi/h8WCInyq69fZaYpbfyMcffpz
         ZSKqKfmeWal1hMaCy5AyFUeKaB+h3upCXVHiMEnd60uRBJ3ewsLz4lAB7cr9x8TjiFMo
         i8bnNrg5K+UtjIMty7JgeQrVdDhlRu3+GTYXkPslUXSr4gsJSXCjAz67lSJ/s+Q3k9hD
         PkEDe/4CBsipCFOlWGzRqinqu4F71vZUSgXjjkUvGe346mUeVKoBKfwoaE7RaOy8/O4K
         m/GgU876uW2RO3BqBZQLn0v9MxFspvNZJbSTYMcfXr6koV8G36p89HFLNuVzsbqh+goB
         VjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677753050;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwOZUGKJ+t9xe2A8iPH5J+XMLtNu9Kocbw3QWISBg/Q=;
        b=RU9crkg4kaNMUdC8rMStum3biMcF+wipqY+4fjS+qCr3ZvVdifUzWOcrIlkbaF7xqz
         CRro9DPSgi2Y6Bv5IH82xrXpxjln1YE5BTg7MOF+BpFm0WXjyR8pMQrPn3VRKrDSAbwp
         ECm1NAmR4pzQHs5Dytk82lqE4Nn/1RKv/QlINsXHwsg2Sjqiq5MYgLlqWlxrl0PH2wXT
         w71yCExJr7ofmoGnfOXb1Tj/66lqxREMeNoOBk2nTpNSj/GFO8DSs+Pm1HX1Pnp0W/W9
         JkgyAU4472zp9NCPBTzNHoJU+j2V+Zio3WcWjwsOVE1ysBNssHOnrmQgRxVZnvcbjjLC
         GL3w==
X-Gm-Message-State: AO0yUKVALePOctS1ZRdHl/rtiBN6z6mGHjnjzNGmzo50riP7SsKFczHY
        eqneblCDGVjsnHIbHWlqdgXPBw==
X-Google-Smtp-Source: AK7set9kQJz6aP9As/ms2j7f0QJlW4EWyc4zj5sDWLQQCRQzwb0ak3Hc3kqXRa2Z8yAId/FNkIDm/g==
X-Received: by 2002:a5d:40ca:0:b0:2c7:4ec:8d79 with SMTP id b10-20020a5d40ca000000b002c704ec8d79mr6613894wrq.21.1677753049937;
        Thu, 02 Mar 2023 02:30:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:217a:db24:fe27:6b35? ([2a01:e0a:982:cbb0:217a:db24:fe27:6b35])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c54c92e125sm15031866wrt.46.2023.03.02.02.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:30:49 -0800 (PST)
Message-ID: <583403fa-c104-42ad-c628-cfcb8da5eb05@linaro.org>
Date:   Thu, 2 Mar 2023 11:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as maintainer for DRM Panels
 drivers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagan Teki <jagan@amarulasolutions.com>
References: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
 <167775297427.128880.7902941265688645008.b4-ty@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <167775297427.128880.7902941265688645008.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/03/2023 11:29, Neil Armstrong wrote:
> Hi,
> 
> On Wed, 01 Mar 2023 10:47:35 +0100, Neil Armstrong wrote:
>> Add myself as co-maintainer for DRM Panel Drivers in order to help
>> reviewing and getting new panels drivers merged, and Remove Thierry
>> as he suggested since he wasn't active for a while.
>>
>> Thanks Thierry for all your work!
>>
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

It's a typo from b4, it was applied on drm-misc-next.
No idea why b4 uses drm-misc-next-fixes, the commit isn't in this branch...

Neil

> 
> [1/1] MAINTAINERS: Add myself as maintainer for DRM Panels drivers
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4ddeb90d602ac58bcf99924eb34d8b2f820ce11d
> 


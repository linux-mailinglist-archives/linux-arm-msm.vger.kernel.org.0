Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE0877D4CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 23:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239995AbjHOVHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 17:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239981AbjHOVGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 17:06:50 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8544610EC
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 14:06:48 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so59000185e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692133607; x=1692738407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pm/+S7GL+s6rxl0CrepE+RJtzi+4NNC4FV8XfAplmZs=;
        b=seUYquo5i1CaxnnpikjNxyne9ePL9rIeTdCMDV289jgplV7+bxRaFgGknqzS/9xIef
         /Eo+CqC0AH5gxlEPjjATV4Kw475/fHfJHpwOvmNxRQF3w9apc1gQXapo8rPtwAzDINF6
         y3Z7ns0IfcluxYkaIB7E/Bg44jCahRyi4PYNQWDJXYBd9e0JuOVkymXk4U0yFFbdzANy
         64Pp6TN4IJxfPQD5sWIgHJFjasbhOP7Z/7kpWsfICNFlMogZ/vQiti4G9BK7GFFhPmgu
         SobQcbYrHM+nX4EobDAt1i52HaXJAk0cRyyAYFVAt1/7RhP3CtPOijFH8psnjZcptp9G
         /uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692133607; x=1692738407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm/+S7GL+s6rxl0CrepE+RJtzi+4NNC4FV8XfAplmZs=;
        b=GFrBhaio3xkNOINXpxfTVVSZSNREiuFvQcGYxT9SB3YgMC+78JVoSRjDmNibqnOE0D
         3NyMk14IS3WULBCy4bCSIjpNv2HqOBYM2QpxkJryCMEFiBs/rgPmrXmWtQ1/ljyVSB6+
         xgZ758bbgWUU8RiQ/7OP3iH7R+bJwF2morg/yoD6CniLgmr1ZHB5K9gcN9SYxxx3BLzP
         O1ZzX2FRTLc40erGC7BrsZsXgrc6T74V4TwD3uhBv4zHXN+Ur0e5rxlZ1B8JorcVi7V3
         nhM58YVot0O4DvHFrswi/8YBXtoiU/OUWkBqm8o8ko2QFWq9fcNOmSmkMlnk1DZYy52g
         VKbw==
X-Gm-Message-State: AOJu0YxvwAihldbd0V1Y4i/dBD7KOAS/UJxEwz5fktnPouXnNWqm93ym
        JiPvyrxMfyypuGHuV1MH1L1nJw==
X-Google-Smtp-Source: AGHT+IGcod8rWFDnxW8A0sFUMzg4nVn9IHR6hKqRw5l8a134zB6nlVl1dQaEh1dMFoV0X3nuoh/Qqw==
X-Received: by 2002:a7b:c449:0:b0:3f8:fc96:6bfd with SMTP id l9-20020a7bc449000000b003f8fc966bfdmr11017146wmi.17.1692133606905;
        Tue, 15 Aug 2023 14:06:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c00cb00b003fe29f6b61bsm18871524wmm.46.2023.08.15.14.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 14:06:46 -0700 (PDT)
Message-ID: <4d94d0fd-72d4-0196-3a30-3e1efb9f5aca@linaro.org>
Date:   Tue, 15 Aug 2023 23:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 0/1] Add add-maintainer.py script
Content-Language: en-US
To:     Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        quic_pkondeti@quicinc.com, u.kleine-koenig@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <cover.1691049436.git.quic_gurus@quicinc.com>
 <20230810185526.GC31860@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810185526.GC31860@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 20:55, Guru Das Srinagesh wrote:
> On Aug 03 2023 01:23, Guru Das Srinagesh wrote:
>> When pushing patches to upstream, the `get_maintainer.pl` script is used to
>> determine whom to send the patches to. Instead of having to manually process
>> the output of the script, add a wrapper script to do that for you.
>>
>> The add-maintainer.py script adds maintainers (and mailing lists) to a patch,
>> editing it in-place.
> 
> Could I request reviews from the other maintainers as well, please? Just to see
> if I should continue working on this script or if the `b4` tool obviates the
> need for such a script.

I send a bit of patches but I use very simple workflow. It is really
simple, so simple, that I was always surprised how people can make their
life difficult with some complicated process to send patches... and then
obviously skip some maintainers, because of that process.

I almost always feed git send-email with addresses from
scripts/get_maintainers.pl. This tool would not bring any benefits to my
simple workflow.

For newcomers, OTOH, I would either recommend simple workflow or just
use b4. Why? Because if you cannot use git-send-email, then it means
your email setup will make your life difficult and adding maintainers to
existing patch won't help you.

This tool depends on the command line and shell interface of
scripts/get_maintainers.pl which is another reason why it might not be a
good idea.

Best regards,
Krzysztof


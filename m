Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F251A52CCBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 09:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiESHUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 03:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbiESHUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 03:20:15 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B386D951
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:20:13 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s5so5146910ljd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=MyN00H0AAHdVbEPk8MqkMpOUB3GN5DrgU7tBv4l/npQ=;
        b=RSgpavvh3DC2RpuHIgRs8SFTYZApS7c3lPT/5frLIn94k/Kp4TuNS6sxEvoO1wBRa9
         2iMiqxEABzO60mcTBEpQtbRwhSINdFsFF/6pW/9Vl4b2fQFI92Kql0tz/8JJWDgVLHu4
         bWy0jZaLsoKyRJwGkfgdsMaD9kZTFXmkjtwU98fr3Cr0QT+JFuDUZR3HZprn98yWJu2H
         U9pX6xC6SaqJ7h/QEoHL3cGZOB6Qo0/oAxdEjCfoh5Q0MvvRYgtQ4JgcBcVapI0xOi9d
         PaSHPy5GRCr6erDnJpO9OgeQ1rzpApjEHbH4ASILxd4EJEF+mTnyibcX8bzz5/2O3Bxd
         E6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MyN00H0AAHdVbEPk8MqkMpOUB3GN5DrgU7tBv4l/npQ=;
        b=jh/eqS+zFrcSPDXubCCcXCVAaS4ik7AAOJvJxfwO8AKA/kGlSgLo1Rwfborcvf7Ifw
         fVJ4Jar4T72AC4D28cOJlTMSUl/qfIPJ1esfoI0DGUXkPUP3aKHg+NtWuKryO9Hyv6Cn
         hHgAQsJfWdlv9rR68rZvJwp47++yC3PbCkA8aquAkBRZbtiggjexY4O7uJsNDgbcLgVX
         EcHbqta1OKS3Zj9tYW1R70q2/B+gTqtDKfJVx0z7eIxMivrZzuaMf6ZShM1BxMj44qif
         6O/r1sflo+jKXOg9/XFRDK+ts/0oVMYxrzzguUhDZMYfw4nkScKAp7Lvc8kMxzs2baql
         Oi0g==
X-Gm-Message-State: AOAM530Fw9wZvwSGD18TBpkUXvKZoXqP9mRqoYsbVp0eejAGmJvcP7we
        UNJBBPhb1QiHMtCSlyWzQYSBtA==
X-Google-Smtp-Source: ABdhPJy5N2odINfCGAMTWNYt9jH0z3r1UunAfx18GA400F0Lk5lDnsync0ocmjR+VZbSweA5uu9Hug==
X-Received: by 2002:a05:651c:2318:b0:253:bca4:2724 with SMTP id bi24-20020a05651c231800b00253bca42724mr1842127ljb.188.1652944812179;
        Thu, 19 May 2022 00:20:12 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b0047255d211ebsm179322lfr.282.2022.05.19.00.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 00:20:11 -0700 (PDT)
Message-ID: <f6c08b8b-0835-1856-3686-aa606689cb33@linaro.org>
Date:   Thu, 19 May 2022 09:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
 <20220519000244.84F87C385A9@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519000244.84F87C385A9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2022 02:02, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-05-01 03:35:13)
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 4406cf609aae..969d98fca5df 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
>>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
>>  
>>  /**
>> - * clk_lucid_pll_configure - configure the lucid pll
>> + * clk_trion_pll_configure - configure the lucid pll
> 
> configure the trion pll?

Ah, copy paste :/


Best regards,
Krzysztof

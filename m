Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB16649615
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 21:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiLKUHx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 15:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLKUHw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 15:07:52 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A747CD13B
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 12:07:50 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id s25so3258662lji.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyNH0hNZh70WbJI+hu94JxsVB+vagkDUD7jGE6QMvLI=;
        b=vUI2KBUW4Yqtr3aN2XBVtRO1Ev4tUuGONyWjJXZVnNUc1Qc0w816xZjsplubjiwCwB
         Gt8u+VmaNR2pqTcFEsMr6JajRYcITHep+SWpP+lKu0zTES6Y97uuDnzaZg/TIJvz82V6
         mPWm+CCCgyGpiPZgyVwKYom2Y1hOn3BcP7jkakjmjG2BwrSe7kZXFCirEEaoZjHpJvbP
         9TI7jH7o8Us//9tep6SSrBFPUKHiAX7aRaovKs8bgCUTlt3sRWV8Ue4o7hNPLJzAL7pu
         yjMUrnYW5sSnntcUzDbrM9su4QySyLi9aM5usxQUICrsyYcar9pQIVun+2MMxxBcF4GQ
         MpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyNH0hNZh70WbJI+hu94JxsVB+vagkDUD7jGE6QMvLI=;
        b=YSL3LhtW3HEREhAJ898Evof9kHoAaozs6v0JSKm7+OPMUL1zP1iml34UH1ptimRTJQ
         KQTBx/Z4UfxMPChvcvySptWvUndZXUYx1zxoGr/hIertU0uvnQd0H6LS+m81Q/K0Wtxg
         YayXUordorkgNOY/RZw+hOMP6Hg3Dc55cgsUU4F2HFDa5xYOJB5l+eVwQaBMzsoxumIg
         gqXcFBDaGN0iH+1Jp7l0bbwyTOs9X0fFNn1QBxBTVNwDLhnk4ji75TzEqXuxEt29tPff
         5kfmQL92ZoJ5lAvt2GlKbhBIbD3emjfmzGunncAowJojI1GrKXDPgQaaNQMrMKKn/LOd
         zCOg==
X-Gm-Message-State: ANoB5pl57g7nYWdxK7f7/hIKYqDqSlQaJacVO71u/rLtfTjiuhvnCuxK
        QmB7Y8ElcuI20lTNrreUdMZH/Q==
X-Google-Smtp-Source: AA0mqf5mvDezw18fihYUWoweev4o8L1BVwBE+VCW9L9hf0EOeb/2tow40NDvW4Jle3kpjQldFcJyGw==
X-Received: by 2002:a2e:be85:0:b0:26f:db34:a151 with SMTP id a5-20020a2ebe85000000b0026fdb34a151mr4287109ljr.20.1670789268982;
        Sun, 11 Dec 2022 12:07:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd23-20020a05651c169700b0027b477e5bdesm519589ljb.19.2022.12.11.12.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 12:07:48 -0800 (PST)
Message-ID: <5795a42d-7920-713a-0d90-df32d657d365@linaro.org>
Date:   Sun, 11 Dec 2022 21:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH] arm64: dts: qcom: Use plural _gpios node label for
 PMIC gpios
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209220450.1793421-1-marijn.suijten@somainline.org>
 <714ac62a-7bab-e16e-e3b6-bdd86e422699@linaro.org>
 <20221210170531.pxoux2kje4vgor5y@SoMainline.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221210170531.pxoux2kje4vgor5y@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/12/2022 18:05, Marijn Suijten wrote:
> On 2022-12-10 11:50:51, Krzysztof Kozlowski wrote:
>> On 09/12/2022 23:04, Marijn Suijten wrote:
>>> The gpio node in PMIC dts'es define access to multiple GPIOs.  Most Qcom
>>> PMICs were already using the plural _gpios label to point to this node,
>>> but a few PMICs were left behind including the recently-pulled
>>> pm(i)8950.
>>>
>>> Rename it from *_gpio to *_gpios for pm6125, pm6150(l), pm8005,
>>> pm(i)8950, and pm(i)8998.
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>> ---
>>>
>>> This was brought up for discussion in [1] but hasn't seen any relevant
>>> reply, unfortunately.
>>
>> This is just a label, it does not matter. Why changing all exisitng
>> files? I don't think it was a part of previous discussions...
> 
> I would've let it slide if it was corrected in the patch that was
> reviewed, but since that didn't happen it wouldn't make sense to only
> correct pmi8950 (and the other bindings submitted or co-authored by
> myself, such as pm6125 and pm8950) for "consistency" - that wouldn't be
> consistent at all.
> 
> To me (and supposedly, to other as well) it does matter.  People keep
> copy-pasting these to to add a newer PMIC and sooner rather than later
> we'll end up with both conventions.
> 
> Regardless, labels are already a mess all over the place, and unless we
> can steer them with bindings or written conventions we're unlikely to
> ever clean that up.
> 
>> To me it is unneeded churn.
> 
> Just like -state and -pins suffix, sometimes even the unnecessary
> -pins-pins suffix?  To me that is the same kind of churn, and *it is

You compare now to node names. The node names have visible impact (name
of devices in sysfs and in system), is affected by DT schema (is parsed)
and should follow DT spec rules.

There is nothing like that about labels, therefore they do not have the
same rules or importance.

I understand that consistency in labels might be good thing... but also
it does not matter. The labels really do not matter, except the code
readability. pmgpio or pmgpios is basically the same readable.

> needed* to keep the bindings somewhat clean, consistent and digestible.
> In this specific case it's not even that many changes, IMO.
> 
> That being said my limited hobby time is probably too valuable to be
> spent on binding cleanup rather than fixes and feature enablement
> elsewhere in the kernel.


Best regards,
Krzysztof


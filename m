Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4606B0AE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 15:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjCHOUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 09:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjCHOUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 09:20:37 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52BA94F61
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 06:20:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so1411189wmb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 06:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678285234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKSsMdFaAlUDx+zY5Z+CZDKUgJ7yUPRW8UQJ4GIn6oc=;
        b=GOh1H2Ul2EM04M4OmgUNtbXzo31UwLSGT/HYmOb55duvYpKr9GLgJd7/c6SICy58qg
         cXSAi5Pw0zxuSRINFh+IYCDziQ9aiQTzf7fgCGlYJ5G1qttavXYDdLODNDO0lD4F1uJG
         xMpZtedQhAmx4u1gYBwWdNTJnWdY2zTkDXZWV6SSbtAezQTjA9XFCRKyaDIQwzxAOLBM
         657zNPGJC9mhUM7Y09c+ZGayHNZugJBpn7BeYPPn/Y0fe9r2sEJQKfZ5PrnDA4mpjRGF
         1qAwtuQ+tptfYkeeMk/Hk173u/GZWFv4wyuYNQCCaPxU03pNf7ohUIosQhRYV18iijJm
         CZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678285234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKSsMdFaAlUDx+zY5Z+CZDKUgJ7yUPRW8UQJ4GIn6oc=;
        b=s8ZyvneJexkVkWgq4eABgheuQMyY7c31W1vl4skgYVgQJq+6VsV1lyaCjQaPdI6Ufu
         E/+vgzjEilWN43BHO3/aFyBtDL3Xihal9kGZ+gqnxyxhyjM/6m99VOhSok0IKoFZc74d
         mg8eG6v9uaMVAw9qBP++DLGjY+HhuHCSvI19bfJcUDWO/ue4lZR0WXTfs2C4tEtBsbKm
         KB0o/Pxx96TaH8ZmzZ9+rBn4ENindCjxJq1YIRz6Qx9UI84vA1yo0Pcv0P8Wc9Desf62
         2JO1NUWqUacSmuHZU6gCMXzYeCmoVvWzlOBIfpvN1WYX2ZoL36TrOaaf+tQnWJL/boqF
         JFNg==
X-Gm-Message-State: AO0yUKU280Q9+ZZE4o7L0Dr6x7eqAMMe816KTICIYbQasiPZ4DDBZU0C
        rwReXrP+xfwKBHRyIcBawCsk0w==
X-Google-Smtp-Source: AK7set847MWs25JAS21TnNMiPelm0Lf2lT226PRQJsD/0FegfmuWWqFIA3/fNqBrwLdJMbLefRfD/A==
X-Received: by 2002:a05:600c:1d9b:b0:3e2:201a:5bce with SMTP id p27-20020a05600c1d9b00b003e2201a5bcemr16278309wms.40.1678285234388;
        Wed, 08 Mar 2023 06:20:34 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id bg12-20020a05600c3c8c00b003e8dc7a03basm21303379wmb.41.2023.03.08.06.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 06:20:33 -0800 (PST)
Message-ID: <afee5468-6c73-d088-e3ab-e9314492e49b@linaro.org>
Date:   Wed, 8 Mar 2023 14:20:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm: Export SCM call functions
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230305022119.1331495-1-luzmaximilian@gmail.com>
 <20230305022119.1331495-2-luzmaximilian@gmail.com>
 <a2c97f09-3360-b2b1-184a-8e3b869a70ef@linaro.org>
 <615d907e-fd7c-f235-405b-d112f1373280@linaro.org>
 <81468734-d25e-ddda-7bd1-1498ca6fa6ae@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <81468734-d25e-ddda-7bd1-1498ca6fa6ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/03/2023 13:48, Maximilian Luz wrote:
> On 3/8/23 13:53, Srinivas Kandagatla wrote:
>>
>>
>> On 07/03/2023 15:23, Dmitry Baryshkov wrote:
>>>
>>>> Make qcom_scm_call, qcom_scm_call_atomic and associated types 
>>>> accessible
>>>> to other modules.
>>>
>>> Generally all the qcom_scm calls are a part of qcom_scm.c. I think it 
>>> is better to make qseecom_scm_call a part qcom_scm.c (as we were 
>>> previously doing) rather than exporting the core function.
>>>
>>
>> Other big issue I see in exporting qcom_scm_call() is that there is 
>> danger of misuse of this api as this could lead to a path where new 
>> apis and its payloads can come directly from userspace via a 
>> rogue/hacking modules. This will bypass scm layer completely within 
>> kernel.
> 
> I'm not sure I follow your argument here. If you have the possibility to
> load your own kernel modules, can you not always bypass the kernel and
> just directly invoke the respective SCM calls manually? So this is
> superficial security at best.
qcom_scm_call() will expose a much bigger window where the user can add 
new SCM APIs but with the current model of exporting symbols at SCM API 
level will narrow that down to that API.

> 
> I guess keeping it in qcom_scm could make it easier to spot new
> in-kernel users of that function and with that better prevent potential
> misuse in the kernel itself. But then again I'd hope that our review
> system is good enough to catch such issues regardless and thoroughly
> question calls to that function (especially ones involving user-space
> APIs). 

One problem I can immediately see here is the facility that will be 
exploited and promote more development outside upstream.

ex: vendor modules with GKI compliance.


--srini
> 
> Regards,
> Max
> 
>>
>> --srini
>>
>>> If you wish to limit the kernel bloat, you can split the qcom_scm 
>>> into per-driver backend and add Kconfig symbols to limit the impact. 
>>> However I think that these functions are pretty small to justify the 
>>> effort.
>>>
>>
>>
>>>>
>>>> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

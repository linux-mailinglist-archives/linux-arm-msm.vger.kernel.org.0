Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2606265AE29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 09:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjABIc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 03:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbjABIc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 03:32:56 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0DEC19
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 00:32:55 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u12so24779264ljj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 00:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdsQq8pIU/cSQEcxLiA3V0Gt5zMs8XjFr211bRc9iVA=;
        b=TMsImaDZztQVAwwtDJZZIOpoTCsof0K3Vh9jxbqoA5LHjsmqWvKFRb6RuZUi0NWBs7
         36Bs3yejMt3RVVS/CT/DBTCgrj3KlOXPgVndlRE1iLxo/xJxGjlyfCbctIGIbnlsCeve
         UgGdWE1CrTs8h5rlV4uxAMYLmZEj6ebdXiazUko0QoaEZQB/N/rnNRimAqwh6D0CvLau
         MzfCdv3NGlEg6bdvjUnQ3kmynuLbkAPLkCB71w4gMjq3xCexNFZoYz3BBBeCZNj/7fxA
         inVti/Bg4hFLhMf0PuZojEXFfzzfuj5hgou1tsBtrupXHqisT//CL5NlG/gbI7wQqTt6
         GbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdsQq8pIU/cSQEcxLiA3V0Gt5zMs8XjFr211bRc9iVA=;
        b=nB3t2MuQjVkcusfFeOhiv4oeXVaaV/nAIYs65BnhebBO9DeWxB6A/Eq+rzqrkULjz/
         Kb0xjZhK254XZoOohXpmgDIxjKMS0FhcnV0m5FaMv3W/KIhzrv7jt45ALGtJcg2699pf
         tTDPLHaaMcdPKizVY3PJz95eFmSJSt+KXk2QkGjHDSL0OCzEzIIgaTAhxJcWyrtqk0PH
         vyiGUIfQJESw38qyhS2n3kKpTnEPHzM5bgEGkKJlMkWyYRlcK8XBU115RtMVfURFJ00B
         MzAoRwjhfZz+H3H32pDCSqSHy9ZKj6ZhFSvt6FiVR3L9l4+p2NhKHo7VjTcw4ncDFgHt
         VgkA==
X-Gm-Message-State: AFqh2kr0MFlJNwm+MXwdftpENxD5ikF6AZCoZiutEPsUwmMO4cPR/cKa
        HQ49ERK4z+LFRift7oAOv6R47w==
X-Google-Smtp-Source: AMrXdXvrQD47osxI5NxAqYygleVc6DQCZOXUa8TmKcXAf3A4+guTLZz9L1b3zXpVK5owHYYlkMxLYQ==
X-Received: by 2002:a2e:8686:0:b0:27f:dc33:729e with SMTP id l6-20020a2e8686000000b0027fdc33729emr3521182lji.8.1672648374032;
        Mon, 02 Jan 2023 00:32:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r4-20020a2e8e24000000b0027feb520bf4sm313879ljk.138.2023.01.02.00.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 00:32:53 -0800 (PST)
Message-ID: <54246dbc-b75f-605c-8103-84a5ff8305be@linaro.org>
Date:   Mon, 2 Jan 2023 09:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 02/20] dt-bindings: thermal: tsens: support per-sensor
 calibration cells
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
 <20221229030106.3303205-3-dmitry.baryshkov@linaro.org>
 <ef9d5f72-e39a-e32c-5d7d-4a6ee57101aa@linaro.org>
 <CAA8EJppp967vZNaMBDmB7HaU_EaCJfvUxFFHikb9oXRohGSCBg@mail.gmail.com>
 <74d22d8b-04b6-77ec-610e-d7f5844225a5@linaro.org>
 <c879951f-9b66-d68a-77e2-228b5b13c683@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c879951f-9b66-d68a-77e2-228b5b13c683@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/01/2023 20:18, Dmitry Baryshkov wrote:

>>> Same applies to the msm8939 (no sensor #4).
>>>
>>> Note: if there was support for the prefixItems, I'd have probably
>>> marked mode/base1/base2 to be the first items of the array.
>>
>> Then how about list of const items and patterns? Would be similar number
>> of lines, just a bit more complicated pattern instead of simple string
>> to enum.
> 
> Ack, this sounds good. I'll send it in the v6.
> 
> BTW: do you know if there are any plans to add support for prefixItems?

Yes, I think Rob is planning to introduce it.

Best regards,
Krzysztof


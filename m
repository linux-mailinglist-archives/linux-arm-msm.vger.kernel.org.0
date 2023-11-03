Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190747E0518
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 15:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjKCO4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 10:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjKCO4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 10:56:50 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F66D49
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 07:56:42 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c515527310so30358361fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699023401; x=1699628201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzRav2ZfuBCwiXlPtdX/9u8isJFM6SrzAhyoI7wYWQE=;
        b=Pn24tQiUjPLyBLkG3Qe2NpyvS10i7qITQ7YbnU1hGUUdtW+034F7pXZ27hmtaeVd2Y
         +BB2M18gEOq+1Xfg+CnuPGz8iuBUijfEYPWJ4cP3PqM3/gsL2wMd8ozxgYWyP92FFOU3
         NlJbDtSKDEWzNd3yaqN9ec9AAxIncQH+aOmP508WeqgYr/COzepVlf49nZcES5y+wQxF
         t1Jf/UGUWv6gX/h6iM81V8NULbY2LpEpYhqI7Iyoj+88NdDEb4DYJJmwUT8pmb18tDOJ
         gICf859WcxLFEmPgonKhOTgepAo4r8IaXzPTEFssBF8/ltxbZzxjKlJl+TrAa6Acp5N8
         f7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699023401; x=1699628201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzRav2ZfuBCwiXlPtdX/9u8isJFM6SrzAhyoI7wYWQE=;
        b=W7hWFkHcg7VA63QwAUkAZR0gIhPc1qwnmpbrdRamqmXe91xczoSHYgF5uefwEp6Qi6
         DC/AnSVC0F1l/mjjfK3UbZ8JTE6r6uG9VdtGxa89xlaPQrn2PzjR5jBvLr/3TZkRQKqo
         hzWJOP/Pwpr5VCtlULD6lPTfmhJdXeWTWEzHf4/640yXY3pFx7zaWzxzVwWQ5B5dpZG9
         8uC5Vomyp/V3u+EdFyE0UBXnSsjVi1vTcoOw9U35oCbUwtUcBDlr/uXitVfHy4wHbFOD
         slJwzb19ImIKRvOEAy5UPQKkgsRm7enYl+YIiRoPEHpfnn5SCWTPgkV1452vsxGLOGmK
         IkHw==
X-Gm-Message-State: AOJu0YzHd6wjoRD5OQ8rk508w75v+7YNDpiYmNwau0lhenwz73XhEeor
        gdNmQaJ0ZSXC78+L+/+1xeN/Yw==
X-Google-Smtp-Source: AGHT+IHrwPsCOO5sN+SmbdkmMIdCW6kgWzAR/USeO8iPtpDH8HwcJAhi+6vW3PBDfaeLUzgkB8gAOQ==
X-Received: by 2002:a2e:be0c:0:b0:2c5:1bd9:f95c with SMTP id z12-20020a2ebe0c000000b002c51bd9f95cmr20995596ljq.53.1699023400703;
        Fri, 03 Nov 2023 07:56:40 -0700 (PDT)
Received: from [192.168.1.7] (host-92-25-138-185.as13285.net. [92.25.138.185])
        by smtp.gmail.com with ESMTPSA id er14-20020a05600c84ce00b0040472ad9a3dsm2656519wmb.14.2023.11.03.07.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:56:40 -0700 (PDT)
Message-ID: <96b3ebe5-781a-432a-9a73-2217a2a674f4@linaro.org>
Date:   Fri, 3 Nov 2023 14:56:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/8] dt-bindings: usb: qcom,dwc3: Add bindings to enable
 runtime
Content-Language: en-US
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     quic_wcheng@quicinc.com, linux-usb@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-2-quic_kriskura@quicinc.com>
 <272a9764-1cae-4d86-88b1-00175de83333@linaro.org>
 <960101cc-78c0-49cf-ab62-90614eeb9ee2@quicinc.com>
 <dbf4a48e-c808-4611-96b1-563ece1e451a@linaro.org>
 <f0820464-16d6-47fd-90bc-cf80b5d76058@quicinc.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <f0820464-16d6-47fd-90bc-cf80b5d76058@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/11/2023 05:34, Krishna Kurapati PSSNV wrote:
> 
> 
> On 11/3/2023 12:10 AM, Caleb Connolly wrote:
>>> Hi Caleb,
>>>
>>>    There are two types of platforms, some use extcon and some use
>>> role-switch to deliver vbus/id notifications. Extcon targets already
>>> have this qscratch modifications present today in vbus and id
>>> handlers. But for role-switch based targets we don't have any way to
>>> get this notification to dwc3-qcom. In this implementation, I wanted
>>> to get those notications from core to glue and for this we
>>> implenented vendor hooks.
>>>
>>> The property added has been used to do two things:
>>>
>>> 1. Register glue's vendor hooks to core driver
>>> 2. Do runtime_allow for glue (and by default for core as the dt is
>>> not flattened)
>>>
>>> In case of extcon, we don't want to register vendor hooks as
>>> notifications are not necessary.
>>
>> Could it just be enabled when role_switch is present then?
>>>
> 
> So we would register vendor hooks when usb-role-switch is present but
> don't do runtime allow, and leave that option to user space right ?
> I think it would work and we can do away with the binding completely.

Can we still enable runtime suspend? Maybe someone else wants to chime
in here, but I'd guess that it's preferable to have it enabled by
default, particularly for devices like phones. Or are there side effects
from this?
> 
> Will wait for comments from other folks as well on this approach.

Sounds good, thanks!
> 
> Thanks for the review,
> Krishna,

-- 
// Caleb (they/them)

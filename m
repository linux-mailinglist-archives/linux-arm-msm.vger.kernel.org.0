Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E2A72CDBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237479AbjFLSUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237471AbjFLSUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:20:02 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE61196
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:19:59 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-970056276acso704133666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686593998; x=1689185998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4cxOfKTTvDZcNfp7Q3cCq6cFjQ+nLVM01oDWqMRamI=;
        b=a/yq5FtlV3i+LTkUI21h759UVdMobPe33EwC9V1kaTkfOEceXO8gcVEwppExH93p61
         XmJM9aqDB9ob8SwguvAGhu1UEK9nyf90lRhsWtIjW0qaZoXMpjZQOr2t+n6aK3C+Pqtb
         3P5lSHbH8eQXEuLH9BJvM3LxqC4H7LCiFCtV9uvD6MDuPOQ0dhMlEkAMxxThB3W6Mh8Z
         pbCjeltU8snS7hMrKHfrruhn3V+qt+P9Uqk/4Mb86yXwfxmJ3beYwpLCPtRWQF/oJxW2
         7UP4Xs3L917msGb2NwjGuttf7+f4boW+EuYoW4KfIuXgBoEOtJk1mEHUR+1diepscOJ/
         ib7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593998; x=1689185998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4cxOfKTTvDZcNfp7Q3cCq6cFjQ+nLVM01oDWqMRamI=;
        b=jhMBYb3CMClJE06NlqtoiawFmjYha5PxDx1P+ETyy79qBtpzjrcqBxBjPdke1WWR/f
         vwGfE0M93Qns6DjAyGzdgq71cARBPPapR/W5kq4pxYm8E0wsWWm+qo0kXVUZuw7WLd0N
         0mE92GfWLvekN6tIDlTqvrY6EfY4DErJBRMom7NSwvgdVJgdX7c4AdP6az2kid7BmbV/
         wkzgiHQnj97M3m5GZBXpmE2gdehLqfuU6z4DgsL7VYDql7rZ+Ab3snvODn7d+AahF+or
         ewQBWpKgsND0c7J8alET1iZJtFphcsCUe8mxfO/nZucrNIkEP+p09esqFL+YYa8NQs+O
         +LRg==
X-Gm-Message-State: AC+VfDx9rRPGcuZrxnDmm/0ZO7uroLbp8ka2NP25Xi4Hzpbbb9zZcN/p
        wNQjzkf0F2QHNOd/WLs+/rvulQ==
X-Google-Smtp-Source: ACHHUZ6EnMu+AeLIi6226BV8ycsU3I7rA5S34eKhYzKJmE27e3+zJ4AJxKMBdeYLfK1LwtNfze4BPg==
X-Received: by 2002:a17:907:9307:b0:973:ebbc:1d6a with SMTP id bu7-20020a170907930700b00973ebbc1d6amr10489039ejc.33.1686593997962;
        Mon, 12 Jun 2023 11:19:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a9-20020a17090680c900b0096f782f727esm5618321ejx.140.2023.06.12.11.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 11:19:57 -0700 (PDT)
Message-ID: <73243db4-3caa-9746-0a78-223f512c9130@linaro.org>
Date:   Mon, 12 Jun 2023 20:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 05/12] dt-bindings: remoteproc: Add Qualcomm RPM
 processor/subsystem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v2-0-56a4a00c8260@gerhold.net>
 <20230531-rpm-rproc-v2-5-56a4a00c8260@gerhold.net>
 <9cdf22cc-6509-b87e-e631-4e3633d1f542@linaro.org>
 <ZISqNPnQgPNEsmxa@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZISqNPnQgPNEsmxa@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/06/2023 18:52, Stephan Gerhold wrote:
> On Sat, Jun 10, 2023 at 06:43:17PM +0200, Krzysztof Kozlowski wrote:
>> On 08/06/2023 09:10, Stephan Gerhold wrote:
>>> On Qualcomm platforms, most subsystems (e.g. audio/modem DSP) are
>>> described as remote processors in the device tree, with a dedicated
>>> node where properties and services related to them can be described.
>>> +
>>> +  smd-edge:
>>> +    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
>>> +    description:
>>> +      Qualcomm Shared Memory subnode which represents communication edge,
>>> +      channels and devices related to the RPM subsystem.
>>> +
>>> +  glink-rpm:
>>
>> This should be "glink-edge", to be a bit more generic and match existing
>> smd-edge.
>>
> 
> I fully agree and I actually made that change at some point before
> sending v1. Unfortunately, it doesn't work: The node name "glink-edge"
> is already reserved by qcom,glink-edge.yaml. While it's very similar it
> has some subtle differences to glink-rpm-edge.yaml. For example, there
> is no qcom,remote-pid in the RPM variant which is required by the normal
> glink-edge.

But the other variant has, so they are pretty similar. It could be one
binding or some common part. Anyway we can as well drop the nodename
from the qcom,glink-edge.yaml binding. Anyway the binding is referenced
by each specific remote proc, so this nodename brings nothing.

> Would "glink-rpm-edge" sound better?
> 
> Thanks,
> Stephan
> 

Best regards,
Krzysztof


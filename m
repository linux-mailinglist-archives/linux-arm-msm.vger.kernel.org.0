Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723D64FE9FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 23:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiDLVeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 17:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiDLVeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 17:34:02 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EC69286C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 14:12:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b15so42955edn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5MGAtg924xQO54iJ+qv/RwdxCFigZdsll8ZfNIcJPJc=;
        b=IRqKqtapX/MHyA0kDhcmneShyhbP439lD8Z4ajJgKEEMZUq7Vj+sED/f2zG9UVnerm
         jpzuGuKrJfonnDeOMuIf0vIONMOIwnyrV3mqp8hjXo3XRoLeZeoo5BR1yxZ0us5IGLCX
         H9JVNJpKmIEhAUOLZsJ/ckHDfJizPDyhh1LzKV9AJtaDXTMi6VVYWGZyQloKrFqD7Mdn
         9mlgMDkO81cme6GlAzsCleTj8LTu7ADAE1Mw8pFcgc04Vg340p+7NMYOHu9JOT4aQDus
         /ERJHCjamQajYUIAoG0AWxsglQKtacsyg28H/ioh0WG/5bTnm3HRNiz9TzBHQCOjpLva
         mUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5MGAtg924xQO54iJ+qv/RwdxCFigZdsll8ZfNIcJPJc=;
        b=B2cZv6fGEwdlZh3K5Yx/TIaPbEdH8/2QI39Rl9abytNVKqoRdtekXfWm51EWYNfcLa
         HDo9Iy4xBeS42UFWhrmb2rhsHFTLSCRNtkBrgEGhkt4WAk81yQJfY6nZ9atXQaK5kmLc
         n2LsFVWgEeTEFqQUy+KpA7XnLiV8BLsOWjULQ/8iOOtFCPoGZ9VGHBYSTFEugnwZlk61
         I5jLnGqarEm0u0sNO6H/3ebv/DLZsF1iHkiUbOHRYWcJfiNNlnI0s9Kwnd6VYptCzEop
         aD3ukFEVARD7bpMvMGo6IKGhNNSrrj/rhwrMaYfhDGwxanYDB7LX2V2zPOR/WWHkwRE+
         fbxw==
X-Gm-Message-State: AOAM533TRMefjUsrxNMbpvW2TmlwTFGqQfL0qtNnZ6ZvfOjgP+uRiuug
        TDFeSpKQexCfgExMXf97r4oIZKL5K2p8Aw==
X-Google-Smtp-Source: ABdhPJxdvBgpOsgvYWc5ohlR+DrAhqAl4jpj9UN/qFwISEbPBxwK1JrxbDhyByhkPcvbEwT59vMZ5g==
X-Received: by 2002:a2e:a585:0:b0:24b:70d2:249b with SMTP id m5-20020a2ea585000000b0024b70d2249bmr3482854ljp.78.1649797049159;
        Tue, 12 Apr 2022 13:57:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e93c9000000b0024b3c2ecc18sm1861940ljh.115.2022.04.12.13.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 13:57:28 -0700 (PDT)
Message-ID: <3c96b6f5-878f-ee90-657e-71e8de16e290@linaro.org>
Date:   Tue, 12 Apr 2022 23:57:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node
 for tsens
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406154028.EC897C385A3@smtp.kernel.org>
 <CAA8EJpod2cNOYr3g+DmdWo_2Ujv7-pW39fBKqcpCPvtVgP5-NQ@mail.gmail.com>
 <20220412184304.79012C385A8@smtp.kernel.org>
 <CAA8EJppha+V77S6LAZW9us6XiVu9vD9X=RF+RKd+5cvCz+NxEg@mail.gmail.com>
 <YlXcTNv4ex54G/ig@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YlXcTNv4ex54G/ig@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 23:08, Bjorn Andersson wrote:
> On Tue 12 Apr 12:20 PDT 2022, Dmitry Baryshkov wrote:
> 
>> On Tue, 12 Apr 2022 at 21:43, Stephen Boyd <sboyd@kernel.org> wrote:
>>>
>>> Quoting Dmitry Baryshkov (2022-04-06 12:57:30)
>>>> On Wed, 6 Apr 2022 at 18:40, Stephen Boyd <sboyd@kernel.org> wrote:
>>>>>
>>>>> Quoting Dmitry Baryshkov (2022-04-05 17:26:44)
>>>>>> Currently gcc-msm8960 driver manually creates tsens device. Instantiate
>>>>>> the device using DT node instead. This follow the IPQ8064 device tree
>>>>>> schema.
>>>>>
>>>>> Why can't the schema be changed?
>>>>
>>>> But these commits change the schema. They make apq8064 follow more
>>>> logical scheme of ipq8064.
>>>>
>>>
>>> Sounds like ipq8064 and apq8064 follow different schemas. Is there any
>>> benefit to harmonizing the two vs. just leaving it as it is in the dts
>>> and making the schema match whatever the dts has?
>>
>> I'd prefer to harmonize them. It makes no sense to have two different
>> approaches for the single IP block (shared between ipq and apq/msm).
>> And having a separate device tree node for the tsens removes a
>> dependency from gcc on the nvmem/qfprom.
>> Note, upstream qcom-msm8960.dtsi doesn't describe tsens at all, so we
>> don't have to worry about it.
>>
> 
> The apq8064 design was chosen in order to make the dts represent the GCC
> being a single hardware block, and the fact that this is a clock and a
> thermal driver in Linux is an implementation decision.
> 
> Seems like we forgot about this decision when we introduce the
> ipq8064...
> 
> 
> I'm not against harmonizing the two, but I don't see any changes to
> Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml and the
> clock patch describes what happens, but not why (i.e. if it's to
> harmonize the implementations the commit message should say so).

Nice catch. I forgot about the gcc-apq8064 schema. Will fix in the next 
iteration.

-- 
With best wishes
Dmitry

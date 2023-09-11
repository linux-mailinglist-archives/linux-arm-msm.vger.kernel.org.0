Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C7579C3C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 05:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241808AbjILDMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 23:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241809AbjILDMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 23:12:33 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B8189857
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 15:35:48 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so8234480e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694471596; x=1695076396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9+eoOqI90b5IJoojeBPaTvWJ+0uXFVbfQP0VbvcLzI=;
        b=pdris6o4tvJXS2D0dvprjtqTInNtv3BZDjG4wVo5IoK4N0T3MuiPvgjbSVwF6KJLSd
         uKvOkegL5brlpZqpP5j6jXx/YTGbWSX7vK+OXs/JOECMrYe60CVzMP4dWwFdHeB9k2Jh
         6VmxgTlKH4iRQRfLDPJjUTpsRwS3Df0wVg9SnadmGH7g2HgrJYoztHpBYbIuN6SD3Osh
         o3bVv6Q4g6G3fRjuvaYDzJNVO0oeMRCnPSjseqA4i2OJrRRj72mI9lWe2EU98BQDzs4D
         lpBpQzPDWtwwWKnU4y6pyFNMu4s2wJqnQJ2Qv5vfcJ2HVCffCEtuQMi+d/LPMC3Kg5R3
         S3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694471596; x=1695076396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9+eoOqI90b5IJoojeBPaTvWJ+0uXFVbfQP0VbvcLzI=;
        b=DFno/vGzydUQE2LGummRk+xi25kYk77m7NU6JyheAkIsr0tPtxnakwxubO9aS2HhD7
         8WSbsT/X1Vv3E3EeH/U5mxJuFjoBYwZAuQOGvnBJQiqSqZdf9bK+cnpjx4Eg/Kmdwxbv
         OT45FrCGqDEquaWV1S9/AZk+6vLARfm24m3lY3wgHw7jbwhxz2bG6mJUVYSCBm6yD++Y
         Y326luZCValLvbB1a8kSX9ytFMJDhSW43L22lvXxlT6OPKeJp4uGmjFZ8wuxIphCq0ug
         BG+FUYn494loxG4s0HJO32wYjlNTWeGG36Qbv5xVL9i85c1343fXT93v+zUfTqz9ktpo
         tP9Q==
X-Gm-Message-State: AOJu0YyacoKja6n2+EZ4ZzwGW4UOrBdeq5Nog9Di4BgGE5wU1GYElP+U
        F4NgACyUtTKVoQguPiyoZNL1SDHpIu7reZ3naTSxMA==
X-Google-Smtp-Source: AGHT+IGBNgSqZ3PSFJY/fSPj/T1VCyEcoWAFXn3cHPB0W49tYwur5uJq49LDYKVIjCN9Ln6+GBh8Sw==
X-Received: by 2002:ac2:4db8:0:b0:500:b2c9:7da9 with SMTP id h24-20020ac24db8000000b00500b2c97da9mr8667990lfe.45.1694467270569;
        Mon, 11 Sep 2023 14:21:10 -0700 (PDT)
Received: from [192.168.37.232] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906961500b009937dbabbd5sm5841046ejx.220.2023.09.11.14.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 14:21:10 -0700 (PDT)
Message-ID: <a59aea0b-033d-4862-9d49-8d276d96e970@linaro.org>
Date:   Mon, 11 Sep 2023 23:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp-combo: use v6 registers in v6 regs
 layout
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
 <20230911203842.778411-4-dmitry.baryshkov@linaro.org>
 <2e78c237-d321-4b85-96d5-0568f1a46601@linaro.org>
 <CAA8EJpqNbykWGEGOKMDHK3OehV5ezsA8T4HcX8kadefBdSmUkg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpqNbykWGEGOKMDHK3OehV5ezsA8T4HcX8kadefBdSmUkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.09.2023 23:17, Dmitry Baryshkov wrote:
> On Mon, 11 Sept 2023 at 23:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 11.09.2023 22:38, Dmitry Baryshkov wrote:
>>> Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> [...]
>>
>>>  /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
>> This comment becomes invalid
> 
> This actually rises the question, why was it called v6 in the first place?
if "it" == the qmpphy "v6"
	return "perhaps v5 was mostly ok but needed evolution";

Konrad
> 

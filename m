Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543947977A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239922AbjIGQaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240613AbjIGQ3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 12:29:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090F983F5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 09:27:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so1955974e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103984; x=1694708784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqSwv2PaV4uvcYy04tKu3DoxY/FfR9LQpL/5rW5UGIU=;
        b=gvc3vlMERD9cbCteX5NT0CokCqyvC/0NWjzZLNnvmNYZsqrZfW7Ok28cVb5cur8jk1
         dw2HbwHWRmqH0zmpTmChUrJkDrSCDuqAKINp/MBbHg98UfTn7/SA1hX1/ULOuVqZWdK0
         XVNQn6v8VF6TfbjL1ugSJlJJ1PkvfJwqHAEAeWRoTMUsmbQUF3Z0W1D7BqjIQn72iSop
         CycPFyEFa6Znr2zcKw3IbaHGlgkbPZuM/6L1Z1z+Ny6lyUSqp8L02Gxtr+ssRBXS/bsC
         jY+/vHzANgn/X3UzVNhK3Vbl3qQs9RIGtrlZyDxZrsXtYXseeCNSbHoZgIblex6zUKL1
         edJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694103984; x=1694708784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqSwv2PaV4uvcYy04tKu3DoxY/FfR9LQpL/5rW5UGIU=;
        b=JIwmjdkHfHTMjDC4G/GLcRiBtjeoXByloaP5sgDem/fYHcLHwe7BibzRZNnFDEDZif
         0drGegqo+uaXshoqa4i5qjrqrUpgZ2HbeLVqNMxFd/Gc743a49eOPIvodRjTjpi1wk0n
         USXUkhzuLJFYUxcn3geo7gxrALhnao/Xmp4NNPDpFb1T1nCj3ZT3ZnCtycNOBcwJC/wa
         9o0LH/epJaPsFluFdiO5y0vU7cLVzlzO8RL80J+M4KtmcsU9JYsKchP5XJcaBd6tS52b
         vwQMh6hDqQ1rZSRT5lmmKboummxtbIcn+scniDr3gco56fJq5F4rlfYq0n0DOS/GN8zH
         5X9w==
X-Gm-Message-State: AOJu0YydgS5rgYQIhRve9b9pWTcsrf2bujj3vUD4UGqpSwzcKFQ9rjKb
        2Xk2sVehCENAhDUy1o1xAVtSj5JNw/p7cYqOGHd96A==
X-Google-Smtp-Source: AGHT+IHzFowHPzuz+xrWiHrylgjnQtYjrvd6hQfqFJWiSw6xL5CNO9tWZMaZJ5Y0VFwN+MHeV1c2wQ==
X-Received: by 2002:a2e:7e11:0:b0:2bc:f2d7:f6ce with SMTP id z17-20020a2e7e11000000b002bcf2d7f6cemr3970577ljc.49.1694082534284;
        Thu, 07 Sep 2023 03:28:54 -0700 (PDT)
Received: from [192.168.37.232] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id qc8-20020a170906d8a800b009944e955e19sm10176379ejb.30.2023.09.07.03.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 03:28:53 -0700 (PDT)
Message-ID: <6545fd47-5334-44b1-9f0f-1c60f8b2d814@linaro.org>
Date:   Thu, 7 Sep 2023 12:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: sm8450: Add opp table support to
 PCIe
Content-Language: en-US
To:     Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, mani@kernel.org
Cc:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, quic_parass@quicinc.com
References: <1694066433-8677-1-git-send-email-quic_krichai@quicinc.com>
 <1694066433-8677-3-git-send-email-quic_krichai@quicinc.com>
 <38f64349-5139-4207-91eb-cd39fabd4496@linaro.org>
 <347293d1-15e5-5412-9695-01be768283ad@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <347293d1-15e5-5412-9695-01be768283ad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7.09.2023 11:56, Krishna Chaitanya Chundru wrote:
> 
> On 9/7/2023 2:34 PM, Konrad Dybcio wrote:
>> On 7.09.2023 08:00, Krishna chaitanya chundru wrote:
>>> PCIe needs to choose the appropriate performance state of RPMH power
>>> domain based up on the PCIe gen speed.
>>>
>>> So let's add the OPP table support to specify RPMH performance states.
>>>
>>> Use opp-level for the PCIe gen speed for easier use.
>>>
>>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>> ---
>> [...]
>>
>>> +
>>> +            pcie1_opp_table: opp-table {
>>> +                compatible = "operating-points-v2";
>>> +
>>> +                opp-1 {
>>> +                    opp-level = <1>;
>>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>> +                };
>>> +
>>> +                opp-2 {
>>> +                    opp-level = <2>;
>>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>> +                };
>>> +
>>> +                opp-3 {
>>> +                    opp-level = <3>;
>>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>> Is gen3 not supposed to require nom like on pcie0?
> This particular controller instance can operate at low svs for GEN3.
>> Also, can all non-maximum OPPs run at just low_svs?
> This depends on the hardware capability, for this instance expect GEN4 remaining can operate in LOW svs. It varies from controller instance to instance and also from target to target.
Ok, thanks for confirming

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

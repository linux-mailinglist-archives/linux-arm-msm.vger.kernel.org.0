Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98FF16B90BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 11:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjCNKzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 06:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjCNKzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 06:55:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C54E387
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:55:39 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a32so15544112ljq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678791338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=re23c7fupDWtZISMx2IbChMkhr35xKPDFSxvyKtpfxo=;
        b=m4RxTZ2X3MJiwm/xt4qU9PIEaaRSfIbj0/OHRhXbH2zfPgvqYJagXbChpBA8VJ/lhJ
         znEDPgSfJcsCEsIbWmFcZLl//gzsn0JUMnyHAQQjAQTZ5xw4CA/11ZBzlK2DRU88x7tw
         sHWpiHIkcltQd6mUWhbX2P6X/H9ZkHsQokECgSohIhVrRpRtELNJSJl8SODgs1rRFm4Z
         TRlt0FuBlxesAaeYDzmib8Llco7I2dpe6NCjbHJdQTKIRi5mZ6Oi33/MlbqRRr9s7tLb
         4BZzUnE3p7wiQnBA1tZoeTNbR+t1GJiQK4ew4krlWk2m292QZYafKffjFzVlwUJA12W5
         TNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678791338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=re23c7fupDWtZISMx2IbChMkhr35xKPDFSxvyKtpfxo=;
        b=YLOapEp6W3I2S35kKPWT3h9IHRaNgfWB5lyrz8KF5drTiDw/i4vYHk8ktZwI5wcblb
         R8ZYeyhZ9FnG/VULbQ3Hk8Qis+XewsvjP2JfCKyQT0w5qBEKHK8FCAthBfXxKWN2+FbO
         s8LOi2gabSRcbdgy3lMjs1cJK9SMd0+8bRdBp7Sm/pyQ773C2wyD8CfXUZOu8jkt0pZ9
         qwvJ7mO5tQC8gQJri3L6UB9rN1U0gvp/iz2S1Qj9eYqCOxO2Gew7b7wdFK72bxEp0HD+
         xbEVTdpJ81SKNtcMy94bJtgY0+UMckggm9syk3GWULgJGlCCHz8X22dPAnn4eJbkB93y
         yOwQ==
X-Gm-Message-State: AO0yUKVym1y6yDMf5XhoPIKODs3cQAN03mrk81a6d5HD7xLSn/80WRqD
        vBwFMvC0gfOdkUqwQSirIK7Udg==
X-Google-Smtp-Source: AK7set/5HooW7gzV6w7VTOua1pVMOoDrespv5T6+y35lZ3AvKWz3vRZwNuBZk9AIlEAqvsVza/09xg==
X-Received: by 2002:a2e:7804:0:b0:295:b3df:4942 with SMTP id t4-20020a2e7804000000b00295b3df4942mr11011312ljc.40.1678791338255;
        Tue, 14 Mar 2023 03:55:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id e11-20020a05651c038b00b00295a583a20bsm391337ljp.74.2023.03.14.03.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 03:55:37 -0700 (PDT)
Message-ID: <4d7d3d5a-4a3c-44ab-6f32-ddee2cb621fc@linaro.org>
Date:   Tue, 14 Mar 2023 11:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: qdu1000: Add IPCC, MPSS, AOSS
 nodes
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230306231719.22263-1-quic_molvera@quicinc.com>
 <20230306231719.22263-2-quic_molvera@quicinc.com>
 <af21f499-5895-c564-3e6f-d23ba188544b@linaro.org>
 <3ee969ec-faae-fd9f-d583-6a8e2670b567@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3ee969ec-faae-fd9f-d583-6a8e2670b567@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.03.2023 22:25, Melody Olvera wrote:
> 
> 
> On 3/8/2023 2:23 AM, Konrad Dybcio wrote:
>>
>> On 7.03.2023 00:17, Melody Olvera wrote:
>>> Add nodes for IPCC, MPSS, and AOSS drivers. Also update
>>> the scm node to include its interconnect.
>> Quite a bit of stuff in a single commit, this could be
>> separated into:
>>
>> - scm icc
>> - aoss+ipcc
>> - smp2p+mpss
> 
> Hmm ok. Will split this patch into a few patches.
> 
>>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
[...]

>>> +			      <0x0 0x4180000 0x0 0x1000>;
>> No reg-names?
> 
> No; we don't use reg-names in the driver. Lmk if we should be.
> 
qcom_q6v5_mss.c / qcom_q6v5_wcss.c get the 'rmb' region with
[...]_byname and I think it'd scale better if we did the same here,
as one day there may be a weird SoC that'd have an "XYZ" region,
different to "base" and "rmb", which we would need to handle.. somehow..

Konrad

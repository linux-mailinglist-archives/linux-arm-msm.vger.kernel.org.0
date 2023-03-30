Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8983A6D028B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjC3LHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjC3LHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:07:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84286A71
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:06:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h11so17031944lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680174413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kFJmqVtwWUVcG0Lm77E8KR/5HB12mJDwmxwNxlca4Y=;
        b=QFJNu3+0CjAQw1iofhkT/VGzYC5JtBTXOv1piZxLxkvwohLbO7ffQXvlBJV5/myadj
         Fhzaxxn3qOPC09GRSp/56AvLmXbNSJxYvmqd8x874qBZE+RhW948/qPsY6V1UKLse056
         1fcu/APUG+3/1TQ6lpSn39vbhMmNrO5lNP/0RYadmKlP0YXisDmlNdntxOcNGTqZQkr3
         W5fjBxZGI5nAAofkKIveAelKKFj8y3KSRwBn0SiCZSVm6l5dG0F98DQVzb1WwSFMtsS/
         fEeB6wyVMjIt6750T/pp7bdMilL/U/Wayoa7tKx12h3goMPRiTcLnvPmJSfpIWxxrejC
         RaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680174413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kFJmqVtwWUVcG0Lm77E8KR/5HB12mJDwmxwNxlca4Y=;
        b=LrEADVC6YZbheoKG21c3evu7BtrzAWGec9ZH3cfSJPW1Bodco54RB0dFDtD1uLZ6TE
         rf2UuSnbp/dDiVUMJottXHyFDngf9AwajGrDw6Mmj7AYsFGmOODRER2hKTgBYFaOjwOc
         XKBRSHp5JhHG7pJsGtFeGVVhMPidUzEgJ9JLKvEl87XZqv398HVphoDoGxO7nl5Afsil
         OMS0G6oI4X8FXnnlBJGeTavf0uA2KiSltywh1QEKW4x1EPhPhCA5+TtypLDcbcbVDTt8
         bsGGkoiTX0xFLw6p8iFHlyMpPNmpHy1NktWYMtCemfCxKFrMf+WPEVPKW1TYCXzXVLAD
         syFw==
X-Gm-Message-State: AAQBX9cxhYYGXyWFT6LIv3aqb2cc0XxjdtRorXLCJqGC7Uow4svQFXpp
        L3n/8haG2VjizhIMODff823+wg==
X-Google-Smtp-Source: AKy350ZOwZSifMJ0COgNwwfI8Ff4NZPvJrvXq9pF7O3gWwfbrZxZjTu20qbb3ttl1T+NHD9CSza3rw==
X-Received: by 2002:ac2:5a4c:0:b0:4d5:a689:7580 with SMTP id r12-20020ac25a4c000000b004d5a6897580mr6377686lfn.47.1680174413683;
        Thu, 30 Mar 2023 04:06:53 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id t7-20020a19ad07000000b004e8451948desm5835252lfc.227.2023.03.30.04.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:06:53 -0700 (PDT)
Message-ID: <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
Date:   Thu, 30 Mar 2023 13:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency
 changes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.03.2023 00:24, Dmitry Baryshkov wrote:
> Konrad brought up the topic of scaling the MX domain according to the
> OPP changes. Here is my RFC for this functionality. I post it as an RFC
> for two reasons:
> 
> 1) I'm not sure that we should scale MX if we are not scaling main
> voltage following the CPR3
It should be ok, however..
> 
[...]

> Dmitry Baryshkov (3):
>   dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
>   drm/msm/a5xx: scale MX domain following the frequncy changes
This is a stopgap solution, CPR is a child of MX.

Konrad
>   arm64: dts: qcom: specify power domains for the GPU
> 
>  .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
>  4 files changed, 76 insertions(+), 2 deletions(-)
> 

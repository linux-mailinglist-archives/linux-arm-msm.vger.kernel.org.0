Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12750567630
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 20:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiGESIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 14:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbiGESIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 14:08:40 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF70C1C10A
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 11:08:38 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o10so4842845ljj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XKjeQCv7FA1B0k4Z3miJbmt5+HTjSydTVM9i1IqzPp8=;
        b=clKnokzl+eqLCyvu1tTLyYdMWTuTQ9BXZxkoflLc0oF5aHhjxlHn+yqGDOhymy/wLn
         rlBL52ghmvAmcQOpnR9cvmGobtD6dPIv7FDJ97/ZVDLrfXUT0IsoATUEOZ2rfhiRaUhl
         kLlompPuRX0OpECvri2oeWXQ1Af1pIgG9pAN3Jek9EqIlsZsgxpyCM/sRfEiWOC3A3JI
         8xS8GYkDIjQyXXS/OAilYyA18lHUNNvUOtFOzc4zmyzdb3tfaySuuz/prvVS9PfK/OPg
         Oc+4b/xdTlVRdbZ8wN00sLUdGeIe0wfV6Jm7taTqAdJ10qDATXO10cp/dEjETYTg4oAu
         R1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XKjeQCv7FA1B0k4Z3miJbmt5+HTjSydTVM9i1IqzPp8=;
        b=1PHWMDYy++pmWzpR5FYYZjN0224ApI/WgNr20kkjUhtCrjPQK0nFOldB/MmHAtfUgb
         +05a/+gmezHwhEosE0OMf4bQTMp9uI+ji1bq9xeCGFdHWT89TMKaCpPhyPZ4uCX5ROMm
         Lbvym4PtQsP5RYE6+hYkatsBdWzGIFmksNSrsyVD9QXkaVKo7N19bXDX7G0tPPmqrjBt
         O/n/HfIYiEEG+vehEZFz4xawDkCqkPoC+2yC/2KR+IBjTfPmqmSaQpoZZfC3yOxull4y
         x5+kpEsSleCLlzcEO5hudXtKTgI6Rq1n2wfG3Z6wl2Oazcf6qf2ioHXOKefoGaz0FC7S
         CeYw==
X-Gm-Message-State: AJIora8ildayNB7gcDiBuh+2XUvivVdnWP2RvkL8VvlUogvOSsVAGI6M
        MePXCz8aNLxgfsCPvNhpYD80jQ==
X-Google-Smtp-Source: AGRyM1vAUYBBcyuszrI9E3iF3mpVohzq4RL3oII8/mtN9i2NOq2AZ+RBACQRsqN2uQjMwrLqWS9xsw==
X-Received: by 2002:a05:651c:1586:b0:25c:258:5837 with SMTP id h6-20020a05651c158600b0025c02585837mr13487288ljq.260.1657044517334;
        Tue, 05 Jul 2022 11:08:37 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm5717472ljn.9.2022.07.05.11.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 11:08:36 -0700 (PDT)
Message-ID: <1bb732de-29c8-6abf-90fc-846ad50c6552@linaro.org>
Date:   Tue, 5 Jul 2022 20:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/8] dt-bindings: power: qcom-rpmpd: Add MSM8909 power
 domains
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
 <20220705143523.3390944-4-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705143523.3390944-4-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 16:35, Stephan Gerhold wrote:
> MSM8909 has the same power domains as MSM8916 so just define them
> as aliases for the existing definitions.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 7 +++++++
>  2 files changed, 8 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

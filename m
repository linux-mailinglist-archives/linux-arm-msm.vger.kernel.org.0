Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA76620C51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 10:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbiKHJfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 04:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbiKHJfC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 04:35:02 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F71225C76
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 01:35:01 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s24so20195286ljs.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 01:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFBXnwgYOk+9t2BDdNhXWV8qbBDtXWeNI3uKhBQ7ls4=;
        b=UuOwT9mhHADA8vHd27kyiqSt7CIiFzPF6F5uT0NWiM8bqT+Je+D57oUY+GEDq/1ngd
         Rh5NffOhwc+y2Ld7raVbwTPBJ8dOJ7zQ/cdzpyVn6XToQm/OCv3besj4D435Nyuk22Hi
         O+jt5ZzcURAa3lgkis5O5gCmInNdb24F4CCMxnHDbmR3tyME68PHa8WR7ffDhy51pq5E
         w8rG4vAhu9ACebJS8c185ySkockMDDrgP5NYf6orCBunJTmWqAGFGpmy6ajH1l7SK1bV
         GjIvNXTJhd+NTR8bfX6OyyEMBjkQHn/jMif7NfJ2PpQL2p8QzjGBFRZMpiGxoJ90c8LM
         JsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFBXnwgYOk+9t2BDdNhXWV8qbBDtXWeNI3uKhBQ7ls4=;
        b=i9psY5HzkWIS0af61UFifejUF+07WqGw2uOsrMaDH8xfp4/3LTKJD/rWpbHAPg/Oi1
         Je8n5mqS9gAdLsPbfk7ZY2PaNKf2TiIXjf41PJlqaHXZ9akltwNpykw41M64ZQJRj6Mh
         riONBH8dThsrbgMDhfEN67AI+8j4Q1UhLJfW8YEoB44oWJxBrzH2OgSC9SRhvRpkef9i
         vtUDw/N0a+kReNz4TcYVYhTJxBC7pb6eJOjt223JXYvnmrh8rWPEfwODFTGfI06769uX
         jK6uiFI4TdARQc83umq3UCMgMpyzMUCEhBOsd201TBdoFTaAOPwmrkYwEA/ObCwpCJfm
         TKzQ==
X-Gm-Message-State: ACrzQf3TKmjs2emd79RdiATULNqrXTnfgb0UDq25W13tqw3xuYU27L6O
        gkO6J420uoTI5aJu1aUztTAL1A==
X-Google-Smtp-Source: AMsMyM5DrqNB/gqUBduco3X7kWyZPPJsKStm6QI6mvBTP7DVgH6Dgw6IfeWXDPqGPvmhosUFK1XFDA==
X-Received: by 2002:a2e:9545:0:b0:277:8a06:fda2 with SMTP id t5-20020a2e9545000000b002778a06fda2mr5265716ljh.32.1667900099346;
        Tue, 08 Nov 2022 01:34:59 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id t8-20020ac25488000000b004b0b131453csm1709404lfk.49.2022.11.08.01.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:34:57 -0800 (PST)
Message-ID: <ca515021-326d-6034-2af9-54e73e1cc8fa@linaro.org>
Date:   Tue, 8 Nov 2022 10:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: sc7280: Mark all Qualcomm
 reference boards as LTE
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        dianders@chromium.org, jinghung.chen3@hotmail.com
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org
References: <20221108092207.8186-1-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108092207.8186-1-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2022 10:22, Sibi Sankar wrote:
> When the modem node was re-located to a separate LTE source file
> "sc7280-herobrine-lte-sku.dtsi", some of the previous LTE users
> weren't marked appropriately. Fix this by marking all Qualcomm
> reference devices as LTE.
> 
> Fix-suggested-by: Douglas Anderson <dianders@chromium.org>

There is no such tag. If it is a fix, use Reported-by. If it is not, use
Suggested-by.

> Fixes: d42fae738f3a ("arm64: dts: qcom: Add LTE SKUs for sc7280-villager family")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Best regards,
Krzysztof


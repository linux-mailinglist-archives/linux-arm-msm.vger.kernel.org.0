Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E0465914E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbiL2Tzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiL2Tzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:55:51 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C0C388E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:55:49 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id d14so27909081edj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6Wkge06zczYAAj7DhM5Xt+bLRLfVVDh4b53VtAv8V0=;
        b=dYcaTK2Y6q8+dBM9M9BA2CtdrLqbWMe6ub90o75QqgjvX7sIfqzklvtuDoUO7ADAa3
         3yvTRN2whJcwkjxT7a90BxMVe47IKMiW6bMUk70n1NMttP0oHWyoTTNSOVoGyNhTkHhF
         FLecafXiCsliIJU2wk2zWFuDLo+zjmW6+MLAXsIqYIw3v2vXjq2+br4dlZOxZMoJb+3k
         beA2vvrxkfDI0DLmgQW03wmDTWg6LW4fslDL9VWWmRxXS+kyi7OcGn3mNeMBSnMY+mKA
         Q3FLyV4HZ7TVO2MzbMhyPLCBxNg9Y1C49SiGgYuA2qfJGf6xp0xyoVJ0Xkg0dsLS+z3T
         PthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6Wkge06zczYAAj7DhM5Xt+bLRLfVVDh4b53VtAv8V0=;
        b=tupdxaXkO+J3kHzZGlAknTDO0GoTuksLGIL4AOsTSfsYT3k68rryG+M7bItEj40seG
         dVrwo6gsorVEHs8daLKOb1Ms4bzzQBMiLjopI6uZLJa0XkDU+aTGXfseGYO+DCOIUBdw
         6GX79FP1UzfJfHTt8sALPHgL4m3kEUWvmmFux7kVSQcB6WFBFaWH2m8pxK0RKrsxnJxe
         Vmn+omYPkDOdVq8joBP9tq9UBFpwBxaxnEat1xqao+dDYI/EoH8DTkFPTICrBM5sSOtx
         MjneZeVNgtUKXy/AzPp2J/fUXKJgC/fniiqkMUMSZEFodRNRSJIJ4mohcBdkuBUhI8/Q
         jJqA==
X-Gm-Message-State: AFqh2kqozP2lmPtgINpxBo8RxCT3K130OSi0NCB8OVEArb04Uf8s3fpY
        mzGzbIoMFyoPcwT/QJYUQ8jgLw==
X-Google-Smtp-Source: AMrXdXvx/IQ7UCmJNw4ibq/ovq6FFnOIl9VZYTkZSTXeE7H+cJ09bEECjagxOE6AcwvCYtagZ9pzUA==
X-Received: by 2002:a05:6402:2a04:b0:463:9193:404a with SMTP id ey4-20020a0564022a0400b004639193404amr27707591edb.21.1672343747905;
        Thu, 29 Dec 2022 11:55:47 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f? (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
        by smtp.gmail.com with ESMTPSA id c17-20020a17090618b100b0084c723a626csm3333075ejf.209.2022.12.29.11.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 11:55:47 -0800 (PST)
Message-ID: <aa948164-9ef0-797a-6241-718694ae9b69@linaro.org>
Date:   Thu, 29 Dec 2022 19:55:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] phy: qcom-usb-hs: Add qcom,dp-manual-pullup logic
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, andersson@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
 <20221229183410.683584-3-bryan.odonoghue@linaro.org>
 <Y63uSgMdP4m6nvhL@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y63uSgMdP4m6nvhL@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 19:45, Stephan Gerhold wrote:
> For the implementation, I think this flag should effectively emulate the
> logic that is currently used if you assign an extcon

Actually that's fine, its a better solution than pushing the pullup 
constantly as I just suggested in my previous email, there's also zero 
potential impact to existing boards this way, so, that's obviously better.

---
bod

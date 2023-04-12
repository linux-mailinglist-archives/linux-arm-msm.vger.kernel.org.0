Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580CA6DFAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 18:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjDLQDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 12:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjDLQDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 12:03:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2184B7A99
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 09:03:08 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ud9so29923385ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681315386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcQb97bFst0w87J4FATWV+9slbXxyXT1L1haiD7uyvA=;
        b=rmnTtS3JmDHvmdBwPjEwvLRIoW2wi9oJNiORutjxymA5PignzrhAfId5+x0CHrt5F0
         6cfcPRDnpZvExuRM2UqfILZmfMdr4KGV0xSsNmGZwjJGBzQiL4Q1P4zbQad7/C80guj6
         rwtStie4Lhukslm6bYqQKLdZdVnTb7MaDl3J9IJN0u6/eqxpPqcZMuHUUy79USh52MiV
         uPiyBBj9wAm9NLR+T7oStLJDxEaqckhK/8UyocxiE9zSyWJzDbiLaJFX73dWrj/jizzc
         BfnLM44okP+nQKB4Mq99rwVJHrDs4XEb4mDWcL0kudLWGuErBU9gVEENg1K03Mn5lu0R
         8AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681315386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcQb97bFst0w87J4FATWV+9slbXxyXT1L1haiD7uyvA=;
        b=JXgqtPaAHObjnVca1UHpmEChEzCDVy90gjjqFJfOAlJbJVnYkV9/a7POvh/lN3rJMv
         zw1RNmeSc9o5uSCQeCFgRsOx0CP0kosGFgKlA0EgLiTqr3/cA83RCKWLMkFlSYn/PTVH
         FWiPA4HEKUWCOo/Bep5doBttBviffBbnO/dsouwLzoxL+hSId6YkLNtMBizC9/4LWVuh
         GPHZ4W3K1v5DqRoamTv4MkK1mKgTuTs5ZjjbH76+Z3sedK5qZWmn0WFyXxtHHvxOhbpE
         IH/d0+qumyR7Wms4ubJfst7Iih9tFLFH8ufPEDe8Z7HHl1YOAiw5skwQ526YWLQSP0Wa
         Wz5w==
X-Gm-Message-State: AAQBX9epOJw7aaRwpAT7XQypahJdr6k/VDjJYqNMETv1L2jxELuk5FHd
        avsOqcWfLsQjuMzFWBHiZLa4Fg==
X-Google-Smtp-Source: AKy350ZfCzazQ3U9mnPQELuCB6zS43BVGcVySY7JsnLkIXdHJCben10NoPtQImCsJWRdd6xHlTdVEA==
X-Received: by 2002:a17:906:7c56:b0:94a:7a2f:d6e8 with SMTP id g22-20020a1709067c5600b0094a7a2fd6e8mr2876892ejp.61.1681315386571;
        Wed, 12 Apr 2023 09:03:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:938a:b3db:7c59:795e? ([2a02:810d:15c0:828:938a:b3db:7c59:795e])
        by smtp.gmail.com with ESMTPSA id qa20-20020a170907869400b0094e6504d132sm772493ejc.167.2023.04.12.09.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 09:03:06 -0700 (PDT)
Message-ID: <93ba650b-c922-5422-669d-51b9234b238a@linaro.org>
Date:   Wed, 12 Apr 2023 18:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [V2 3/3] spi: spi-qcom-qspi: Add DMA mode support
Content-Language: en-US
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        broonie@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     quic_msavaliy@quicinc.com, dianders@chromium.org, mka@chromium.org,
        swboyd@chromium.org, quic_vtanuku@quicinc.com
References: <1681313387-8376-1-git-send-email-quic_vnivarth@quicinc.com>
 <1681313387-8376-4-git-send-email-quic_vnivarth@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681313387-8376-4-git-send-email-quic_vnivarth@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2023 17:29, Vijaya Krishna Nivarthi wrote:
> Current driver supports only PIO mode.
> 
> HW supports DMA, so add DMA mode support to the driver
> for better performance for larger xfers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202304050512.MN2oNY9Z-lkp@intel.com/

Drop both tags.

> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v1 -> v2:



Best regards,
Krzysztof


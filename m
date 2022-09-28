Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C9A5EE113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbiI1P6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbiI1P6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:58:17 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F478C034
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:57:40 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso1555885wmk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=gr4NX9hKRksMUEvq5iTnWXuuqbt/cVaS54wl4qK2lz8=;
        b=mdJ3llifS4oJUpDPAfPfMM/e0Rps1EgY/vfmcdeIeb1PTNfbiUzu74Rq35J8bTdz68
         Ki4TAcYr2QXp+pVREY+gV6TixTC3BV5nGW6A1Uj1uFmC4tZPVuYoJE/zVbRRClGSr8a0
         t8bA2ch1kfpMa4or71ORVt8H+6QD/00XeuiY3OHKh0kXm3f6Up+tVoRVkN+ieq2gEaiG
         nNSerlekU1cbt/5nWaetLqJR5pdnGIIihnmjk6KGf4tjxDCtjX49MV7pl5TIkShAYKuf
         BRnLcTfMXZJH891uiyW/cEIqPN1qSyRLvEqfV5s2Kbxm1ByCZ3/L2nlq/tL0m1V84Mrf
         oWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=gr4NX9hKRksMUEvq5iTnWXuuqbt/cVaS54wl4qK2lz8=;
        b=i2l+f4LhtisNXER2KbYgF9Kb78W6dGocsjgOgCm9VmQcRMmy82EiAU/Nfp9WHWqfhs
         jfzM7BBBxt2kunPTgZFAQ2ne98qTAyOi75L/r+6AWOMc3m0iE2+bNmWN3JmPvyZcSQ4D
         qPE4VKOZiCdYy+O5NACW4WL8MihMtb+Bc5bB1tShsyEHz+lFQ16dQOOy6q7yhKZBWdrz
         yWWFo5F65+DZgk75V3ChJIbjm3wXqa2y3S9NGcq8Z2B8MaQJ3v6pzSVigy7H7DiR1KTM
         OwOKfnEhzekjnHkb5UXfrr75mEV/pd+M29np9jgnZzSjdgu+OLQX1npghIiTOsRScz9o
         bj4w==
X-Gm-Message-State: ACrzQf1JwOLskW+rPup6LFzYxgDm8FeQIJo+uYgNplqZfS5I3o6fPcHP
        y/Qi3tE54pgUYpBrAngsZA4SiA==
X-Google-Smtp-Source: AMsMyM52RP978MnDNTMt8hGiwehpzwFh2XZw41YvZzfZBT9JDhg3g2F+igKOAnGTDVkRxYzJwttHcA==
X-Received: by 2002:a05:600c:3844:b0:3b4:becc:e43 with SMTP id s4-20020a05600c384400b003b4becc0e43mr7446114wmr.33.1664380657522;
        Wed, 28 Sep 2022 08:57:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id q16-20020a7bce90000000b003b492b30822sm2098621wmj.2.2022.09.28.08.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:57:37 -0700 (PDT)
Message-ID: <85ce689b-4fea-49a4-2faf-eac15eb2ab6c@linaro.org>
Date:   Wed, 28 Sep 2022 17:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/13] phy: qcom-qmp-pcie: unify ipq registers
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220928152822.30687-1-johan+linaro@kernel.org>
 <20220928152822.30687-5-johan+linaro@kernel.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220928152822.30687-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 17:28, Johan Hovold wrote:
> The IPQ register array is identical to sm8250_pcie_regs_layout so drop
> the former.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

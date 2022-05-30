Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF3D5388FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 00:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239821AbiE3Wji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 May 2022 18:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbiE3Wjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 May 2022 18:39:37 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380855DD17
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 15:39:35 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j10so18639579lfe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b836Hwaa25hw9M7Z+368J9Eu0dyxv+PkfmBi1LY54Zg=;
        b=HTDgud/cnqJA53cMtygJCrwf/TA4n6/dzAbBozqOQAL/VIGAz7yworbRH7YWqf34Ht
         ncDu3wbkmZtJLlDLg6VgwdE40QfyH5X4gmPyK5kFQfykEEnNQsWFeUTgzmK4ZyyzySMS
         LQuR8gmLVNXHkfZnDoIBXx23II8g4/MR8cK+qvhU8+7edh2xwaWMQt1puVH0pr9o+Gpd
         6sWEJwnVhbWpUuk/mw7wJh04gJPLNs794/qW65mpjGXBxb4ENUf4KXXpV0NnxGCcLtSQ
         5R8cWd3v0u0p3qXfj5Oobg61TnhnqTUqRNELjTnmXPGpwFiwUol+yc3p6Iz7NqF+oUY1
         pSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b836Hwaa25hw9M7Z+368J9Eu0dyxv+PkfmBi1LY54Zg=;
        b=ROUBwhH464MbsVO03k3EPzxQBbH+18Cs9gQqF2Q0ZeMCGV9ZLsE4zAGzRJn3NrLCr+
         R9F/FVz1gt9H7lE9BbfGQkpl/sttEprfCQs5Am1mQKu4YsdgJcC4HWYciwXabaDehKwu
         PbMRITn+uNomwbnpS/f4fEurcem/3RYNTvBlp4x3k8495MdK7YV7sYQR/3VD8ZL1hzaH
         4n9t1bZ2LnPdjJDOFPqtvUWGAvPgsHaU2BMc6fBbES5TNtDCVvdjH5h75eJ8fhOqeVyp
         4O4HA1764Ai1YfSawKodYT6FODUKsyjOMe9/eI/l+nEtFpHp2z8TTKaSwrNCRUFnLxZ9
         e03A==
X-Gm-Message-State: AOAM531Xw/cnot3Ff3fQi54TKlTvqURWZ1UQWf19HoI6Lnl6inbOeL14
        4zMX1H8zVs6aHtv1m26U6zvooA==
X-Google-Smtp-Source: ABdhPJwL/kYaRSEshZrSrq15BSStK/gx783mRIkQR9eF0XkTpUjVrrwLBl7M/PByAxjfz35p+txh5w==
X-Received: by 2002:a05:6512:374a:b0:478:6208:63c with SMTP id a10-20020a056512374a00b004786208063cmr33479245lfs.483.1653950373589;
        Mon, 30 May 2022 15:39:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v25-20020a2e4819000000b002502e691b05sm2742896lja.136.2022.05.30.15.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 15:39:33 -0700 (PDT)
Message-ID: <04af7d5f-a4d1-3403-c481-1cc2bb13d30f@linaro.org>
Date:   Tue, 31 May 2022 01:39:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8450: Fix the IRQ trigger type
 for remoteproc nodes
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        tglx@linutronix.de, maz@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220530080842.37024-1-manivannan.sadhasivam@linaro.org>
 <20220530080842.37024-3-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220530080842.37024-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2022 11:08, Manivannan Sadhasivam wrote:
> The watchdog IRQ trigger type should be EDGE_RISING. So fix all remoteproc
> nodes.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

BTW: Could you please send the same patches for sm8250/8350 too?

-- 
With best wishes
Dmitry

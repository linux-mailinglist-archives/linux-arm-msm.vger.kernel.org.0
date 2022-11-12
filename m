Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2241A626770
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbiKLGTr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234715AbiKLGTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:19:46 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719BC6DCCC
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:19:45 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so11217417lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UClpvOx0l9x+wjA6NEMXjcRIRS2zniqBsDWiJ5YtAUo=;
        b=K1wBk00iQ+/cUopXCupusaXiigjC/njLZng3w92JMTk8+biVa8bmMx+hn/hU/jKzms
         WX1dwiix829U04+ELHFA3x+is3pzk8uVOLt6iuaxIu+mgLm+M0JbGXpiPYD4aEe+UPI7
         VmAiMq0zdOzQVr//oV9Jm7tn9GIsCtyunBS92beRFJlY89DKGuBad27HDSvMmIXmsefE
         sr40fd6P/jyv5yQ8hGEttm1gHJAOx3ycNQLrImx0sxGEfydnZXMgY0MJ5ckumMI0HJYw
         JilPJSW0N6FgjwBEDw2dxS+4AFUFXPrrhiWVwKg23bC48LyArlLxJzkJH0ALAd18I7bi
         QSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UClpvOx0l9x+wjA6NEMXjcRIRS2zniqBsDWiJ5YtAUo=;
        b=nQ78Pm1qacQt6JcBpOsxc3GMpxLC7hbBgNT/JLI4+FEwF/P86gKn6KwDFH8pACZwxR
         KzXgFNxd1cheUswMhZekbN9rNP/r/AkT8eAHw7oHq7XByD7JXumpq0ifLZrWcn/RsqK9
         PpFrzx49drgWQ8IGL4KckskDBGARNLb1jat5kK+Ln3sdYrHBpfE9tmDeVCnrnubuAKb3
         UOkRQnfsGqXWqAef/EX44h0HDaKBB8QsK3rm3W31L2hNciNEfZPS/m3hHMAwu3v3EGxe
         f4tOLFsqQzqHEFS7H13PK7aAoZqM/lVTbOWqL+fCEp2A4CzDic4WrODqhPRxUI9moX69
         v+PQ==
X-Gm-Message-State: ANoB5pkkUoeMlTGjXQj8S4CryfVqTqFtWh9Wv/uLqaqxyJxG5wLEeowX
        /WYQIr4gwVteKDK1DMq5ycCmvg==
X-Google-Smtp-Source: AA0mqf47PGAs8fCQ4Z0uj/k2vezGwWn9P9tyi5uAcrbHyrCGf3Lh0Pir9XtBrY7XcOWFCUYU28Y0Ng==
X-Received: by 2002:a05:6512:390a:b0:4ac:2f5f:5c9b with SMTP id a10-20020a056512390a00b004ac2f5f5c9bmr1615735lfu.206.1668233983840;
        Fri, 11 Nov 2022 22:19:43 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512208c00b004a25468d86asm711484lfr.68.2022.11.11.22.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:19:43 -0800 (PST)
Message-ID: <c5b55da7-79ef-76c4-a2fb-02e04c6579de@linaro.org>
Date:   Sat, 12 Nov 2022 09:19:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 05/22] phy: qcom-qmp-combo: drop unused DP PHY mode op
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> The set-mode operation is currently only used by the USB part of the
> PHY so drop the corresponding callback from the DP PHY ops.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


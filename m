Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D830362690B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 12:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbiKLLQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 06:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbiKLLQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 06:16:40 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DF01D31C
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 03:16:38 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id d3so7220337ljl.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 03:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usLQM2GRgo6G5zV0n+K+few4UokTLDJIqn1X3n+/7eY=;
        b=QtqjW7jrkJx46ATqTwbwEIJimu4PgF9DKwVSOuuf4NmGi3MiGKXAQyhX4lMRjjufS3
         jNcSHkxmVCwPbd0Wvu3ah7dr7bKcay6XV8O095pN3MN0GMVxSZaHXsQQ3VQL6v4WOAak
         sU3G4SvH+7c4EhNFwl2eKRJRq74068BzfLgl4NVMFP6Rn/Sv9uuT96iPBiVQG/JhPr//
         AUriPuCgY0oy3ZJR/uh7JxkNLAniZLpYqXD2kSOF/hj/KLQGuX5LeAa0mys9+7PPKhjr
         /dnHliYI6Ij+BbJmRxaIn2uJ7yAyInVQq5MbhhHHU2iDnefq9R63k1HNs+ckVpxb3XZi
         MsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usLQM2GRgo6G5zV0n+K+few4UokTLDJIqn1X3n+/7eY=;
        b=zRjLjzUnqnJv3/ymwXjBv4hCtINOKGG669ugjgwEv9t8GObRFriJGXoodUma2NKq/V
         we+S9oNoxFowbPf0gBjnWh4Cb0mJwrGInJr8MwMdiHcN4EfkvPxyEo+nEDWWc6MCOYF9
         9OBh4WOr+RXlVUAC6jrO1cLidEHQhBHQwtyarAmk0gxm9I0b4z4lVyNh0PebnUkKEPmn
         1K5C5wfV+3T/p9AginltVpH7R1sSXQZ9EEEuYLGyQNxRsvmjz0xyOxJfyOTpUcV5YVXJ
         0y2FEjiLuO2ZlHmnrb9gu1P97NybV5gR5mQ+LPdSePcjNMhMUHSHzBVGSkgdBpqv+oJt
         feXg==
X-Gm-Message-State: ANoB5pk8VACD2Pg9CvefRxDy1uD6ZVRV/PHXuMzatoIHqxlvbHUysn2i
        mwjsz3np0mxK0n2e13RS2Z3YSTxczWgvQa0D
X-Google-Smtp-Source: AA0mqf4rX8KHS/ur6RbwvNnkJ+nujSEZ4baBqLu7grSwQ3YarEBmG1Z7Ak0Cq2Fe/Lxl2aoI4L6YwA==
X-Received: by 2002:a2e:8783:0:b0:26c:532e:3cc with SMTP id n3-20020a2e8783000000b0026c532e03ccmr1708678lji.66.1668251797322;
        Sat, 12 Nov 2022 03:16:37 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n22-20020a05651203f600b004ab98cd5644sm824622lfq.182.2022.11.12.03.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 03:16:36 -0800 (PST)
Message-ID: <d2aa457d-2d63-af9d-f206-55c8b3051023@linaro.org>
Date:   Sat, 12 Nov 2022 14:16:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 07/14] phy: qcom-qmp-combo: drop redundant clock structure
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111092457.10546-8-johan+linaro@kernel.org>
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

On 11/11/2022 12:24, Johan Hovold wrote:
> Drop the unnecessary DP clock structure and instead store the clocks
> directly in the driver data.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 52 ++++++++---------------
>   1 file changed, 17 insertions(+), 35 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


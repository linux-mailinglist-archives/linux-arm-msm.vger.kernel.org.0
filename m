Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E466048AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiJSOFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 10:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbiJSOEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 10:04:38 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8869B1D3470
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 06:46:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j4so28248976lfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+LxXEoeheHG6dh6zF/4rl0OCksLbDke1IojHO4tA8=;
        b=irdHAYA9Jwqqm0lxZQw+hxnUNsTL0kw7lUyDAibF1ONGiJ7yP9iggjkSnbYBaNetnY
         OHh6i4j6+BxG1lhj/4bHWifcc1AZl38kf1netmavd6C1Fir05OUvIdWSxH78x7kyRZnl
         dYO4XAfcGTfX7cQ0On4Wa0/m6/Ptr+vxvNa+WoR+MrtnmyfPFanzPgxlNYxASXdSs/aA
         g72AZJ2eb5OiL1Nbj7Tn4VsZYNkfD1roC/jGZ/RWB7oqcSEuuecOuu06c7JwwzxNK1SS
         v2HpB7S50pordEQFWQKqTKjUsh2KdXLwLX5jlutGSbBE1BNE/2Thg2OF/5aA9WArNsJk
         sxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+LxXEoeheHG6dh6zF/4rl0OCksLbDke1IojHO4tA8=;
        b=V1BmrEgg8Y+KGrdiGG4lKDe/KyiGOAAa7ZqPaymZ4ImfUr08NAGLih11TCEBjArqyL
         bLeMinqqg6Kqn5Cfa21OLsqzqz5BBQzOiit5f8q9JbQdRz2u0AsdqgiU7p9Hf6qmDUCB
         /UWk1EOsvHtefdQ9osLGCXlMcKtxTWBlceHNTJlolaL4xRbQ8II9ezJgvAvmBkcHqNZy
         JWQR4nEbGCl9Kyx6cTBseeDL+qdaQc/uu8UQ9Tmqajmzbid6umtN6jVbHf7IJbUO4VhH
         stDy0oQxRC77XB99d1Rzd6VDnWTErfMXRfvVRBuX9hV9GdVUOkHBpd9DLWhAwRKVuXQx
         RR+A==
X-Gm-Message-State: ACrzQf2z+oQ23tPB8FH87Jg5yAX8InK02BVDaKPwkLWFpitjs4lJJYa8
        3es43wdGsSjllUWvMw5/IIJseQ==
X-Google-Smtp-Source: AMsMyM54rKUClMHRJrOCc/1SNFrVq4sFv2gmYRmlKpizJzuAPsZ8y2ng4/eO3zYlb8FE8WHHi+7x2g==
X-Received: by 2002:a05:6512:3da2:b0:4a2:6fb7:b64b with SMTP id k34-20020a0565123da200b004a26fb7b64bmr2725454lfv.442.1666187102434;
        Wed, 19 Oct 2022 06:45:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512214c00b0049f87fb416dsm2315571lfr.12.2022.10.19.06.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 06:45:02 -0700 (PDT)
Message-ID: <a9c4c02e-de96-bada-d4a2-32c06e2eed75@linaro.org>
Date:   Wed, 19 Oct 2022 16:45:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 07/15] phy: qcom-qmp-pcie: clean up PHY lane init
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019113552.22353-1-johan+linaro@kernel.org>
 <20221019113552.22353-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221019113552.22353-8-johan+linaro@kernel.org>
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

On 19/10/2022 14:35, Johan Hovold wrote:
> Clean up the PHY lane initialisation somewhat by adding further
> temporary variables and programming both tx and rx for the second lane
> after the first lane.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


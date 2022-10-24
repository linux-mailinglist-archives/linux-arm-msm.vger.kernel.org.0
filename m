Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF94960B3E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiJXRTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235473AbiJXRTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:19:10 -0400
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1205BF0364
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:54:18 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id 13so6030751ejn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2Ef1B72AKv92WqpGmoWgiykPR41P059MtKUSV1dcDg=;
        b=UZLOcBWKiIN/hH5Fs9NPYS3GijO4NAndQrmQRsKbral4tksqPRvrgE9UGfwXtyEgHd
         3MEhNw0FE1tEqcbwLrO6qm28DGlR0ex8Y25o0YdLXVjozxUIM6mADVXyhVDffXNjM9lv
         umVwGtRz8CB+qSE85KNt9vlxDYAygN/Gk/qBPtlwgaI4tha15FV68qcR8G6uzTb6Onyr
         O+MWquMaYfEVxL5hvHPYuix7O3O3YkJNCrizTMHZf8adWGxudjVZrPnHY3a3SN63K7ol
         zIw9OTzDmhPU6yaCrWAgy52h3QMWWWnG8Iy6Kf7gYo87SQBx3Ixq505MUOVCEjfh+O04
         R2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2Ef1B72AKv92WqpGmoWgiykPR41P059MtKUSV1dcDg=;
        b=kNdhvdOLpFAiH0v56hT/jJfd2+XiirXqWSRB/V/FoBlF3iuYJnG2pMaKreMPLXK2/r
         qfSHyYoxfPhFRZZ71GX2kvX9Cn6fmN+svvHb1tiJtvavZbJmnwYUqgWfpV7eHj9Kjy4V
         ei0plZLSslmjCicZnv/+TRC/Lg8w6i56nuW18WlcJo12P05htY5ralhEDfKQP4dkqHKb
         5KDEbX7RY+mKfAUbLAVDd4oaNY79nnAkCVB65oLncsqwH1lmN2CREsbTYSo35bDR2x13
         qi6EDU8E1J0vJXs7rVrIPFsJCGO8iBPJSbJZ7tJYYdoF5sFM0rDiy/DPn/G1pG8CmIWT
         +0Dg==
X-Gm-Message-State: ACrzQf1cqIfKeyljU7xUmJq4NqPXlimPfHIjV847DEpzkWjKpzVHGTZn
        dajvh/drgMIkCX15jP0Y89QfdrBFf4h3sUmF
X-Google-Smtp-Source: AMsMyM5jX7OiDEQDWyvzBEOzsc0vxkYH4NLEKD4zJsJxdaz8GYopiaVKrrXCyW7CktB9D8iJmH3GvA==
X-Received: by 2002:a05:6512:2c88:b0:4a9:4051:79a1 with SMTP id dw8-20020a0565122c8800b004a9405179a1mr3897069lfb.331.1666618277293;
        Mon, 24 Oct 2022 06:31:17 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c24-20020ac244b8000000b004947f8b6266sm4410814lfm.203.2022.10.24.06.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:31:16 -0700 (PDT)
Message-ID: <9cb136e3-4028-091e-a298-ff24880f32b6@linaro.org>
Date:   Mon, 24 Oct 2022 16:31:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 05/10] phy: qcom-qmp-ufs: rename PHY ops structure
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
References: <20221024090041.19574-1-johan+linaro@kernel.org>
 <20221024090041.19574-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024090041.19574-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 12:00, Johan Hovold wrote:
> Rename the PHY operation structure so that it has a "phy_ops" suffix and
> move it next to the implementation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


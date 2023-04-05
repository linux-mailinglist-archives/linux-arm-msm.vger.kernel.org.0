Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17556D86DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjDET2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDET2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:28:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EE2525B
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:28:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g17so48076484lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680722931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=346s2bKdYoG5vPV5rp3s9nWtY0B9BIwq57Oj+lIn3Vg=;
        b=ng0x/2R0Th8bEcsqzNgfBpd7/DzXCd8Cd4TRPar2DMSSggI5YlkDkHDXKcrpUkUqDW
         Z0Y0MexQ0ZUj2q7lmZXTpPCMnUYT/bl32auSmZsJC/z2w7UbSAeRrvLulKh6F/2baSp5
         fZfdIpk47kfzN2ebK676NXnkOU0y9FsG10QR+2KLvI2stawy6Mv+7EQ8yGq47HvcBw1e
         AkN1w4Tuyl9MEhr4XBL2mlenP3w68sSQk4jQDgi5rxICVDy95DwjcCSfvC4esB4s/ibY
         TfNKSNEprLMCPkBC4/7uPfbVBhAlhthOvffo5QWc075V/efwccfDW4spoRNVoUTgZMoS
         QXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680722931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=346s2bKdYoG5vPV5rp3s9nWtY0B9BIwq57Oj+lIn3Vg=;
        b=Ut+W18L103tebJfcpnfuotCDx8p9xcXnx7gKrocwGS8APIJeVvjVY0KB8rro+/nIs9
         LgLrETnjb8plCOnMvLfnzvBX1mqcrV9+MGwOmThydEpYrmrXs8YoLXf8JZQYDoo/T6rk
         PHe/1kd7vwS3H2ZRTk+PY2QrBKjM6rh9ZNztSMGrMdjCT3aBYUE8WCAjLRIlmYaUA1b4
         pwQ8pjtYdCNqz02V865bO74o/TIEnGzdDClhpScOXk9wQFpTfchliDXAQYM7TuBPTrIL
         WFMh4dM/Kmvdd/k6POJkr4PiyL5JLm/Ws08hPCM5N+zpi6aADpTzmTr2YN9HIEOl5oK2
         chhA==
X-Gm-Message-State: AAQBX9eEQVstoS0AMdsaqRgXWfCGJqudawpid31XRR8qV86s+GyWj1QO
        WTxp9yUarIvf9czL8WjX3FWbGQ==
X-Google-Smtp-Source: AKy350Z/ouHgHeB8oV+efcHIpdWXA+rQsJ/apK5YiovxQb31exrCS09spev/Ov7kjfTinHYxaC9usg==
X-Received: by 2002:a05:6512:961:b0:4de:ca63:b2d2 with SMTP id v1-20020a056512096100b004deca63b2d2mr1776561lft.26.1680722930935;
        Wed, 05 Apr 2023 12:28:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o28-20020a056512051c00b004b55ddeb7e3sm2959997lfb.309.2023.04.05.12.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 12:28:50 -0700 (PDT)
Message-ID: <14d6749a-1268-f311-1e17-115bc6328681@linaro.org>
Date:   Wed, 5 Apr 2023 22:28:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 6/6] drm/msm/dsi: Fix calculations pkt_per_line
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-6-1b79c78b30d7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-6-1b79c78b30d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 03:41, Jessica Zhang wrote:
> Currently, pkt_per_line is calculated by dividing slice_per_intf by
> slice_count. This is incorrect, as slice_per_intf should be divided by
> slice_per_pkt, which is not always equivalent to slice_count as it is
> possible for there to be multiple soft slices per interface even though
> a panel only specifies one slice per packet.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


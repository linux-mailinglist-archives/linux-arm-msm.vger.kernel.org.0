Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4290B6F08D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 17:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244153AbjD0P5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 11:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243994AbjD0P5K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 11:57:10 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A8A3585
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 08:57:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9536df4b907so1640447266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682611027; x=1685203027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cH12h8gx0PWDPigXqbqwozUNRD0Cp+35p1ClIe9c8g=;
        b=SlHUO+Yu+A759O72XQxISrPAsoC8mB81KRW9/HwH2y0j3pg5RjSiH94gpAR3J5sGUi
         uI2Xs8vSy1iykpzp5ykoLiKHDUNKN5dmJTkQVQ/UKKzOLTvRlP1vjPFl0KSKItCb29JF
         po3FMw5ZWRqOkKnE93q4xHtF5AUzvF3ZbvJ6hq7Aa1yMwe9Qsd+QIDmAUOO61RvOZaMW
         abKuLDioyAZUn7J8B7zBdvFjQTtSnoEPNLy8c7MY33oIe52ZtUuIwK+Ch0teFJLJGenE
         rfH9ouA4TD/SQmCJTYYDdWq5XA2K9gNGih7sxMcSE7tOn58+zJQj5Lsvzdtgj1OIpDet
         +EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682611027; x=1685203027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cH12h8gx0PWDPigXqbqwozUNRD0Cp+35p1ClIe9c8g=;
        b=LGF/tk41wcc9+fWEMyVztDy0r5cP7CmbwPc+366T0/3sykIQ/fBGU60R7loVDlHTqZ
         czE6ED4woJvv7iG0tBCLunlfEknrSRFLZu/CufkDYOCnhjE0Cok0bUMGFFzMgozAOaxm
         +FH/871bcj1v9Iqjo5W/Vj9tySbos2ZuQXa038v5Q5MShZU0gSWBpOaB9hdijzG4ieP0
         ZCJGfgMuiqHhmJpWnivVHfygM12YvcBhU8hnfc9YzwV1Vdz2A06Z77tmUThkk7ZxH14M
         lmLGVl81UeHm3WQSDmVfsgiay2Q+qHXM53wgFlBzbWPOvU5Ln1iVCx4kTlpBNLnsUI+O
         KcSg==
X-Gm-Message-State: AC+VfDzuc30n9aKDj9v60YaunVc1sXMqTp9Gdunhap1mi20W8uOPDkEm
        TeVbrHxU6em3HefK/Xs/q4e2Xw==
X-Google-Smtp-Source: ACHHUZ5phXkCDiqMiJbhsnckjPHBo6cXwTFrQneho/GMvFOJmMiBU3kg8o+dAc/M9aCLdolIMZSDLg==
X-Received: by 2002:a17:907:3686:b0:94f:cee:56f2 with SMTP id bi6-20020a170907368600b0094f0cee56f2mr2233749ejc.4.1682611027668;
        Thu, 27 Apr 2023 08:57:07 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090682cb00b0094f5179540fsm9739881ejy.83.2023.04.27.08.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 08:57:07 -0700 (PDT)
Message-ID: <7e2fceb0-7b13-fc21-5e19-9776ad9c8770@linaro.org>
Date:   Thu, 27 Apr 2023 18:57:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK from hw
 catalog
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-4-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230426192246.5517-4-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2023 22:22, Abhinav Kumar wrote:
> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
> than DSPP_MSM8998_MASK, lets drop the latter.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


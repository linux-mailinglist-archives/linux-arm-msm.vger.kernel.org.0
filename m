Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733DF5E6C2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 21:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiIVTyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 15:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbiIVTyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 15:54:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20C930567
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:54:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o2so16418474lfc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OjwZCqtCWqNmy6fBlsSqFzKD3bCEsVFc8uYZ8NecXtA=;
        b=cR1wX2FyrChyeXiQTbsumMufekbEXq//32J9TUANOOvMEPcLZBAnvdJkN5/dOTPFhW
         YDzxuQBUWoM8O+Ji2t/YzyJES7V01wIFwoDljjbUsfMqbKEr+FsO2QpGX7GhL2/Mp4G4
         mON4wkSqvEa57udsnvbN4U4OpI1WBslnFDc6d1PdQDr6yJLEe2WZ8OHPXEFigl1J0xw3
         b6XSaWYhGmBtfvo3PjAqcFcVUcnANXhRnP4+5lIbYIDCqnyNSgMZUJtB8fHlA6AehCax
         fMemAtVkjVnrgnonlx+vH3cCQc+KK2iIA9bjL7VaxYEEbI2M6aePGQ0YpGae/k2DGaZq
         QTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OjwZCqtCWqNmy6fBlsSqFzKD3bCEsVFc8uYZ8NecXtA=;
        b=rb0KgHuk4Wrryjsqt3b1T9u8pGp8+6/UVM4yH+3AixJ8ksFy5CmySD8Mig7Oo3jgP+
         4fvyRuwYYmuk7JpSnSEdFNo8d2iOIFlsPM34RKbnY5buqdyOtFr1Sc5aRfT7qoCM6RJE
         cL5/8I1hS4iUo2jtO2HLseBAaQvzQ99YVsyDqpnEWkRQBYTVCJeIUdy13gXhBJ0IlfMd
         Y0DUUolxHUsEy+IOBBFaHgcETYq+eFsLwdJzdUCqc5YjKopWtoEWY3jx2tuodzuCVTLr
         uUM9NNWNiEGJWAmtK98/kIQBIQajq/DgELgASwZYOjirsGdaBoDdl1mJDZe+Sqm/jV9Q
         rWSQ==
X-Gm-Message-State: ACrzQf0RyVilFF7e7upJ0NR3IIqzPqdGjyoBuJrauWICKdJgw12tEHHy
        igthtaQY4TXBsmtCquhOne2SEw==
X-Google-Smtp-Source: AMsMyM6i0a3Z4JYmUOIVUA71gmZPtBQq55ndJesQ2D0Yuq+Npbif2fuRodqYcIhyrWi8eBAEzx2g+A==
X-Received: by 2002:a05:6512:ac6:b0:4a0:2b26:3ab3 with SMTP id n6-20020a0565120ac600b004a02b263ab3mr1551875lfu.154.1663876478067;
        Thu, 22 Sep 2022 12:54:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8-20020a056512210800b00499b726508csm1072325lfr.250.2022.09.22.12.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 12:54:37 -0700 (PDT)
Message-ID: <39ae31b2-48f1-4c30-851c-17276ce55e25@linaro.org>
Date:   Thu, 22 Sep 2022 22:54:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/10] drm/msm/dsi: fix memory corruption with too many
 bridges
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220913085320.8577-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2022 11:53, Johan Hovold wrote:
> Add the missing sanity check on the bridge counter to avoid corrupting
> data beyond the fixed-sized bridge array in case there are ever more
> than eight bridges.
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Cc: stable@vger.kernel.org	# 4.1
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


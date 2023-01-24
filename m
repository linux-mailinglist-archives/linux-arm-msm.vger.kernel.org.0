Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630B867930B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 09:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjAXI0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 03:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbjAXI0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 03:26:17 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6A78A62
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 00:26:14 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w11so2148558edv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2e7HEaZzLpkgKJ+mpx17xzcEDMDD/CmZJqe3c3ax7l0=;
        b=zncYDCgpGkMatClGm2DMi0c0OdVcLDIdyt7Rb9+a8egPe9nKd5uiikyemO8vz+bfmB
         MRPOX3cmhv3RPVHso+TAS6TGx4StMby9I+rUgSgSdmNgKT5Bu7Plj2aTZuXe/G6qJDo2
         PdzSVUP4Tb8Yy3YhDaqgb3xOfjH5NRGzuZ693taFd9cp1UHCKtOYffDhVD51TxOxVCam
         0V3SJOEUEPz1BXoNVDwiW0nZr+5pLlbwVB4+UUjOn8DF+FdHa62vDoI2AyUOttcEU2r5
         yo+jAqoE+tumTM8Hu0xcYUo2N7F4cDEzhbZcFCRszTe6mIm8ySrNBALs4B415aOnQZo1
         D6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2e7HEaZzLpkgKJ+mpx17xzcEDMDD/CmZJqe3c3ax7l0=;
        b=kwQtrJxyg6rH33EP7XGX3+aNoF5xbJfzdQodc+xEypc9b2ZxfL4LP8KI5/U6jQneIQ
         ybG7PBjlc2SD8H6LtNGCKLTKo4iSkrE6C3MkWWuuwuA0n7rQbm17wwTZECFC9elHACFe
         TD6oZ1iKyWZkW1fbkgsJPxvPLl4B2T+pGd2HLPUtntNaYmVEUGt4oJ4puHdyiDyfGzyA
         H/bChlv6cpEuGh7t4MgltAfAc1vZAFYApNV+euZTwUcHgYJZCuSLx6b1k13MbiOcx5Hj
         DPuZYnxobY4rMS+4dt+rwb+RirDdxztnuTiEAQBAXa8vNl4TpyZyQCpXnnbJ+6e6eqQA
         xIgw==
X-Gm-Message-State: AFqh2koBx1HUB5s2PT4OiBXJF/0ZtfI4VZzQdPhNJuJ8GFB9Dnx91cV5
        dywqOm7AJjcw8XpkYcDqVYO7BA==
X-Google-Smtp-Source: AMrXdXvTlmdYJDkk7HNWHOpnCfo2eeTcCcUwQ4fhimZfI+UQoykA0RByBJDf74eFAZPIC7GmmB9kGw==
X-Received: by 2002:aa7:c9ca:0:b0:49e:28c1:936c with SMTP id i10-20020aa7c9ca000000b0049e28c1936cmr26949737edt.26.1674548773533;
        Tue, 24 Jan 2023 00:26:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090636d700b0086dd8f20a6asm561330ejc.77.2023.01.24.00.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 00:26:12 -0800 (PST)
Message-ID: <b8a3b544-daf9-a357-1ab8-236da345a413@linaro.org>
Date:   Tue, 24 Jan 2023 10:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/mdp5: Add check for kzalloc
Content-Language: en-GB
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, quic_jesszhan@quicinc.com,
        ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/12/2022 09:48, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check the return value
> in order to avoid the NULL pointer dereference.
> 
> Fixes: 1cff7440a86e ("drm/msm: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


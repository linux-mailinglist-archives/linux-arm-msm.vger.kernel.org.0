Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEF65E6C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 21:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiIVTy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 15:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbiIVTyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 15:54:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D63C10CA41
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:54:24 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z25so16475187lfr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zDb70WoeINlNx9irFKk6bRAswY6QKXf8jtRE5Sg+xuc=;
        b=e14Rma8aobSIPoTFiAvddfO9VrrSEWb5OAv/vAYZrJyxHZLKgNe7FRwCy8H+rMq55z
         9SgiTOBTOW5fbmBNgeSLAEswJqAdv+LvGlIkFYAwH5ZmH67wkj9mWeUbArfatAFrMITy
         9DTvu3wxHjcAVDwgrJzXLdF5we1tV7FdJIj9KDmNAUPS02FjiFghQr2HzEoA0jbmBTdD
         yFe40SVo0m6meu1ADwI7rqHmpd4ZXWuul8inj7VP+Iu89bdcLwE+TX3DtI1IyE6YolYu
         EE9zpZO9JDEx7z8DE50gxK2keFlv11vniqms6lWh7RqacygUPDuWhhjAvMThlrht3wx3
         meug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zDb70WoeINlNx9irFKk6bRAswY6QKXf8jtRE5Sg+xuc=;
        b=x0Zo2WXIupFX/Mu28Kvhw133GdBUxNyn5wmxeePq8Ym+l/jkHP0F+n9QpiosozmsQ9
         buXiwsHrM/FJ7XQcXMlZJnQWxCJCLXVHa0m0qqYr79jxPlOeduIdNLW8QXIp4IRc7psI
         LCnmtu2iy8cejU7HPp1OcxXyvHuDbLNmXMlBwLdLOhNp4Pizsue0TsXkQvWVBqNeVRxm
         27M5smtGZ4NREG3VwgRSr5YGtSL1QRYpgNnBegPMlp+GBZo6RgFDYpGuonpb3iHaG2qL
         ajQgLhrb6lPBUWal7Rvyzqjne3BW+TltVUST8RaNC1+FALcd+j4f6X8p4XJGWpONRWsF
         A0Gg==
X-Gm-Message-State: ACrzQf2pUusOtoj9sqCgxLTS6jidbiEpz2nDhMn4f2IQyWX/6uRZJD41
        usDUun1n02MaMVxinQ3TtV4L5Q==
X-Google-Smtp-Source: AMsMyM6rSKkJT7IrEEGLQaau0EqzxrS/guqoT52jaku/kN4wSEXcJRuY7+W54WkiFW0yNFbLYDB6yQ==
X-Received: by 2002:ac2:454a:0:b0:49c:6212:c44d with SMTP id j10-20020ac2454a000000b0049c6212c44dmr2035689lfm.430.1663876462589;
        Thu, 22 Sep 2022 12:54:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r10-20020ac24d0a000000b0048af3c090f8sm1089401lfi.13.2022.09.22.12.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 12:54:22 -0700 (PDT)
Message-ID: <b3b59b86-d9e8-5706-c9e0-152523661e9e@linaro.org>
Date:   Thu, 22 Sep 2022 22:54:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 02/10] drm/msm/dp: fix memory corruption with too many
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
 <20220913085320.8577-3-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220913085320.8577-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: stable@vger.kernel.org	# 5.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


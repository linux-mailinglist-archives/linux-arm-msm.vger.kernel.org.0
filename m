Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C5F59CA12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 22:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237358AbiHVUeS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 16:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237416AbiHVUeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 16:34:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C30E27CEB
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:34:09 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z6so16881757lfu.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=n+5KOQrd1zcRYfj9IdOVX1teuqbwsnScpQd/P5v+XSc=;
        b=MnkO0GK7zPhGQTTU5nw22JzPP9cYth/4/+c9bbtGBTRxAlXSdkDkEvSNUvm33QL5t8
         lh4V8HDA8GJw9DsqErxuEZxsOWEDElCOuEvrTQ8ApAHvDNqbm59AvfwlaHzhYTeulNWD
         cVLULTK4JVItAv4cPkixwjXDi+ZNr7lBjMMyOIrwVQhgApjnpK1NCiStUIYwHLmIFY+N
         qCru4TN8N+SMWvE1C3787wclJFRAAEO7GYowJviQYOiGIdgUUM5xbzhVVHgnBGWd/Hr+
         L6kYIDRD6ZbrYauBfF6bREQLbSdCCIaXmvg4g8oU/sngSa9//hAjP2d2mokpGgsrQfp3
         0GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=n+5KOQrd1zcRYfj9IdOVX1teuqbwsnScpQd/P5v+XSc=;
        b=xpxjnA7ORG4WdY2NJhYeg0jOoPnU2KlkdYSsjYbrtKxBNdZDArILNTccShvXwM5ifn
         efa4QGEJyjHISdgi3GKdbZiplI2qg1Xkn91dTbyXlrNSv87qosZ02KuXWE0GROQ0gy4S
         Zq35uYUDIvB76j+Vtat6xM5na/wlQ2nTc7sJkLZRnkhfGWLQTD0Wfn/G4XC362HPWMd7
         Ks4Bq52Pb9MxfQGXbfBxmYFmqkEdPM3SVPDzPK5iuNWgZU+h47RqmzY92Pr4jVelVvxh
         2eQUV5ciOwQvgWCkZaK9a7t26FJexOCexMQR+iTWw9P3xfY4jF7fqaGjhH1X7JIdpcrw
         flcw==
X-Gm-Message-State: ACgBeo39uRDPuN5JEafdskdgpRzoZe2+eYVyJIvdnpEEX2uJYr70a/FT
        z3HbJsjTa7z/+Z5z5j0ZWo7JtA==
X-Google-Smtp-Source: AA6agR753dxf3W5qo9qPUq3jDVTHWl504cW4UYh1AEjc/sllgbZkCbVKuNBo4Z3dcTm6sKBfN/fDrg==
X-Received: by 2002:a05:6512:1583:b0:492:c028:d2f3 with SMTP id bp3-20020a056512158300b00492c028d2f3mr7999834lfb.216.1661200447407;
        Mon, 22 Aug 2022 13:34:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 13-20020a05651c128d00b0025e4c560475sm1991849ljc.96.2022.08.22.13.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 13:34:07 -0700 (PDT)
Message-ID: <e13e644e-0f18-b338-1068-e4405def3c6f@linaro.org>
Date:   Mon, 22 Aug 2022 23:34:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 4/7] drm/msm/dp: Add SDM845 DisplayPort instance
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-5-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220810035013.3582848-5-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2022 06:50, Bjorn Andersson wrote:
> The Qualcomm SDM845 platform has a single DisplayPort controller, with
> the same design as SC7180, so add support for this by reusing the SC7180
> definition.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry


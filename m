Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18345A22D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 10:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiHZIUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 04:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343636AbiHZIUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 04:20:35 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3DC15A21
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 01:20:33 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l23so896295lji.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 01:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZIIB6p8+GcEolV6RN9oSlXFiG4o6xXTtdv/9DOxOtXM=;
        b=tNPjXlQj9Q80gxPnM5tgHSO1u9W9l2FXH76KS++DyEsHaLkMFf2lpVZaIyVo2bd+ik
         BjHUmIMnW/Wva8Al8IK1zGCUKIVe9UPUV3MuV9JzSQ2iVul3RI0OIXUgTn2e0mUT3a9O
         KrBERk0GxHPR65SUAHH1aUkt5k86yoHIdkmMED9uwCHMpA/He2mIrvDGkFOUksZeYqVI
         QWsJLBiS/Aq7G8HfyJGetZWQjhBJK2J0qrKAurZld9vCyncIj2qE81hr66pawyGyaBic
         EK53YZjsyiHeGq6pI7TNYOfCm5co9dTo6+1rzB6yx5lzel3bZ3w/CNAOcBSAkwKcmplM
         YKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZIIB6p8+GcEolV6RN9oSlXFiG4o6xXTtdv/9DOxOtXM=;
        b=k6CKhwrjvCQm2JAJS6Zbo5C8c9jr5EmdRTaaei22EoKOU35cdViM3ll50ew8XCFWKw
         rSqPZqkKCIVVwaWdOUfzqpQW8mlghx/ZDMGOgGgouF2frfomB9vcMtcyh5sDzoNZA0r8
         Y4g/E9oEQ6PZaKK0Oj5iZ4AWC1Vvd/5PICjWA6dbnSt2oOc3FcefFrqyl3cI/TGAuatC
         OMk9RL5iSMjqzD1R/Xu23apq2rDrhHIxeyZ8c7/3ztCt5zu10Dz6aAnJWPhvBkhvnJQh
         NgPjVjbKFxLPZTfcYCsx+rPANIJQkKxjeNKfCEDmOkBWUUl1GKpzGrC2aJAlv1gBTVkY
         bFzA==
X-Gm-Message-State: ACgBeo3e6D0Ybrgxlbx/z7lc7tfUCRFZhuYi8+gtsFK7vY+NPznjPsDI
        Yc2FDwUQ5/EiPcAwjxY8+ojZKQ==
X-Google-Smtp-Source: AA6agR4vV/tZcz4yv4jCGwEcaNKj5eE+IrPE4xj/nrvIDdQLzWzu8KXdbOSxPkB5zlMQotgmL5gKGA==
X-Received: by 2002:a05:651c:17a0:b0:261:ac0d:6c45 with SMTP id bn32-20020a05651c17a000b00261ac0d6c45mr1984674ljb.225.1661502031668;
        Fri, 26 Aug 2022 01:20:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p1-20020ac24ec1000000b0048cf0fef301sm287425lfr.301.2022.08.26.01.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 01:20:31 -0700 (PDT)
Message-ID: <b5400980-9736-0756-42d3-84acc918bcb6@linaro.org>
Date:   Fri, 26 Aug 2022 11:20:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH linux-next] drm/msm/dsi: Remove the unneeded result
 variable
Content-Language: en-GB
To:     cgel.zte@gmail.com, robdclark@gmail.com
Cc:     quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, swboyd@chromium.org,
        laurent.pinchart@ideasonboard.com, vkoul@kernel.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220826072821.253150-1-ye.xingchen@zte.com.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220826072821.253150-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/08/2022 10:28, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value msm_dsi_phy_enable() directly instead of storing it in
> another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


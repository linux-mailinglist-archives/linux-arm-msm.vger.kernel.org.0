Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188B559C4DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 19:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbiHVRQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 13:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237325AbiHVRP6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 13:15:58 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591121EAE1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:15:57 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q18so10239006ljg.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3B91h+yrTjwS7I4FUx77uKxPNz+E7GshMHnIapiZTc8=;
        b=L9QS1hKwgWBMx6ma10ELOh9eQnoZAT8Szdd1iSgK+rhGHKoZ6Mtm7TdVEyday19ApG
         R3x87oAm5OhNvqgvSNUuuRIalt/FEzvZraWsVRATJVhrk2zNUxrDG1DaPfqa1gnvRiET
         GrjSk+xWXT3q1YI3kCSOaTd1UTyO1DACmUkCAqSUglcPKmJP1VWpzOVBZaafRTN020KX
         qgfAE13dDMgRhUjuX7bsxL0AleLwvYnfTTynsdyZJ0GrQ26JoQvufwKvqsGlC2wbb9YA
         nfXmXt03p+fYISvL3GLe/omMfhMvZoA6T2eo0unJ3CCi/WCwLifw7v7K7vddOmcEa/u+
         O91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3B91h+yrTjwS7I4FUx77uKxPNz+E7GshMHnIapiZTc8=;
        b=bGRf5ZG1v9e4VyagSb+jlxj7Tnufk+Wt54HCIteSob7R1ty4PJgn7ehR5yMvtkmZsk
         VyIZpuPz9l7BnLUXMALhwqdItxRksEVl6kERfyRYFAFKqJcMEswic1i6/yGrpq8R2Mui
         QTLEljh9JF2srBdEh/D8s8Qc5I4EJNhtY6KxKwPLMzexNPtUcF5TT7Lq0vqUq2pYK7Dc
         +K7nLq8uisDSmPei3AWFayfaA1H6xLxRdxXKMcOWtseW+zZ610yPzWjLMk35ELRh2Csq
         5JEaBbhaN64GT3WFjXLtiGd39hOcv2leszJVoI5uXyPF1U7z3rP6Kdy2zBvcHPrRio9p
         S+FA==
X-Gm-Message-State: ACgBeo1ruhmY9+mBknKN8Le4qMBfEEKn8+KiKPs3iISwTVzUkKZcFzTZ
        GKmihlovmD5afehk22x7vxwUOQ==
X-Google-Smtp-Source: AA6agR45NEMpbO0Z9AzrrsVon/LA0ZrvVtjVxutO5v+1o6P1YNcB95+XrUkQ2XHqrbFf16qxDUfE0w==
X-Received: by 2002:a2e:3314:0:b0:261:d144:faa4 with SMTP id d20-20020a2e3314000000b00261d144faa4mr1232145ljc.208.1661188555755;
        Mon, 22 Aug 2022 10:15:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651203c900b0048b0bf9f4bfsm2010195lfp.140.2022.08.22.10.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:15:55 -0700 (PDT)
Message-ID: <f0016468-16f9-aca1-c362-805bfd141e57@linaro.org>
Date:   Mon, 22 Aug 2022 20:15:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm: De-open-code some CP_EVENT_WRITE
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220821155441.1092134-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220821155441.1092134-1-robdclark@gmail.com>
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

On 21/08/2022 18:54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


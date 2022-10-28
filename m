Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71B86110F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJ1MOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiJ1MNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:13:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1903B1D3C42
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:13:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r14so7991800lfm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xR6n4tPOTRtX/oPKaIWQlGUsVv0ju4GWJB4ChrEGNQs=;
        b=oTGAMQIRL9jE0Ap9S8AnYZna2RYYXpSYyRJjE50e+VKAoeJ7tdgFkXIeMlWTiLHpDq
         n8HT2ZWqqmSZyvC9flPK5Z3Pk4e1FE1vIewgY0/2he+JonIowrPmTDE6YUnxtZLQZXNg
         qUAuwp4HcJb8pq3OGaniff/LxuiHtYWB3a66H7j69IeV63zDkb1nNHMseyGxkmaKuzBu
         R09jekptyf45syURijFOjYJquuXlE/wa3iAd+MN1W+n9YtKSTTM75d1XLMq4YKhATXC2
         1OEckM4LgtTsXAIQRXsskyWrYwN9we2m8NVVPy4jgR21tNGC49IJMwRSn5iw/vb1KfIL
         YfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xR6n4tPOTRtX/oPKaIWQlGUsVv0ju4GWJB4ChrEGNQs=;
        b=UsH5SzZcen51ysigKFQE50jEy7eTbrlN6/LaNGSOGm/AueAfPog2GoNeNkQPk7xfxf
         Y2SuVQ25S7G9+++/NGfysVgDWPbCbAi1autJVbeerag51ou+ldpaWXV0i7YgvE+F+UFp
         ak1EexuN29ofEnhOa5FNaCwdhuZmA09bNf9MD2BZv1uxX+wE6UVAx8N1qvNAfU28jr3c
         mosJF5wwam42drJQ+7brBRfXJ1zVZ26DaZx4ADUhKY0jkJ5gS0Xe0Tzb5sowMPt78bpy
         KhjdNWewuIoOjasiD2bSi7NljGcmKBe9dhIWhlB2eXwUuLz8V233NOo+bIZumVHp2J5z
         6HZw==
X-Gm-Message-State: ACrzQf3Z2cHokTVPFHXa5590AsYShDcAwqhq/6jcXN/gJIDnCBLSwHZC
        n56JQ74JgrY+uUMrUBxuDAwgeA==
X-Google-Smtp-Source: AMsMyM5MbTQFq5x3e6ONcHd6Es9SsNthXHhjHeyRI7uSJVr7cGXvBBvArBxWA4ttYfN0ItFnubGLHw==
X-Received: by 2002:a05:6512:3110:b0:4af:7f73:4e9d with SMTP id n16-20020a056512311000b004af7f734e9dmr5132328lfb.588.1666959209457;
        Fri, 28 Oct 2022 05:13:29 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b14-20020a056512070e00b0049876c1bb24sm539842lfs.225.2022.10.28.05.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:13:29 -0700 (PDT)
Message-ID: <cde17188-734d-8000-8ed8-82a406a2b079@linaro.org>
Date:   Fri, 28 Oct 2022 15:13:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 1/9] drm/msm: Add compatibles for SM8350 display
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
        swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_vpolimer@quicinc.com,
        vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-2-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028120812.339100-2-robert.foss@linaro.org>
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

On 28/10/2022 15:08, Robert Foss wrote:
> Add compatible string for "qcom,sm8350-dpu" and
> "qcom,sm8350-mdss".
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   drivers/gpu/drm/msm/msm_mdss.c          | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


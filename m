Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56316040DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 12:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiJSK0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 06:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiJSKZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 06:25:24 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFAB50FBE
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 03:04:59 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r14so24460612edc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfXARYLAPAKPU+ts0JPN6WSMDNf2tPgtkDo7YOo0RzE=;
        b=aC1Rq9oRQvkYFkj/zSMB3cGfJmPvgA3ym7b0Aldx4sTYZ7nbJfYecv1+jCaryzsIpE
         gMs5WaFiZLV2+WGy07yI1VIZCPVdLMVCywN4zg3f0kObS8JlnY37PgSw6uGPex55FxqZ
         C8HCDRMyjI9KWk9y4dZYE/l4HDEYZUFbe9mnFxiN03LOJAxCRO+AJEOJwxUIFdDuoGH/
         NlQYKbfoOIYpXEWTaYHEQ9sX/KHuBRiKgdIrbdFfQJcr0F08HGt0TjE4J4pkshliHydO
         k2+6fJytl8F7e0TBpGD5N4O3Par23nLOl9lS/vM/pHW/y19v85vLlGhOuF8+fdLMUxaZ
         F8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfXARYLAPAKPU+ts0JPN6WSMDNf2tPgtkDo7YOo0RzE=;
        b=urXqPiTJ91PFjwbwy+CRjWqeO60ZvmfTpp/12FjOCCx11Hi2WKqjRBeE9skOSmaMCg
         PKMaIvHEnHZIMRsEBalMivChyhytfolh1ZanjbkNmN2DkpAOa01jM6u3FYHUNBR+dL5G
         oWSPBmv708aHd/uPnlCdatwaIFXyXbZB+4zR6CecX9d33XyFSPLd4k/cNvfPB+oEu6Sn
         EdVLjr0kyknEcX3/QjpzqTQ0Ix+qt1Kc7pIUHrgcPvRHyPAvfuQXIn/57um+XSzmhgjK
         1d+P7sYoO/oM+huaP7NMUzdrO0lbaFmM/h6ELrI7oxp8c7V/MmCiyoPQghONAAlwcDgh
         pwjg==
X-Gm-Message-State: ACrzQf1FjlNiJ455h9QqWB3lmGiIryMNuvssZuP89pY5wXN0DSRkymeh
        vPCMta2IkHry9ohnXinsZO60q6ebPJ7CRA==
X-Google-Smtp-Source: AMsMyM4whuxT7+AoBpdG68cpyGwsuxGExvwb5YnVAEngbIbOYk7MlxvP+3mfP7XiBru3VnVLBrTyNA==
X-Received: by 2002:a05:651c:1786:b0:26d:aaec:1487 with SMTP id bn6-20020a05651c178600b0026daaec1487mr2528273ljb.287.1666171643259;
        Wed, 19 Oct 2022 02:27:23 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651220cd00b0049f5358062dsm2218639lfr.98.2022.10.19.02.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 02:27:22 -0700 (PDT)
Message-ID: <09e82b02-dffd-8ec9-4851-11715a16b67b@linaro.org>
Date:   Wed, 19 Oct 2022 12:27:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
 <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
 <20221019091341.bqkro3zmnojcqvnu@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221019091341.bqkro3zmnojcqvnu@SoMainline.org>
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

On 19/10/2022 12:13, Marijn Suijten wrote:
> On 2022-08-26 12:16:40, Dmitry Baryshkov wrote:
>> On 05/08/2022 15:24, Marijn Suijten wrote:
>>> On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
>>>> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
>>>> components") changed the MDP5 driver to look for the interconnect paths
>>>> in the MDSS device rather than in the MDP5 device itself. This was left
>>>> unnoticed since on my testing devices the interconnects probably didn't
>>>> reach the sync state.
>>>>
>>>> Rather than just using the MDP5 device for ICC path lookups for the MDP5
>>>> devices, introduce an additional helper to check both MDP5/DPU and MDSS
>>>> nodes. This will be helpful for the MDP5->DPU conversion, since the
>>>> driver will have to check both nodes.
>>>>
>>>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>>>> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630
>>>
>>> But I'm not sure about giving my Reviewed-by to this, as I'd rather
>>> *correct* the DT bindings for sdm630 and msm8996 to provide
>>> interconnects in the MDSS node unless there are strong reasons not to
>>> (and I don't consider "backwards compatibility" to be one, this binding
>>> "never even existed" if mdp5.txt is to be believed).
>>
>> As a kind of a joke, I'd prefer to have interconnects in the mdp/dpu
>> device node. In the end, the interconnects describe the path between the
>> display controller and the DDR, not the path between the whole MDSS and DDR.
>>
>> So, for next chipsets I'd vote to move icc to dpu/mdp node (and maybe
>> even move existing inerconnects to the dpu node).
> 
> Sure.  In that case, do you want to rework this patch / code again to
> only look in the DPU/MDP, and not at MDSS at all?  (Or is that another
> DT API break we'd rather not make?)

I'd rather not make this break. Let's keep backwards compatibility at 
least for now.

-- 
With best wishes
Dmitry


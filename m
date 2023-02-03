Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEF7689B44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 15:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbjBCON6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 09:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbjBCON2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 09:13:28 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ABEEC62
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 06:12:51 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id f7so5298318edw.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54zdl1tRuHVK3aF6AZOHZOpUGyh9nh8JsKMJAcUFHTg=;
        b=haenjJLu3SMXpiI575MBFq3SyWjaRgpGdgugDM2E8Gl/xZUQ9cu4Q4HYLsxz0tka+u
         GDRHlBfylQcoBU/XEfV1nRu8XdOJfpOh9ajkMlrh08XYGfUWL0MOVscytFYbwbz3boif
         tQnK4oq9w6iTC5EBXN3tBvFyNSWe1pmRZtrV2Pb4CVjKtmBvfpFgZKj/fKfN69pz8Vfl
         zS8pyYHVY64VaY6H11uyrKVRLTBnrBteJGUzN7coFXtazPWue22pz42rmaAXZV1O+ikQ
         eEYLa8jL7UqAls1TltGhxlgQkiF9Sc7u6+7gvOhRa7UAqbztOvsN6zPIWrjkNbeNOFoB
         iuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54zdl1tRuHVK3aF6AZOHZOpUGyh9nh8JsKMJAcUFHTg=;
        b=AQufRFvOm0VJPdIDr/3YEP+8muXB/d7xO0mGnPUbCYmKbYk15JfHBv46sN+Irg8N3p
         Rqh2kBSxRS94FfmL/Vge2nzvON6pz0F/rNyC4iNosVPPdu12c7uINAqIEtlQzBDgxwq0
         jPk0AJ6Nm6Q+uLeKDqf1lfD3dnKmW+o93ZGHtlq/HcjkSyt8X1q1ZmLfoSY0mKV7us3t
         lRwDJ0vwsmIkhHKIzbkfnX5u8GN+ZsOy0Bnb1HGu1jU9urL6Z+dxOc6/dQRVSR7DLcEx
         5Tqnw98U81ctziY8up9g/z/O/Icf6f0qCSJXrooDR5mX/OYZU/u7qHJZIJ52BK74Iar4
         pbAg==
X-Gm-Message-State: AO0yUKVh2m4OWkCu1PvUpZ0dwkmu5Z+jKzqnwHxoXF+OGOdbAcKzYp5j
        SOVEuPhYiI/a8QdLQQRcmLnkmw==
X-Google-Smtp-Source: AK7set/ve4XzE3pF30+4jOvyrtX3hH7oCcZ8r/IJTnbchN8fLFAPNYqIPw/1e98czw/LvCF66HD2nw==
X-Received: by 2002:a50:ed8d:0:b0:49e:a107:268e with SMTP id h13-20020a50ed8d000000b0049ea107268emr10632611edr.3.1675433569631;
        Fri, 03 Feb 2023 06:12:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id en14-20020a056402528e00b0049622a61f8fsm1191829edb.30.2023.02.03.06.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:12:49 -0800 (PST)
Message-ID: <3626303d-714c-bf99-699a-b4dda283dc2e@linaro.org>
Date:   Fri, 3 Feb 2023 16:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-12-dmitry.baryshkov@linaro.org>
 <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
 <CAA8EJpooKAiZfJqz3nYsHbJfNkqxGikNb7U5P3907+nUwoLiNA@mail.gmail.com>
 <2de00884-fcc3-7658-811f-9844dea6f5e7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2de00884-fcc3-7658-811f-9844dea6f5e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 21:15, Abhinav Kumar wrote:
> 
> 
> On 2/2/2023 10:55 AM, Dmitry Baryshkov wrote:
>> Hi Abhinav,
>>
>> On Thu, 2 Feb 2023 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>> Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
>>>> dpu_hw_sspp_setup_rects() programs only source and destination
>>>> rectangles.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Sorry but once again, I dont see a response to my comment
>>>
>>> https://patchwork.freedesktop.org/patch/473166/?series=99909&rev=1#comment_875313
>>>
>>> So let me repeat that here:
>>>
>>> "This separation is logically correct, but there is another codepath
>>> using this.
>>>
>>> _dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.
>>>
>>> So for solid fill, I presume that stride getting programmed is 0 as
>>> there is no buffer to fetch from.
>>
>> Could you please verify with the HW team what should be the correct
>> stride programming for the solid fill? I'll have to check what is
>> being programmed ATM.
>>
> 
> Sure, I can check but in the _dpu_plane_color_fill() method the 
> pipe_cfg->layout is not filled up so it should be a 0 stride.

Actually I think we should call setup_sourceaddress for the color-filled 
planes too. Otherwise the SSPP's adddress registers can point to the 
memory regions which are no longer mapped/available.

-- 
With best wishes
Dmitry


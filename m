Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D938870D50D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 09:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbjEWHcu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 03:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbjEWHc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 03:32:28 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9964E7F
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:31:53 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso6726323f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684827093; x=1687419093;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo3QQVBF1zQQ3+nnY4pKQDIrabOXQEcA8UUOKkd2BEY=;
        b=vD4hTdA42VIwENxzkkpdO7069UxTRVTlisAbRjMtKM5JkWlEwNpy8fdvVO2CqED00T
         wD2Fzzs/UxF9FoZVG8ybEW3yY/oBbo2vS2I+UFIjUUAMqKucZvlKnyCrYmMj+2fjdy5x
         QQMj01wq6bPkgM7tUalvX5Gixp2FakPe0bNpsGlZeV1KKYr9tjQousqbfrKTX14Fh8s3
         gsGbZ1CHIiLJzV0VWqx9piSelOFfIDWnhMC3473kyEltwoqIkuAJaG13I8giONbo14zs
         DldtsGXhs1Lri63lVp8bDG7nOHX7UE5/rfOZTJQqXM1cvfNpUnA8rEIXdjeO1IsVhoVj
         KC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684827093; x=1687419093;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo3QQVBF1zQQ3+nnY4pKQDIrabOXQEcA8UUOKkd2BEY=;
        b=Lwzb2tZNyYOmZ8pHlmFxcrGgucEUvMSl48z/J0LFd9SSAB298QMH8dFunfJHuaQbBP
         Bj1KUkxdx8fg6HS21Mm0ziOVIKDHVZ/og/Lr5r4bf+1RyqvjsR8nA5jZHXG9xEpAl7+2
         RBRL8X7a4gMp+lM0JJ3BOUbArUl6xabx/53sDUuXyU3jy79uleeOLPAGJRFvqETX6emC
         jd9HODbFhpEV763V9IY0G6biPCUFFnEeUxtQu8mRYikK9ztHMqeN2SzrPTvFx+M1D8Pc
         iwzY8/o/1hzw+oLIpSbMSQcNMoKIp5GCi8D1NM+L1aAaEDF4sXuU52nKqrM+ztpympNe
         Juwg==
X-Gm-Message-State: AC+VfDyML28HUgauveRYcuSE31jqcrMXsq3PLXrwm5UN4GtFnSdNXNrQ
        YLpbc4TWIv2JgT5AFEmEdklWLQ==
X-Google-Smtp-Source: ACHHUZ61Pt/BRx14UZ3NVtBsBgYIQ+floO4a4rBJ4XNl0AeUCF+iUD7PWYtK66zIeqey4QZXZ0QRzg==
X-Received: by 2002:a05:6000:11cc:b0:306:4162:ebbe with SMTP id i12-20020a05600011cc00b003064162ebbemr9378833wrx.49.1684827093179;
        Tue, 23 May 2023 00:31:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2e68:28c3:4022:7754? ([2a01:e0a:982:cbb0:2e68:28c3:4022:7754])
        by smtp.gmail.com with ESMTPSA id j17-20020a5d6191000000b0030639a86f9dsm10063986wru.51.2023.05.23.00.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 00:31:32 -0700 (PDT)
Message-ID: <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
Date:   Tue, 23 May 2023 09:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
 <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 09:20, Dmitry Baryshkov wrote:
> On Tue, 23 May 2023 at 04:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
>>> Rework dpu_encoder initialization code, simplifying calling sequences
>>> and separating common init parts.
>>>
>>> Changes since v1:
>>> - Withdrawn two pathes for a later consideration
>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>>>     dpu_encoder_phys_wb_init()
>>>
>>
>> I had previously given these comments on the cover letter of v1, so
>> giving it again.
>>
>> Please mention that your series was made on top of
>> https://patchwork.freedesktop.org/series/116530/.
>>
>> Figured it out when I tried to apply it to my branch to test.
>>
>> I had tested v1, and between v1 and v2 i only see very trivial change,
>> so i think its okay to retain:
>>
>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
> 
> Unfortunately patchwork ignores tags sent in the cover letter thread.

But b4 does with -t option to b4 shazam or b4 am

Neil

> 
>>
>>> Dmitry Baryshkov (7):
>>>     drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>>>     drm/msm/dpu: separate common function to init physical encoder
>>>     drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>>>     drm/msm/dpu: inline dpu_encoder_get_wb()
>>>     drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>>>     drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
>>>     drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
>>>
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
>>>    7 files changed, 140 insertions(+), 243 deletions(-)
>>>
> 
> 
> 


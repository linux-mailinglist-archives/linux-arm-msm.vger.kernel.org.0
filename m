Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659DF69B505
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjBQVph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBQVpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:45:36 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A386534F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:45:28 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id t8so2984068lft.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJgo6ul60Cbzprplm9cKqpN63/vkUMUzHN3LDsBeStI=;
        b=h7m7n6VTI/ugoEkovIUKo4Xh27r9HweKwzvbbhIkVk2y0G+00FjHLND3UM5NO/ryD0
         Tg9QmrFvFOyQzdokRmhbsklg7x+4XBUNEc9EWT0xTCsu9TI4fUYXbNW7W0KKhr+gHrFA
         qNxG6r6NUMYl0AEWkYo/UATM2L5SpMu1WkRKD1tlatsb9+Ad7ge8JmB4pnXIuzlA9Nv5
         x40IY/9g6ODPZz93arUAEluZN6enu8yjRParfYSK76TPfusoi5x1K7wsAXAOOJ+BgFH0
         xUWahNpRIsZrHFoJdJPCLqRQmEJX01VnfsqrZGUYvk1y4phXbABAGH0NyTCt7rHwtewW
         ex9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJgo6ul60Cbzprplm9cKqpN63/vkUMUzHN3LDsBeStI=;
        b=ypUv4aBIgUyWs7SZpByS3VXXauFAt/FNPqvCrvRXdGe1JMfb8bfmaCAk/bWpBNRF1t
         e4yazs3Nb6G1bV9fSgjGNGjGfS2adCgah/AZVFZsDXl3a5Dnc8XDgjWvDiVgtGWKWdwe
         REX1t3bj3i8k4yHoXc8JM7vvfsvrh+QSiC6JRL8gBNWSjqTZbEOls74bSuaz8USroCH4
         S0FNC0VnrA0ZqJB+9iDXRF4xQNPyn5a56VY6B8ufU8J2wfENKeo1WndIkVBpcGWfK1re
         k07c3gSse7jQDXfz1H2L6/50Uf2H8ya5dJPWfcSZtFwsHCltWSev3flpb2RjvgqR8gp1
         uHdQ==
X-Gm-Message-State: AO0yUKUnkYdXxQV/TzVC/JFg5G+ImLyTJLu3TKgBUSzNJAOaR5G95Mj/
        615b377M1waVvqA/N2XQ05uJEw==
X-Google-Smtp-Source: AK7set/u1kwPqjUW5A7pVAifFgobOYozdSSvCwdLULWacI3kPnDOZkk2g2Lt2ZNLXiIY+IbDIFCWNw==
X-Received: by 2002:ac2:5443:0:b0:4dc:828f:ef97 with SMTP id d3-20020ac25443000000b004dc828fef97mr1303357lfn.60.1676670326613;
        Fri, 17 Feb 2023 13:45:26 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id z9-20020ac25de9000000b004d39af98af6sm783983lfq.81.2023.02.17.13.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:45:26 -0800 (PST)
Message-ID: <8547e66d-504d-3e1c-9356-3c5f1618ac91@linaro.org>
Date:   Fri, 17 Feb 2023 22:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 03/14] drm/msm/a6xx: Introduce GMU wrapper support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Douglas Anderson <dianders@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-4-konrad.dybcio@linaro.org>
 <caae5c4b-4aa6-5219-3278-92c3bed7868d@linaro.org>
 <1c2f6e03-8b16-1ee2-bdbd-8f84219acb36@linaro.org>
 <aba38acf-d68f-27a8-eccc-f4a7b3b3535d@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aba38acf-d68f-27a8-eccc-f4a7b3b3535d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 22:44, Dmitry Baryshkov wrote:
> On 17/02/2023 23:41, Konrad Dybcio wrote:
>>
>>
>> On 17.02.2023 22:37, Dmitry Baryshkov wrote:
>>> On 14/02/2023 19:31, Konrad Dybcio wrote:
>>>> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
>>>> but don't implement the associated GMUs. This is due to the fact that
>>>> the GMU directly pokes at RPMh. Sadly, this means we have to take care
>>>> of enabling & scaling power rails, clocks and bandwidth ourselves.
>>>>
>>>> Reuse existing Adreno-common code and modify the deeply-GMU-infused
>>>> A6XX code to facilitate these GPUs. This involves if-ing out lots
>>>> of GMU callbacks and introducing a new type of GMU - GMU wrapper.
>>>> This is essentially a register region which is convenient to model
>>>> as a device. We'll use it for managing the GDSCs.
>>>
>>> Why do you call it a wrapper?
>> That's what Qualcomm calls it.. The GMU-less GPUs have (almost) all the
>> same GMU GX/CX registers as the real GMUs in this 'wrapper' region, so
>> that lets us reuse some code with gmu_(read/write/rmw) calls.
>>
> 
> Ack. If you can add this to the commit message, it would be great.
Sure! I spent so much time on this that I can't really tell what's obvious
and what's not anymore, heh.

Konrad
> 

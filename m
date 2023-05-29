Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CC27146D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 11:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjE2JJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 05:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbjE2JIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 05:08:55 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F164B115
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 02:08:49 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3edc05aa5so3270195e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685351328; x=1687943328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSa8aYLGe0eh6zJBgEC1ehDOBlDuDqV/nsz+yCLZGS8=;
        b=JoqnkqFFs6uFRbpaAbkym4gYnhJQCsnnGsqSwDYL/jL5nlLBM1xz+gJ5X0dxp1zrXI
         O/tJTtctTjTyqNVgs5ydIokhsCUjUZ6MLaZnabW5HL89gZDo+3NBUFwCT8kUFd3H6zWl
         kPOun5HSiSYWhM/m/AlGwBhXK7FNMMcr+F0J8kQidRUP9Bh4lLQ07imKQsvlBPcgBpgO
         NEUKGi5kqZ73V91LHAr4ihEjWO79uT96tJRe9v+PuXqYbTCt1PDg+AcQbyVXRTTFVC8J
         FfU5KFOmNBObhRkJldNnsxwrZTdw/T3goyEYKuDbs3lrMOdHwfHGvFO9ulU3uj9g9o3K
         jiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685351328; x=1687943328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSa8aYLGe0eh6zJBgEC1ehDOBlDuDqV/nsz+yCLZGS8=;
        b=AzEbjl4h/W6HH2BBZHHiSrFKLj8v4zvumQQLpY5pznZeCJH9SSamY5tRM7hBJenmyw
         wXnW+L11Uaz+zSdYmXw+jTnmKHhQ2eKC6mfa+yMtXpi8zreVWC98DJnEwyKQN5ewum9K
         aLBpPdeMV9fFMornh/bpgv8F0+3UuIQ5HJt+hAUMZArNt+I7xsG8xcoOHGsE0lsB5Fi9
         P0t2G8DmwTe5EFNZ3mDiS6j/TMtx23TfyNB/3eKJ+iR6Jrav/XbCKc+MQgjy9dCl3CbX
         CiaPlTwEdC/hI+wnJQJ0QtR9GqL5LQLe/T8Dtsz+Ja+RB4Fmg9u2alXFdUzTH6N2OWTC
         8KWw==
X-Gm-Message-State: AC+VfDwTklcOV3+K3AYGGathb3wcLdnEkdLUCOjtvbv0WoNM3w0I5zUG
        sg+ftFuF/fgmrPaJo43o6GolHw==
X-Google-Smtp-Source: ACHHUZ5qiEyUTO6pdyeSWqWw0+WfQT0iGbQqMBiKvhlXlAcXdRgSEX7FCWEmso42ecsPEc8eSvdmTw==
X-Received: by 2002:ac2:59cf:0:b0:4ed:d2cf:857b with SMTP id x15-20020ac259cf000000b004edd2cf857bmr3019232lfn.5.1685351328124;
        Mon, 29 May 2023 02:08:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id d11-20020ac2544b000000b004f4e637db2fsm1484450lfn.167.2023.05.29.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 02:08:47 -0700 (PDT)
Message-ID: <e99a9fe9-21e4-fc56-d400-4f6e9df2eaed@linaro.org>
Date:   Mon, 29 May 2023 11:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/5] MDSS reg bus interconnect
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
 <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
 <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.05.2023 10:47, Dmitry Baryshkov wrote:
> On 29/05/2023 10:42, Konrad Dybcio wrote:
>>
>>
>> On 29.05.2023 04:42, Dmitry Baryshkov wrote:
>>> On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>>> another path that needs to be handled to ensure MDSS functions properly,
>>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>>
>>>> Gating that path may have a variety of effects.. from none to otherwise
>>>> inexplicable DSI timeouts..
>>>>
>>>> This series tries to address the lack of that.
>>>>
>>>> Example path:
>>>>
>>>> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>>
>>> If we are going to touch the MDSS interconnects, could you please also
>>> add the rotator interconnect to the bindings?
>>> We do not need to touch it at this time, but let's not have to change
>>> bindings later again.
>>>
>> Ack
> 
> Also, several points noted from the mdss fbdev driver:
> 
> - All possible clents vote for the low bw setting. This includes DSI, HDMI, MDSS itself and INTF
As in, "you need NUM_CLIENTS * MIN_VOTE" or as in "any client necessitates
a vote"?

> - SMMU also casts such vote, which I do not think should be necessary, unless there is a separate MDSS SMMU?
There's one on 8996, pre-845 SoCs often have a MMSS MMU, 845 and
later have a MMSS-specific TBU which (theoretically) requires a
vote for access to 0x400-0x7ff SIDs

> - PINGPONG cacsts high bw setting for the sake of speeding up the LUT tables if required.
Hm, I think is would be a separate topic.

Konrad
> 

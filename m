Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61E271468B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 10:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjE2IsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 04:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjE2IsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 04:48:03 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711E8DF
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 01:47:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2af177f12d1so32212891fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685350038; x=1687942038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzR1qktZzOvH81Zib2LaEXdkG13P7Z7RhzbaUscbWOw=;
        b=jxn7BQOdZmvckaE12Hl2c9bavNMy7RrdjwUnwR6H/Xt/+VXWtp4rFvxrxZPVmghylB
         ycBTAWo9YKSZZ8jmGXuRRat+0FfJVaghtW3S6BG1mszhfxNtu/yGIF6ACBWqSMJQbktT
         xWU1fgUvF7ILRUuezpToY26mWXttrcGHCQdANf0mhIbTMj+QXmtbJYv+honJzyJ/5mn0
         VingADEIYqRrNEUk27dIrFdRvOm0olSdaj4oKalk970Al+FoDbd+TIBPDCn25P6HneJ2
         KZck+WCD857/l4Lf7olFAR3fkihylDAhZ8RIsewf5UHQisqhvX5INqi+wdQpdKqUE8VP
         uFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685350038; x=1687942038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzR1qktZzOvH81Zib2LaEXdkG13P7Z7RhzbaUscbWOw=;
        b=esK60onsezmA+T8cUsqI98rfdTkbB1nZd3qRp3vBDA/Ivve1CiUe1bQMg549fx+lb5
         nUN2957SKMF07lsp89mKJr1Dawo4MuoZ7Vo0IQWhLr3+5+D2TTiqQzEVPK/Rxl1p1AUD
         8rhCPuATsXo3pKutznHK8cRz2LrPIC50Rp9KsZcIAeGnUs3WJ2NFtt2sOuGW7hPNe4Js
         V4NpW8T3Fs7bsKOwdtTlvsK7WN2SsSXIP/+ZlHriLjzsYBS255xq5I9TZjffhqJE90km
         cZakfxvJxZQbXF9yEFb8NyBkkg1rM80HKDTdrTlpulXu/xUucNfj8or6ZsHxaq7GxoAw
         zF1g==
X-Gm-Message-State: AC+VfDyw8Bd/+ZXK78VTLEDpFvb+ZccPkg5bxyJsz2q5r3r/RKFId5xN
        8juc44zeaPjLkQBqLhmhIjU53L5DEwhXQOtTXBw=
X-Google-Smtp-Source: ACHHUZ5O1rcmLdfc7ENpclDamyb8dvL++NBXNXBVpxw+CFTsLwnZcMYU/9MNKtWHxoVGtRtW87O6AA==
X-Received: by 2002:a2e:850d:0:b0:2ad:bb53:8b9a with SMTP id j13-20020a2e850d000000b002adbb538b9amr3861865lji.20.1685350038248;
        Mon, 29 May 2023 01:47:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m25-20020a2e97d9000000b002a8b9570403sm2346883ljj.31.2023.05.29.01.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 01:47:17 -0700 (PDT)
Message-ID: <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
Date:   Mon, 29 May 2023 11:47:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] MDSS reg bus interconnect
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 29/05/2023 10:42, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 04:42, Dmitry Baryshkov wrote:
>> On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>> another path that needs to be handled to ensure MDSS functions properly,
>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>
>>> Gating that path may have a variety of effects.. from none to otherwise
>>> inexplicable DSI timeouts..
>>>
>>> This series tries to address the lack of that.
>>>
>>> Example path:
>>>
>>> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>
>> If we are going to touch the MDSS interconnects, could you please also
>> add the rotator interconnect to the bindings?
>> We do not need to touch it at this time, but let's not have to change
>> bindings later again.
>>
> Ack

Also, several points noted from the mdss fbdev driver:

- All possible clents vote for the low bw setting. This includes DSI, 
HDMI, MDSS itself and INTF
- SMMU also casts such vote, which I do not think should be necessary, 
unless there is a separate MDSS SMMU?
- PINGPONG cacsts high bw setting for the sake of speeding up the LUT 
tables if required.

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E12870A310
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 01:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjESXCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 19:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjESXCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 19:02:16 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEEDE3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:02:15 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af2d092d7aso799611fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684537333; x=1687129333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ICfQVhv0p58QRGm6Ofs09fgKjfcNCD6otbrYwwYRjw=;
        b=k9H9/XI3c4gYLXp82YhPCxKp/bDxz6SLs54kVqVsH58rAVBFtDinul2AXJ4edC47fj
         nKbery7wfrU4P9uk2IJgPBl3Fjdr7phb96CXmFwjNSPMLGxh1IVMXyRmqV31yuFyfZoM
         7jc+hyKKcb3efWrPCnY+pwHfbjLrL8lYZAha27UWnTXjswT7u3SXRwa+yDiwxCJyXG5y
         FsnGNwxdnMS6EH1orrvTh6JDIUfouHrBU0mUd54t4lZcvgGwCcyNJ2VFo4E+SpxkHuSv
         KLF+Lp2TPkzxtmpmWsLk8N3ZCmFsRVTr3CJUN17MXA07WLu1RKvXM/Tol4dUd9C6ntbh
         A4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684537333; x=1687129333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ICfQVhv0p58QRGm6Ofs09fgKjfcNCD6otbrYwwYRjw=;
        b=NugYlj2lquVcVSf7AME/qGfOyfigBZBvyoi6KSM+LNpnQKVMw7RkyjZMVzm8G3ygMZ
         xZ1KE3D7gviUH7taVaAFc8wke1oEb18k3vvt5NJzM4f8ZeMqrgcB91QlQzwuYV2AtNV2
         VelK6ae9Nq9sw+epOL3fUtxdvlwCLkJ1JY8MwshsMb4KOAAT+gUcMFaSK/XD7lvHRmzs
         cFuVWTtHNh3KOOyntGcbodQMWtCJqCMePJx3+fcWWeBYf5N2ZVn8Si3rFYtHKL2WFnHa
         dxP2ar4V0RdWgVYvkjZj2H6qWXCTDeF0vLlQdkFuGDpxsN99URVFLnSKbxJzmaaB6KBZ
         u/Pg==
X-Gm-Message-State: AC+VfDzJbmYczqGQdZ6JCcJK8JMbwNslR86IAkcLTdxCYebgtqKsfb+M
        0xnPqfZ8bZE3S78+94g7txlQ5A==
X-Google-Smtp-Source: ACHHUZ7UMqHk5rENqq9JMQbX9ZqRDgPSQuGZy96/uT1vIZP+8fQjGpkcjjF1D/yArdvq6XYMW8UwDw==
X-Received: by 2002:a2e:9117:0:b0:2ad:af50:6ecb with SMTP id m23-20020a2e9117000000b002adaf506ecbmr1397207ljg.14.1684537333678;
        Fri, 19 May 2023 16:02:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id k1-20020a2e2401000000b002a8c2a4fe99sm34178ljk.28.2023.05.19.16.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 16:02:00 -0700 (PDT)
Message-ID: <d97a5b51-f71e-28d6-47ee-a49d11a6aa2d@linaro.org>
Date:   Sat, 20 May 2023 01:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in
 INTF_SC7180_MASK
Content-Language: en-US
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org
References: <20230508-topic-hctl_en-v2-1-e7bea9f1f5dd@linaro.org>
 <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.05.2023 00:00, Abhinav Kumar wrote:
> 
> 
> On 5/19/2023 11:49 AM, Konrad Dybcio wrote:
>> DPU5 and newer targets enable this unconditionally. Move it from the
>> SC7280 mask to the SC7180 one.
>>
> 
> You mean DPU 5.0.0 right?
Yep!

> 
>> Fixes: 7e6ee55320f0 ("drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
> 
> I have cross-checked all the chipsets affected by this and confirmed DATA_HCTL is present and those 3 registers programmed with that feature bit are valid, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Thanks!

Konrad
> 

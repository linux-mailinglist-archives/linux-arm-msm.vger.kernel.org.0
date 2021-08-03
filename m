Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542B93DE7C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 10:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbhHCIAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 04:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbhHCIAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 04:00:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE2FC061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 01:00:42 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id m20-20020a05600c4f54b029024e75a15716so1527810wmq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 01:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xQ4m8nY0R0gdaQ2/t/epPl2Yst37jmddCHkepiSD0C4=;
        b=Bw+xkG5sbehOUYrGhW3vuHjC0TodTkMZrfcQqx90U7cza0bBBP+1vYns95ZaSdpsaW
         0ZejcJ4Vl0vp8xDbgM1uk3tTQkuD460xHm+MTBNVbOZuHGVyBCs0HFLhFINqMWGLY9sZ
         SuEMjTiYAkai4RKewsDrHd/xSHe5J+lQ8yvBTh5H+nE7akdFJjAkbHi7B16zwMAeN7nP
         it2zDi+0Jk2xm2q0urRgOdPZvXffKHfpiR2EPrBLK4pGR0givWjer6Bn3dI4vIi/DPQy
         4ZDz/FGRU0R2IAyPvMMKAPoruwFrejYoxePAxZzNVUQDAvVgohV1+P4U56gUqpqZV7me
         FB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xQ4m8nY0R0gdaQ2/t/epPl2Yst37jmddCHkepiSD0C4=;
        b=l5lGIKf7qoY5bLdLIrQK1Jb3/hGoyu3x2xZ4+L2SWbLf2ybWKcozuG1Tt7XVai/GJm
         wwfumyvseY3bRSJk3RbhRAFKoSNsr6FqgqQKdZf6NkzonEt+GfSWt7RL3Jx4zsJjii8E
         pxda5S8xW3hsbEoRgoW+Ene/tGozQrFa3kZQaPLZMBcGBM/15+5zngSw3Aiha92y2oZI
         HnRwwrhfd/rQ27lqj1VV4Tf0Xhn7+YSeUcn4nHI9ajsXtyhT9XGYGa+H5L7u6hy509JH
         W6DaEkRVtnafEHPWnH/kpa+sTsNjPi6vbzXdzYDWkvh3Ja0jAG28u9HanpRu+dnT51wf
         u+iQ==
X-Gm-Message-State: AOAM530FFcLziUrvEeSMFrnF992E47NrLKuj8dD+H+wBfw4kciM8EJ5H
        F1pbzzPzVd0sXFLZls0wnOwRLQ==
X-Google-Smtp-Source: ABdhPJwel4nkglJAenKOcjYpcxSacPWxMq2xkHmEmS8ycsumGKjElVh8s/Y1jXHSsXVTWplDeiJwSA==
X-Received: by 2002:a1c:2314:: with SMTP id j20mr2951400wmj.30.1627977636036;
        Tue, 03 Aug 2021 01:00:36 -0700 (PDT)
Received: from [192.168.1.11] (hst-221-68.medicom.bg. [84.238.221.68])
        by smtp.googlemail.com with ESMTPSA id m9sm13534055wrz.75.2021.08.03.01.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 01:00:34 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] media: venus: Set buffer to FW based on FW min
 count requirement.
To:     dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
References: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
 <1626246068-21023-8-git-send-email-dikshita@codeaurora.org>
 <e85515cc-6213-cdc3-dab8-46ea5eb58011@linaro.org>
 <6c8f0d013be8ba6d276afe04d6e0c840@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <253417f1-579a-0a57-388b-7fb07fd83d9c@linaro.org>
Date:   Tue, 3 Aug 2021 11:00:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c8f0d013be8ba6d276afe04d6e0c840@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/2/21 10:50 AM, dikshita@codeaurora.org wrote:
>>> req->count_min = inst->fw_min_cnt;
>>> +
>>> +    ret = hfi_plat->bufreq(&params, inst->session_type, buftype, req);
>>> +    if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2)
>>
>> ^^^^
>>
>>> +        if (inst->fw_min_cnt != req->count_min)
>>> +            inst->fw_min_cnt = req->count_min;
>>> +    return ret;
>>>  }
>>
>> Also in regards to inst->fw_min_cnt, can we pass fw_min_cnt as input to
>> get_bufreq via 'req' structure, i.e.
>>
>> req.count_min = inst->fw_min_cnt;
>>
>> ret = venus_helper_get_bufreq(inst, type, &req);
>>
>> inst->fw_min_cnt = req.count_min
>>
>> ?
>>
> Sorry, I didn't get it, How is this different from the current
> implementation?

The difference is that platform_get_bufreq() will not modify any of
'struct venus_inst' members, i.e. platform_get_bufreq() is not supposed
to change anything from input 'inst' argument.

-- 
regards,
Stan

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE9B41C64A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 16:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245362AbhI2OIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 10:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhI2OIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 10:08:05 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7534DC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:06:24 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v17so4474778wrv.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Fpk4eNFB/FqNcDuDV/dejw65ihoRMEpb7CL35wXBpY=;
        b=x2oQ5kChrmnKaewPLRbDPuiIaIS8dBaZpQa20OfXZIUskVf1xG5N+N565Xf4eq/ppx
         2lk5MBcNkxcQaE1Jj72rCyjWJU8HLE7N8+IDSSZZVbSzj74+OOzGXbkZbfAE2ewIN1RF
         nL5TfZhJ9TN9a2yd6Rx8WHUDJYxUzxhJ8PAOWa7LV/94IDMnn/CU7iGjoKv3h+xvfVOz
         wn1eS8bZjWALbs2dCYcKKpo4LXhAeymW4obmlcHL9msvbG1kxnDPoHGou60TUlNP5arQ
         7VPgcEgyGBp6wpXk8kSRYBRxuK39TQT81RNcVCygjh7iN2ScK1JNXMXwUIjTk+XcTy5c
         J4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Fpk4eNFB/FqNcDuDV/dejw65ihoRMEpb7CL35wXBpY=;
        b=KF7iL/YZIMM6tpkixEJyEiQ0jS1Z0vV/V3dsRxOP7g2cS7UDGtevyoEyJFjuLXHBxG
         gEkXHtZcAp9VNX7XUWcny9Qu0Mx8z185h0+AF7+nGP5eDrZWle0d29FWSeEBAhujZAO4
         IdW/j/fj9clBt4mklE8F4T7gmP5BOWGJlBwv0ODhGwA1lJ4tFAXwQ2x2rH91oIuN1zsn
         zJibjufm/HngrOlPhxa8R6kKVZsoBMcZLJ34dsIY4PNm335XN43FqJMyMT4ZbVVE56CP
         uWVowOrL7aQS6pNzr5NpMAOr/0uYiUeI+UJ9tKrL4UYeft6/6Gzo2ksEP3L7eBukli1K
         JXLQ==
X-Gm-Message-State: AOAM533BEDB8jFQ13BDmsQ3x5llzaKpmnB8pZO6LQaqb2Lde+QFdHYDT
        p8LiyxjtOwh0mho7T7xThpJgPRF9UFvlFg==
X-Google-Smtp-Source: ABdhPJy/Ei9sVDkUj7lCSKfNjn5FrbVmdclZn9wWgDr1+KjgiIYFrscFtuyl7VOuILxMBboOHdwl6g==
X-Received: by 2002:adf:fbd1:: with SMTP id d17mr19660wrs.146.1632924383074;
        Wed, 29 Sep 2021 07:06:23 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id g13sm2735wmh.20.2021.09.29.07.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:06:22 -0700 (PDT)
Subject: Re: [PATCH 0/4] Add secure domains support
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e9d20133-fd21-b3d6-ec42-04093f9def14@linaro.org>
Date:   Wed, 29 Sep 2021 15:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24/09/2021 13:19, Jeya R wrote:
> This patch series adds secure domains support. All DSP domains other
> than CDSP are set as secure by default and CDSP is set as secure domain

This is going to break the existing devices that work with this driver? 
Alteast the non cdsp cases.
like msm8996, sdm845, sm8250 ....

> if fastrpc DT node carries secure domains property. If any process is
> getting initialized using non-secure device and the dsp channel is
> secure, then the session gets rejected.

Could you elaborate on what exactly you meant by secure here?
Is this SE linux policy we are talking about ?

Why can't we deal with this directly on /dev/[adsp|cdsp]-fastrpc nodes, 
why do we need this extra secured node?

--srini

> 
> Jeya R (4):
>    dt-bindings: devicetree documentation for secure domain
>    misc: fastrpc: Add secure device node support
>    misc: fastrpc: Set channel as secure
>    misc: fastrpc: reject non-secure node for secure domain
> 
>   .../devicetree/bindings/misc/qcom,fastrpc.txt      |  6 ++
>   drivers/misc/fastrpc.c                             | 64 +++++++++++++++++++++-
>   2 files changed, 68 insertions(+), 2 deletions(-)
> 

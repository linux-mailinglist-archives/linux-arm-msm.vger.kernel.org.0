Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6105A2566
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 12:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343597AbiHZKGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 06:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245452AbiHZKGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 06:06:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0708E0CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 03:05:04 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bq23so1353211lfb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KzbOceaNTdDVnBmlwaML66Ag3gKl0lXdyJPKSYlfMfo=;
        b=q8eihlZNapUVxFRiEU7EF/LhPsaz08qpV4fS8UH0p1tLfCsASqzJK4ypoixw0h/ez4
         6CbzJZjfGhPUqbHSpQRiDIJB8GL9CW4LQ9rhDaySA5C3rKbjesmGRlKZZGdpL1dHr4wk
         I5DCiPc7BjD/AnmMdsmpgv1bK2A3gfaIxeEIayc5QCybaFZHgCslg8K3X8Qo+lBUjELW
         KghkIm4r/LbqnSdq2kXDtYmIlYQgTNNL1nNWOp3pL4RZuggBCGYsfnrivqnV8IoQQ0vr
         clpfazGqs60ASVHKOPHj5Gut9iyLthfuMtsm3eOYpIjzLb5GELVJEkyZvYDTSsImlrAR
         QBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KzbOceaNTdDVnBmlwaML66Ag3gKl0lXdyJPKSYlfMfo=;
        b=Ir9+cxrhiJpBKnFaj3CGDV4JmM0VGE5p4JDNr+4U1j8rrWnxLvZbCwU7uV3jfqQxQs
         P/9e96u0HRixnkWeEI7ISE2Ti2rjrNIZjTUf4Uw8GyycJMwqCH65XhO/OLMagAQO3PzL
         EvXsdk14zvU5mlDB5FJgF0b+iWI+KGbz10MbOkNnfU5XXgfmbtxyJ9mgb3892vBUJG93
         aEOpw5ie1+vCJYbrjzL8vBRkkXvGqSckYdcjugboJyR/HYcQq3/HK4iQYIF9F998r9YJ
         MIkWHng812lY5rXwsKkZQNKNNm4TqjDPOk/+rDDmFiRekEiiOqm1hcvpmQykiaVjx2dA
         z47Q==
X-Gm-Message-State: ACgBeo05rb2Uw/6Zy53BkoUozS8+ZOOme3y1FfyMAOxXDeyzeELmkbyr
        qYinYfuBDuL3lFZgoNzFF/ITNA==
X-Google-Smtp-Source: AA6agR7XBftW2NwzU7hLIQQlu/k8toww0vgW9/YoDFtF97R9hU26kKpJdaP34/aFNMlrNfNooKaMIw==
X-Received: by 2002:a05:6512:234c:b0:492:d9fd:da59 with SMTP id p12-20020a056512234c00b00492d9fdda59mr2174078lfu.63.1661508302738;
        Fri, 26 Aug 2022 03:05:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j28-20020a056512029c00b0048b17852938sm329074lfp.162.2022.08.26.03.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 03:05:02 -0700 (PDT)
Message-ID: <ca972ced-b4f7-2eb4-0381-095cedf5f356@linaro.org>
Date:   Fri, 26 Aug 2022 13:05:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] msm/adreno: fix repeated words in comments
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     wangjianli <wangjianli@cdjrlc.com>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, wangqing@vivo.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220724073650.16460-1-wangjianli@cdjrlc.com>
 <0e16e719-4eb2-bfb3-6b77-88d5314757a1@linaro.org>
 <20220826095311.GG2030@kadam>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220826095311.GG2030@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/08/2022 12:53, Dan Carpenter wrote:
> On Fri, Aug 26, 2022 at 12:45:09PM +0300, Dmitry Baryshkov wrote:
>> On 24/07/2022 10:36, wangjianli wrote:
>>>    Delete the redundant word 'in'.
>>
>> Could you please:
>> - adjust the commit subject to follow the rest of commit messages,
>> - drop the extra whitespace at the beginning of the commit message,
>> - add a correct Fixes tag.
> 
> This doesn't fix a bug so the fixes tag is inappropriate.

Well, it fixes a typo, but I see your point. Let's not insist on Fixes 
for the comment fixes.


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C97E2832F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 11:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgJEJP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 05:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEJP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 05:15:56 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87579C0613A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 02:15:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l15so5433435wmh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fWlKMXcFZV3qTTTvDHRLs9xOZHTLn5G/jh1t4G1iOZc=;
        b=Q9+Uao4VA5SEkHf5jRu9Bp3Z6aC1UN8jZGM4QVcDZPWCP7iLz5Cjnn6Hl0FLi7PC0K
         eo47WFZv+1KW1SNYUtvtWjZtLgkBg9TGHbFpMHW+gVH/9/3Kr2Io2beUu92EgkZtMBQs
         yaCtdVuBqusjgw5TGLKr+9j9hPtCLHsbvmrlXgyWknU9R+w3I8Zc0dWt4FM5m5Hqeu4e
         4a2vO5XmA5W5qqWKx3RLRsBky6I60k1FgUOECoRihmwx4MROeZMQZjuvUacxwEkjUhhZ
         wl+5rUCyOTxsIyGylcfsdMoC6INtK9KHsfUfKH2pcuqWSQLs8PKvqgfZDjw95MVbe99m
         a9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fWlKMXcFZV3qTTTvDHRLs9xOZHTLn5G/jh1t4G1iOZc=;
        b=jldhICDII9ezdll1YCyVdHkBHiP0Ho/JPedKS6ncw8POLhhQ/FvX2w5g3yxy0hBCH1
         gsAW3WsHAzN9z/HJxLalehK0X2KlqN4yZNl1PPfoLxgr55vQeuh4XpNSwrAhT3mvK1r6
         fA6wEt+cuQKXpzEHVeh8B3MvyPak5BDiz37J45taDkGKqK7Sefa05pZy5z1/iEk81Nsm
         weprynW/hRsdmvJWVvYxYwMRmhY1RtIhY/hxk8xgKdeFYxcO8fAjAC9wce975xUCxs70
         DmmHzGOoBoJ6okS25/FVLG7FJfQEPmkYORpV72hp4WQfKbuhsLLkIJqe4UAy1eOWAcga
         FpkQ==
X-Gm-Message-State: AOAM532FvWCngDZ3rB7pbIkWIve4FY3yuYp/c8UOaGGa2wwOLShvVxPm
        gTMpJYuIjnzSm/xkX48AtdzCQ+WPsKsd2w==
X-Google-Smtp-Source: ABdhPJwp6GJmyaXxzC/PhjI7YXLfOhuby/I0er6VONP0Inh6P7+osbWNoJZ7ReqXZwKOGZkDacY2Rw==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr6812612wmb.160.1601889355135;
        Mon, 05 Oct 2020 02:15:55 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id q9sm9299569wrd.57.2020.10.05.02.15.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 02:15:54 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add qcom,sc7180-qfprom compatible
 string
To:     Evan Green <evgreen@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200929205807.2360405-1-evgreen@chromium.org>
 <20200929135741.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
 <CAD=FV=V3+V0uBiC_whvWEnv1TSkXt-MfnK+34Kir_kfTymejSA@mail.gmail.com>
 <CAE=gft6GAYePE6eCPi4PxNoJvc1K=KYCN5U_PvTRNnLdpKmLyg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7486a297-e47d-5366-3eb2-5f1787c9d1dc@linaro.org>
Date:   Mon, 5 Oct 2020 10:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft6GAYePE6eCPi4PxNoJvc1K=KYCN5U_PvTRNnLdpKmLyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/10/2020 00:14, Evan Green wrote:
>> You don't want either/or.  You want both.  At the time Srinivas didn't
>> see the point of having the SoC-specific compatible string here, but
>> now that we have a reason for it maybe he'll be convinced?  IMO you
>> essentially want:
>>
>>      items:
>>        - enum:
>>            - qcom,apq8064-qfprom
>>            - qcom,apq8084-qfprom
>>            - qcom,msm8974-qfprom
>>            - qcom,msm8916-qfprom
>>            - qcom,msm8996-qfprom
>>            - qcom,msm8998-qfprom
>>            - qcom,qcs404-qfprom
>>            - qcom,sc7180-qfprom
>>            - qcom,sdm845-qfprom
>>        - const: qcom,qfprom
>>
>> For some context:
>> <https://lore.kernel.org/r/CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com/>
> That makes sense, thanks Doug.
> 
> Srini, do you want me to go fix up all the various device trees to add
> the soc-compatible string, or just sc7180? (Also, don't forget about
> my other question about whether you still want the keepout stuff in
> the core at the cost of added complexity).

Lets keep the existing users as it for now! and we can still list 
compatibles in the bindings so that any new users (including sc7180) can 
start using them when needed!

thanks,
srini


> 
> -Evan
> 

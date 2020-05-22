Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C1F1DECA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 17:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730362AbgEVP71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 11:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730284AbgEVP7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 11:59:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8ADC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 08:59:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id n5so10316292wmd.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C725PFMtDiHrRc3i2SLPg6w+bs7updZxKNMHmijN1VQ=;
        b=hFLurQd8lALxKvkgjhmKgmiDeylXFlmrAVzw0aGcvJ88fP7bTPbTzWTQ3K6czv1fjr
         mZTlMBoViX8+tUUHcUmS3ZQTluV4WPazB50TzwBu51BomWzL4NUqzRVs0mpia3ZjaEUx
         P/uHroqByZsgKCvV8IMoGwbwnFB89v9jmhzwTR87d87N+rh1Vqe5vR5Lx0jp4gGUpa77
         Kl1Y0Z/z32WEcWrfUy2XIM1c1tY42XvcWReyMKitDdkEZX69gu1DPSh4bE3QyUVpvOGM
         KkNyXcYSChYkxnI3yCnE1t0PFE00D6EMZkPwp4b7u8vOIFD/rhFkLfIeDj/JskbZOALV
         RFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C725PFMtDiHrRc3i2SLPg6w+bs7updZxKNMHmijN1VQ=;
        b=dbioXrXquWTKuMEV+iyLrQwXCcXZLj18iEHHHDTC30sRKZWY/H3U7h+uZO+9yE0Dcx
         hcFHHe6P7Mtw9EhfSRNgsqBSP3Wyji/qI3Cbmv4Iv89jPQLxaRm/dVb7J5kOFnOn2RIs
         OM/4FXn9mK81pJjSfwg7WJTK12roNrB4/Oc5bfHxKY/96PphL9KN/CejHPlm7mAPpqtl
         8wIlIfiYHdSiVS5QYrJ5Naw6EknTXGERIeR1Z/3xuYt+9dJVlC5YSHozRZdKIboiGLF1
         /p4fgjSPS7f6KAeDn97XZB6ATrePn9lE2XvRjKbNTSkRTJNd/KoOZHftzbNYSAEDyCoH
         4d7g==
X-Gm-Message-State: AOAM53382JgO2kVIlTVLSwJIXJXS43aGDQu6sJa+OvkCo/GGivuaLmRP
        kGQTtE8o62/I9++zPq3ZJ3HNUg==
X-Google-Smtp-Source: ABdhPJwd2mBNn/vXnBKaIvdZ54WGZWYcXW5tacq0foXZjFC8cUslwy55aAQDWRcbmut0Qpqx/rmVNw==
X-Received: by 2002:a1c:64c1:: with SMTP id y184mr12491271wmb.175.1590163163023;
        Fri, 22 May 2020 08:59:23 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id h196sm2065476wme.22.2020.05.22.08.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:59:22 -0700 (PDT)
Subject: Re: [PATCH v5 0/3] Convert thermal bindings to yaml
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, lukasz.luba@arm.com, mka@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <cover.1585748882.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <92749181-d7a1-ce54-a685-344b0d1a3dcc@linaro.org>
Date:   Fri, 22 May 2020 17:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1585748882.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Amit,

On 03/04/2020 09:01, Amit Kucheria wrote:
> Hi all,
> 
> Here is a series splitting up the thermal bindings into 3 separate bindings
> in YAML, one each of the sensor, cooling-device and the thermal zones.
> 
> A series to remove thermal.txt and change over all references to it will
> follow shortly. Another series to fixup problems found by enforcing this
> yaml definition across dts files will also follow.

Applied. Thanks for taking the time to convert it to the yaml schema.

Thanks Rob and Lukasz for the review.

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

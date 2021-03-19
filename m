Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9A33421BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 17:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhCSQWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 12:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhCSQV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 12:21:56 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63277C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 09:21:44 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v11so9686243wro.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q+7JtPWrzoVq9IfYXX5dUkVFHCMG2f/RW7isFZzxLUA=;
        b=kCDrU+/pozRLTw7JfiUzllg727f/Dvdtxcp8fBXJF3uJb/k0xBeZnoAfeakD1/zqha
         ki8k8iPrQ0TsHckjaXnoHA7IEaELvBJqrGMFvvz/bRO911SmVjhw70Zmdp3QJAmYgls9
         9wCw6Ysb0dcSXlUD0e9FC2LQXRROzc3lHgbjnDvnKBMeC/9IzVNglJaL0nEpQGQyytbC
         OTkqJni8+tuM+i/0xr9j1Dgl594p8Qqofbhe5eKjUHEJKpnvkRpfJUMAtrzxRxKSQMRj
         TBcb23H5QehIEdQ/d/ppbt/PZ7ncFbEAMj4JTAnpntFzj9nJC4j2MJwplqRdfx9JwWgQ
         5r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q+7JtPWrzoVq9IfYXX5dUkVFHCMG2f/RW7isFZzxLUA=;
        b=ndFfTK8Ve2uOjmaN6BGK2f9jxw8tkoZoEI4WK8iyb4NgC/hPOXw2xqRsnk8NdTqs+D
         K4lhiapAPL50KViF48gjUnSv5Us6hxEEr+YJaLnLGg3CnB0P0g2XhhYEc7BTdtn6XV53
         3KHAd0vakdrniFetEvUWcV+kDPv63lOb90W6yFLSCH9KO+GJprSSHENg2qJrRmsKNfwN
         51i/CetANXulKoLpZrWYXB7YMSoik4+Q96s+1iTReCd/8COyKcHvkc3fvtwyQkWf0gpg
         y/68p4snWLQdbcc3yWWL2vU05JSAMjW72dI1ijdWpELBiQnomx9vJpxb74vDerKpjnB0
         0Xeg==
X-Gm-Message-State: AOAM531cD1jJNnxS042DIFx46/9RbTLDW91qnkzA0gBg2+Yf8pGtyT/o
        owOu7ABxMbcfFNoCG0CAoD6LYw==
X-Google-Smtp-Source: ABdhPJzwBl5xKMtGiYizYyniDg1e76b+/vRNVyIXX1Ak+IcQQbjKxiJPZGQ3JYHmvmwRqiBJGUrS8g==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr5497712wrn.352.1616170903054;
        Fri, 19 Mar 2021 09:21:43 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:ddd7:1eb:a66:7a85? ([2a01:e34:ed2f:f020:ddd7:1eb:a66:7a85])
        by smtp.googlemail.com with ESMTPSA id w11sm8812705wrv.88.2021.03.19.09.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:21:42 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add co-maintainer for Qualcomm tsens thermal
 drivers
To:     Thara Gopinath <thara.gopinath@linaro.org>, amitk@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210319153711.2836652-1-thara.gopinath@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0688c116-bcde-7980-6535-80000fac5afb@linaro.org>
Date:   Fri, 19 Mar 2021 17:21:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210319153711.2836652-1-thara.gopinath@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2021 16:37, Thara Gopinath wrote:
> Add myself as the maintainer for Qualcomm tsens drivers so that I
> can help Daniel by taking care of/reviewing changes to these drivers.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

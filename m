Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E202C3D16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 10:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgKYJ6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 04:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKYJ6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 04:58:09 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28743C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 01:58:09 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r17so1283562wrw.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 01:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IGoyXBsorWkLQoXFObTVk+nYQCTZv7J02NxoMaKjTAY=;
        b=Uj5LRdofKuT8+5FuGdVIteQYraSKJiu7/YfKp8bInFXi+d70QuXk1UUvcs117qs9DF
         xpgv8U4MZw5rAFBG438njOVGOeDntbEyDls/bx+XrHV5ULhNCDI4UgkwmdFDrIk8s9vj
         Owabze74c/NFpNRl7Etx2ax2UQEpeYmoTzfHGPzhipelcb2qTEhTWYRCC3UwDSIn2dOJ
         ooxPjoN5/UBk4M1gPlKVDfX7Ncfb9rhsEdeXpSx8MKMWsAO1ygyClyaC1FjEK5DpiHBJ
         Jrgbc375NF22Ti0GBpdVS6+g6n68qV2dKZBW9xws7yVXSvD+lC9zyH10RxCT5SezhjMS
         8G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IGoyXBsorWkLQoXFObTVk+nYQCTZv7J02NxoMaKjTAY=;
        b=VwaLKnlOArKsUXGrRxa1FzeL7acIAhRxp5hf+jDa9DZA9Arklw2I2lkYI/1Au1ZWy6
         6PYzh2HPcq2Hq8ByF1svGZN9UO2lTYKRYraNiDaFjoMrGcO3Ep/rDa94LMVnk2MGhv4Y
         XEogEbgT/wHb2XPaazMzb4ORVw1kBER8oqnrUVh/krBLCs0Fl9VWT+2suEzHUfCpKqvJ
         T1heoKmixKdGhHswV2RMbj/E+V2x5wepWpF3qbnm4nY3KVqaZn6eBR+0uOH8WixW2dnb
         tzm/0rAmROTI35rf04n99zsRLSEwRDm0B/uBmFkHYxL/6gAtPAG+F7sy69334dD3sM3D
         CfNQ==
X-Gm-Message-State: AOAM533izoysN243ghYc0fRZAHYPjTMtPwddbzxVVHko7PCFVkQ7kqdE
        XMsC9L6Hc6dvhkDXjZSOV1s4Zg==
X-Google-Smtp-Source: ABdhPJwwJEoDVfiJEDcAdp12hLdqEk12t7E2J/3yeyUwAU16zYFlKjqpQdsIf/Z0BjD+fAhAB5dELA==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr3269628wrn.340.1606298287868;
        Wed, 25 Nov 2020 01:58:07 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id b4sm4153093wmc.1.2020.11.25.01.58.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 01:58:07 -0800 (PST)
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Avoid sending power requests
 without QMI
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20201125054255.137067-1-bjorn.andersson@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a92ba901-283f-e0fb-54e0-af6c87bbd44a@linaro.org>
Date:   Wed, 25 Nov 2020 09:58:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201125054255.137067-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25/11/2020 05:42, Bjorn Andersson wrote:
> Attempting to send a power request during PM operations, when the QMI
> handle isn't initialized results in a NULL pointer dereference. So check
> if the QMI handle has been initialized before attempting to post the
> power requests.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Applied thanks,

--srini

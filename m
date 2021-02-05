Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7AE310A39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 12:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhBEL00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 06:26:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbhBELYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 06:24:16 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AE6C06178C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 03:23:35 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id q7so7217949wre.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 03:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XZjai84jL2MT2ucdxhObStbkoL/lh0RPK5ZQb+JvFLU=;
        b=hBAJFGW1p9M9bmp/UZGUDfatvFUjABQ/JztirKiZmRHKUuOfGRXmqb2nKBQBjBO/TC
         A2enYbxhdPzAG7tv5ViNxbCib5KFbgW17JC4W3wy4ASE+7+HWNv+A+BAV2lXsK9+AoJE
         QkJVBy4jBYK5A1t2aftsdf3Z0TLEN/XmhWNI0mU7RbP0Oi1msIAIp52V0mBUsOh0Audw
         +VXdPoXnqi0lDgdD8k5wtw7F3GZ2444i1MwmdSvCGhPx9zWKlJwPiDxd10qClYvXIzMV
         KcfnusQvwJfaXBe3XKjrffKQTLQ7JlGOyycIFx5+WE1xuba0ERmWHKwcvR7ks8RgKG4l
         0y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XZjai84jL2MT2ucdxhObStbkoL/lh0RPK5ZQb+JvFLU=;
        b=C8j+L1vYbD0fcWZkCE8e+u/1pAwQ4ibQHXooxMDlCSC12t2aQMoAlnUFJr8T/8nf9d
         zhDOJNLsUnT07hgp+UhZtldMf4HkL6kHom4OZxARibI3ujh54vOW5eCxYA7cryjYtZFn
         gQ265n2WbjA/nQVSQw43odoObdi+Z7ZhRFLpBNLS6nulk8hqGgTTIjhAvoPhLIRZCdvb
         87nZ3vRyGmBGjl8y6LLgQBi0qBjyg5S6anFr3rLmN1PoI4Hu3a5FrkD3q7v5jXAaIMie
         sFYgGPwH+qbRTL9ARDwaLmdO9oBR1IZLyB2kXIMvxZbaoljsbM3LMB2OiZuOcZeSogvH
         Bypw==
X-Gm-Message-State: AOAM532eJhpsOJnCVzKFMeWvUTEvmVlY9T+RqsAffx+W9P9Mfe6Svd/j
        czpXt6cvfjmdRwVS2OZSVvo0Bw==
X-Google-Smtp-Source: ABdhPJxg/K+XB7iuVyDTWRnWVCN/mjnEdAzS9V428QgxkfYG7v/5E1B9oIcA5Jsm7Yp6SCebfCtgGg==
X-Received: by 2002:adf:a554:: with SMTP id j20mr4600474wrb.148.1612524214711;
        Fri, 05 Feb 2021 03:23:34 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w25sm8833617wmc.42.2021.02.05.03.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 03:23:34 -0800 (PST)
Subject: Re: [PATCH] media: venus: core, venc, vdec: Fix probe dependency
 error
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org
References: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
 <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <e2d89409-6691-e98c-1f68-fcdc63d26be4@linaro.org>
Date:   Fri, 5 Feb 2021 11:24:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2021 08:31, Stanimir Varbanov wrote:
> Why not just move platform_set_drvdata(pdev, core) at the end of
> venus_probe() after we registered v4l2_dev? I think this way we will
> avoid this v4l2_dev gymnastics.

Because pm_ops->core_functionname() relies on getdrvdata.

I changed that in a version of this fix which I didn't publish but also 
found that there were other dependencies in core::probe venc::probe and 
vdec::probe on drvdata.

I can publish a fix for drvdata and you can take your preference

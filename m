Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A415D3A5032
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 21:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhFLTKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 15:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLTKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 15:10:09 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D4EC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 12:07:56 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l9so9804759wms.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BB8JUk0gwOcSxW/GKLMC0NWk2t05q2bfE76haF6J3Uo=;
        b=o0usK3QAxuMZK/rVefuHHGWcinLsWk2ORSuWGqkbpvKNPirUZwHB0IX1vBVsGc1m2q
         CXODO5OyslNMhb0byegXAdCtsQhI5sf43fRZe4bnHneuWFDsHUKR4ju/vvP3d4KuqNhq
         WmUzU7I1Vq6e6r/OJP/kHXT3/GOMyHRDUpGs37RF2AhT+UzTfYv6yp2xm373zI9nSeHF
         MJCgHJkwUnWg+JyfiwGAjyPG2H6Ac/XFERVX0vl6f2Jcn1H1jPxiVW5KOxX3mvpjKx3w
         BirBvxX1YMVQPleRAlwNumjxpidN4lchJ68kDc2LZRihahAwdQ+Xaw4saFwbQmKBo9Mk
         8Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BB8JUk0gwOcSxW/GKLMC0NWk2t05q2bfE76haF6J3Uo=;
        b=Pl6zATNLp/kUzyX3OpsomqVW6xsz0lyoo4xKjoETvYyVHMAq11JYgLghLKOj4ZWLi7
         60jN5bzu50EeH4hxOqAtwmhO+DrIw14lEPHnv0Rc/t0esGwHVeGUrGa1V9vAQ+y1alWJ
         p6OzJdvNruKeoPbhJc36auV37ktR30wa3FIg7ZxKkqzxI1uhVxvdBbAcG5hsvNiOV8CS
         fLReHHn0T5eATGij/Hwwfmpu4LSqG74NkluViFSAaWtKkODSCI/5V2oWY4HlAqZvRrJS
         wSzU7N97luO7FjwG5KqZQSrPZXBRoDvTz7pdEqrwd/qreVq0BmBXzcDc3CQb8lODybjU
         Ngow==
X-Gm-Message-State: AOAM530u0poCpJV48UmgKs+5czBobBtZDXZTFpshIgrNdl9taYOVzd5k
        Vyb9/+62hE4bng1fX2eH+ikWJ19UYehHBqub
X-Google-Smtp-Source: ABdhPJz9Cv27r1lmZZb4uNwMHuG9pbRW72eCDdcMkHadZWJDxkgeHQdiuL6Zx6X5A5hk6iPmc4LKew==
X-Received: by 2002:a7b:c110:: with SMTP id w16mr9449399wmi.4.1623524874956;
        Sat, 12 Jun 2021 12:07:54 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:15bb:2e33:aa66:1b44? ([2a01:e34:ed2f:f020:15bb:2e33:aa66:1b44])
        by smtp.googlemail.com with ESMTPSA id w23sm16170888wmi.0.2021.06.12.12.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 12:07:54 -0700 (PDT)
Subject: Re: [PATCH V4 1/3] dt-bindings: thermal: tsens: Add compatible string
 to TSENS binding for SC7280
To:     Rajeshwari Ravindra Kamble <rkambl@codeaurora.org>,
        amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, manafm@codeaurora.org
References: <1620367641-23383-1-git-send-email-rkambl@codeaurora.org>
 <1620367641-23383-2-git-send-email-rkambl@codeaurora.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9a8f0d40-5368-580b-b037-9d9637cc0861@linaro.org>
Date:   Sat, 12 Jun 2021 21:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620367641-23383-2-git-send-email-rkambl@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/05/2021 08:07, Rajeshwari Ravindra Kamble wrote:
> Adding compatible string in TSENS dt-bindings for SC7280.
> 
> Signed-off-by: Rajeshwari Ravindra Kamble <rkambl@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

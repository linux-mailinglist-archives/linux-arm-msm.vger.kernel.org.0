Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77DE29639A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 19:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898801AbgJVRQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 13:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369128AbgJVROk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 13:14:40 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8324C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 10:14:40 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j7so2480443oie.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WJ8I14wf262ZPiivnyQQ+MbWvOKiYpS8eHcxbP0dKhU=;
        b=Cv/UfUS2m8S022aQfxyLpzkNxoSNuyCiqVOSYEMnDmqJ+bAyotuK5ClUvp+29FFeX4
         8ohCnv1IdAQ/GNFX7aaWVX+JL7JQjTo1Svl5gfjJT0T1hVj73KDoOwJGKoEIB1rZyvo1
         A+DkALDz1k8ys/LNmSOIKG6R2BEj0NkW4zSXwFHbRx2CcB9MiiI5dDBrfFPrTgsjY3Rt
         EEFmwJLK+IoclWuWtP+3aFxj5mjM9sgCcJk/Se2XXybCyIQgwuO3RZO4jdyBWql+/4MG
         1ReSp5+e8sKlC2KNfpjd/kRjS/5Uz+eCPbe4TP8c2kpQPYOf2+CnFEcZsdf880Vil8r2
         EY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WJ8I14wf262ZPiivnyQQ+MbWvOKiYpS8eHcxbP0dKhU=;
        b=Bi2EV6YvigTY9Tz95BCOfuwy9IC6vM+zLqCjh4waQMB/v0ISU2fSmyHt3dWO94MLv+
         XbRht3Jzehz+vt4kPZzSdIMYGx9EUaQ/dsDQ6ZgO2q36TDspongP7bBPZ34F/GI+QSH4
         6MiktTxxxiQWE7kdbJ8V/FfF3ojcVlRmgpGSe+VmnltFmWJHg8FwJTkPh9T3iZCG07Fv
         7HO1uVnWxKISPVC92U2tJDtaGt4d2NEjUhe1wSJKkmB1hoxoOHQKh5x0P/cHFb5R3tK0
         lNlocO1FmepAi+9x5y88GnciE0Kf1h+lk0qxsmNLKJHqYODGgVu00v9jedX0WobemJaP
         ZEnA==
X-Gm-Message-State: AOAM5313zlOnh138hBguTIA5uoy5FkccN0S8LGWrdFxzSiamMVIp5GYS
        69BZMYbccsO7+FnVYUNpZ+iYnoFExMVkqLHe
X-Google-Smtp-Source: ABdhPJzyrldG0EAOpS5mzfx05qjQMb07bP9ln6Ug2CmF2ns8x1lus0gf3gV2Hw+JIM4TWr7SZqRqJg==
X-Received: by 2002:a05:6808:9b8:: with SMTP id e24mr2313226oig.97.1603386879819;
        Thu, 22 Oct 2020 10:14:39 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id t84sm589024oih.35.2020.10.22.10.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 10:14:39 -0700 (PDT)
Subject: Re: [PATCH v5 0/3] iommu/arm-smmu-qcom: Support maintaining
 bootloader mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <fc462189-d5de-bb8d-31b5-6fb87a6edbdb@kali.org>
Date:   Thu, 22 Oct 2020 12:14:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/19/20 1:23 PM, Bjorn Andersson wrote:
> This is the revised fourth attempt of inheriting the stream mapping for
> the framebuffer on many Qualcomm platforms, in order to not hit
> catastrophic faults during arm-smmu initialization.
>
> The new approach does, based on Robin's suggestion, take a much more
> direct approach with the allocation of a context bank for bypass
> emulation and use of this context bank pretty much isolated to the
> Qualcomm specific implementation.
>
> The patchset has been tested to boot DB845c and RB5 (with splash screen)
> and Lenovo Yoga C630 (with EFI framebuffer).
>
> Bjorn Andersson (3):
>   iommu/arm-smmu: Allow implementation specific write_s2cr
>   iommu/arm-smmu-qcom: Read back stream mappings
>   iommu/arm-smmu-qcom: Implement S2CR quirk
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 90 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 13 +++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
>  3 files changed, 101 insertions(+), 3 deletions(-)
>
Tested series here on my Lenovo C630.

Tested-by: Steev Klimaszewski <steev@kali.org>


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D360485D17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343705AbiAFAZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343716AbiAFAXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:23:55 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CD8C034003
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 16:23:53 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id y16so819973ilq.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 16:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=cWmrJPJ0MvmK8YxK5PKxGmy6rgAFhqWT5bfVzAqhgig=;
        b=GSLAeV7ct3Cl8UbCnOZv/YlpSZ+KTu9jGq0/4lz1kKyi/H0HHlFtfrus/gy+ZXD7ES
         xWDsKmKkL2lygd97OcQO/BV2+uQQurQcuXsUhadiQ92frLdq8EV/xRoM0Cz1lWpTiNSC
         DWHe4YwGA6a8ymhr1BwcQZeP7DDPuj0Ny69bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=cWmrJPJ0MvmK8YxK5PKxGmy6rgAFhqWT5bfVzAqhgig=;
        b=VTYaHxSCen5mmju/wlV+XClqOS6V2CrbwBdQOdfmG4vSuvoZ3n6ee+lxaSf1oqm8+m
         AFkIwGErI9FyL5eWoKg4Sw3qw6v7Cl75ILGsg0+qdPL89wJ4qRBlUvU5GRAiZu0BRta6
         Zz4cDrhg68zIpdAWeociYSMkHUSk7cek/4hXRYy1AJfc7ficiIF5LaHmLuXvoO0cHU3O
         K+4zA+DzXTWFAuVXIwnpo2J5jb7arAyTrAs6juIEzuNtD75hjVuZuYqNLq8XfWTW5ZtX
         0s0x4z7AxSWegasnETk1+HQyOVwzlH93KZV0O+VBtYQpTkB40O0QFQG4LxrybWManXce
         UUsA==
X-Gm-Message-State: AOAM531ITVFeeQ4DhZM8nRuUGbqsoohhzdgW6vpzAbFuEmpudzsTOKGC
        7gu30d+Wq9uaOr2fFxNL0pYCog==
X-Google-Smtp-Source: ABdhPJz0CNxnXr43ULF4S3QBlzgIEnc22wgp8za6in1ONKt9zwDj3U4mfXlX9BW+REUtBUpjLnuVgg==
X-Received: by 2002:a92:d58b:: with SMTP id a11mr2719025iln.315.1641428633275;
        Wed, 05 Jan 2022 16:23:53 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id p16sm329708iov.3.2022.01.05.16.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:23:52 -0800 (PST)
Message-ID: <c6b60b30-5a9f-134b-b1fb-b84704a3ccb2@ieee.org>
Date:   Wed, 5 Jan 2022 18:23:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From:   Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 04/20] bus: mhi: Cleanup the register definitions used in
 headers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-5-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-5-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> Cleanup includes:
> 
> 1. Moving the MHI register bit definitions to common.h header (only the
>     register offsets differ between host and ep not the bit definitions)

The register offsets do differ, but the group of registers for the host
differs from the group of registers for the endpoint by a fixed amount.
(MHIREGLEN = 0x0000 for host, or 0x100 for endpoint; CRCBAP_LOWER is
0x0068 for host, 0x0168 for endpoint.)

In other words, can you instead use the same symbolic offsets, but
have the endpoint add 0x0100 to them all?  It would make the fact
that they're both referencing the same basic in-memory structure
more obvious.

> 2. Using the GENMASK macro for masks
> 3. Removing brackets for single values
> 4. Using lowercase for hex values

Yay!!! For all three of the above.

More below.

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/common.h        | 129 ++++++++++++---
>   drivers/bus/mhi/host/internal.h | 282 +++++++++++---------------------
>   2 files changed, 207 insertions(+), 204 deletions(-)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index 2ea438205617..c1272d61e54e 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -9,32 +9,123 @@
>   
>   #include <linux/mhi.h>
>   
> +/* MHI register bits */
> +#define MHIREGLEN_MHIREGLEN_MASK		GENMASK(31, 0)
> +#define MHIREGLEN_MHIREGLEN_SHIFT		0

Again, please eliminate all _SHIFT definitions where they define
the low bit position of a mask.

Maybe you can add some underscores for readability?

Even if you don't do that, you could add a comment here or there to
explain what certain abbreviations stand for, to make it easier to
understand.  E.g., CHDB = channel doorbell, CCA = channel context
array, BAP = base address pointer.

					-Alex


> +#define MHIVER_MHIVER_MASK			GENMASK(31, 0)
> +#define MHIVER_MHIVER_SHIFT			0
> +
> +#define MHICFG_NHWER_MASK			GENMASK(31, 24)
> +#define MHICFG_NHWER_SHIFT			24
> +#define MHICFG_NER_MASK				GENMASK(23, 16)
> +#define MHICFG_NER_SHIFT			16
> +#define MHICFG_NHWCH_MASK			GENMASK(15, 8)
> +#define MHICFG_NHWCH_SHIFT			8
> +#define MHICFG_NCH_MASK				GENMASK(7, 0)
> +#define MHICFG_NCH_SHIFT			0

. . .

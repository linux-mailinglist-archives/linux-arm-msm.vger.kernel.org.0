Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4EAD5ED1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 22:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfGCUDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 16:03:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42094 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfGCUDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 16:03:04 -0400
Received: by mail-io1-f65.google.com with SMTP id u19so7796195ior.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2019 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UKh+fnCjeVqcQm0IwUHZUc5vltmZ8E0kqz9Ok6uJVI4=;
        b=EIIpKwYigj//ohw/Hx/d7USCLYQ6Yz7CE5EleU+SyrJULC2Fj/eLP/4fOYzc89xM75
         8ifdTZ2G88o7ItmphKYgUPbJB+abRou6TKyNi7KyE+2xJEXze5Lp4Z9e5BNv8RchqzQ9
         wEdy6vOTEm2EaFnEJxAfuww3pGtAweWtCXg3SkK4hTV3xFwZeQr3Sc/G5MBsWKrFSkLm
         xjrb1E3oqGmHMNVHWVZ8gxN3WOr6b/PsqLUhI9snTyH8Z9pnjPntS9aFwjJ6i6+P01xf
         iR1aDSllthbZYMqBxEdAPvCd592QwZ1nwWYrXyD1vmy2zvCAJODbOW4U/7pkPL5ePznv
         OK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UKh+fnCjeVqcQm0IwUHZUc5vltmZ8E0kqz9Ok6uJVI4=;
        b=G/IFS4wlhDTYEsv7Tkumcs2c23ufANlFnNI2qYMBXJeuEeSwHdl+5HMdWuiWx7bhWV
         Wy5rHYTzXuQpZUSjn4K9w1Z1OnuMWY60tdS4yZoi6aCxEJaaddiI5WUBPJQLD+h8y/sX
         tPVYEWsafwX4YNsJlv7eAYludHMKoxdw/GuJ8+5WB7GuNdlH5ztpZWzo29A34ZfnIMKj
         Vy86QgVZbCRIA4dMVaipqi9nPKdzxRa9qakDLUGUIXmsIlfiJpyvg1AzlVc+Si3HvNFE
         V/jBSD4CpSCsMTD7gMPn+saL/ppm8REHdA/gpyUpcP/k/diIpeZd11GgrsyGwbmXyNuj
         xiew==
X-Gm-Message-State: APjAAAVwOincFuSfAooRqMGL05AgvXRziOL5a1i7XdPnkNbn7b1OWiXr
        WYcfx2DA5WbqUvzX617nNOtm5/M5FHx5tQdpw0jZVg==
X-Google-Smtp-Source: APXvYqwoE6c94VoRDisMNtWzyjcFI4tXdYpggqbejcxRg98CE8mWN8SWLgyCum0KXlMbwrRNVk/eX+bCnISJDGHcvbo=
X-Received: by 2002:a02:7642:: with SMTP id z63mr31807037jab.36.1562184183245;
 Wed, 03 Jul 2019 13:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org> <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 3 Jul 2019 14:02:52 -0600
Message-ID: <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Thu, 27 Jun 2019 at 12:15, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Do not assume the affinity to CPU0 if cpu phandle is omitted.
> Update the DT binding rules to reflect the same by changing it
> to a required property.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

I'm all good with this patch - can you pick this up for the coming
merge window?  If not I'll simply keep it in my tree for 5.4.

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  .../devicetree/bindings/arm/coresight-cpu-debug.txt       | 4 ++--
>  Documentation/devicetree/bindings/arm/coresight.txt       | 8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> index 298291211ea4..f1de3247c1b7 100644
> --- a/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> @@ -26,8 +26,8 @@ Required properties:
>                 processor core is clocked by the internal CPU clock, so it
>                 is enabled with CPU clock by default.
>
> -- cpu : the CPU phandle the debug module is affined to. When omitted
> -       the module is considered to belong to CPU0.
> +- cpu : the CPU phandle the debug module is affined to. Do not assume it
> +        to default to CPU0 if omitted.
>
>  Optional properties:
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 8a88ddebc1a2..fcc3bacfd8bc 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -59,6 +59,11 @@ its hardware characteristcs.
>
>         * port or ports: see "Graph bindings for Coresight" below.
>
> +* Additional required property for Embedded Trace Macrocell (version 3.x and
> +  version 4.x):
> +       * cpu: the cpu phandle this ETM/PTM is affined to. Do not
> +         assume it to default to CPU0 if omitted.
> +
>  * Additional required properties for System Trace Macrocells (STM):
>         * reg: along with the physical base address and length of the register
>           set as described above, another entry is required to describe the
> @@ -87,9 +92,6 @@ its hardware characteristcs.
>         * arm,cp14: must be present if the system accesses ETM/PTM management
>           registers via co-processor 14.
>
> -       * cpu: the cpu phandle this ETM/PTM is affined to. When omitted the
> -         source is considered to belong to CPU0.
> -
>  * Optional property for TMC:
>
>         * arm,buffer-size: size of contiguous buffer space for TMC ETR
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

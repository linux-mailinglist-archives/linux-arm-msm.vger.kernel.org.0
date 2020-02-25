Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C7B16EE75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 19:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731265AbgBYSzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 13:55:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:35368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728051AbgBYSzV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 13:55:21 -0500
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43B0524656;
        Tue, 25 Feb 2020 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582656920;
        bh=GcAOngsNc42gcovvY3uUGpbwLfTEWg8qiIiv3HckXOU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wiHIZtal8u4HE4RLq3R2aMVKuvHeuLy4NZ5EfCWymWev2oUMeVYxCmBgnf5YhVchV
         iTaVNzQtwydoDEuJtvEdXGE6BqmJ2X7hEZnl8t+p/3unNU3UkiSxruywLdcUoSaDeX
         SAM2LR6raG9nKiUpALVKgYocAemKbkqQWtJ4ONWo=
Received: by mail-qk1-f176.google.com with SMTP id o28so185780qkj.9;
        Tue, 25 Feb 2020 10:55:20 -0800 (PST)
X-Gm-Message-State: APjAAAWDVPuPn+zONg7D7ioIwxxViYAx9wCp8lb1nVKB7CfZSs/KHPLp
        b0H20/vdpeOYoonZGEFNQ0TrvR4Xp/lE/QD2Rw==
X-Google-Smtp-Source: APXvYqwNHK4+Y1yIBWKMojOKtY7ghpPbDHqnF8yS97h6Zmcgig7EivjliFmXOITvj7XfHi/v0Mg41/i8G2/gEn8VQok=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr322658qkg.152.1582656919408;
 Tue, 25 Feb 2020 10:55:19 -0800 (PST)
MIME-Version: 1.0
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org> <1582223216-23459-3-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582223216-23459-3-git-send-email-jcrouse@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 25 Feb 2020 12:55:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+NLhw4mfNd7=4ADz63G15WATPpGbz3HxxV1QJqPVQwjw@mail.gmail.com>
Message-ID: <CAL_Jsq+NLhw4mfNd7=4ADz63G15WATPpGbz3HxxV1QJqPVQwjw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: msm: Add required dma-range property
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 12:27 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> The GMU node now requires a specific dma-range property so that the driver

s/dma-range/dma-ranges/ here and the subject.

> can use the DMA API to do the few memory allocations required by the GMU.
> This sets the IOMMU iova allocator to match the 'uncached' part of the
> GMU virtual address space.

Sounds like a bunch of kernel things and this is a binding.

>
> v2: Fix the dma-ranges tag. The third pair should be the size.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index 776ff92..d11a073 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -83,6 +83,13 @@ properties:
>        Phandle to the OPP table for the available GMU frequencies. Refer to
>        ../../opp/opp.txt for more information.
>
> +  dma-ranges:

dma-ranges is a bus property and doesn't go in device nodes (that
don't implement a bus like PCI host for example). This would not have
even worked a few kernel versions back because the kernel would only
start looking for dma-ranges in a parent node.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Describe the dma-address range for the device. This should always
> +      describe the range between 0x60000000 and 0x80000000 which represents

If this is always the region, then why does it need to be in DT? Just
set your dma_mask which drivers should be doing if they want anything
other than (2^32 - 1). dma-ranges sets the bus_dma_mask.

> +      the uncached region of the GMU address space.
> +
>  required:
>    - compatible
>    - reg
> @@ -95,6 +102,7 @@ required:
>    - power-domain-names
>    - iommus
>    - operating-points-v2
> +  - dma-ranges
>
>  examples:
>   - |
> @@ -127,4 +135,6 @@ examples:
>
>          iommus = <&adreno_smmu 5>;
>          operating-points-v2 = <&gmu_opp_table>;
> +
> +        dma-ranges = <0 0x60000000 0 0x60000000 0 0x20000000>;
>     };
> --
> 2.7.4
>

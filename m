Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB33773B7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 20:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhEHS5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 14:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhEHS5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 14:57:19 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7ACC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 May 2021 11:56:17 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so10855383oth.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 May 2021 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IF7Fac0YjVDycbq5PH+VvNCEX38AVPA4fKxY5+X2pvM=;
        b=PUqcaScEb9tsf7vUvHj3CnZsCwzWf3odcLsWYZX9AtdI1hc4sT58bXGsUhazsSPyWI
         6Q6kBqJcVBJZgaxWMz3M7RZJYw4eqyTkDsILIbnC1E1xxqSzc316q931UtbagBNF20ma
         156h+ehNaRPmn35EfI/9L4A5U6GjV4KBICyzI1eHarm/92TJyfZ0rREoWPcNWGegyDVv
         L1yO/eZLul0v1cZ41ndHwaMbCGiPESt4zyISiWKNkIHF5wwVjA84EkC9VkLvHvxF0RRb
         UzbBBWKZy5vRQlr9iE1nZLtvcescqeEuUx9GHyqoND2oK+jyGr+AZVrK+LrPt6b5XP1H
         j2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IF7Fac0YjVDycbq5PH+VvNCEX38AVPA4fKxY5+X2pvM=;
        b=ai9G+5Agkz32hBSo5eKEa9t0qK3lSoJrRxB5MybHn+EDnIkTAnGqdVQOOU6Z65ZEsP
         nR8XwFO4Trt4hzYZnS4beyrZIWlIDAsomuEXvHdPAu7QpVucat3mQ+Jc4ibms5PUUM2p
         F6jdbcO0WlF95AnbteuRYMRYrJv2eqvklPmdDR+BmK5G8BDCgjqaGcAuZFtcaq99mb/g
         hYZ5wuACxgPp6aTknNrw1dgvTBVtHiV7gdjDvkjsaem3DI/ZfM2M31OE6cgsw61gVgAR
         9YvD7fF94q7cdyG6K/WdHmW6k/F04oRjGN9Gn8j7JO9OtZL/AlixrL4eZJAAb0R+aPQ/
         yvDg==
X-Gm-Message-State: AOAM531Y+lUTgVqAmE5JuMWzJPkJ+qMUBg+dt7vnXy32iZQiRHxjCoih
        Yh3tHyOoD17a8xQQZnhkSXbf4bHhNkkpLF/ZdvkukA==
X-Google-Smtp-Source: ABdhPJwSVaVB5oB3yhUXmvXMdKhgh8GWruFZ82+rfw+bzS/cGv/WjBJnJLO0ry+vEzbyw1Po+3sMwFzSUAbOpuPcAsg=
X-Received: by 2002:a9d:51c7:: with SMTP id d7mr5449017oth.51.1620500177155;
 Sat, 08 May 2021 11:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org> <20210507211434.GA2879094@robh.at.kernel.org>
In-Reply-To: <20210507211434.GA2879094@robh.at.kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 9 May 2021 00:26:06 +0530
Message-ID: <CAH=2Ntwwzu5Ftwj=r9RWnKv6xvRdKz0qjyqvJvxFwmoTP1zTqg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Enable Qualcomm Crypto Engine on sm8250
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Sat, 8 May 2021 at 02:44, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 06, 2021 at 03:07:14AM +0530, Bhupesh Sharma wrote:
> > Changes since v1:
> > =================
> > - v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210310052503.3618486-1-bhupesh.sharma@linaro.org/
> > - v1 did not work well as reported earlier by Dmitry, so v2 contains the following
> >   changes/fixes:
> >   ~ Enable the interconnect path b/w BAM DMA and main memory first
> >     before trying to access the BAM DMA registers.
> >   ~ Enable the interconnect path b/w qce crytpo and main memory first
> >     before trying to access the qce crypto registers.
> >   ~ Make sure to document the required and optional properties for both
> >     BAM DMA and qce crypto drivers.
> >   ~ Add a few debug related print messages in case the qce crypto driver
> >     passes or fails to probe.
> >   ~ Convert the qce crypto driver probe to a defered one in case the BAM DMA
> >     or the interconnect driver(s) (needed on specific Qualcomm parts) are not
> >     yet probed.
> >
> > Qualcomm crypto engine is also available on sm8250 SoC.
> > It supports hardware accelerated algorithms for encryption
> > and authentication. It also provides support for aes, des, 3des
> > encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
> > authentication algorithms.
> >
> > Tested the enabled crypto algorithms with cryptsetup test utilities
> > on sm8250-mtp and RB5 board (see [1]).
> >
> > While at it, also make a minor fix in 'sdm845.dtsi', to make
> > sure it confirms with the other .dtsi files which expose
> > crypto nodes on qcom SoCs.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> >
> > Bhupesh Sharma (14):
> >   dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to
> >     optional properties
> >   dt-bindings: qcom-bam: Add 'iommus' to required properties
> >   dt-bindings: qcom-qce: Add 'iommus' to required properties
> >   dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to
> >     optional properties
> >   arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
> >   dt-bindings: crypto : Add new compatible strings for qcom-qce
>
> Please convert these bindings to schemas.

Ok, will fix it in v3.

Thanks,
Bhupesh

>
> >   arm64/dts: qcom: Use new compatibles for crypto nodes
> >   crypto: qce: Add new compatibles for qce crypto driver
> >   crypto: qce: Print a failure msg in case probe() fails
> >   crypto: qce: Convert the device found dev_dbg() to dev_info()
> >   dma: qcom: bam_dma: Create a new header file for BAM DMA driver
> >   crypto: qce: Defer probing if BAM dma is not yet initialized
> >   crypto: qce: Defer probe in case interconnect is not yet initialized
> >   arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
> >
> > Thara Gopinath (3):
> >   dma: qcom: bam_dma: Add support to initialize interconnect path
> >   crypto: qce: core: Add support to initialize interconnect path
> >   crypto: qce: core: Make clocks optional
> >
> >  .../devicetree/bindings/crypto/qcom-qce.txt   |  22 +-
> >  .../devicetree/bindings/dma/qcom_bam_dma.txt  |   5 +
> >  arch/arm64/boot/dts/qcom/ipq6018.dtsi         |   2 +-
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi          |  28 ++
> >  drivers/crypto/qce/core.c                     | 112 +++++--
> >  drivers/crypto/qce/core.h                     |   3 +
> >  drivers/dma/qcom/bam_dma.c                    | 306 ++----------------
> >  include/soc/qcom/bam_dma.h                    | 290 +++++++++++++++++
> >  9 files changed, 457 insertions(+), 317 deletions(-)
> >  create mode 100644 include/soc/qcom/bam_dma.h
> >
> > --
> > 2.30.2
> >

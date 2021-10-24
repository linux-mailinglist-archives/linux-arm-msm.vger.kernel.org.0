Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C275438963
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Oct 2021 15:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhJXOAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 10:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhJXOAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 10:00:36 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5AEC061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:58:15 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id y15-20020a9d460f000000b0055337e17a55so11102821ote.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YY0ykMbflRlWO1UcyI3Q6Xhl5BeEo40+CEHPuWbOWVE=;
        b=FXOyEcLZFGx39BEbINgPsrseN8HM6oioA48PhAgo6HD8KUF2TneTW8WR+xcDyiTQxh
         QDnFVHxtd5FbZYAFCdM4Cwol64woYhS/oFKUnH4xh3FDMbHHmjFXdrzDhfqZUHfe2K6T
         j5HNb5B2jAGMPLeKs3vqMBpiSnfk76qaV5JaghcFDtE4A/Q8XxK2KBIjoZTOMItfWdqd
         XW5U1qC2b5fH75zx7HXVmsCsGg0JpYtwMgUouX8Fn5Jh8l27W8cizYBX1Lo1bjKGpouk
         qR7j56CWRbv1BEafJJdntYLFEYU2W96bXj12KneHdm1Ciawgi17Wkx82m7yhAP7bbC3E
         Cuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YY0ykMbflRlWO1UcyI3Q6Xhl5BeEo40+CEHPuWbOWVE=;
        b=SgIrQyECPcwoD8oIg7pNNwe+hseAqRq/2F+Frdzm+J0ni87koKKtif4mqDT9wvsG8i
         bn6gRUtq824eW10VRI4pPJZxRCdgShBcH1QWtr/4gYl+k1pXtJZNGCbpIXJ1rLacjINH
         IKo5Fu0M1Z50sMGEWlvH01kGrX+74yBRcZ6b0QQIoLzSf1SRAYj2HeB8sX3x5b1FttQ4
         UBhjh8j9MSCo7cMiyGZOC6cSt24a0a5yubKbcBfdaSwf8ceO6MTUb9EgrRsAHb393gBH
         jA0rV3cWYdwxLrsn3wTKphz/X5pHEScJ+kelZv8uvyal9YKkRkRPdMF2QFCsrdZWiyQ8
         mYQg==
X-Gm-Message-State: AOAM5313LKtDhP3JHMyvOxGwdDNlGFO3cKf4ZvBFgtV47bhhTm/5n4Un
        tssRtv/P5HQ6WzYQryoN05rfBEEkHMW3oxXlb2Ccyg==
X-Google-Smtp-Source: ABdhPJzf43bh1mPOcsyeHedw+iQLM168Gf76LvYgzEpsZhLSqjOEZ5P6jQpTHLqLE6frIYIMiyZrjopUloHwtyJLJnE=
X-Received: by 2002:a9d:26:: with SMTP id 35mr9008458ota.379.1635083894573;
 Sun, 24 Oct 2021 06:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org> <a5927363-5e2f-9af1-7446-2146fd455f36@linaro.org>
In-Reply-To: <a5927363-5e2f-9af1-7446-2146fd455f36@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 24 Oct 2021 19:28:03 +0530
Message-ID: <CAH=2Ntx-gDk-QqKDNkm9_=NU5uGiYaOEJYc_e7TCMHGu58+SeQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] Enable Qualcomm Crypto Engine on sm8250
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thara,

On Wed, 20 Oct 2021 at 19:33, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>
> On 10/13/21 6:55 AM, Bhupesh Sharma wrote:
> > Sorry for a delayed v4, but I have been caught up with some other
> > patches.
>
> Hi Bhupesh,
>
> If possible, please consider splitting this series into 2. One with
> changes required to support crypto driver on
> sm8250 and other with the generic fixes / fixing the dt-bindings et all.
> It would be easier to review as well

That's a good suggestion, but I would suggest keeping the series as
one for now (as we are already approaching v5 and most of the review
comments are taken care of in v5).

Regards,
Bhupesh

> > Changes since v3:
> > =================
> > - v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20210519143700.27392-1-bhupesh.sharma@linaro.org/
> > - Dropped a couple of patches from v3, on basis of the review comments:
> >     ~ [PATCH 13/17] crypto: qce: core: Make clocks optional
> >     ~ [PATCH 15/17] crypto: qce: Convert the device found dev_dbg() to dev_info()
> > - Addressed review comments from Thara, Rob and Stephan Gerhold.
> > - Collect Reviewed-by from Rob and Thara on some of the patches from the
> >    v3 patchset.
> >
> > Changes since v2:
> > =================
> > - v2 can be seen here: https://lore.kernel.org/dmaengine/20210505213731.538612-1-bhupesh.sharma@linaro.org/
> > - Drop a couple of patches from v1, which tried to address the defered
> >    probing of qce driver in case bam dma driver is not yet probed.
> >    Replace it instead with a single (simpler) patch [PATCH 16/17].
> > - Convert bam dma and qce crypto dt-bindings to YAML.
> > - Addressed review comments from Thara, Bjorn, Vinod and Rob.
> >
> > Changes since v1:
> > =================
> > - v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210310052503.3618486-1-bhupesh.sharma@linaro.org/
> > - v1 did not work well as reported earlier by Dmitry, so v2 contains the following
> >    changes/fixes:
> >    ~ Enable the interconnect path b/w BAM DMA and main memory first
> >      before trying to access the BAM DMA registers.
> >    ~ Enable the interconnect path b/w qce crytpo and main memory first
> >      before trying to access the qce crypto registers.
> >    ~ Make sure to document the required and optional properties for both
> >      BAM DMA and qce crypto drivers.
> >    ~ Add a few debug related print messages in case the qce crypto driver
> >      passes or fails to probe.
> >    ~ Convert the qce crypto driver probe to a defered one in case the BAM DMA
> >      or the interconnect driver(s) (needed on specific Qualcomm parts) are not
> >      yet probed.
> >
> > Qualcomm crypto engine is also available on sm8250 SoC.
> > It supports hardware accelerated algorithms for encryption
> > and authentication. It also provides support for aes, des, 3des
> > encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
> > authentication algorithms.
> >
> > Tested the enabled crypto algorithms with cryptsetup test utilities
> > on sm8250-mtp and RB5 board (see [1]) and also with crypto self-tests,
> > including the fuzz tests (CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y).
> >
> > Note that this series is rebased on a SMMU related fix from Arnd applied
> > on either linus's tip of linux-next's tip (see [2]), without which
> > the sm8250 based boards fail to boot with the latest tip.
> >
> > [1]. https://linux.die.net/man/8/cryptsetup
> > [2]. https://lore.kernel.org/linux-arm-kernel/CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com/T/
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> >
> > Bhupesh Sharma (17):
> >    arm64/dts: qcom: Fix 'dma' & 'qcom,controlled-remotely' nodes in dts
> >    arm64/dts: qcom: ipq6018: Remove unused 'qcom,config-pipe-trust-reg'
> >      property
> >    arm64/dts: qcom: ipq6018: Remove unused 'iface_clk' property from
> >      dma-controller node
> >    dt-bindings: qcom-bam: Convert binding to YAML
> >    dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to
> >      optional properties
> >    dt-bindings: qcom-bam: Add 'iommus' to optional properties
> >    dt-bindings: qcom-qce: Convert bindings to yaml
> >    dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to
> >      optional properties
> >    dt-bindings: qcom-qce: Add 'iommus' to optional properties
> >    arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
> >    dt-bindings: crypto : Add new compatible strings for qcom-qce
> >    arm64/dts: qcom: Use new compatibles for crypto nodes
> >    crypto: qce: Add new compatibles for qce crypto driver
> >    crypto: qce: Print a failure msg in case probe() fails
> >    crypto: qce: Defer probing if BAM dma channel is not yet initialized
> >    crypto: qce: Add 'sm8250-qce' compatible string check
> >    arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
> >
> > Thara Gopinath (3):
> >    dma: qcom: bam_dma: Add support to initialize interconnect path
> >    crypto: qce: core: Add support to initialize interconnect path
> >    crypto: qce: core: Make clocks optional
> >
> >   .../devicetree/bindings/crypto/qcom-qce.yaml  |  90 +++++++++++++++
> >   .../devicetree/bindings/dma/qcom_bam_dma.txt  |  50 --------
> >   .../devicetree/bindings/dma/qcom_bam_dma.yaml | 107 ++++++++++++++++++
> >   arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  10 +-
> >   arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   4 +-
> >   arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
> >   arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
> >   arch/arm64/boot/dts/qcom/sdm845.dtsi          |  10 +-
> >   arch/arm64/boot/dts/qcom/sm8250.dtsi          |  28 +++++
> >   drivers/crypto/qce/core.c                     |  66 +++++++----
> >   drivers/crypto/qce/core.h                     |   1 +
> >   drivers/dma/qcom/bam_dma.c                    |  16 ++-
> >   12 files changed, 302 insertions(+), 86 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> >   create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> >
>
>

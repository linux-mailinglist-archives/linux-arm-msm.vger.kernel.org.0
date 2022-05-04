Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD1F519BA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 11:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344448AbiEDJ3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 05:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347305AbiEDJ3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 05:29:48 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F5F26120
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 02:26:10 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id k14so747432pga.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4IYt+9Q28WSomnu+KeGS1JfySm8PsBO1uB4iAKwe7Iw=;
        b=wK5SXDcbGzg0dEaPLynv1bjI050D9s08Vaqhq8hnygfqo6sEcdMEV5c23xZEMObvHJ
         7xLA5Z/RAUw6CkC63ns1qYmbdhOECat0ZaYeK8LxMJJA67OEUywEOSYUqel3FfArLknL
         m6Y9/ejgpPJV0xEoDLLyg7v3ij5VtGQcS26TWrFrPedEMfR19iVzorss4MAiMOCKmh6Z
         7Qt1LEs0aqlcdu6LtXeYS5e8T/AivbFmGInpikNsohMh3AYolMSlWPGrXz1CIYTzpJGK
         HDLNF8iJi+WomhnpRTw8XU/pfJ7BpzFrTUaV6uKyVxstTX+BK252EtLR1KTX5XBdptpy
         DedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4IYt+9Q28WSomnu+KeGS1JfySm8PsBO1uB4iAKwe7Iw=;
        b=qK51JCfIcVk3Va9qTzGk6jn+px2riH1+uiqjo9EOuMVXvg1PJSAMYBZ3F2eQmBluZC
         rCgfbKFK/ggViHutCZ4MBUILSrC3lg6H7weT0gv+vp5N+FVrnGvihN+jViTus2YBm0yE
         isxcCGYG4/bON2r0Bbo0XRHlwVNvZ+/aQtVXD0VHKEa4tdTQzlojjFCIEF82P8b8s5Dr
         vU6Boe8X9D4mVkYwaciKayXLanXEOiXByaJNeHa3d5Pv0h/Pooqa1yT7PcYj/RNxvvCL
         uJ9VeFnr6Wmk9jDtvMMmUe1KYaAKXesSYmJI/OiQInpE7GNeHaLtLjttKr9DI1PGlS6y
         TwaQ==
X-Gm-Message-State: AOAM533R/7MzADKI/SiAlFpVT+S3XIJ/WtWHzbgvLceaqeHd25wFa7wf
        DeCzt5+uIhJ8+qziXkRgLj3y0Lz5jkwpMOTdQRv1Jg==
X-Google-Smtp-Source: ABdhPJzl9I2Po2E1xpvCJ4fFfxZflGfVFlfllWiGpNzG2EQekRJLBX7+MjFTKG7/uBnAYwdKoXpicCvqSfgaB9/nOpg=
X-Received: by 2002:a63:5747:0:b0:381:54b9:b083 with SMTP id
 h7-20020a635747000000b0038154b9b083mr16965488pgm.178.1651656369704; Wed, 04
 May 2022 02:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
 <20220502104144.91806-6-manivannan.sadhasivam@linaro.org> <CAMZdPi_i60TqszUL+=ocMn-4veyoGRQoOGD_B4YiEpz_uWE+ZQ@mail.gmail.com>
 <20220504081720.GB5446@thinkpad>
In-Reply-To: <20220504081720.GB5446@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 4 May 2022 11:25:33 +0200
Message-ID: <CAMZdPi9oA4SSYGSPw9tCmQ=GhwhCgdYz+=rQiUzu1tNbo80ceQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx
 wp update
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 May 2022 at 10:17, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi Loic,
>
> On Wed, May 04, 2022 at 09:21:20AM +0200, Loic Poulain wrote:
> > Hi Mani,
> >
> > On Mon, 2 May 2022 at 12:42, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > The endpoint device will only read the context wp when the host rings
> > > the doorbell.
> >
> > Are we sure about this statement? what if we update ctxt_wp while the
> > device is still processing the previous ring? is it going to continue
> > processing the new ctxt_wp or wait for a new doorbell interrupt? what
> > about burst mode in which we don't ring at all (ring_db is no-op)?
> >
>
> Good point. I think my statement was misleading. But still this scenario won't
> happen as per my undestanding. Please see below.
>
> > > And moreover the doorbell write is using writel(). This
> > > guarantess that the prior writes will be completed before ringing
> > > doorbell.
> >
> > Yes but the barrier is to ensure that descriptor/ring content is
> > updated before we actually pass it to device ownership, it's not about
> > ordering with the doorbell write, but the memory coherent ones.
> >
>
> I see a clear data dependency between writing the ring element and updating the
> context pointer. For instance,
>
> ```
> struct mhi_ring_element *mhi_tre;
>
> mhi_tre = ring->wp;
> /* Populate mhi_tre */
> ...
>
> /* Increment wp */
> ring->wp += el_size;
>
> /* Update ctx wp */
> ring->ctx_wp = ring->iommu_base + (ring->wp - ring->base);
> ```
>
> This is analogous to:
>
> ```
> Read PTR A;
> Update PTR A;
> Increment PTR A;
> Write PTR A to PTR B;
> ```

Interesting point, but shouldn't it be more correct to translate it as:

1. Write PTR A to PTR B (mhi_tre);
2. Update PTR B DATA;
3. Increment PTR A;
4. Write PTR A to PTR C;

In that case, it looks like line 2. has no ordering constraint with 3.
& 4? whereas the following guarantee it:

1. Write PTR A to PTR B (mhi_tre);
2. Update PTR B DATA;
3. Increment PTR A;
dma_wmb()
4. Write PTR A to PTR C;

To be honest, compiler optimization is beyond my knowledge, so I don't
know if a specific compiler arch/version could be able to mess up the
sequence or not. But this pattern is really close to what is described
for dma_wmb() usage in Documentation/memory-barriers.txt. That's why I
challenged this change and would be conservative, keeping the explicit
barrier.

>
> Here, because of the data dependency due to "ring->wp", the CPU or compiler
> won't be ordering the instructions. I think that's one of the reason we never
> hit any issue due to this.

You may be right here about the implicit ordering guarantee... So if
you're sure, I think it would deserve an inline comment to explain why
we don't need a memory barrier as in the 'usual' dma descriptor update
sequences.

Loic

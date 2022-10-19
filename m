Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACE8604CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 18:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiJSQEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 12:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiJSQDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 12:03:40 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73763197F95
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 09:02:23 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id d13so10988418qko.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXEg5LXhNr6g4o3GCgJPPoDv0cCzaMCnarb4y16JcsY=;
        b=RAroKaRpfurWTvdxCuUh8np+UlQQDNQ6hBpvoFSPm0fTBhVT/dA5guQBjs7SUBydth
         +3IKvpvLg/wjYbkIR6rexQtdqizcuPcHZDA3kQDEXFs30wzynVs2kDSu9/qKRurQ3M03
         72Yncp8YmtQJnt67CQ23xVaGYKwA3/S2ha4z3RZoH9lXA5Pf9t8TdjbcS/9n2UL7XVE7
         hDnbDot1+25UMESk3RQ68mxmpoktDbGTVLzuXj4tjMjTsX11WiIeBiymhFgofg2Aw/LY
         MJfprLSyTunx+IWVFqOBAT5drMePt+caneSsNcjxC3FYEw2JnUUn3RIRHfxtoTP+BCak
         KWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXEg5LXhNr6g4o3GCgJPPoDv0cCzaMCnarb4y16JcsY=;
        b=CccOqG2RJi0gLYl3T9ena1smRowXvt4DX+VaYnJ7S8EnIAeMJillMDQkUyZunFvTG9
         vb9BuEtP9G/MAIt38GgveMcoPVpcnMAKeY4xsoXJIqquVJtpKvO0/MQxmzVhaYsMcrtu
         /MCEB3YdncqpP6RQTedrcIb9iJTu6WdY9NBoHl4CJ+df6uubYR6YtHo/HE751D4NySOJ
         5Iydlb5WhiE2PGtXoKTO9LBMRkIrHEE67Nz2sf4DLmBKIrE5td6Md2RqcImnyOD6m/6S
         5vHe7Q8jJDbYJHTO0T+2fux/oeshThmtPj7SIOHI5j+3dmB0IGPiEyu2Y9o2DhS5F5Sb
         m9aQ==
X-Gm-Message-State: ACrzQf2rrcbphiodr9+ZMjkr7hvEBP/5L4P3Yv0+KuxgW0RGBJvjM/hW
        q0is+x69cOzHPX7bWdO82wDzCIwld8jj8fCl4Xg=
X-Google-Smtp-Source: AMsMyM6TEo4hDub8A4ZbQ/NFeTrObyoOtGeqB0ezEVBW6LzWaQsU9/zwd1KSDsuucdd55cJAlAut2BNOLEXJ57PbZ28=
X-Received: by 2002:ae9:e002:0:b0:6eb:adfb:5e03 with SMTP id
 m2-20020ae9e002000000b006ebadfb5e03mr5941174qkk.243.1666195342071; Wed, 19
 Oct 2022 09:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 19 Oct 2022 09:02:10 -0700
Message-ID: <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To:     Nathan Hebert <nhebert@chromium.org>
Cc:     linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
        quic_vgarodia@quicinc.com, Fritz Koenig <frkoenig@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Actually, isn't the .mbn the joined fw?  If so all you need to do is
remove the other files?

On Wed, Oct 19, 2022 at 8:52 AM Rob Clark <robdclark@gmail.com> wrote:
>
> Hmm, does venus not support the combined firmware yet?  Elsewhere
> we've moved away from split fw to using a single ELF file..
>
> BR,
> -R
>
> On Tue, Oct 18, 2022 at 2:18 PM Nathan Hebert <nhebert@chromium.org> wrote:
> >
> > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> >
> >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/nathan-google/linux-firmware.git
> > update_sc7180_and_sc7280_firmwares
> >
> > for you to fetch changes up to 76e160366a28010fa06ddc965659c38a44d159d9:
> >
> >   qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58 -0700)
> >
> > ----------------------------------------------------------------
> > Nathan Hebert (2):
> >       qcom: update venus firmware files for v5.4
> >       qcom: update venus firmware files for VPU-2.0
> >
> >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
> >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
> >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
> >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
> >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
> >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
> >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
> >  14 files changed, 0 insertions(+), 0 deletions(-)

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9AE2ECD9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 11:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbhAGKQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 05:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbhAGKQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 05:16:50 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4857C0612F8
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 02:16:04 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id y21so2091295uag.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nN6dQuyXA1cgqaEtX0AA7VlQcXxY7DKXUbiyQ5ub41M=;
        b=xxwLJ3IPnOXtSUDE2Gdlx0SJdkSqovTBp91M9E5FKZrmUHw7dCEQpFQ98RF8o+WrNH
         knhaOrLGzOD18xACwcCw3gdpBpZPNfYkIONNySlqOmnSvz7fovgFMKGIPGEsQYFQnhaI
         TtXkgMJCLQU51RNodvDwQij/Fvv2ynhYSkqKL1b6JTczfv1/EJfPH2MxEpD5u/JR4jyG
         OxjGKGtcsRuVnyq5PIrLySxYaoOFSVYUd1PlUvQci7rFzjWQcubgc8kH6ei0IZ8h9AWj
         DS5Dckqu4klEKtI1eU/AsegRJViuVjJfseycLxpMvEUTJZtpdUVWzWvRbV5EvtCEI03K
         Yl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nN6dQuyXA1cgqaEtX0AA7VlQcXxY7DKXUbiyQ5ub41M=;
        b=GrTMiva74cAFA4d3Rz0EAFOmvaxSXUl+4BgDgGSytnkB6/JeeR4FapR2esOvr0pB64
         ViSZhe5xnU2D3xxHy/FNSNLs3qC7+V9VhHxnEQoc2HjCAcLOcLHNiVLtT/9zRhpWsOwG
         anz+P6/JFZTxXq4sLn13pVVtMPlRzI7NlHxy+iG/WRWXB4uF+Kv6+p8/7wJHJ+z0BN38
         FdQCawH7c/lil0fThtBJcM4ahesfIu+BEVfn03t021ZdrfbUfeSoAI4k8afi8EcwVnlr
         oQhGNQw92DwfaDJcAMxddhF9wmpDmLTpCpd4NYE8RsGvz6N+epPUT2Z9GBWCcy+jDWJe
         Qvpw==
X-Gm-Message-State: AOAM531n9XCF3ykqr26hZhNKa55tOdWk6Y2Fi9oP6dxcuHp5lTMi96ue
        RmUrJzgmDDoVIZiWicO6p9k24WcG8iScFiTWEFo45A==
X-Google-Smtp-Source: ABdhPJxu0lBxj9SXRgJDA/FBzEbFglx8xUdGm7WcmhHVlZDFqUon4K67vqgtMxOm7nKooSMq+yMOs6LAlI1VBW6Nbt8=
X-Received: by 2002:ab0:78d:: with SMTP id c13mr6731978uaf.129.1610014563793;
 Thu, 07 Jan 2021 02:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20201112194011.103774-1-ebiggers@kernel.org> <X7gQ9Y44iIgkiM64@sol.localdomain>
 <CAPDyKFrXtqqj3RXJ4m666e_danpp2neRD_M+FCaMWPC+Ow2jsA@mail.gmail.com> <X/N+ouEtmMPYT0Qa@sol.localdomain>
In-Reply-To: <X/N+ouEtmMPYT0Qa@sol.localdomain>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 Jan 2021 11:15:26 +0100
Message-ID: <CAPDyKFpjwen156VyR8HTLb579Npr=ocT8RGBcZb-i82bfi1gwQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] eMMC inline encryption support
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, linux-fscrypt@vger.kernel.org,
        Satya Tangirala <satyat@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Neeraj Soni <neersoni@codeaurora.org>,
        Barani Muthukumaran <bmuthuku@codeaurora.org>,
        Peng Zhou <peng.zhou@mediatek.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Konrad Dybcio <konradybcio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 4 Jan 2021 at 21:46, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Nov 25, 2020 at 10:56:42AM +0100, Ulf Hansson wrote:
> > On Fri, 20 Nov 2020 at 19:54, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Thu, Nov 12, 2020 at 11:40:03AM -0800, Eric Biggers wrote:
> > > > Hello,
> > > >
> > > > This patchset adds support for eMMC inline encryption, as specified by
> > > > the upcoming version of the eMMC specification and as already
> > > > implemented and used on many devices.  Building on that, it then adds
> > > > Qualcomm ICE support and wires it up for the Snapdragon 630 SoC.
> > > >
> > > > Inline encryption hardware improves the performance of storage
> > > > encryption and reduces power usage.  See
> > > > Documentation/block/inline-encryption.rst for more information about
> > > > inline encryption and the blk-crypto framework (upstreamed in v5.8)
> > > > which supports it.  Most mobile devices already use UFS or eMMC inline
> > > > encryption hardware; UFS support was already upstreamed in v5.9.
> > > >
> > > > Patches 1-3 add support for the standard eMMC inline encryption.
> > > >
> > > > However, as with UFS, host controller-specific patches are needed on top
> > > > of the standard support.  Therefore, patches 4-8 add Qualcomm ICE
> > > > (Inline Crypto Engine) support and wire it up on the Snapdragon 630 SoC.
> > > >
> > > > To test this I took advantage of the recently upstreamed support for the
> > > > Snapdragon 630 SoC, plus work-in-progress patches from the SoMainline
> > > > project (https://github.com/SoMainline/linux/tree/konrad/v5.10-rc3).  In
> > > > particular, I was able to run the fscrypt xfstests for ext4 and f2fs in
> > > > a Debian chroot.  Among other things, these tests verified that the
> > > > correct ciphertext is written to disk (the same as software encryption).
> > > >
> > > > It will also be possible to add support for Mediatek eMMC inline
> > > > encryption hardware in mtk-sd, and it should be easier than the Qualcomm
> > > > hardware since the Mediatek hardware follows the standard more closely.
> > > > I.e., patches 1-3 should be almost enough for the Mediatek hardware.
> > > > However, I don't have the hardware to do this yet.
> > > >
> > > > This patchset is based on v5.10-rc3, and it can also be retrieved from
> > > > tag "mmc-crypto-v1" of
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> > > >
> > > > Note: the fscrypt inline encryption support is partially broken in
> > > > v5.10-rc3, so for testing a fscrypt fix needs to be applied too:
> > > > https://lkml.kernel.org/r/20201111015224.303073-1-ebiggers@kernel.org
> > > >
> > > > Eric Biggers (8):
> > > >   mmc: add basic support for inline encryption
> > > >   mmc: cqhci: rename cqhci.c to cqhci-core.c
> > > >   mmc: cqhci: add support for inline encryption
> > > >   mmc: cqhci: add cqhci_host_ops::program_key
> > > >   firmware: qcom_scm: update comment for ICE-related functions
> > > >   dt-bindings: mmc: sdhci-msm: add ICE registers and clock
> > > >   arm64: dts: qcom: sdm630: add ICE registers and clocks
> > > >   mmc: sdhci-msm: add Inline Crypto Engine support
> > >
> > > Any comments on this patchset?
> >
> > I have been busy, but just wanted to let you know that I am moving to
> > start reviewing this series shortly.
> >
> > I also need to catch up on the eMMC spec a bit, before I can provide
> > you with comments.
> >
> > Kind regards
> > Uffe
>
> Ulf, are you still planning to review this patchset?  I just sent out v4 of this
> patchset based on v5.11-rc2, but not a lot has changed from previous versions,
> since people have generally seemed happy with it.  Any chance that you will
> apply it for 5.12?  Thanks!

My apologies for the delay. I certainly appreciate the review that's
been done by people and I intend to have a look myself within the
coming week.

I definitely think it should be possible to get this queued for v5.12,
unless I find some very weird things, which I doubt.

Kind regards
Uffe

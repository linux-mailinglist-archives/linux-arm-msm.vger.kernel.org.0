Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAB9457293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 17:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbhKSQR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 11:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbhKSQRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 11:17:55 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FBFC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Nov 2021 08:14:53 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 133so9034076wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Nov 2021 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UcqY3TV76OxNe1xu4n8DKFERXvuTUA0Ucfm9ueomvFM=;
        b=MHhVidxEBzBTALz/eMu3IOohwSk9E6Mdp3oIwEzXnNbjVXnitIiPqqQlBCS2/ZRFsp
         Liwgi2UtlyjggwA7g/Ev4awfC/AYqmE3DcWz+ka3uhEUn62vEr6J0lAdR952KtJz38CY
         OO0EsbPviPQVV0tFtht59BHVHC22ZHBtN8M1/BZYi00SRlB9+49NTjvoR3ogCAJy/NQx
         jzOlUXOon2WqsSTKLRCF7AT93tUIMR7XbUdZGLfqB5alQg7g1sL0qGkBMD2MGaeeME8b
         oPzljj2V1ZJKN02jj2IQwi+/H5PjyaNsxoLaZiMXnVQQtaKAKdD20e+yUd7+3EUw9/Qx
         iKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UcqY3TV76OxNe1xu4n8DKFERXvuTUA0Ucfm9ueomvFM=;
        b=Kdf8JNl5rcemhJuUrvGVNq/8qs74uhfly4rYztLqLpkUNqrXovUQbk2iAdUMaE14LK
         6HY7hMW0j/E4iKN9+UeE9bfMRBSSlQdKMJvnJh8bIt9RrrJpopih+gEnf2nhfinLHyB1
         HGTBt7nzug3gqXdgrkx1R8470pdFYRZUPWTgPXm+l7h5zhzepG9MZZBudDFN8D/BT4YL
         gNh0W7q7pPsi8FCWSiWPIC04vb3CCZhXMGet/K7ZfXxV/Hme9MSCrRu64AgWn02NisZE
         2Mdx4hlpFARvwkdgPTSKzoE5QUtIAdzq/3I0CQsg0A5hZag6Fy5jaNNQ0AusCsifFveq
         gYgQ==
X-Gm-Message-State: AOAM530JfG1Hy+eILE1logQv6IToNeN3t5XhLCzjKKzI4s2XDslmw/Ql
        DVHbLyCNXhajdpbsY59Djj7a55ulnJBlZPeUzfQ=
X-Google-Smtp-Source: ABdhPJztRHw/IXsl/jzRJwmq6CaBP2pBkI2TX2vFR+YvDgcR5py+7U8KVWDGTo1h0iavOJPh4SuhT7zbJbHPCOJGVcQ=
X-Received: by 2002:a05:600c:1d01:: with SMTP id l1mr1036483wms.44.1637338492141;
 Fri, 19 Nov 2021 08:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20211116003042.439107-1-robdclark@gmail.com> <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 19 Nov 2021 08:19:56 -0800
Message-ID: <CAF6AEGsKq7g8ngyVngZpLBeZ+-XavguaCUnNNbptdv0pA3v=XQ@mail.gmail.com>
Subject: Re: [PATCH igt v3 0/4] msm: Add tests for gpu fault handling
To:     Petri Latvala <petri.latvala@intel.com>
Cc:     igt-dev@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 19, 2021 at 3:56 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Mon, Nov 15, 2021 at 04:30:38PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The first patch adds a easy way to write debugfs files (needed to
> > disable hw fault detection, so we can test the sw timeout fallback).
> > The second adds some helpers for cmdstream building.  And the third
> > adds the new tests.
> >
> > v2: Fix headerdoc comments in first patch
> > v3: Add helper to detect debugfs files and updated last patch
> >     to skip the one sub-test that depends on new debugfs when
> >     running on older kernels
> >
> > Rob Clark (4):
> >   lib/igt_debugfs: Add helper for writing debugfs files
> >   lib/igt_debugfs: Add helper for detecting debugfs files
> >   msm: Add helper for cmdstream building and submission
> >   msm: Add recovery tests
>
> For patches 3+4, in case you're waiting for this:
> Acked-by: Petri Latvala <petri.latvala@intel.com>
>
> For the record, msm-specific test case changes don't need to wait for
> review (see single contributor exception in CONTRIBUTING.md).
>

Thanks, I was actually just waiting until I had time to start putting
together msm-next for v5.17, and pull in the patch that added the
debugfs which the recovery tests use (which should hopefully be in
next few days)

BR,
-R

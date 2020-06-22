Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FEA202FA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 08:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731226AbgFVGSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 02:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731219AbgFVGSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 02:18:50 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA7CC061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 23:18:49 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z9so17852911ljh.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 23:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EwHajz3b3OzliZZ0iljg79Qo0FRnx6yIvPIMoMPNCF0=;
        b=L680i4qLfffD6qOBHAVVNs/RTGmimhbH54HePc+aAEEFMZsU+KwUMLtg0o3/KjZxwi
         AsJtSTQQ9TWWeiUXdQ6E95DBB6nBEu9Bw9RHmSduuUFi5efeqeK0TwchSwQmEm1b/LR9
         guCuBfe2PDw3TrUU4GG5GeGv7DXpvHYmlHIldJ2LtIJ7sYX6q2DjQR1wjBtOZiQOZo0Z
         c9Wg8EN9kOlCKoKR3DMaVb8rhfL6NJ6XMN3s8YaoUJrXHuvkQxL1kSCVF2HJjwP4WKbo
         VBXH7bVYaJLr5EKRWY/wyAk5DctM3eO6l3XrzLPT9iajAEGxLTpci91ZvZNz83XG70eE
         IcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EwHajz3b3OzliZZ0iljg79Qo0FRnx6yIvPIMoMPNCF0=;
        b=qmHuZ/xWjdNfaOsIM/Sp4KPpx93ruCVOkT4ZmyyAl6CfzH5+AfXuEjuUHl8P2oQcCz
         QyW54gNhwFdxdUvJPxdOhnqMmGhqcf33JKWQC2KQwGTvyEBA/V6EUa2OScEI3VHEqJxT
         ac2LWMuH986gT6+Jx0hk2lWg0FpkfSFxayN8q0eCY7QJPtO12J8Negkj2xRig2A4eyBg
         frSs/PXd60eXeoWLuJnSH3QhXI78XdjeW9WjFhG3RWpWW6d8fLsTeZXi6E6fpdTeLGZ9
         lW6UuxhP3K7cAUGTc+9Gn3DPilUwRGtuyqbZVxG8/f8e7X0tfqYp8UZsJzVBB7+frbgT
         ya8A==
X-Gm-Message-State: AOAM531Mb2eUWCOJxAahekxYo4MbbvWDusFpaCFu+ISdp3jetM82ZMwk
        ByLk3Qcb1Dym/14CHmkhLqgNbZtY/c/SOhRB9CFzLw==
X-Google-Smtp-Source: ABdhPJzk1dBKVTKlDCM/pQw++y3L1fqg3Nln3xfdv33XwAIbfQ+dtjXOSdb7gqcWA/t3i5e0VbW2AJq+r8s5HIFRXi8=
X-Received: by 2002:a2e:9116:: with SMTP id m22mr7607612ljg.431.1592806727377;
 Sun, 21 Jun 2020 23:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200617065658.27567-1-naresh.kamboju@linaro.org> <20200621074003.GJ128451@builder.lan>
In-Reply-To: <20200621074003.GJ128451@builder.lan>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 22 Jun 2020 11:48:35 +0530
Message-ID: <CA+G9fYvOSRL5WaU1tYTxe4Y16h_kBbNsOibsH6Od5dc1tcmK6Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix kfree build error
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, inux-remoteproc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vinod Koul <vinod.koul@linaro.org>, agross@kernel.org,
        Ohad Ben Cohen <ohad@wizery.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 21 Jun 2020 at 13:12, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 16 Jun 23:56 PDT 2020, Naresh Kamboju wrote:
>
> > This patch adds linux/slab.h to fix build error in qcom_q6v5_mss.c
> >
> > Build error:
> >  ../drivers/remoteproc/qcom_q6v5_mss.c:
> >   In function =E2=80=98q6v5_mpss_init_image=E2=80=99:
> >  ../drivers/remoteproc/qcom_q6v5_mss.c:772:3:
> >   error: implicit declaration of function =E2=80=98kfree=E2=80=99;
> >   did you mean =E2=80=98vfree=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
> >    772 |   kfree(metadata);
> >        |   ^~~~~
> >        |   vfree
> >
> > Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Thanks for the patch Naresh, it looks correct but I've not seen this
> build error myself. Could you please let me know what you built to get
> this and if you have any suggestion on what caused it? (So we can add a
> Fixes: tag etc)

Thanks for the review.
This was an arm64 modules build failure on linux -next 20200616 tag.
This fix has already been taken care of by
Herbert Xu <herbert@gondor.apana.org.au> and got merged.
Fixes: f0187db056dc ("iov_iter: Move unnecessary inclusion of...")

ref:
https://lore.kernel.org/lkml/20200616010502.GA28834@gondor.apana.org.au/

- Naresh

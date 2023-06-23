Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FF273BF25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 22:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjFWUAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 16:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjFWUAb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 16:00:31 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F297271F
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 13:00:30 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-78a1e095508so392779241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687550429; x=1690142429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1M1xaiNrSMz3C3bpTzsCCZISH1fndbXxP2b6AYA7P8=;
        b=25Kx93HWxGNrW7i8PiktSOxdVI0xb3gbLHu/eSh/j7KcjQodThxWFZuBF6WKG7vUNS
         fYGM58rw15YqtrfK2oWLKC89wNDMbmfUK8+JUWu7fId3vSV6WvME2X6LNspLodF8+Gzk
         JeGZfAvppULZbqGu0aJaAxlUxXk+SBbxfbERd5XMyCmMiMWuNJUgw4blEMn28OAKgq5x
         g57zEZlB4IiEhm4455u2ZGEzB8LTZ/xNmtAKaKdOAlIvBBzUBx/DuWC9ZSunGwJEHezU
         6t9WGtZdYGDquTmuZk1GnP1yKTKRpGH0LGW7iszsplwh/aOwdfaW5wDh3OjguCw5FfAN
         +Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687550429; x=1690142429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1M1xaiNrSMz3C3bpTzsCCZISH1fndbXxP2b6AYA7P8=;
        b=DdvDc55azRtXvQSirRKU/VpaWE0JaWFi9HhSHoDUvvLM5PiExQhol40eybEJ+syn71
         Mgu+5cte0Y4IH2DTUFWFM88mbb2zBDivQDBFo5o8h3oDIkpBLa3apIxqNQPxC0LAkrlB
         4rqPlT8Xbvh9IGan8jbjHwqGFfhqL3H0IiVAW9l/K5aSKhQXjThP6feh/K7VB9NojIXM
         QtD4zreolggwix91hYVB2sGcIYMEVc8rM+FPyBE35LsVtBXzjkBZcb0QJignU2QmRHIB
         8P+Mk411c5SkOuLDwXNP2cERz6ulYeCIUw4KZHK1o4w9UIFxZ1idM1lmBy8VtP8TJGwx
         bPcA==
X-Gm-Message-State: AC+VfDxdkQ8Ur75tdZLQJLGKF4oOHFVwSXWXJzc7LluPY2REcWlA1cQj
        S+1hMatq7eoC5sv7lRC9mpG8r0lBrFB2gQejRnmxtw==
X-Google-Smtp-Source: ACHHUZ4dgCpqMi4ZlVuTYZHeFbBd4fFXdHkx89qsxKlJ0GOPlCr0eVv4RzmW7IXVicUlGnXnteN3dR3IFwrJ2sBV24Y=
X-Received: by 2002:a05:6102:2453:b0:440:d2f5:e36d with SMTP id
 g19-20020a056102245300b00440d2f5e36dmr5548679vss.14.1687550429626; Fri, 23
 Jun 2023 13:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230623100845.114085-1-brgl@bgdev.pl> <20230623100845.114085-3-brgl@bgdev.pl>
 <ZJXw+92ee7CGtnCS@corigine.com>
In-Reply-To: <ZJXw+92ee7CGtnCS@corigine.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Jun 2023 22:00:18 +0200
Message-ID: <CAMRc=MeXtK8kNbNo0u7onz3vmKS1eHWdok7vGFRMr41S2Aehvg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/12] net: stmmac: replace the sph_disable
 field with a flag
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Andrew Halaney <ahalaney@redhat.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 23, 2023 at 9:22=E2=80=AFPM Simon Horman <simon.horman@corigine=
.com> wrote:
>
> On Fri, Jun 23, 2023 at 12:08:35PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Drop the boolean field of the plat_stmmacenet_data structure in favor o=
f a
> > simple bitfield flag.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ...
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > index ab9f876b6df7..70e91bbef2a6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > @@ -459,7 +459,7 @@ static int intel_mgbe_common_data(struct pci_dev *p=
dev,
> >       plat->has_gmac4 =3D 1;
> >       plat->force_sf_dma_mode =3D 0;
> >       plat->tso_en =3D 1;
> > -     plat->sph_disable =3D 1;
> > +     data->flags |=3D STMMAC_FLAG_SPH_DISABLE;
>
> Hi Bartosz,
>
> I think something must have got mixed-up here.
> An x86_64 allmodconfig reports that data is undeclared here.
>

Cr*p, I thought I build-tested everything...

My bad, I'll resend a v3 after the merge window.

Bart

> ...
>
> --
> pw-bot: changes-requested
>

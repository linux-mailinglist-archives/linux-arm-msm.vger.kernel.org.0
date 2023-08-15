Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23FB277CC0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 13:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbjHOLwu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 07:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236886AbjHOLwU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 07:52:20 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C480D171F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 04:52:17 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65C9F3F129
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692100336;
        bh=C7DwVUcSx3lMMADwShmbJqderoSd3gR00V23Q/iPW+s=;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=ErF0+kwnXOf+IQIc0dWTI0wMNUOP69PdVRzVE0exWfqF+2v3c+8y0GjzHnD2xsBY8
         DbSCPLIny11p+YdWuECvLfNE8AOELdk5HIeAXbdjkRldDJ/DgAcCq96G9KjP8TnH4m
         IO8rEejrrHtnhpeIrL/oK9GxDdalJ+RNvY8F2BQrsJhY8XxskSej+3O8GiJCM7xTXh
         APfeKYpucPAZdWd+FxaGkHvQEKdu98BDWvyXQisFauQfJh6LoVUjqViP0L/Vsw19Nw
         I6HOCTerCH0gojSCCmEOGFcSWp7P9wrX2dX0opwZL/8+P4079YOGVPsLi8hYr2a7Zh
         aWM8xXQHLRl9A==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30e4943ca7fso2806287f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 04:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692100336; x=1692705136;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7DwVUcSx3lMMADwShmbJqderoSd3gR00V23Q/iPW+s=;
        b=hD/wM7/ANjUpWbbD5Kigw6wlDMncQ9PHAX26WPvl6FvL7kOf0Joo2f6GmrWsRpIsEu
         9Dym+3aRHjF8iW9j7nBbaATniiVFr4ONgdf4DU6WqUSqCHNyYCIdKpf1zWMe6UfU49zh
         H23qhTXKyM9dSkC/IdAo8bRyf42oXfWgL7ovGCioifcBpfdIVW6Pe8Wx8dC8Wse6Ckeg
         pnlHleNaOJG9vuMSafjPvPrKXmdcd9OeV/G/c8CKfBcfi2ptQCQI1AHvdusArr8hrkgF
         Hm1gVPJkD0RGwHwVeZJFax+aqqsYVhouEh0ZpaHmarG2op4T8lYmLaOT01mHnl8C+5FE
         O0ZQ==
X-Gm-Message-State: AOJu0YwT8P6oYToNhA9MyhmNwsDrzO4nHIMcKxJVBCzryPHTvnWHLqOo
        tDE+GhnUpyQjBoWKpEatxues6pX8pgqxBWdN1Si8AgEMEE1rk2IzpuHZOSAKgqzvLnPi0WGCXYA
        Wzxhq6/pqyelmONdRVZaN9A/D7inVk2GqLk4bePm687g=
X-Received: by 2002:adf:e9c9:0:b0:319:8b21:b050 with SMTP id l9-20020adfe9c9000000b003198b21b050mr388507wrn.61.1692100336174;
        Tue, 15 Aug 2023 04:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbVNNrLF0rpeAxAN4xCQRWR3gy4KLXXalr3mFCIQPw+9VnlGKRxgZ6SkAXXFQkvb6dfVbzHA==
X-Received: by 2002:adf:e9c9:0:b0:319:8b21:b050 with SMTP id l9-20020adfe9c9000000b003198b21b050mr388493wrn.61.1692100335875;
        Tue, 15 Aug 2023 04:52:15 -0700 (PDT)
Received: from gollum ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id g5-20020adfe405000000b0031773a8e5c4sm17709446wrm.37.2023.08.15.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 04:52:15 -0700 (PDT)
Date:   Tue, 15 Aug 2023 13:52:14 +0200
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        joel@joelfernandes.org, johan+linaro@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
        quic_akhilpo@quicinc.com, ribalda@chromium.org,
        robdclark@gmail.com, sean@poorly.run
Subject: Re: [PATCH v2] drm/msm/adreno: Add missing MODULE_FIRMWARE macros
Message-ID: <20230815135214.15aeff63@gollum>
In-Reply-To: <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
        <20230620054031.1203960-1-juerg.haefliger@canonical.com>
        <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vv7PBfafaUhFIXtl8vRRuy7";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/Vv7PBfafaUhFIXtl8vRRuy7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jun 2023 21:44:25 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On 20/06/2023 08:40, Juerg Haefliger wrote:
> > The driver references some firmware files that don't have corresponding
> > MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> >=20
> > ---
> > v2:
> >    - Drop addition and removal of zap files (needs more discussion)
> >    - Add new a690_gmu.bin
> >    - Update commit subject and message accordingly
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+) =20
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20

It looks like this didn't go anywhere. Is there something missing?

...Juerg

--Sig_/Vv7PBfafaUhFIXtl8vRRuy7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmTbZu4ACgkQD9OLCQum
QrcZ2xAAg4LyZtCle1bB0fPoNTnHgzF+qA1aRvXE7v67vPpOMn3Q2uY4LpSs3YKJ
Fumq39oRZ0KkNtNuKaUxF9xIkbZOXIYfERvok7LMSp2SQJfa+mEI4j0kT1Lc8ER7
kKeRLZV2ASC+KA1EcxBINfyNi6wm/MxWWwQj98IzLHJxMu6+lTFoXsko4A7+TWOl
7Y0lqb/keVeYYHzMcTehoC9pF1HrIXdAMhP2OrczTkynWHU5eolQHWncCix83d1V
vz1ovozrGRCsvi6XHc8WSdWhhmp4JfbZXwTCEvG3riyAnUu5IbgQa5FGkiYXLrq8
QUgOXLsMsa7rA0WW5RoUp+wLhOIrwXZFZp7+1IbNAA4U53GMzpTSMTvnA6TBDrPC
VgC0KAqxoC3HzYL/1k1kaYybAw3HXBjaE0K2IiGHyY8YM4MDZoWBUxRiR0lAcKlB
XCpt6KbiFMvz4NYtw2EVeSeOUFPld3g+aIqHk578fnEse+gCegxyCc9X4auIGPND
lVNvPGZcIRcJypw9kkWZOJ1Uhhpm2y8/xUkhVMECQV3uyzLr02dFnA6Cuw/0+KOZ
Yrr7F37Lk8RkKqqQbBSWOYh49Y63ZDLOa+gts3+TzpiJS8YuXyXCSRQwJDN1r1fu
oAqaxGqhfpYZp4xZ/SMN70VepPX7rZCbc5f7BOFSxaXleJNcmGY=
=A5x/
-----END PGP SIGNATURE-----

--Sig_/Vv7PBfafaUhFIXtl8vRRuy7--

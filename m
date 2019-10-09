Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAB1D0561
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 03:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfJIB6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 21:58:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36223 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfJIB6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 21:58:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so553304pfr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 18:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=N4NGesu7+LudHzth0OydBmbsxdfqhnx8W8LYisp+NrQ=;
        b=e584x4yHx18hiFqvlc698JaAJA95f63sgzOILU9VL7hd8XxZsETHI1Hgg5kMcFNlTB
         rX3XXUZmzjiIM+R+nW4VPyPXUaqLD53pZRQvV8pQry6JiifTX4fXgC7qCaveTDEf7TYP
         22RWf715Z5yz7lH5RjQMmCBm2c9aua5ju4IVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=N4NGesu7+LudHzth0OydBmbsxdfqhnx8W8LYisp+NrQ=;
        b=JCcm6rR+kinGaNWCqBzGvdMKPTiQI48NaVK04IJnK0VeoL97sXPbdC0hwEIXmrud6b
         rXl8UN5fX4Ji2X/FB/cb0oMFen5yD0EOGIVZQQ5VL6HoqtCwhsPcZeqmtxoWqjrBhahC
         fMqBi28m82FscQ9NuZ8uaL4M3ra7zpZGTEBbSu8Z+GgUXqw7SxyQxgkflOOqeELmfMxd
         jj1k1wqXbWwpjPP6EpKBFOMBDEBkb9v+90oRGkdTiKZzzcx+CprEytcwyD+L8W9FQvvx
         4qjfxtfXq2s1pYYGujgAnlBOkJtNZ18FERrlEuZ3ry/Q4y6/CDeZ1CCWePoqaGqnToev
         4Ltg==
X-Gm-Message-State: APjAAAWSXDTF4rzVUs4fRItFmV25hYliqpM0FYxsQsTDkjBzmLFkPDrn
        ZZYmZACYN6/uKocydRsc7wakmA==
X-Google-Smtp-Source: APXvYqwQUXs/txuT157faSRndetKLyxoEajKjIqDLEVK13dzHpkQoILsZ9lcR3OuVfBhpTOSfejTsA==
X-Received: by 2002:a63:5d1e:: with SMTP id r30mr1732669pgb.68.1570586325138;
        Tue, 08 Oct 2019 18:58:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z12sm366340pfj.41.2019.10.08.18.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 18:58:44 -0700 (PDT)
Message-ID: <5d9d3ed4.1c69fb81.5a936.2b18@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191008235504.GN63675@minitux>
References: <20191008234505.222991-1-swboyd@chromium.org> <20191008235504.GN63675@minitux>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v2 0/2] Avoid regmap debugfs collisions in qcom llcc driver
User-Agent: alot/0.8.1
Date:   Tue, 08 Oct 2019 18:58:43 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-10-08 16:55:04)
> On Tue 08 Oct 16:45 PDT 2019, Stephen Boyd wrote:
> >     @@ drivers/soc/qcom/llcc-slice.c
> >      =20
> >       static struct llcc_drv_data *drv_data =3D (void *) -EPROBE_DEFER;
> >      =20
> >     --static const struct regmap_config llcc_regmap_config =3D {
> >     +-static struct regmap_config llcc_regmap_config =3D {
> >      -        .reg_bits =3D 32,
> >      -        .reg_stride =3D 4,
> >      -        .val_bits =3D 32,
> >     @@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_i=
nit_mmio(struct
> >       {
> >               struct resource *res;
> >               void __iomem *base;
> >     -+        static struct regmap_config llcc_regmap_config =3D {
> >     ++        struct regmap_config llcc_regmap_config =3D {
>=20
> Now that this isn't static I like the end result better. Not sure about
> the need for splitting it in two patches, but if Evan is happy I'll take
> it.
>=20

Well I split it into bug fix and micro-optimization so backport choices
can be made. But yeah, I hope Evan is happy enough to provide a
reviewed-by tag!


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F577D8B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 10:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388823AbfJPIfc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 04:35:32 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37827 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389008AbfJPIfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 04:35:32 -0400
Received: by mail-qk1-f193.google.com with SMTP id u184so21995229qkd.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GmuC3zn8bALphH5r2b0Q1YLWOrBX5XjvTZ9/8xPZZN4=;
        b=ezJ2leywNfinL5V540/jApDr2GEu4Od6OcnKeW75/FAlBxgP8+aMmrW3ENWC8EVwIK
         bbUw8QHOWvqgI2Rn//zRyqpUTL/bgIoOrv05RXTa9DixIYgal1j03iYpAo+OCXxHXxtH
         B8duz5djvIIx5kmVYxdveo8+w2jLJwZDXppqJReOWwEh8AeAClRF/5D52vfw2aGa3z0Y
         vtbc65QrHG7hThQJpg36B1viWx0nFYWkAjoJuEQQ6gaP2+c5X7XDi1pgQdA82zDpOsVv
         hgd4qZSz+RrWQucvq75ZkaN4bgVA8dU6IoKzIX419wej4sUDk/qe07R8NcEFU5ms2+tr
         /bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GmuC3zn8bALphH5r2b0Q1YLWOrBX5XjvTZ9/8xPZZN4=;
        b=JWbbx+DoYwxS/T4JG2gAJ9IW2/ovgjcS6cfPvbWVMfYPNmTt4ltb436SmjyJnA/EbK
         2Wl8zAjvygA97Pqh3/BdMebbgM47SRa2ETlr0FqdrKuRt/WE2sKidxTjg8tq4bgVTVB5
         YRZfexPBBCy9v8wZAj7LJThmdwUH5gy6EQ+L9SdzOVx5IvllUL/uk7grWmzFVYsWclIx
         lbAbMsDhLsF6grUEffLGLsnvad2ATzWK+LKhH9r4pZzQBqfaI69CgCAJno665o8/Wn37
         E8QNuQ816FH/bPFSAYGUYePzaUUtMtx2+GqEEpguii1lMvT2mLWp53WA76pUGQSpf+Ce
         /fvA==
X-Gm-Message-State: APjAAAVNyUy0kAEaw9itUECNDtej0DZJ9g80UZi0eLq0Y3nz2HHmhybi
        3NkfDsUq5iZNedqdditXMZ96p6grlgc8zGTxuOydQg==
X-Google-Smtp-Source: APXvYqzGRMvNTAJKYa1IF/vPfb2c7W0O+r3HJGpQGbPndIgkhES6jDxA2LF0IZi6nk9B8YFGFFqvF/SXFonIwxR9VZo=
X-Received: by 2002:a37:8806:: with SMTP id k6mr39103180qkd.127.1571214930602;
 Wed, 16 Oct 2019 01:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571210269.git.amit.kucheria@linaro.org> <6e6c6da8-0948-581c-a4a3-7a2617ac5dd0@linaro.org>
In-Reply-To: <6e6c6da8-0948-581c-a4a3-7a2617ac5dd0@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 16 Oct 2019 14:05:19 +0530
Message-ID: <CAP245DXOoRoCogZzgG7ss-bVSmE-FfeP3fxV3Vrya+_c1ew7dA@mail.gmail.com>
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 16, 2019 at 1:29 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 16/10/2019 09:33, Amit Kucheria wrote:
> > Hi Thermal and MSM maintainers,
> >
> > I believe this series is now ready to be merged. The DT bindings and dr=
iver
> > changes should go through the thermal tree and the changes to the DT fi=
les
> > themselves should go through the MSM tree. There is no hard ordering
> > dependency because we're adding a new property to the driver. It would =
help
> > to soak in linux-next for a few weeks to catch anything on kernelci.org=
.
>
> So the ones going to thermal are:
>
> 1-7, 14, 15 right ?

1-4, 7, 14, 15 =3D> thermal tree
5, 6, 8-13 =3D> msm tree

I guess I could have ordered it better for merging :-/

> > Changes since v4:
> > - Change to of-thermal core[1] to force interrupts w/o changing polling=
-delay DT
> >   parameter
> > - Corresponding changes to DT files to remove the hunks setting the val=
ues
> >   to 0
> > - Collected reviews and acks
> >
> > Changes since v3:
> > - Fix up the YAML definitions based on Rob's review
> >
> > Changes since v2:
> > - Addressed Stephen's review comment
> > - Moved the dt-bindings to yaml (This throws up some new warnings in va=
rious QCOM
> > devicetrees. I'll send out a separate series to fix them up)
> > - Collected reviews and acks
> > - Added the dt-bindings to MAINTAINERS
> >
> > Changes since v1:
> > - Collected reviews and acks
> > - Addressed Stephen's review comments (hopefully I got them all).
> > - Completely removed critical interrupt infrastructure from this series=
.
> >   Will post that separately.
> > - Fixed a bug in sign-extension of temperature.
> > - Fixed DT bindings to use the name of the interrupt e.g. "uplow" and u=
se
> >   platform_get_irq_byname().
> >
> > Add interrupt support to TSENS. The first 6 patches are general fixes a=
nd
> > cleanups to the driver before interrupt support is introduced.
> >
> > [1] https://lore.kernel.org/linux-arm-msm/1b53ef537203e629328285b4597a0=
9e4a586d688.1571181041.git.amit.kucheria@linaro.org/
> >
> > Amit Kucheria (15):
> >   drivers: thermal: tsens: Get rid of id field in tsens_sensor
> >   drivers: thermal: tsens: Simplify code flow in tsens_probe
> >   drivers: thermal: tsens: Add __func__ identifier to debug statements
> >   drivers: thermal: tsens: Add debugfs support
> >   arm: dts: msm8974: thermal: Add thermal zones for each sensor
> >   arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> >   dt-bindings: thermal: tsens: Convert over to a yaml schema
> >   arm64: dts: sdm845: thermal: Add interrupt support
> >   arm64: dts: msm8996: thermal: Add interrupt support
> >   arm64: dts: msm8998: thermal: Add interrupt support
> >   arm64: dts: qcs404: thermal: Add interrupt support
> >   arm: dts: msm8974: thermal: Add interrupt support
> >   arm64: dts: msm8916: thermal: Add interrupt support
> >   drivers: thermal: tsens: Create function to return sign-extended
> >     temperature
> >   drivers: thermal: tsens: Add interrupt support
> >
> >  .../bindings/thermal/qcom-tsens.txt           |  55 --
> >  .../bindings/thermal/qcom-tsens.yaml          | 168 ++++++
> >  MAINTAINERS                                   |   1 +
> >  arch/arm/boot/dts/qcom-msm8974.dtsi           |  92 +++
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   6 +-
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi         |   6 +-
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi          |   2 +
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi          |   4 +
> >  drivers/thermal/qcom/tsens-8960.c             |   4 +-
> >  drivers/thermal/qcom/tsens-common.c           | 529 ++++++++++++++++--
> >  drivers/thermal/qcom/tsens-v0_1.c             |  11 +
> >  drivers/thermal/qcom/tsens-v1.c               |  29 +
> >  drivers/thermal/qcom/tsens-v2.c               |  13 +
> >  drivers/thermal/qcom/tsens.c                  |  58 +-
> >  drivers/thermal/qcom/tsens.h                  | 286 ++++++++--
> >  16 files changed, 1102 insertions(+), 166 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsen=
s.txt
> >  create mode 100644 Documentation/devicetree/bindings/thermal/qcom-tsen=
s.yaml
> >
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>

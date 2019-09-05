Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23613AA5BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 16:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388050AbfIEO0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 10:26:51 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46654 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729053AbfIEO0v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 10:26:51 -0400
Received: by mail-io1-f66.google.com with SMTP id x4so5207494iog.13;
        Thu, 05 Sep 2019 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q+357KwvNyY+wJyemee0wqrc8e6AXwO2zGyzu6liuT8=;
        b=ZXx8UvfzqCNfutH7x8/UBhR2N6yi7+q+BF5eMZ7i4fCdz+eFMVy8WHsWZd7lqNobgf
         XTIycr3EdIGl9yBCPLJ0LwDWslY0X+If2OQsEtJoaiMvj2X+6YZu+MTSJ0V1FaBfyPpj
         WRXMzgSyz7wEy+lmnIQ8rqI0iUA83IIuWcbiH4vS8UswSEoC193CIRh1MSAC6M8AtfLA
         g8vcBRgcJo3bYwOVzQUVdrS4XbFNSVR9Xsx9c+rY9vWTqckksvpXfY0weCozatthiA8W
         czq3Y2w0xn116mC7d6f3oanKz9IFytA57NarXn1B3DD7sZYnj+SNslOmW4KUI4KbKh7F
         cVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q+357KwvNyY+wJyemee0wqrc8e6AXwO2zGyzu6liuT8=;
        b=sxT24Ctf+O3+VqIHdJLwTIE+0AO02cxzNX1/BmNJh03kq9DlffDZCuySg1YZaJ9g2U
         Ejy6XYPdMSXpI5jJlKjP5x74eYcOHUmAeXO0UT7Nzri/e/Hpz4M3yMynVdAtejCxBuO/
         QqIrtWEtktQT2ujTqIMFrQj0i0XL0BnA7JuLrshWiWZ8aXEsdvUOYM1rf8+KnkYV55oJ
         SW8v+NZ74EsQGwHNY3Wp1MF0Jh5G2369mrnp09tjcW5X8InlWQK1+YX79bD8J1dN8sIe
         c74FnguwCEFzK8ERARkuAcowEm5vVYii8lzvs9LU9kmj6vzWfYvVR5yTSzGM9I+cKyCP
         Bs6A==
X-Gm-Message-State: APjAAAXK7Fhojg9QarscsV7BFWIzl7nx9eyWTOYS1sMqwIMb5hgMuOQ5
        XDJounVTxV3EaCpzGSmtvw1mevODvGu6wv//IAc=
X-Google-Smtp-Source: APXvYqy4Vhcn6NpXRW6OYhDvJUR0iWbZKP2tTqahRcLHyyWlL2k9Yc37MptJ06YkHBxEtkO4k2uf396d5KZGjx1lJ58=
X-Received: by 2002:a05:6638:8e:: with SMTP id v14mr4293784jao.72.1567693610586;
 Thu, 05 Sep 2019 07:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190904211551.10381-1-kw@linux.com>
In-Reply-To: <20190904211551.10381-1-kw@linux.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 5 Sep 2019 08:26:39 -0600
Message-ID: <CAOCk7Npab7Ffi1fKQ8p9s6_XbrGJaG6tTa7W2dXNqn+rrP2Onw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Move static keyword to the front of declarations
To:     Krzysztof Wilczynski <kw@linux.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 4, 2019 at 3:15 PM Krzysztof Wilczynski <kw@linux.com> wrote:
>
> Move the static keyword to the front of declarations
> of msm_dsi_v2_host_ops, msm_dsi_6g_host_ops and
> msm_dsi_6g_v2_host_ops, and resolve the following
> compiler warnings that can be seen when building
> with warnings enabled (W=3D1):
>
> drivers/gpu/drm/msm/dsi/dsi_cfg.c:150:1: warning:
>   =E2=80=98static=E2=80=99 is not at beginning of declaration [-Wold-styl=
e-declaration]
>
> drivers/gpu/drm/msm/dsi/dsi_cfg.c:161:1: warning:
>   =E2=80=98static=E2=80=99 is not at beginning of declaration [-Wold-styl=
e-declaration]
>
> drivers/gpu/drm/msm/dsi/dsi_cfg.c:172:1: warning:
>   =E2=80=98static=E2=80=99 is not at beginning of declaration [-Wold-styl=
e-declaration]
>
> Signed-off-by: Krzysztof Wilczynski <kw@linux.com>

Seems fine to me.

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

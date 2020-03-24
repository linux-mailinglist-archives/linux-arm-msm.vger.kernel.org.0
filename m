Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F091914F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 16:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgCXPjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 11:39:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33844 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbgCXPjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 11:39:06 -0400
Received: by mail-ot1-f67.google.com with SMTP id j16so17450098otl.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gdNgUyovH3fFL036Rwp6qFNO07syiek5Tdf11PTq7yM=;
        b=ONu4l2SCV9dgZFVg2UfYC52IuLbDCEb5mUeYEhKuzsvwFmPCM5N8SJEEk4UafeWoac
         DoP3VVqPJ1Dk2LAERFmDMuVGBO0TY89uQuoBp7MFHclOAMl3bheWXApCowCeUXM/iSYl
         Nki8KGmmkSaOqM2fHh6N8WGQtlddbJhB3NDhpJ++w3NiESRoLgfLeVfr2rbE+cELcGxq
         o2DKUdhGkONXExSAuo9kb0sL0NAcnUZsgjhHgPJPpfzcsj07J5frb6YO7TEkmwK/jufN
         epMmVkXkVFOiJMmQSqJtLz6OILDjXl85QLHgLlYPCaP8HtfqS6wc3U9QgUQs5Zr3ATYI
         g9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gdNgUyovH3fFL036Rwp6qFNO07syiek5Tdf11PTq7yM=;
        b=CmMb895qaNkVfTGXuCvAaeImKT+MTAJIW7fp7zXS3BN7/tMMRmTHwnSKXFFTtEtKKQ
         HmBN8tdudDMazIWUUgkxRr2tt89zEvnNd4jEnRa6BinALbNDN4tyoARqSz/AMzT8cv/K
         i1Sn/eP362bejH0DNSByUwjWQ57tCY8oeCmbC3k1LzMrWiloKcyqZZfCBHZcX4N6Zkm7
         XaOTnOVV7N8HMwgCWQcAUxt6fo+EqUI1vc+DVpOYvnskBg3sb1DJVWWd/bFh1/OtgZ5K
         6t31iVe37Kq892pe7j7+c7wXF2swzp+3FMNDYoFySgnPz81neeyr+MpNU+gzfyOYb4zR
         pbHA==
X-Gm-Message-State: ANhLgQ1DjDzWNZPlg0bwRW6E4HfcC8YAOng0Jq2etgfLiRnXlfQfWmS6
        iEiunymOUztDZUUsmZFe0kBFSxMYW16A5n8TX+7vzQ==
X-Google-Smtp-Source: ADFU+vtLsKQwanUzdtbf2Q0mesZdWrEI+84/TzmxAH6yGULo2vc9lF+1ZHeUnyQ0lDvVCPKemKF+dhoLeJTrSBfVjBc=
X-Received: by 2002:a4a:e48a:: with SMTP id s10mr2128023oov.10.1585064345759;
 Tue, 24 Mar 2020 08:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200317135740.19412-1-robert.foss@linaro.org>
 <20200317135740.19412-7-robert.foss@linaro.org> <2523204.mvXUDI8C0e@g550jk>
In-Reply-To: <2523204.mvXUDI8C0e@g550jk>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 24 Mar 2020 16:38:54 +0100
Message-ID: <CAG3jFyuiVFHfNVwCAEynH0j8fK91k32m+nvZYYR79gju9cwPKQ@mail.gmail.com>
Subject: Re: [v2 6/6] arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, olof@lixom.net,
        maxime@cerno.tech, Anson.Huang@nxp.com, dinguyen@kernel.org,
        leonard.crestez@nxp.com,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Luca,

On Fri, 20 Mar 2020 at 20:52, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Hi Robert,
>
> On Dienstag, 17. M=C3=A4rz 2020 14:57:40 CET Robert Foss wrote:
> > Build camera clock, isp and controller drivers as modules.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index 4db223dbc549..7cb6989249ab 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -376,6 +376,7 @@ CONFIG_I2C_MESON=3Dy
> >  CONFIG_I2C_MV64XXX=3Dy
> >  CONFIG_I2C_OWL=3Dy
> >  CONFIG_I2C_PXA=3Dy
> > +CONFIG_I2C_QCOM_CCI=3Dm
> >  CONFIG_I2C_QCOM_GENI=3Dm
> >  CONFIG_I2C_QUP=3Dy
> >  CONFIG_I2C_RK3X=3Dy
> > @@ -530,6 +531,7 @@ CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
> >  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
> >  CONFIG_VIDEO_RENESAS_FCP=3Dm
> >  CONFIG_VIDEO_RENESAS_VSP1=3Dm
> > +CONFIG_VIDEO_QCOM_CAMSS=3Dm
> >  CONFIG_DRM=3Dm
> >  CONFIG_DRM_I2C_NXP_TDA998X=3Dm
> >  CONFIG_DRM_NOUVEAU=3Dm
> > @@ -732,6 +734,7 @@ CONFIG_MSM_GCC_8994=3Dy
> >  CONFIG_MSM_MMCC_8996=3Dy
> >  CONFIG_MSM_GCC_8998=3Dy
> >  CONFIG_QCS_GCC_404=3Dy
> > +CONFIG_SDM_CAMCC_845=3Dm
>
> You seem to have this option twice in this patch.

Thanks for catching this.
I'll send out a fix in v3.

>
> >  CONFIG_SDM_GCC_845=3Dy
> >  CONFIG_SM_GCC_8150=3Dy
> >  CONFIG_QCOM_HFPLL=3Dy
> > @@ -762,6 +765,7 @@ CONFIG_QCOM_COMMAND_DB=3Dy
> >  CONFIG_QCOM_GENI_SE=3Dy
> >  CONFIG_QCOM_GLINK_SSR=3Dm
> >  CONFIG_QCOM_RMTFS_MEM=3Dm
> > +CONFIG_SDM_CAMCC_845=3Dm
>
> ^
>
> >  CONFIG_QCOM_RPMH=3Dy
> >  CONFIG_QCOM_RPMHPD=3Dy
> >  CONFIG_QCOM_SMEM=3Dy
>
> Regards
> Luca
>
>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB0266B59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 13:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfGLLGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 07:06:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56824 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfGLLGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 07:06:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 775C960DB3; Fri, 12 Jul 2019 11:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562929609;
        bh=S4zkmrBpLqtuRgINSb+a9jUCuBn2h2LPZL0xctcj5AM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i2Eyeg9NdS60UfmZUzdTmiu/YZS4TryOSzeTmA3rpeJ/W75l2FlWb8ZAGKbcumbs0
         ChEy2ZtnuHAwiA2nZmxs8UCuh356LHxHip97XAzk/Zeo7ainvp57D8KWaf9ySRpjiu
         BVbSbZCFlkuej87wqlg2AdU0apQsnM9wtHNItXpI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3ED0A60E5A;
        Fri, 12 Jul 2019 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562929608;
        bh=S4zkmrBpLqtuRgINSb+a9jUCuBn2h2LPZL0xctcj5AM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZGZsHKsqRz7qV8g1WuzoZdgGkCbsfekpv8/qI25FlbK7eaHpyD1UeKrGgRrrRhwmb
         k5SI7+q6l01fsAqNTTx8TOq8foruaNVT5z1dTrKB8T/Jkmonm6NOwr9k62NcK526Gz
         hgaj50tlYnQDVV1eNLEKwXhHVklyqE2mblvDZvkc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3ED0A60E5A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f43.google.com with SMTP id p15so8833155eds.8;
        Fri, 12 Jul 2019 04:06:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWYxTy8uJGHjxg+wYloKWz1IYLgDnT1zuXj11CqY5rBEXI/q2NY
        Q4KXX0j+Sy6usI+V5vwtVVUJf+diiYzjj0S3XJQ=
X-Google-Smtp-Source: APXvYqx1fX4ty2VHwMHUACUBDGxE6ZzPktMXFevDrLghjjiQtfrnhIUO8kThQTTcYEUkCDon2Jm9Vbp5bza5mGYPfE0=
X-Received: by 2002:a50:eb0b:: with SMTP id y11mr8610424edp.224.1562929607000;
 Fri, 12 Jul 2019 04:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190711110340.16672-1-vivek.gautam@codeaurora.org> <20190711153816.GQ7234@tuxbook-pro>
In-Reply-To: <20190711153816.GQ7234@tuxbook-pro>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Fri, 12 Jul 2019 16:36:35 +0530
X-Gmail-Original-Message-ID: <CAFp+6iHrJ74BMMcpiKG=wMZvBDe=LcAAPjTsZ9Co+HrqMFsPTQ@mail.gmail.com>
Message-ID: <CAFp+6iHrJ74BMMcpiKG=wMZvBDe=LcAAPjTsZ9Co+HrqMFsPTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: llcc: Rename llcc-sdm845 to llcc-plat
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        rishabhb@codeaurora.org, vnkgutta@codeaurora.org,
        Evan Green <evgreen@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 11, 2019 at 9:19 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 11 Jul 04:03 PDT 2019, Vivek Gautam wrote:
>
> > To avoid adding files for each future supported SoCs rename
> > the file to a generic name - llcc-plat, so that llcc configuration
> > tables for other SoCs can be added in the same driver.
> >
>
> We've had a generic LLCC Kconfig option and then a specific SDM845 one,
> with this change we have two different generic options and both would
> either always be enabled or disabled.
>
> So I think you should drop QCOM_SDM845_LLCC and build both llcc-slice
> and llcc-plat into the same qcom_llcc.ko instead.

Yea. I can chuck off the llcc-slice module. But for readability would
it still be
better to maintain separate files. I will drop the SDM845 config, and keep only
QCOM_LLC.

Best regards
Vivek

>
> Regards,
> Bjorn
>
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > ---
> >  drivers/soc/qcom/Kconfig                        | 10 +++++-----
> >  drivers/soc/qcom/Makefile                       |  2 +-
> >  drivers/soc/qcom/{llcc-sdm845.c => llcc-plat.c} |  0
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >  rename drivers/soc/qcom/{llcc-sdm845.c => llcc-plat.c} (100%)
> >
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index a6d1bfb17279..8110d415b18e 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -62,13 +62,13 @@ config QCOM_LLCC
> >         to clients that use the LLCC. Say yes here to enable LLCC slice
> >         driver.
> >
> > -config QCOM_SDM845_LLCC
> > -     tristate "Qualcomm Technologies, Inc. SDM845 LLCC driver"
> > +config QCOM_PLAT_LLCC
> > +     tristate "Qualcomm Technologies, Inc. platform LLCC driver"
> >       depends on QCOM_LLCC
> >       help
> > -       Say yes here to enable the LLCC driver for SDM845. This provides
> > -       data required to configure LLCC so that clients can start using the
> > -       LLCC slices.
> > +       Say yes here to enable the LLCC driver for Qcom platforms, such as
> > +       SDM845. This provides data required to configure LLCC so that
> > +       clients can start using the LLCC slices.
> >
> >  config QCOM_MDT_LOADER
> >       tristate
> > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > index eeb088beb15f..3bf26667d7ee 100644
> > --- a/drivers/soc/qcom/Makefile
> > +++ b/drivers/soc/qcom/Makefile
> > @@ -21,6 +21,6 @@ obj-$(CONFIG_QCOM_SMSM)     += smsm.o
> >  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
> >  obj-$(CONFIG_QCOM_APR) += apr.o
> >  obj-$(CONFIG_QCOM_LLCC) += llcc-slice.o
> > -obj-$(CONFIG_QCOM_SDM845_LLCC) += llcc-sdm845.o
> > +obj-$(CONFIG_QCOM_PLAT_LLCC) += llcc-plat.o
> >  obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
> >  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
> > diff --git a/drivers/soc/qcom/llcc-sdm845.c b/drivers/soc/qcom/llcc-plat.c
> > similarity index 100%
> > rename from drivers/soc/qcom/llcc-sdm845.c
> > rename to drivers/soc/qcom/llcc-plat.c
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> >



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8625B1238E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 22:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEBUnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 16:43:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:54394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfEBUnr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 16:43:47 -0400
Received: from localhost (unknown [104.132.0.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE2D52081C;
        Thu,  2 May 2019 20:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556829826;
        bh=L/uUYW5vLxR98baFOMyoQD9iYylHnteOXlwFU+2+IYw=;
        h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
        b=EaeKe+n3NxQDSiV89AeuqufG4jIjiCfu2O9QzaOu08OmrJGDhDL4p9U/en2USFQw1
         9EoQ+IAFqr3cLt4zeKvCvHaO5qYuGkO2ns5vMjpwHdZv+C+6nuMU4GLATQMYOvjgtn
         2XLALOgOwuLXffpoMVSxbRHmbS9p4ANCa4lXWEcw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502112024.GA18333@centauri>
References: <20190502002138.10646-1-bjorn.andersson@linaro.org> <ecc6a7fb-14a8-3314-d376-433c9f98b692@free.fr> <20190502112024.GA18333@centauri>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: gcc-qcs404: Add PCIe resets
Message-ID: <155682982590.200842.4482547017911714715@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 02 May 2019 13:43:45 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2019-05-02 04:20:24)
> On Thu, May 02, 2019 at 12:53:33PM +0200, Marc Gonzalez wrote:
> > On 02/05/2019 02:21, Bjorn Andersson wrote:
> >=20
> > > diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt=
-bindings/clock/qcom,gcc-qcs404.h
> > > index 454b3f43f538..5959399fed2e 100644
> > > --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > > +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > > @@ -166,5 +166,12 @@
> > >  #define GCC_PCIEPHY_0_PHY_BCR                              12
> > >  #define GCC_EMAC_BCR                                       13
> > >  #define GCC_CDSP_RESTART                           14
> > > +#define GCC_PCIE_0_AXI_MASTER_STICKY_ARES          14
> >=20
> > Seems weird that there would be two names for the same entry at index 1=
4?
>=20
> Changes since v2:
> - Rebased patch
>=20
> The proper tag in the subject should have been [PATCH v2].
>=20
> This is most likely an issue caused by the rebase.
>=20

Please resend then.


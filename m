Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007B3413AEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 21:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhIUTrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 15:47:23 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:19968 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbhIUTrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 15:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632253549;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=dCirvFcy4YDwlUftw9ZMx+DsgpN7YelrcBP8Cpil+Rc=;
    b=qPdDnIzF9j+cfLDyvgBvzK2A7Zs3cr6WMaAq0lRnW2WkP88sJeKKQqMM9dOSpyi+s5
    jZUVXEMgyr/Wn7fEZofdHljyIh38DiiaZ3BvAGgRPHJ5jmKaN4uq2AquXGktc1QngSGo
    0lpVSrFkQNx14Cegs8ItPvoKCyufhwHWuQlT+DveHa0hAbwdkbeqYi7sAyIEA4cUCVpb
    lWkfi1wrbo2kSXVUHSv/HUJW6KdniqULnSRNk6nVRvlL3DFMRjxKLFPk7RlWXSAGVtrJ
    m94p3iKdQfpOEPyABSPYjEb2kNXjNyxNGWTe4Lhd+xr81TXlZEi0d1E2e2wHvbtD/IGG
    L2sg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pWA9pbh"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8LJjmC4x
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 21:45:48 +0200 (CEST)
Date:   Tue, 21 Sep 2021 21:45:43 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8916: Drop underscore in node
 name
Message-ID: <YUo2ZzQktf2iSec/@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net>
 <20210921152120.6710-2-stephan@gerhold.net>
 <CAE-0n51Ukr0FMhzHotrGnrJjE3=w2X_u4ukc1KC_HpjjsUdNfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51Ukr0FMhzHotrGnrJjE3=w2X_u4ukc1KC_HpjjsUdNfg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 11:20:18AM -0700, Stephen Boyd wrote:
> Quoting Stephan Gerhold (2021-09-21 08:21:19)
> > Using underscores in device tree nodes is not very common.
> > Additionally, the _region suffix in "smem_region@..." is not really
> > useful since it's obvious that it describes a reserved memory region.
> >
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 5551dba2d5fd..95dea20cde75 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -41,7 +41,7 @@ tz-apps@86000000 {
> >                         no-map;
> >                 };
> >
> > -               smem_mem: smem_region@86300000 {
> > +               smem_mem: smem@86300000 {
> 
> Shouldn't that be smem_mem: memory@86300000? Node names should be
> generic.
> 

The way I read it, the DT schema [1] and device tree specification [2]
interprets the generic name recommendation a bit different here:

> Following the generic-names recommended practice, node names should
> reflect the purpose of the node (ie. "framebuffer" or "dma-pool").

"framebuffer" or "dma-pool" would also be "memory", yet they suggest
a name reflecting the purpose instead. The purpose of the node is
"smem", it's not just arbitrary "memory".

However, my main problem with using memory@ here is that it actually
causes new dtbs_check errors:

apq8016-sbc.dt.yaml: memory@86000000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@86300000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@86400000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@86500000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@86680000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@86700000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@867e0000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@86800000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@89300000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@89900000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
apq8016-sbc.dt.yaml: memory@8ea00000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)

Looks like it thinks this is a definition of physical memory now.
I would rather not add more errors. :)

Stephan

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
[2]: https://github.com/devicetree-org/devicetree-specification/blob/master/source/chapter3-devicenodes.rst#reserved-memory-child-nodes

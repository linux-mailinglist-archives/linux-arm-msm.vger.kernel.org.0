Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F6B330F37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 14:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCHNby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 08:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhCHNbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 08:31:47 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05899C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 05:31:46 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so2982775pjc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XGoAGNYT6tXYgHeKhW2JDJs/r9xX8kr9hTTKfXjfp84=;
        b=WigFhTulHneEufHF8nv8vUutVojLFmgJDTeNXtaWIU6BPb8zOYLtrlP6k9KxCz7upK
         WM+rXJTkMx5jSH6Dnskkvn1o6moP8tLlEMZJCi7YrJ0k939ChwsqstpuQR7lnUAxzxBl
         ucee8leMGI/ko/e3O64fAxTffuba/YrwHSJXqCHntP10EbeqbbbbliijiU1IoFBtmZXe
         Q/J53WiSAsl9wqEppvQqc4ozTiJcKnSqkvrpPi20tb8KkqDmbyBVxlhsitw6Cw5Xwh/8
         T3teg/0t8/tMtTV9Rf9vAtYZVx24Zr/hgmlvXknmO9/URPDL4zAr6pXjJ1caln+exoXS
         /qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XGoAGNYT6tXYgHeKhW2JDJs/r9xX8kr9hTTKfXjfp84=;
        b=kQmmr4s1vKd76OB435eGCl1jfxEB5By1iE7dKfTC/X8KmizhFPt8dUJdcKgIozNKns
         XWS+sl8ImCWqyOHCCmQZa+EvjRgFVj2aq4ctUeDWvKKUKcwNz62B3Hr12Iwsaf3mrADQ
         PeH43rpenBn/yQPX/vJboyEhaxZUUUQDhPsNrdq647J8M5qQN0li+ugQO5CA5nSMzYzf
         H2uTbatU1NzlzEetFIF5yemDKOnc8nEO1l45NJMoTPnTlfeLdBnkFvOxbYy3Mg5k5Hct
         vWAQQZW4cABlFZPC2TE+ZS+brvrp2IcdzECU/WbyRQm08QaGwQesZa550gwbEFevVGc9
         4eXg==
X-Gm-Message-State: AOAM531q20QFcc1tpirUTjOvgIhXznJn770trpDaCUScyAoJRciw46Jn
        u1wD6HgkIuWxARcGsVt4Zhwq
X-Google-Smtp-Source: ABdhPJwn8ZZ3Vko9jfDjEVdgsQIgjWmAgHZxLJB3qCJ/IroL6/2uU4WCwC0b9b9enVnZRNsno+6JbA==
X-Received: by 2002:a17:90a:1485:: with SMTP id k5mr24582282pja.103.1615210306421;
        Mon, 08 Mar 2021 05:31:46 -0800 (PST)
Received: from thinkpad ([2409:4072:638a:aee8:50fe:f77:990e:395b])
        by smtp.gmail.com with ESMTPSA id i1sm10449641pfo.160.2021.03.08.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:31:45 -0800 (PST)
Date:   Mon, 8 Mar 2021 19:01:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniele.Palmas@telit.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210308133134.GC5457@thinkpad>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
 <20210308101059.08658fbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308101059.08658fbe@collabora.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 08, 2021 at 10:10:59AM +0100, Boris Brezillon wrote:
> On Mon,  8 Mar 2021 11:14:46 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > 
> > So let's add a property for declaring such secure regions so that the
> > drivers can skip touching them.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > index d0e422f4b3e0..15a674bedca3 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > @@ -143,6 +143,13 @@ patternProperties:
> >            Ready/Busy pins. Active state refers to the NAND ready state and
> >            should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
> >  
> > +      secure-regions:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description:
> > +          Regions in the NAND chip which are protected using a secure element
> > +          like Trustzone. This property contains the start address and size of
> > +          the secure regions present.
> > +
> 
> Since you declare this as a generic property, I think it'd be simpler
> to do the check at the core level.
> 

Hmm, so have the parsing logic in qcom driver and check in core or both parsing
and check in core?

I don't think the first one makes sense.

Thanks,
Mani

> >      required:
> >        - reg
> >  
> 

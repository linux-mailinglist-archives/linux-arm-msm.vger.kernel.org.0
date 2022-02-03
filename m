Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9854A824E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 11:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243517AbiBCK30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 05:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiBCK30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 05:29:26 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B77C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 02:29:25 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so2530766pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pDySLD49Od9ppT5fF1VG9msX8bYroKjD1B55FHPH58o=;
        b=Ry0lEsVBCpgcS1blKtvJPs+19daf+8Hwxusy8ZKY7MmPiUk2SgCkkAez2CnxJPShgP
         i3CSAUEN4gh48bw/c5TYBsPzmHPPkQFMqx17rweN5l01thiDWgFhEAwElqYqN8Xluzm4
         LP0lY366cYHR8x81YoetishaETS9BYdEZGGI14uYvSaryTZQXwaAh32a4rp4letWaUb1
         o9CA3ntDuR2WxidEpq5m7o0nccgFceT0si0eUJvCGI26SdMdkYyCNypS2o7rk0hf3h8H
         8RE2+GEs2Na+7hhGmmv6CgXkoG1x+1GgM6LPB7+cPxp/fbb7GsgUjrMVf6MGnEJhoO8v
         G2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pDySLD49Od9ppT5fF1VG9msX8bYroKjD1B55FHPH58o=;
        b=Y/DAfLGt5Ie1p7v0KvcALoAR3eNA9Nz2p6t6w4VgFcwE23flXprwseODuyxQTJqlzf
         g4DgZ95T8JsmSVeaLfh7hBtK4GtMZ+V+ev8BNBi6eN2TtqGGbLOb0HDDOJdY2Y9zcuDH
         OumrvlNGSm5OE8x7NF5pWA5rAIEI/DjtikwjyFEALr41805xCyttYfRLaeRk3/JhvS+h
         2RJfgDCoj5XcpcK4KnDmf3f/+vw/qhwv6a0crwa6g295NKSMvWzP5CzHJQ9Y1KVtioS2
         BXmRWKfrroHn4/e6ciYCju98EMq2CglOyh0lfmajSZQBFk0YlZ2T60I2EK0Q0q/bcAwg
         zb2Q==
X-Gm-Message-State: AOAM5317XYvB9eS0qCMPpQMMLLhj1Sh5nuVDyk1iyyJQRRFNtcYT1MgX
        ode9t2LdtRjg6aQn5Xe5L0WQ33xuP+xD7X0=
X-Google-Smtp-Source: ABdhPJzsej4081ZvrJvwGCEc+Zbs5ayxAOBDZ5759R8sreFuk9QW7NHmAy3LdpoqVgTnT+RgxDKtIQ==
X-Received: by 2002:a17:90b:3ece:: with SMTP id rm14mr8882107pjb.220.1643884164685;
        Thu, 03 Feb 2022 02:29:24 -0800 (PST)
Received: from thinkpad ([117.217.179.179])
        by smtp.gmail.com with ESMTPSA id l13sm36476955pgs.16.2022.02.03.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 02:29:23 -0800 (PST)
Date:   Thu, 3 Feb 2022 15:59:17 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@ieee.org>
Cc:     mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/20] bus: mhi: Move common MHI definitions out of host
 directory
Message-ID: <20220203102917.GA6298@thinkpad>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-3-manivannan.sadhasivam@linaro.org>
 <cf56733b-7c5d-e5f9-70c4-6f262fa2853b@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf56733b-7c5d-e5f9-70c4-6f262fa2853b@ieee.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Alex,

Thanks a lot for the inputs. I've incorporated a portion of your suggestions
and kept remaining ones post upstream.

On Wed, Jan 05, 2022 at 06:22:25PM -0600, Alex Elder wrote:
> On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> > Move the common MHI definitions in host "internal.h" to "common.h" so
> > that the endpoint code can make use of them. This also avoids
> > duplicating the definitions in the endpoint stack.
> > 
> > Still, the MHI register definitions are not moved since the offsets
> > vary between host and endpoint.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/mhi/common.h        | 182 ++++++++++++++++++++++++++++++++
> >   drivers/bus/mhi/host/internal.h | 154 +--------------------------
> >   2 files changed, 183 insertions(+), 153 deletions(-)
> >   create mode 100644 drivers/bus/mhi/common.h
> > 

[...]

> > +
> > +#define EV_CTX_RESERVED_MASK GENMASK(7, 0)
> > +#define EV_CTX_INTMODC_MASK GENMASK(15, 8)
> > +#define EV_CTX_INTMODC_SHIFT 8
> > +#define EV_CTX_INTMODT_MASK GENMASK(31, 16)
> > +#define EV_CTX_INTMODT_SHIFT 16
> > +struct mhi_event_ctxt {
> 
> These fields should all be explicitly marked as little endian.
> It so happens Intel and ARM use that, but defining them as
> simple unsigned values is not correct for an external interface.
> 
> This comment applies to the command and channel context structures
> also.
> 

Ack

> > +	__u32 intmod;
> > +	__u32 ertype;
> > +	__u32 msivec;
> > +
> 
> I think you can just define the entire struct as __packed
> and __aligned(4) rather than defining all of these fields
> with those attributes.
> 

This was suggested by Arnd during the MHI host review. He preferred adding the
aligned parameter only for members that require them.

> > +	__u64 rbase __packed __aligned(4);
> > +	__u64 rlen __packed __aligned(4);
> > +	__u64 rp __packed __aligned(4);
> > +	__u64 wp __packed __aligned(4);
> > +};
> > +
> > +#define CHAN_CTX_CHSTATE_MASK GENMASK(7, 0)
> > +#define CHAN_CTX_CHSTATE_SHIFT 0
> 
> Please eliminate all the _SHIFT definitions like this,
> where you are already defining the corresponding _MASK.
> The _SHIFT is redundant (and could lead to error, and
> takes up extra space).
> 
> You are using bitfield operations (like FIELD_GET()) in
> at least some places already.  Use them consistently
> throughout the driver.  Those macros simplify the code
> and obviate the need for any shift definitions.
> 

Ack.

Thanks,
Mani

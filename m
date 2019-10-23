Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DCCE1B32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 14:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405385AbfJWMr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 08:47:56 -0400
Received: from onstation.org ([52.200.56.107]:33894 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405381AbfJWMr4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 08:47:56 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id F35C83E951;
        Wed, 23 Oct 2019 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1571834875;
        bh=0kqhIdrcdwTaeOk++zBCxLaWbwoAfqHJ5bwvzT6eofE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ty01jSUZZyZs/E5U7fYrVJsqd7rCW3TaZaBl4f6bW9Imrc+LwyG/rkLvdy1HnEelF
         yz54byi8l52QHKOb+vJbMLzFSvC5pmQg29NgewohrS2cpj2QCPLe7MwSxSaRhAcH7K
         8lU1zbQPw4nW+ClZbLkZrp8GCMt2MEyGq6n/hcZU=
Date:   Wed, 23 Oct 2019 08:47:53 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974: add interconnect nodes
Message-ID: <20191023124753.GA14218@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
 <20191013080804.10231-6-masneyb@onstation.org>
 <d154b0c6-fc39-bebc-d1b5-cc179fb6055d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d154b0c6-fc39-bebc-d1b5-cc179fb6055d@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 23, 2019 at 02:50:19PM +0300, Georgi Djakov wrote:
> On 13.10.19 г. 11:08 ч., Brian Masney wrote:
> > Add interconnect nodes that's needed to support bus scaling.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> >  arch/arm/boot/dts/qcom-msm8974.dtsi | 60 +++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > @@ -1152,6 +1207,11 @@
> >  				              "core",
> >  				              "vsync";
> >  
> > +				interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
> > +				                <&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
> 
> Who will be the requesting bandwidth to DDR and ocmem? Is it the display or GPU
> or both? The above seem like GPU-related interconnects, so maybe these
> properties should be in the GPU DT node.

The display is what currently requests the interconnect path,
specifically mdp5_setup_interconnect() in
drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c. The Freedreno GPU bindings
currently don't have interconnect support. Maybe this is something that
I should add to that driver as well?

> > +				interconnect-names = "mdp0-mem",
> > +				                     "mdp1-mem";
> 
> As the second path is not to DDR, but to ocmem, it might be better to call it
> something like "gpu-ocmem".

I used what mdp5_kms.c expected.

Brian

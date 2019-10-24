Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6F7E2AC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 09:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436490AbfJXHHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 03:07:31 -0400
Received: from onstation.org ([52.200.56.107]:36614 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727635AbfJXHHb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 03:07:31 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9DC693E88C;
        Thu, 24 Oct 2019 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1571900850;
        bh=Dd3LcWl/3IsTamvy8Zm2T8waJpgR0GN+K+t3Gns4Kzw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BljIAdCmSBPQJoMkCdPK9vSnCl/XK2ohuqjyatJrxZfuKtzIGnroppAOkatB8EdHp
         MXmTBPmWjHgzJWrUFGaQ8AOLWc4/tHMtnCiiNw4dhle3YrpjGysM1ut1pPTiNYlm9z
         TtvWMxSeW+a6CvejIjQNDcWqlsE8iR9ZfnkaG7kA=
Date:   Thu, 24 Oct 2019 03:07:30 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974: add interconnect nodes
Message-ID: <20191024070730.GA19974@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
 <20191013080804.10231-6-masneyb@onstation.org>
 <d154b0c6-fc39-bebc-d1b5-cc179fb6055d@linaro.org>
 <20191023124753.GA14218@onstation.org>
 <c26159f5-e6fe-07f1-51b3-50b72b258846@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c26159f5-e6fe-07f1-51b3-50b72b258846@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 23, 2019 at 04:39:21PM +0300, Georgi Djakov wrote:
> On 23.10.19 г. 15:47 ч., Brian Masney wrote:
> > On Wed, Oct 23, 2019 at 02:50:19PM +0300, Georgi Djakov wrote:
> >> On 13.10.19 г. 11:08 ч., Brian Masney wrote:
> >>> Add interconnect nodes that's needed to support bus scaling.
> >>>
> >>> Signed-off-by: Brian Masney <masneyb@onstation.org>
> >>> ---
> >>>  arch/arm/boot/dts/qcom-msm8974.dtsi | 60 +++++++++++++++++++++++++++++
> >>>  1 file changed, 60 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> >>> @@ -1152,6 +1207,11 @@
> >>>  				              "core",
> >>>  				              "vsync";
> >>>  
> >>> +				interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
> >>> +				                <&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
> >>
> >> Who will be the requesting bandwidth to DDR and ocmem? Is it the display or GPU
> >> or both? The above seem like GPU-related interconnects, so maybe these
> >> properties should be in the GPU DT node.
> > 
> > The display is what currently requests the interconnect path,
> > specifically mdp5_setup_interconnect() in
> > drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c. The Freedreno GPU bindings
> > currently don't have interconnect support. Maybe this is something that
> > I should add to that driver as well?
> 
> The "mdp0-mem" and "mdp1-mem" paths mentioned in the mdp5_kms.c are the two
> interconnects between the display and DDR memory.

OK, I see. Most of the interconnect paths in the downstream MSM 3.4
sources are configured in device tree using the
qcom,msm-bus,vectors-KBps property, which is what I was only looking at
before. The interconnect path for the display is configured directly in
code (drivers/video/msm/mdss/mdss_mdp.c) to setup a path between
MSM_BUS_MASTER_MDP_PORT0 and MSM_BUS_SLAVE_EBI_CH0.

In the upstream kernel, it looks like I'll need to

  1) add support for an optional second interconnect path for ocmem to
     drivers/gpu/drm/msm/adreno/adreno_gpu.c.

  2) add implementations of gpu_get_freq and gpu_get_freq to the
     adreno_gpu_funcs struct in drivers/gpu/drm/msm/adreno/a3xx_gpu.c.

Brian

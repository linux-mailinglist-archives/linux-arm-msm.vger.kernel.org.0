Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E1C433E16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 20:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbhJSSKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 14:10:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233413AbhJSSKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 14:10:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A16860FC2;
        Tue, 19 Oct 2021 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634666876;
        bh=ugfD5oilf5sZAV+LUYkHhfUlgC/YPCB6tjBtG4YOD0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uvnnD4OI+qKD9QmyuovZJzI+yKN041k3a+/rJK6zsDyjiEMQbOJxl2ZuDLF0TmQqn
         wv9NtGeXIpRbKp12+JvTnxuKGAiBbYDAnAGtBmfMFLRD5eCl6wTGX4ASH6fx+/zFyG
         VE26MCWV+Vaf1/OCJjC7diB4pSAStOI3wz3V/vjB9XWvsUDWasgD985mbJ5Anb7Xe3
         6ZDMjK1kObcgNkLaGzfEqQCtYyuLX8o2CaR2O+twDHxzuoNmjhfg7oxgHXAOT0IA5x
         u3RD3xBZG7NiQqS62YYd7r2EbImtIl80PpBNFzpVYDa3UeqrOVS5tXnX+eNtOC/q+p
         hOfjaY+MpsZKQ==
Date:   Tue, 19 Oct 2021 23:37:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and IPQ8074
 PCIe PHY require no supply
Message-ID: <YW8JeJ6C9SzcGaqS@matsya>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-3-shawn.guo@linaro.org>
 <YVvx9jEGS3g9LD8X@matsya>
 <YVxzdiVKWOF9AVVV@ripper>
 <YV62USm8pSvAKdvo@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV62USm8pSvAKdvo@matsya>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 07-10-21, 14:26, Vinod Koul wrote:
> On 05-10-21, 08:47, Bjorn Andersson wrote:
> > On Mon 04 Oct 23:34 PDT 2021, Vinod Koul wrote:
> > 
> > > On 29-09-21, 11:42, Shawn Guo wrote:
> > > > The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
> > > > are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
> > > > bindings to reflect it.
> > > > 
> > > > While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.
> > > > And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
> > > > 'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
> > > > bindings.
> > > 
> > > Acked-By: Vinod Koul <vkoul@kernel.org>
> > > 
> > 
> > I think it's better if you take the two dt-bindings through your tree,
> > so we avoid any potential merge conflicts related to possible other
> > changes.
> 
> Okay picked up the binding patches

This failed to apply for me, can you please rebase and send

Thanks
-- 
~Vinod

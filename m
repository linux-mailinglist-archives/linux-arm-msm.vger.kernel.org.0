Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C36424F96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 10:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbhJGI6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 04:58:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232573AbhJGI6r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 04:58:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADB0560F59;
        Thu,  7 Oct 2021 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633597013;
        bh=tGpzmiv6pVVsRqKqVpTwy7imiBRGTLNRryr1xxIDdg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hhYS54kF3UYSF0kSXd3keMiH+8Lv0ca2K0NQ9OxOrSDq3VxfPM6Y6tcz07d0Jt524
         MNXFs4OKPPad7AB9Dz5ujjdkXsNYK82btH6KA7F4c8vcPffWDomLoXzDUx+L2hB7EC
         J8Oz2kOpGTsfcsFadb9PZSTrWuus/WkQnugpbIdhl6dIQjofY2Iq3u0ylpxipE79H8
         03CdidP0g7tI3RDkh2iyk11dBDK3vLaBt5YMLMcGtpm2P4o9wt/baLwerapl+iCf/l
         loBIdt/FPzqa9li8UtzErLcot5StnFgZeIaKjFMAEgW52CcXzmIIKSkj718eHkQfct
         4CylOsvkl2u8A==
Date:   Thu, 7 Oct 2021 14:26:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and IPQ8074
 PCIe PHY require no supply
Message-ID: <YV62USm8pSvAKdvo@matsya>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-3-shawn.guo@linaro.org>
 <YVvx9jEGS3g9LD8X@matsya>
 <YVxzdiVKWOF9AVVV@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVxzdiVKWOF9AVVV@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-10-21, 08:47, Bjorn Andersson wrote:
> On Mon 04 Oct 23:34 PDT 2021, Vinod Koul wrote:
> 
> > On 29-09-21, 11:42, Shawn Guo wrote:
> > > The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
> > > are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
> > > bindings to reflect it.
> > > 
> > > While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.
> > > And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
> > > 'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
> > > bindings.
> > 
> > Acked-By: Vinod Koul <vkoul@kernel.org>
> > 
> 
> I think it's better if you take the two dt-bindings through your tree,
> so we avoid any potential merge conflicts related to possible other
> changes.

Okay picked up the binding patches

-- 
~Vinod

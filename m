Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8329041E8F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 10:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352296AbhJAIVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 04:21:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:34828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231209AbhJAIVg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 04:21:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 393CF61A63;
        Fri,  1 Oct 2021 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633076392;
        bh=SXKYoP4v8q0a1PDAzV+UPRkyOgdg+9D+MrmjRdjtW5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X8R0S1Hv/XuLUH6kBia6UAlnKkf8cuhAqoWtqu+sdRZ4gpBdX8os5qki8Et1VmlnZ
         ZAIjJzT4YjhVK0PwN3fmKoBuDtkMKLBwXQkoz0lxEkxRsEKS8R3L4XTUihjWz6r5NX
         idFI0FUPmh+Et0tfqYesGHdQhiPh5pfebO2zkq+wGHATg/HPrzBIvuwtca2jDkNRWX
         A9sX+4HiX/ZFIMHQpMR3PiaT2ck+2NmdP0xjIHt9n7Xd4ZFaSZA5ZuBZ+H1MjidnAn
         BjmpLjAN6sZv60Xuw9FIDUgQSi3wuWc/wy4BnZQzey8yFW91WGx9/39O4wGdVerS+e
         Jm5GJMkkWbvcw==
Date:   Fri, 1 Oct 2021 13:49:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add QCM2290 USB3 PHY
Message-ID: <YVbEo4i5T63O+RnC@matsya>
References: <20210927064829.5752-1-shawn.guo@linaro.org>
 <20210927064829.5752-2-shawn.guo@linaro.org>
 <1632745399.282824.3097156.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632745399.282824.3097156.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-09-21, 07:23, Rob Herring wrote:
> On Mon, 27 Sep 2021 14:48:28 +0800, Shawn Guo wrote:
> > Add support for USB3 PHY found on Qualcomm QCM2290 SoC.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.

Shawn has fixed it at: https://lore.kernel.org/r/20210929034253.24570-1-shawn.guo@linaro.org

I guess you are okay with this patch, if not do let me know...

-- 
~Vinod

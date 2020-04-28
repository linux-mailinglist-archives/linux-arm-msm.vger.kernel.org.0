Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AB81BB5A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 07:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgD1FDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 01:03:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgD1FDJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 01:03:09 -0400
Received: from localhost (unknown [106.51.110.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9279206A5;
        Tue, 28 Apr 2020 05:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588050189;
        bh=N1HNyStyjFiaOU+5t7xqSf2pJH8YMPv9M0ySO4tvUTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PsN8M6WXTSo8162Ajbr9aPD49VWZsl6oWEvdH6kGQstJ7ERIVzIIeXENcZ3w3bKt/
         tvcpIFGjuw/ge0iLM1SlSUcX3eOIeVcemQzQMIrUDif0oZI+69G0lZeaKy9QiQNnzV
         yJWAsh99vqtdYOS2PRuBD96g72YMM1ce3PhBYD0Q=
Date:   Tue, 28 Apr 2020 10:33:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp: Add SM8250 UFS PHY
Message-ID: <20200428050305.GY56386@vkoul-mobl.Dlink>
References: <20200415060745.740193-1-bjorn.andersson@linaro.org>
 <20200420214958.GA23753@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420214958.GA23753@bogus>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-04-20, 16:49, Rob Herring wrote:
> On Tue, 14 Apr 2020 23:07:45 -0700, Bjorn Andersson wrote:
> > The SM8250 UFS PHY can run off the same initialization sequence as
> > SM8150, but add the compatible to allow future changes.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 5 +++++
> >  drivers/phy/qualcomm/phy-qcom-qmp.c                    | 3 +++
> >  2 files changed, 8 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks


-- 
~Vinod

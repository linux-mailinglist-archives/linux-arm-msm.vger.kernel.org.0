Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB99189BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 14:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfEIM32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 08:29:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:43936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfEIM32 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 08:29:28 -0400
Received: from localhost (unknown [106.200.210.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3C4F216C4;
        Thu,  9 May 2019 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557404967;
        bh=BljvyTbE81ovLkzFUTjNgjLZsjG8lFpQTfmvRrZPXek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CTvOjxvBZDMGzX2U1AU2dZ2kfxkkcAXvnlJ1tHarIuVUJ+cR/GkjyCXO1RQiAckCN
         SzGpifmThizFaXtA4MtEV3cfxECx4KoGKn4zcZ7CSt/0gvEyHugRkwigo765hJ30rL
         jf3C00g2v7XCOjhdCdcsXXTdfu715jUe0m5fxRkg=
Date:   Thu, 9 May 2019 17:59:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: qcs404: Enable PCIe
Message-ID: <20190509122922.GD16052@vkoul-mobl>
References: <20190508224309.5744-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508224309.5744-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-05-19, 15:43, Bjorn Andersson wrote:
> This series defines the PCIe PHY and controller on QCS404 and enable them for
> EVB. This was 1 commit, but per Vinod's request its split up in its individual
> pieces.

Thanks for doing that, all:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

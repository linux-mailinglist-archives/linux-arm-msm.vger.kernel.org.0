Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56EF421EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 08:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhJEGgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 02:36:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:60088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230526AbhJEGgX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 02:36:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D05861251;
        Tue,  5 Oct 2021 06:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633415673;
        bh=AstlIYtQpZekEfikMl1e8m7Syzc6J7RPE8yoOqvD4B8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AjlhIlJOzmzm0Q+KhaLGgoPnYIC7LWUM2z/38IoTBtHHMpDdUsCVUT3UBBrtNQfsM
         IGTaLnR5kmqk6WXlv/Y/LDFvQQ5uRqfhS1pu/ivtEnNXxR6b99mKh2Y04mvXBd3qlM
         mtadUBKnWDLqIAikTS4/eNlc5ZFrYnSlQfZ9RRcJsVfBIVWO27knBhUgy/o419cSE5
         /iQrL5d+6WzRG8s+BBtjnoGrruoK6fFvbzFQyQf0EkPNczq3kq++IGOJIdmyWUQ+GX
         wrOvwKriROh5SB41BKrizqYHLVv9fyIp64z4HPKvjM0AKmwmXkU5p7/lCUaTqTqLHQ
         n0vGJ2yHsNUlw==
Date:   Tue, 5 Oct 2021 12:04:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and IPQ8074
 PCIe PHY require no supply
Message-ID: <YVvx9jEGS3g9LD8X@matsya>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929034253.24570-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-09-21, 11:42, Shawn Guo wrote:
> The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
> are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
> bindings to reflect it.
> 
> While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.
> And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
> 'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
> bindings.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

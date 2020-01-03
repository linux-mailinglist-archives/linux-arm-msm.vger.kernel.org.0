Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDBE12F484
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 07:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgACGWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 01:22:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:51788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgACGWG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 01:22:06 -0500
Received: from localhost (unknown [223.226.47.138])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F211821734;
        Fri,  3 Jan 2020 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578032525;
        bh=coJeXShRUXqUAMrqKrVaX/J8EKP2NMcFSvnDHKG69Kg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WTPy3i8056odC7ALREYvthds0qx5F+KzPr3A/hrx52TJ9a0v7m80b6MRCtRa+uuCx
         0oYK/Vujps1L7475N6pIKEfF+cHDtT1URndonROCjUxiR753YVIveM3r5vLRw2h1XZ
         EsMLQfn7VeRta2ANmXcRbnhhJ7mWR0gB5/ZFidh4=
Date:   Fri, 3 Jan 2020 11:52:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] phy: qcom-qmp: Fixes and updates for sm8150
Message-ID: <20200103062200.GC2818@vkoul-mobl>
References: <20191223143046.3376299-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223143046.3376299-1-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kishon,

On 23-12-19, 20:00, Vinod Koul wrote:
> For SM8150 we need additional SW reset so clear the no_pcs_sw_reset, and add
> SW reset register. Along with that remove duplicate powerdown write.

Any update on this series?

Thanks
> 
> Changes in v3:
>  - Drop patch 1 "phy: qcom-qmp: Increase PHY ready timeout" as that is
>    applied by Kishon
>  - Drop patch "phy: qcom-qmp: Add optional SW reset" as that is no longer
>    required
>  - Add "phy: qcom-qmp: Add SW reset register"
> 
> Changes in v2:
>  - Drop patch 1 and pick the one Bjorn had already sent, makes timeout 10ms
>  - Fix optional reset write as pointed by Can
>  - Fix register define as pointed by Can
> 
> Vinod Koul (4):
>   phy: qcom-qmp: Use register defines
>   phy: qcom-qmp: remove duplicate powerdown write
>   phy: qcom-qmp: remove no_pcs_sw_reset for sm8150
>   phy: qcom-qmp: Add SW reset register
> 
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> -- 
> 2.23.0

-- 
~Vinod

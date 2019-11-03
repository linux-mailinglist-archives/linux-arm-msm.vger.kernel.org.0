Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89203ED292
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2019 09:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfKCI2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Nov 2019 03:28:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:52014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfKCI2H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Nov 2019 03:28:07 -0500
Received: from localhost (unknown [106.206.31.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6958214D8;
        Sun,  3 Nov 2019 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572769686;
        bh=+fzWTobamhGrK8+G2X8RepZguerf8UBR732qIjN5bOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r0yJa2hsvmGGBe6njZasq5fj1OZVbCxOx9AQN5QHXEOOPGLGWT7enDmtk0ghVwh32
         eCl0FTUZiIKDJUiJ4OcvpblgrYj0gKNLDh9pXYHFwzmkEkZJxtliytpKoapv8fzaza
         nODSLw/1NEHqlMo7cMjD8T7M2ikbOsZgPuLPkJDM=
Date:   Sun, 3 Nov 2019 13:57:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sdm845: Add PCIe nodes
Message-ID: <20191103082759.GR2695@vkoul-mobl.Dlink>
References: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-11-19, 17:31, Bjorn Andersson wrote:
> Add PCIe controller and PHY nodes for SDM845 and enable them for the
> Dragonboard 845c.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> The two series' that adding the PHY drivers and controller support can be found
> here:
> https://lore.kernel.org/linux-arm-msm/20191102001628.4090861-1-bjorn.andersson@linaro.org/T/#m6a892f4d6a8eefdd2c16b29b1cebb0023c69eac0
> https://lore.kernel.org/linux-arm-msm/20191102002721.4091180-1-bjorn.andersson@linaro.org/T/#m42ca469f4b23d534000a4b45a55d9739edbebdc4
> 
> Bjorn Andersson (3):
>   arm64: dts: qcom: sdm845: Add first PCIe controller and PHY
>   arm64: dts: qcom: sdm845: Add second PCIe PHY and controller
>   arm64: dts: qcom: db845c: Enable PCIe controllers
> 
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  91 +++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 215 +++++++++++++++++++++
>  2 files changed, 306 insertions(+)
> 
> -- 
> 2.23.0

-- 
~Vinod

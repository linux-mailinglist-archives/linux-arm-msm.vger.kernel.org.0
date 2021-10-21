Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4FF435AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 08:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhJUGMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 02:12:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230515AbhJUGMJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 02:12:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09B2060F57;
        Thu, 21 Oct 2021 06:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634796593;
        bh=NlpZ+tRRFszqoSX8V5iXnjX/Amqqcnl5RIAZP/WUKYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCz7acZHYP2rMtrIwrl7LHZtYIPnTHSPw2Yv16mxP25W/QMoL7FeQN41o3s4Dxw7X
         drFuLvr0QoEFHOO6Io46KCHObs3T1K4tSFy4UnXJBDxWAdliJnYj9av9tgOe9ZoHml
         e3XiNooGPmV9qaRAw5xcdPUj1yOWHSpVBzqQR6HC0atqWs7+md75QYSG0Q9cn4KBRR
         +rUMwKkzOXUuAhVzuf9Bhcjx/jGjUFYsZv7q1fr/NOFUmEZObXPWOIcyhYOZBB0dPK
         gn6aFXSzqZj2DMR+ebaHeq3p8lSTpCM6Co8tqNdizObD5LoLLDx7KPy6pkrSHlPe71
         YZ0Vu1bouTDNQ==
Date:   Thu, 21 Oct 2021 11:39:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qmp: another fix for the sc8180x PCIe
 definition
Message-ID: <YXEELLHeCerNrQ1a@matsya>
References: <20211020155604.1374530-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020155604.1374530-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-10-21, 18:56, Dmitry Baryshkov wrote:
> Commit f839f14e24f2 ("phy: qcom-qmp: Add sc8180x PCIe support") added
> SC8180X PCIe tables, but used sm8250_qmp_pcie_serdes_tbl as a serdes
> table because of the copy paste error. Commit bfccd9a71a08 ("phy:
> qcom-qmp: Fix sc8180x PCIe definition") corrected part of this mistake
> by pointing serdes_tbl to sc8180x_qmp_pcie_serdes_tbl, however the
> serdes_tbl_num field was not updated to use sc8180x table. So let's now
> fix the serdes_tbl_num field too.

Applied, thanks

-- 
~Vinod

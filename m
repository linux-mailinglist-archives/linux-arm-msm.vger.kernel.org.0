Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035AC3D206A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 11:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhGVIaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 04:30:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230491AbhGVIaJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 04:30:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77A616008E;
        Thu, 22 Jul 2021 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626945045;
        bh=UFRJTyfDU5ERSeJesOqndphPGq72ZxFE2ZfifURN+3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSErgSXc3zIsanJlbIjWVuGFwc6SVUyPtmQ+AN6t5x7jkKjscQNYahvKperrjR25f
         4L7rcX4jPE63oqQt3BZwo+NFZyFqibwNm9kAkCXca6R+bUTOMoWA8TJkm1zWbhHfIz
         4x+YUeHATUI1+M2yjvNDMz8jvYTHDq6ss58Ie6+2CxXdl7+aGCwmrzLWdVJdOfa05m
         zf7p/gn8PlLeJ+cwylepkdC5/T4jPQ8HiMzVOrJCo0slQ12nZV9W/cQYsRy4a4yPhH
         NdQqTWXPKKQtRYt4o+6WRW8DdB/QFxRqtHxyA9J8qEuJbl59a2Xm5Acn7ZE+Fx2N8X
         gOZfYmVZK1Jiw==
Date:   Thu, 22 Jul 2021 14:40:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: qcom-qmp: Fix sc8180x PCIe definition
Message-ID: <YPk2ERxHcJ7YgW4X@matsya>
References: <20210721163029.2813497-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721163029.2813497-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-21, 09:30, Bjorn Andersson wrote:
> A copy paste error was snuck into the patch going upstream that made the
> SC8180x PCIe PHY use the SM8250 serdes table, but while this works
> there's some differences in the tables (and the SC8180x was left
> dangling). So correct the SC8180x definition to use the SC8180x serdes
> table.

Applied, thanks

-- 
~Vinod

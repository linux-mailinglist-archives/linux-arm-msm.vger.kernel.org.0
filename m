Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFAC2273E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 02:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgGUAjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 20:39:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:42860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728127AbgGUAjB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 20:39:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67535208E4;
        Tue, 21 Jul 2020 00:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595291941;
        bh=mwZKvG+01y2ShgeBeoa9RMB1Bx/jUGES7yJ7dxJ92wQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VzsUSpUNum/ISB0NVT4N0zXSNrFlbwDylNiu0lA2s93tr3uqcQ9reMibtCaKNkOqg
         0S4C+yydEFCUSUtef4oUTdneQZrA/vyxY04FZT2R50Qq5kfE52EWKVCFNCBv4dQwWQ
         milHt6vZ9gz/gS07LquBtvkKgxIRtTbUzio3VqdA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594877570-9280-1-git-send-email-sivaprak@codeaurora.org>
References: <1594877570-9280-1-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: ipq8074: Add correct index for PCIe clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org
Date:   Mon, 20 Jul 2020 17:39:00 -0700
Message-ID: <159529194068.3847286.12937961081804827485@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-07-15 22:32:50)
> The PCIe clocks GCC_PCIE0_AXI_S_BRIDGE_CLK, GCC_PCIE0_RCHNG_CLK_SRC,
> GCC_PCIE0_RCHNG_CLK are wrongly added to the gcc reset group.
>=20
> Move them to the gcc clock group.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Applied to clk-next

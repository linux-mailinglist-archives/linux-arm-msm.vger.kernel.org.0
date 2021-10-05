Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A528421EE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 08:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhJEGgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 02:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230526AbhJEGgJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 02:36:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E5F761251;
        Tue,  5 Oct 2021 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633415659;
        bh=5EZHQoATB2gNDZncKK24ZE2sDKzzHL55yzP5fNl41/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IJIJMC8MbB2izN15QS7IJh45OY7JByOpZ7aQNS4RdBauw2CrlP6uYu/t5X/XK/LPO
         z4bZtW65HsHJ4nIr3GoYXSf6A1dAseX2ATn16KCWCWmMqlUI4P0TS3/+tohDc/2tpa
         qmCnwNxOBdVKFiLnd20JdRwrsRqj01DXTyuHKdP/6ZG9bUwwBZu3BjLNLf/WVzwOGY
         Kjq43LCQhkpCKKoQlHVD+kLjNo3E1yVjp3voWwzh4n9RxHKGVp2NnQMBBOfnlSCoDY
         F93boRDZRIoUUosNDTzftwentpAcUS9lPsBYOSHjhuuBFmVAL0pg+JxV0kHumX4CeY
         H2iIG7iJXDirA==
Date:   Tue, 5 Oct 2021 12:04:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: phy: qcom,qmp: '#clock-cells' is not
 required for parent node
Message-ID: <YVvx58Xhz1buDtaX@matsya>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929034253.24570-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-09-21, 11:42, Shawn Guo wrote:
> '#clock-cells' is not required for parent qmp-phy node but the child
> phy/lane node.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5593B2C11AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 18:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388007AbgKWRO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 12:14:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:43574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733152AbgKWRO1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 12:14:27 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D1D320719;
        Mon, 23 Nov 2020 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606151667;
        bh=Z0D0G7UXZZita+xmedZvqpv4DisJLJYg0ajIZcOzBSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5q7W847ripT143Funrq1sT9U76vY3E2WEZwTVwNMc1eh5l8aK10ltL1gxezscOtZ
         onto7fUrNGV8XlWu1BHq0poN7oQBNVUFjNWUtpnnoKoMizawr1FPxR2W7cF5Uv6qtg
         DfN0pit+2G73GnUJVaEvOBA7pX/SHQnqUUZRUNoY=
Date:   Mon, 23 Nov 2020 22:44:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add iommus property to qup
Message-ID: <20201123171422.GE8403@vkoul-mobl>
References: <20201122034149.626045-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122034149.626045-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-11-20, 19:41, Bjorn Andersson wrote:
> From: Stephen Boyd <swboyd@chromium.org>
> 
> The SMMU that sits in front of the QUP needs to be programmed properly
> so that the i2c geni driver can allocate DMA descriptors. Failure to do
> this leads to faults when using devices such as an i2c touchscreen where
> the transaction is larger than 32 bytes and we use a DMA buffer.
> 
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> 
> Add the right SID and mask so this works.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

on DB845c with GSI DMA:
Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

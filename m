Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE2E1A1B13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 06:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgDHEaj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 00:30:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgDHEaj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 00:30:39 -0400
Received: from localhost (unknown [122.181.202.227])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B885A20747;
        Wed,  8 Apr 2020 04:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586320238;
        bh=3leDYa1AeE862sOerDhOdNbm1duD9dAtRdqfXgT7+v0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gapYNRjIgpGQFa/zxW/WDLGxway4CMHUpQuePVPsAZ3tqeErsujuorqGRL+l1cOzw
         /eRV9vp2NiEOijeVsN2PdjaW3lXCtVbYV8y6WM8+vYHSIbKT92OnyD5cQRAE5XMWe9
         E049tsCJ0C79o5LiXOq3hIy+K1iycrURyK0pcKA4=
Date:   Wed, 8 Apr 2020 10:00:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Enable SS/HS USB support on SM8150
Message-ID: <20200408043027.GV72691@vkoul-mobl>
References: <1586298267-4722-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586298267-4722-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-04-20, 15:24, Wesley Cheng wrote:
> Add required device tree nodes to enable the USB SS and HS
> paths on the primary USB controller on SM8150.  In addition,
> implement missing resources from the SM8150 GCC driver, which
> includes the USB GDSC and the USB PIPE clocks.

lgtm:

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FF13E2B22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 15:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343965AbhHFNFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 09:05:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:35600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242837AbhHFNFm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 09:05:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EFA06108D;
        Fri,  6 Aug 2021 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628255127;
        bh=pV33NW1AKtJLdX1rKRb3MhxASd8RqDizeCWKI3yR6NU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aiNoCyLAZTwkesfU2xGWcO2ndzA3EYaRyXUTLYBiVufl/45EdOagnJJJR9vgVePvS
         AafC8yZH6XxUjPKB/VqXTlXLtxCEaqAXP46RwqMEveXYagZ97uCUCQhlGrRX5IzgDX
         YqKUHNi7gPxp/rS94KdJxRmIrWkJng8CQ3CfK9760RhOqZfSBINArfTFz3JF4qNAFr
         C2KPLCOq8m7Sa1k1+HzNs7nM6hY8NchPyz4/eB24sASa03Lx0Vk9c00FVnyO8z6D76
         kZPs7tuhlxU2H8AZIM88LaGhnYaOiR+Aidr1tlKq9Mc5uoPPWAK3k7G/VQK4LXhZKG
         iqdiBV7Je57zQ==
Date:   Fri, 6 Aug 2021 18:35:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] phy: qcom-qmp: add USB3 PHY support for IPQ6018
Message-ID: <YQ0zk44peRTsbLnu@matsya>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <6eec7ef4ecd1e8360ebe8e425151121684e997ed.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eec7ef4ecd1e8360ebe8e425151121684e997ed.1628085910.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-08-21, 17:05, Baruch Siach wrote:
> Initialization is identical to the IPQ8074 USB3 PHY.

Applied, thanks

-- 
~Vinod

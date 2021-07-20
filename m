Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91883CF7FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 12:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbhGTJzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 05:55:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:60838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237352AbhGTJy5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 05:54:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00943610F7;
        Tue, 20 Jul 2021 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626777324;
        bh=RYG5u04jOFhHEELWkGlORZlrGjhovJ3g71bY1CkTWOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TLNPMZ4GtPBXI0Soxg5cR+bV9o8znecg8edikg64Had5iRpJhZnTYGw9RBUO17s/W
         Df7BYeAtuFZhRex6RnDbIIb6bzU7rGpleaNLevaRi/63ZJf8Gvn/ihrRwUlojnmp6x
         6AvoKn6w9+zNi44oCXNSgVdoq7+wXAHVQH49AdGBtW7x+/qTM9+HzkAOHywx5Otvvk
         0aDDuV+ngrSgsenYbtMc4UfkQYyDxfpkeWlDEeuyRtK33X4RxJcfHa+w2DjI/XFb1Q
         xVlYndOidhVxm+AC9m/k/NRbDIQucqbcwJDwZzoy0LjLG+oBCdK2zKxVBJZ5w1eJUa
         HZjvjJHNf+hCw==
Date:   Tue, 20 Jul 2021 16:05:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add sc8180x PCIe
 compatible
Message-ID: <YPam6Bmvmj/4H0rQ@matsya>
References: <20210629004509.1788286-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629004509.1788286-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-06-21, 17:45, Bjorn Andersson wrote:
> Add a compatible for the sc8180x PCIe PHY.

Applied both, thanks

-- 
~Vinod

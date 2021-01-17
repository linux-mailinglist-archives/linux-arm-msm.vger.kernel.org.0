Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4A02F912B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 07:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbhAQGz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 01:55:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:38248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbhAQGz5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 01:55:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5732922D5B;
        Sun, 17 Jan 2021 06:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610866510;
        bh=iALNQjS79XwR6V+/HCyVdrnQfK8UZ/Q9N1tW2Yoteb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VY7TXqYBzASWjQsU4UvJbh8CCSyhyf1hG3NiUjBNIv2cHF8HC7lx5PadNMWYyXY6X
         8ireItZXvxL95+9HwOh0A5r3o00F0hLSb4s2eBagziRWNW524bBO2rUOEPLj3wInaH
         EVwfsqM4t/r+XNYfS+t3G2ajBFtO3ROXkHxL2fUQpSkdvlKgjHo+nRbi3HxgiZCKpM
         3ms/SIpACwr+pVsm+nR4XIvteWAKbc7KF96tBeZ33oBxHPoH7cgsunBjxzDvH9yh4t
         fv9Gr3e1manyZ2wN4LEjdfS34CUPkvpBJa2m4/OtBKhV5/O6U/pO4YSN+EGWRmdXLq
         VxZ0rHAag0S8g==
Date:   Sun, 17 Jan 2021 12:25:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     kishon@ti.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for USB3 PHY on SDX55
Message-ID: <20210117065505.GP2771@vkoul-mobl>
References: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-01-21, 17:00, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds USB3 PHY support for SDX55 platform. The USB3 PHY is of
> type QMP and revision 4.0.0. In this revision, "com_aux" clock is not
> utilized.
> 
> This series has been tested on SDX55-MTP along with the relevant DT node.

Applied, thanks

-- 
~Vinod

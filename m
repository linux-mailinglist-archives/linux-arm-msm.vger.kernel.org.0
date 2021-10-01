Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DAD41EA14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 11:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353117AbhJAJvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 05:51:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352947AbhJAJvM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 05:51:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E21B61A08;
        Fri,  1 Oct 2021 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633081769;
        bh=7xV7tAvqNWAUsfd37pQphXwNTBS1AhSdydvTA9IEfSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dsadxg0Ep0U1sOmU93Ijk0nq+FyxlYV5u8zfIyTkPzqr9/feOduxIN2XhQZpoI73X
         ycgrRpfhnJrH4+UtRLF6ksfMGs65eQaMahSJ+h1R/MwIbnH1V2gddKdyr7TtSzftbZ
         jpazUxg2/64JbdOqeFxxsBgmafgJllvWr7CPwIqg8UAxsbA5vOMuByGQzV+SMrFumy
         d7mnCq0WI7V0rAe5pKugaqXWiqMsuHNOhts6BedclRvA1HUhewyl/RYc2FxKxd3T8g
         MMLarblYvlmrpT2TTe1cG/m5O/D15g/VHPURnqRTjz7++YA9wktWoP3fok63x+QU4k
         z8tVflks1zRZA==
Date:   Fri, 1 Oct 2021 15:19:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add QUSB2 PHY support for QCM2290
Message-ID: <YVbZpJxpvGpDk7s3@matsya>
References: <20210919031110.25064-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919031110.25064-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-09-21, 11:11, Shawn Guo wrote:
> The series adds QUSB2 PHY support for QCM2290 platform, by documenting
> the compatible and it into driver match table.

Applied, thanks

-- 
~Vinod

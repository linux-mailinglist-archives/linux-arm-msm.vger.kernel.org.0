Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1883A1276C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 08:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfLTHxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 02:53:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:43960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbfLTHxo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:53:44 -0500
Received: from localhost (unknown [106.201.107.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 990BB20716;
        Fri, 20 Dec 2019 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576828423;
        bh=q+mQGfwkNQv1HURBxfmX2bv2zPEE80IykS2mIjvqiiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yUxz/CFTQ4sjWgwFHvYN+tRZEc+brxL8rJeMAVFBaAv8ccMRAAAnmM28vNJ9QqAgW
         2oeCsmxA5XEW5BIm9KQ9Zav1bzxkJkQPRoHIYJ7i5/WGHF2gC/BcqRCmyjoUO8EC7w
         fbnCGxRv/iI3sM7Dix22Pvc2tULBv4KhvGi5dgFg=
Date:   Fri, 20 Dec 2019 13:23:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Can Guo <cang@codeaurora.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
Message-ID: <20191220075338.GG2536@vkoul-mobl>
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-4-vkoul@kernel.org>
 <ff83ac1f0ec6bca1379e8b873fd30aa2@codeaurora.org>
 <9ef99dcac59dbdc59c7e5eb1a8724ea2@codeaurora.org>
 <20191220042427.GE2536@vkoul-mobl>
 <e55185eda9d7dcbce80a671e630449ea@codeaurora.org>
 <20191220071015.GF2536@vkoul-mobl>
 <b54f1f3a8938587b85aec74f7094006d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b54f1f3a8938587b85aec74f7094006d@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-12-19, 15:41, Can Guo wrote:
> On 2019-12-20 15:10, Vinod Koul wrote:
> > On 20-12-19, 14:00, Can Guo wrote:
> Hi Vinod
> 
> We are just removing the no_pcs_sw_reset for 8150, right? Why is it
> possibly impacting 845 or older paltforms?
> 
> In future, we will no longer need no_pcs_sw_reset for any newer QCOM UFS
> PHY designs, as it is only for 845 and older platforms.
> 
> I am sure QPHY_SW_RESET will be within PHY's address space since 8150.
> Otherwise, it will be a regression in UFS PHY design. We had a lot of
> discussion about this on 845 years ago, then design team decided to add
> it on later platforms, so I don't see a reason to remove it again. :)
> 
> I am not sure about the other qmp phys, but so long as UFS PHY needs the
> reset, we need to keep it, as phy-qcom-qmp.c is a common driver. I am
> not sure if I get your point here. Please correct me I am wrong.

The argument here is that we are making this UFS specific and we do not
know if this will be true in future as QMP is a common phy, so adding a
separate flag helps to keep it independent and to be used in other
situations.

Thanks
-- 
~Vinod

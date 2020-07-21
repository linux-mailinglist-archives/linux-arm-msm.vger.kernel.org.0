Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F52D2287A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbgGURmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 13:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730383AbgGURmM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 13:42:12 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6DCE20792;
        Tue, 21 Jul 2020 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595353331;
        bh=4OevMx9uMIoav+Swk+McjWTokdsX9C23mmK745+ZYTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZKg7+l7gcgWou1XcZJ5oNSObkAqLRyTwRH31sSOxQU2cbpeo1xatMahyrj+RmqUR+
         lGnRc3eHI3whFeY3qqr74SAsl3hvE1T/27x1CVaS2nnC/u9LBTi4y9bF5XAqdTYaiB
         T5xKCUyPfZEOsisos2rwt3DmIsHEmoIFBT3vgTt8=
Date:   Tue, 21 Jul 2020 23:12:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] phy: qualcomm: fix setting of tx_deamp_3_5db when
 device property read fails
Message-ID: <20200721174207.GP12965@vkoul-mobl>
References: <20200721150613.416876-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721150613.416876-1-colin.king@canonical.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-20, 16:06, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when reading of the device property for "qcom,tx-deamp_3_5db"
> fails the default is being assigned incorrectly to phy_dwc3->rx_eq. This
> looks like a copy-n-paste error and in fact should be assigning the
> default instead to phy_dwc3->tx_deamp_3_5db

Applied, thanks

-- 
~Vinod

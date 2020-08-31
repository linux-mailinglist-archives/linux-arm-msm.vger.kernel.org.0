Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225E62575F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 11:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgHaJG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 05:06:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbgHaJG4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 05:06:56 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44968208CA;
        Mon, 31 Aug 2020 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598864816;
        bh=1Qz1M9vaoARg9GtUW4ovk1F2f4s3/6BPUuzEaqduOXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0jTD3R1lBvSfSxPQgT9W8buKR6N1GnQIJ8/BTEbtQYmZr50oYl1xw16dsiwgfcl1e
         KDwjWx/mDwezUpYNuxO/4Wt5l3vGvBhOYGADoVHSEyFGRRHvHxK8AeJhRGq81bLTh3
         tEeAeWgWGdDiLs+A2JrPcoySoIKg7e8IS95c65GY=
Date:   Mon, 31 Aug 2020 14:36:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Seungwon Jeon <essuuj@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/8] drivers: phy: Constify static phy_ops structs
Message-ID: <20200831090652.GK2639@vkoul-mobl>
References: <20200823220025.17588-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823220025.17588-1-rikard.falkeborn@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-08-20, 00:00, Rikard Falkeborn wrote:
> This series constifies all static phy_ops structs in drivers/phy.
> Typically the only usage is to pass the address of it to devm_phy_create()
> which takes a const pointer. The lone exception is in
> drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c where the address of the
> structs is assigned to the data-field in of_device_id, which is a const
> void pointer.
> 
> Making the structs const allows the compiler to put them in read-only
> memory.
> 
> The patches are all independent of each other, and have been
> compile-tested only.

Applied all, thanks

-- 
~Vinod

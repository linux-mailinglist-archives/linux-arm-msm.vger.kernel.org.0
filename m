Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B6223C5C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 08:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgHEG2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 02:28:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgHEG2w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 02:28:52 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C497C207FC;
        Wed,  5 Aug 2020 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596608931;
        bh=7H4nWDeblmEKkyV19nhAZ4kYdJLAUZE1qFOWcPo+iT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ec3NA66beVkmoxpWmwOp4Hq+OD85ACrxac0sUtHq8LrRVsPGmoXAW35MEmpzxc7FZ
         aZvCFe5FbyHKVrHbX8NNFOGCxmdjbc4zzO+xI2++5YxJT9qcD6sK3qfJo+Zd2CH4oS
         tOpdR2LEwpA7umz2epZKTQbr2KG3Mhz8o1/j5CRQ=
Date:   Wed, 5 Aug 2020 11:58:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] phy: qualcomm: fix return value check in
 qcom_ipq806x_usb_phy_probe()
Message-ID: <20200805062847.GT12965@vkoul-mobl>
References: <20200723113622.136752-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723113622.136752-1-weiyongjun1@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-07-20, 11:36, Wei Yongjun wrote:
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.

Applied, thanks

-- 
~Vinod

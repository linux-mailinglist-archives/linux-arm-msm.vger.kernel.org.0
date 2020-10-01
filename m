Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA6227FA5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 09:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgJAHhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 03:37:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAHhZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 03:37:25 -0400
Received: from localhost (unknown [122.167.37.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CEA82075F;
        Thu,  1 Oct 2020 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601537844;
        bh=TDrQHRDL6ldEEmEZPWfZGGyKmLKzjPkeDwgyzBlKEsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rvn4NzcRmatJ9Sh20/cNYH53ODpEtIsLpyXuB++B6+gWwGrlXh/Mpe33w3OWT7VWg
         22EZm+erdeXbTUawBXxGDwA+2DZDOQ1dHBiK5yODMkclJfOHGLopqguD5QKHDx094V
         p3q8TWHIF9hUHIWCDn4ILgDj7nW8m6bUx3hFyHcw=
Date:   Thu, 1 Oct 2020 13:07:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] phy: qcom-qmp: initialize the pointer to NULL
Message-ID: <20201001073719.GT2968@vkoul-mobl>
References: <20201001070911.140019-1-vkoul@kernel.org>
 <160153698271.310579.690982928498545843@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160153698271.310579.690982928498545843@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-10-20, 00:23, Stephen Boyd wrote:
> Quoting Vinod Koul (2020-10-01 00:09:11)
> > Smatch complains:
> > drivers/phy/qualcomm/phy-qcom-qmp.c:3899 qcom_qmp_phy_probe() error: uninitialized symbol 'dp_cfg'.
> > drivers/phy/qualcomm/phy-qcom-qmp.c:3900 qcom_qmp_phy_probe() error: uninitialized symbol 'dp_serdes'.
> > drivers/phy/qualcomm/phy-qcom-qmp.c:3902 qcom_qmp_phy_probe() error: uninitialized symbol 'usb_cfg'.
> > 
> > This is a warning but not a practical one as dp_cfg, dp_serdes and
> > usb_cfg will be set and used when valid. So we can set the pointers to
> > NULL to quiesce the warnings.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Thanks!
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks for quick review, applied and pushed now

-- 
~Vinod

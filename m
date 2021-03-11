Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D98336E88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 10:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhCKJMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 04:12:13 -0500
Received: from mga02.intel.com ([134.134.136.20]:54642 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhCKJLz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 04:11:55 -0500
IronPort-SDR: CJPwHRFlCMTxV+1XzzbSTyNr/tk14Q7XvhvY3lvc7/Atdb/uIZ9TdivkWcH5LWUvVeTJ2R8zgK
 ifCW/qEFa48A==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="175751156"
X-IronPort-AV: E=Sophos;i="5.81,239,1610438400"; 
   d="scan'208";a="175751156"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 01:11:49 -0800
IronPort-SDR: Tpw6Dvx3s1M7gsZcr+qTNJa41P1Nw4KiWeyLrplpiXt54IjH0snVCCuyPm0rriYRiRl/G2jmlq
 NpRjeKFAsdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,239,1610438400"; 
   d="scan'208";a="509967596"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Mar 2021 01:11:45 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 11 Mar 2021 11:11:43 +0200
Date:   Thu, 11 Mar 2021 11:11:43 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Revert "usb: dwc3: qcom: Constify the software node"
Message-ID: <YEnez7CuR4YW8AVA@kuha.fi.intel.com>
References: <20210311090049.7354-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311090049.7354-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 05:00:49PM +0800, Shawn Guo wrote:
> This reverts commit 8dc6e6dd1bee39cd65a232a17d51240fc65a0f4a.
> 
> The commit causes an regression for ACPI probe on Lenovo Yoga C630
> laptop.  platform_device_add_properties() will fail with -EEXIST for the
> second USB instance, because of the software_node_to_swnode() check in
> function software_node_register().

I think you mean device_add_software_node() fails with -EEXIST, no?

There should be already a fix for that:
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=2a92c90f2ecca4475d6050f2f93
+8a1755a8954cc


thanks,

-- 
heikki

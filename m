Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB112E6BB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 00:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730603AbgL1Wzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 17:55:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:19031 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729364AbgL1UFl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 15:05:41 -0500
IronPort-SDR: ciAdtghjX46Vdz7B5+llLCCsDQ2CQh8wJv9pMS626z2ZPuyd28KLGBJdi9fO9b+GfsuQ3Xem2T
 EVfH2zPL6bTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="176516715"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="176516715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 12:03:53 -0800
IronPort-SDR: oWZXpPwDO92EKKydUnpBM/cxEAOJTeMogCbxkcDJescRlDe1D/pnA/+fOzf02O0OaNvr8ej0D0
 4fNK+y/r8fJw==
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="375765335"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 12:03:52 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ktylB-000HLg-P8; Mon, 28 Dec 2020 22:04:53 +0200
Date:   Mon, 28 Dec 2020 22:04:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH v1] soc: qcom: smem: use %*ph to print small buffer
Message-ID: <20201228200453.GE4077@smile.fi.intel.com>
References: <20200730153220.39466-1-andriy.shevchenko@linux.intel.com>
 <20201027183022.GJ4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027183022.GJ4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 27, 2020 at 08:30:22PM +0200, Andy Shevchenko wrote:
> On Thu, Jul 30, 2020 at 06:32:20PM +0300, Andy Shevchenko wrote:
> > Use %*ph format to print small buffer as hex string.
> 
> Any comments?

Anybody alive here?

-- 
With Best Regards,
Andy Shevchenko



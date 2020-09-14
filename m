Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFDA268936
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 12:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgINKYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 06:24:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:53137 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgINKYX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 06:24:23 -0400
IronPort-SDR: MfUqEcs7OQ0HouTs2oEZrAW8uus6fGESVPD0ICmtLwnLS+il38Cc26BMlVApZOgw8vLsOTxkrB
 HNTT0vCLAb/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="177113870"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="scan'208";a="177113870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 03:24:20 -0700
IronPort-SDR: QcyP07RF3LAU/PI2J/duytNCtP6tKMncHxoFHjpptViBWJHxO3DuUntzK/+Rvdd1QVz+Pb6Jl6
 pX2V7TlmncCw==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="scan'208";a="450820403"
Received: from akeogh1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.27.129])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 03:24:17 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
        khsieh@codeaurora.org, seanpaul@chromium.org,
        tanmay@codeaurora.org, aravindh@codeaurora.org
Subject: Re: [PATCH 0/4] Add support for video pattern DP CTS to MSM DP
In-Reply-To: <20200903224328.26452-1-abhinavk@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200903224328.26452-1-abhinavk@codeaurora.org>
Date:   Mon, 14 Sep 2020 13:24:21 +0300
Message-ID: <875z8gzmei.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 03 Sep 2020, Abhinav Kumar <abhinavk@codeaurora.org> wrote:
> Add support for video pattern Display Port Compliance tests to
> MSM DP driver.

FWIW, I find it useful to prefix the cover letter subject line with the
usual git log prefixes, e.g. "drm/msm/dp", so people can filter their
mails better.


BR,
Jani.


> Abhinav Kumar (4):
>   drm/msm/dp: add debugfs support to DP driver
>   drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
>   drm/msm/dp: add debugfs nodes for video pattern tests
>   drm/msm/dp: remove mode hard-coding in case of DP CTS
>
>  drivers/gpu/drm/msm/Makefile            |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   7 +
>  drivers/gpu/drm/msm/dp/dp_debug.c       | 485 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_debug.h       |  74 ++++
>  drivers/gpu/drm/msm/dp/dp_display.c     |  28 +-
>  drivers/gpu/drm/msm/dp/dp_link.c        |   2 +-
>  drivers/gpu/drm/msm/dp/dp_link.h        |  23 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c       |  46 +--
>  drivers/gpu/drm/msm/msm_drv.h           |   2 +
>  9 files changed, 617 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h

-- 
Jani Nikula, Intel Open Source Graphics Center

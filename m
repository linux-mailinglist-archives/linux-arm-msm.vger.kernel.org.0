Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1EA456E89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 12:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhKSL7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 06:59:06 -0500
Received: from mga03.intel.com ([134.134.136.65]:3877 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231835AbhKSL7F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 06:59:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="234349665"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; 
   d="scan'208";a="234349665"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 03:56:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; 
   d="scan'208";a="537081383"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 03:56:02 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
        (envelope-from <petri.latvala@intel.com>)
        id 1mo2Ts-0002Y6-9T; Fri, 19 Nov 2021 13:55:00 +0200
Date:   Fri, 19 Nov 2021 13:55:00 +0200
From:   Petri Latvala <petri.latvala@intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH igt v3 0/4] msm: Add tests for gpu fault handling
Message-ID: <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 15, 2021 at 04:30:38PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The first patch adds a easy way to write debugfs files (needed to
> disable hw fault detection, so we can test the sw timeout fallback).
> The second adds some helpers for cmdstream building.  And the third
> adds the new tests.
> 
> v2: Fix headerdoc comments in first patch
> v3: Add helper to detect debugfs files and updated last patch
>     to skip the one sub-test that depends on new debugfs when
>     running on older kernels
> 
> Rob Clark (4):
>   lib/igt_debugfs: Add helper for writing debugfs files
>   lib/igt_debugfs: Add helper for detecting debugfs files
>   msm: Add helper for cmdstream building and submission
>   msm: Add recovery tests

For patches 3+4, in case you're waiting for this:
Acked-by: Petri Latvala <petri.latvala@intel.com>

For the record, msm-specific test case changes don't need to wait for
review (see single contributor exception in CONTRIBUTING.md).


-- 
Petri Latvala

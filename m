Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4BB7130006
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 02:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgADB4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 20:56:55 -0500
Received: from onstation.org ([52.200.56.107]:34432 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727194AbgADB4z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 20:56:55 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id A08E93E9DC;
        Sat,  4 Jan 2020 01:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1578103014;
        bh=xyNpKZprwQIQOXph+TC++p8DP2NT1nhOZroE+HxC+Wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fCnL+ieIaQvIfsDm34kYoKy5MvFQxUR+EE3sBFaanimdxnirMX0x22gUiUQtM0Rhw
         RydRRFkrtd+kt3Y0aZvK8QmC5Wtv9zypLIvQ8fjjm/4xqFl47tmzQ4ghFt6E9UXX3Z
         J1RJg/tl/ORovtH4zbVvJ+DQ3dAxrbbS/ZxyE+MU=
Date:   Fri, 3 Jan 2020 20:56:54 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/17] Restructure, improve target support for
 qcom_scm driver
Message-ID: <20200104015654.GA30866@onstation.org>
References: <0101016efb7349c0-3c8f33b3-f7d2-46df-9bbb-c8f4401c5bf2-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016efb7349c0-3c8f33b3-f7d2-46df-9bbb-c8f4401c5bf2-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 12, 2019 at 06:51:07PM +0000, Elliot Berman wrote:
> This series improves support for 32-bit Qualcomm targets on qcom_scm driver and cleans
> up the driver for 64-bit implementations.
> 
> Currently, the qcom_scm driver supports only 64-bit Qualcomm targets and very
> old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
> Convention to communicate with secure world. Older 32-bit targets use a
> "buffer-based" legacy approach for communicating with secure world (as
> implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM SMCCC.
> Currently, SMCCC-based communication is enabled only on ARM64 config and
> buffer-based communication only on ARM config. This patch-series combines SMCCC
> and legacy conventions and selects the correct convention by querying the secure
> world [1].
> 
> We decided to take the opportunity as well to clean up the driver rather than
> try to patch together qcom_scm-32 and qcom_scm-64.
> 
> Patches 1-3 and 15 improve macro names, reorder macros/functions, and prune unused
>             macros/functions. No functional changes were introduced.
> Patches 4-8 clears up the SCM abstraction in qcom_scm-64.
> Patches 9-14 clears up the SCM abstraction in qcom_scm-32.
> Patches 16-17 enable dynamically using the different calling conventions.

I tested this whole series on arm32 (msm8974) and everything looks good
from my vantage point. Feel free to add my:

Tested-by: Brian Masney <masneyb@onstation.org> # arm32

Brian

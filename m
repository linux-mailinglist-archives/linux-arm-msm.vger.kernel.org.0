Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3B8A4C0B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 20:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfFSSVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 14:21:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41290 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfFSSVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 14:21:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id ED6696090E; Wed, 19 Jun 2019 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560968514;
        bh=ZVW7rMnSzf5tgpVqQWif1NMUXOC0s7ohk9A350pigjQ=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=O6dgRUsjCJRtoWbxywsl0jTz5cbqgwukxfuEroxRxMDj+DWNGWXY8ECwi20d3Kasa
         bNfTeZemL7yDf1qvcVds6efN9HIbm1pwq9WGj/9ilxl0tX6JvK2S2M5/MWpbZRDzGT
         AHFK0W+iOiMhYcTIruJLMcNpW1qBjkE56IhyOTuA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB4446019D;
        Wed, 19 Jun 2019 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560968513;
        bh=ZVW7rMnSzf5tgpVqQWif1NMUXOC0s7ohk9A350pigjQ=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JM2dl7TzVPPe6ioGsZSuYsPfSg370cRaYcWa6PiMhi1S4nLFzU0BXt8aY+t3yE1Pp
         8dSCB0hwBAWf9OGjGCDxJLE7I8FT1M0CgBNj7ut5gyrjFZCqsG3jwOAMlLc7dEBIDV
         7SY//+eypfsd6xRkbMjRPEMJQRvLCXAAKF7lt6t4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB4446019D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 19 Jun 2019 12:21:50 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Masney <masneyb@onstation.org>, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup
 functions
Message-ID: <20190619182149.GD17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 12:15:26PM -0600, Jordan Crouse wrote:
> On Sun, Jun 16, 2019 at 09:29:30AM -0400, Brian Masney wrote:
> > The files a3xx_gpu.c and a4xx_gpu.c have ifdefs for the OCMEM support
> > that was missing upstream. Add two new functions (adreno_gpu_ocmem_init
> > and adreno_gpu_ocmem_cleanup) that removes some duplicated code. We also
> > need to change the ifdef check for CONFIG_MSM_OCMEM to CONFIG_QCOM_OCMEM
> > now that OCMEM support is upstream.

Sorry for reviewing v1 when there was a v2 in flight. That will teach me to not
keep up on my email. I think you caught most of this, but a few things I still
saw.

<snip>

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

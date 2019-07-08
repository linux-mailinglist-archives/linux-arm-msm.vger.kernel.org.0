Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6159D62472
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 17:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731401AbfGHPY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 11:24:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50560 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388393AbfGHPY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 11:24:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E4D9460F37; Mon,  8 Jul 2019 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562599496;
        bh=LaN53jeBYi5tmPR5ezGeeym0cUuS5a/xgbX3lDsZMh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ONNmY6hh8UETji6VY4CPGNI9BNgDf1TfHiCcbM8ph7nNlivKTcA8F4ptLXFT27cQf
         +nCkVIfIRYCHNcUpZldX8dvnHlQ/VCitu7yWegFZoy4CIY13H0J3o1KVd7lXPpnNmR
         h7v//ZnmbhGp8EESOjxSCQhsGJeljGtl1F+wkgc0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33C9360DAD;
        Mon,  8 Jul 2019 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562599496;
        bh=LaN53jeBYi5tmPR5ezGeeym0cUuS5a/xgbX3lDsZMh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ONNmY6hh8UETji6VY4CPGNI9BNgDf1TfHiCcbM8ph7nNlivKTcA8F4ptLXFT27cQf
         +nCkVIfIRYCHNcUpZldX8dvnHlQ/VCitu7yWegFZoy4CIY13H0J3o1KVd7lXPpnNmR
         h7v//ZnmbhGp8EESOjxSCQhsGJeljGtl1F+wkgc0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33C9360DAD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 8 Jul 2019 09:24:53 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
Message-ID: <20190708152453.GB10188@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190703140055.26300-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703140055.26300-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 03, 2019 at 07:00:35AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For platforms that require the "zap shader" to take the GPU out of
> secure mode at boot, we also need the zap fw to end up in the initrd.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index d9ac8c4cd866..aa64514afd5c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -174,6 +174,10 @@ MODULE_FIRMWARE("qcom/a530_zap.b01");
>  MODULE_FIRMWARE("qcom/a530_zap.b02");
>  MODULE_FIRMWARE("qcom/a630_sqe.fw");
>  MODULE_FIRMWARE("qcom/a630_gmu.bin");
> +MODULE_FIRMWARE("qcom/a630_zap.mdt");
> +MODULE_FIRMWARE("qcom/a630_zap.b00");
> +MODULE_FIRMWARE("qcom/a630_zap.b01");
> +MODULE_FIRMWARE("qcom/a630_zap.b02");

Hopefully we are in the very last days of the split PIL so we can leave this
ugliness behind us once and for all.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

>  static inline bool _rev_match(uint8_t entry, uint8_t id)
>  {
> -- 
> 2.20.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

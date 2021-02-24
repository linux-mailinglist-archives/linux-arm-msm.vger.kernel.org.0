Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BF8323C09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 13:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhBXMpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 07:45:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:47926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232761AbhBXMpI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 07:45:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33BAB64EDD;
        Wed, 24 Feb 2021 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614170637;
        bh=1dYsUpyVvPhbmV0+5LvS3bhv3yECXDIDj6pUXRHW6bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RSEsgjDhD+du86adEo8yRcyHz74+lbK/SuJvaedZt8c67gYbB5CkPbuabuvYLN7zf
         Aqi/EohrqAnPly94BCm+fbvORu9L3K2FeJVdg6HcpQTMjEVD86GjTDATOTB27lm57q
         fSbu7ArD95yfBEihTDs2y1yi1RVIfrHP7mx28dzc=
Date:   Wed, 24 Feb 2021 13:43:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yogesh Lal <ylal@codeaurora.org>
Cc:     rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] driver core: Use unbound workqueue for deferred probes
Message-ID: <YDZKCk+it/7RpgUJ@kroah.com>
References: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 05:25:49PM +0530, Yogesh Lal wrote:
> Queue deferred driver probes on unbounded workqueue, to allow
> scheduler better manage scheduling of long running probes.

Really?  What does this change and help?  What is the visable affect of
this patch?  What problem does it solve?

thanks,

greg k-h

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8471CB547
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 18:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgEHQ6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 12:58:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbgEHQ6G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 12:58:06 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E61F2184D;
        Fri,  8 May 2020 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588957085;
        bh=WP1BgEPTd2LR/MoihVTnA2bSf8MuPTmn0D0iTQBdITw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AX0fptuXGlETWhByUdADUICOr6vdc9Z16dkvRO1IuyMQYTv4Z15h4gzUh0IMxLdH2
         zEf+e1gglPKzwZO0W0JfZVUfLsYwhyXUo7pBDY9TQxmkqZvM2owGdGgpR5YGGOzYO3
         xClFY/M4pHYmCeCoeSex6B79c+U1V62XPaLi7Pyc=
Date:   Fri, 8 May 2020 12:02:33 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Replace zero-length array with
 flexible-array
Message-ID: <20200508170233.GB23375@embeddedor>
References: <20200507185016.GA13883@embeddedor>
 <1b3cda25-5f3a-5359-4bf7-d16a8364f545@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b3cda25-5f3a-5359-4bf7-d16a8364f545@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 01:24:57PM -0600, Jeffrey Hugo wrote:
> >   drivers/dma/qcom/bam_dma.c         |    2 +-
> >   drivers/firmware/qcom_scm-legacy.c |    2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> Shouldn't these two files be two different patches?
> 

I believe so... I'll split this patch up into two patches.

Thanks
--
Gustavo


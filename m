Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41CCA280352
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 17:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732242AbgJAP5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 11:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732213AbgJAP5W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 11:57:22 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5DC420759;
        Thu,  1 Oct 2020 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601567840;
        bh=88TimvFIDpE/EXN2SuKN5wvVnaahwbSobcreM/XHuIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xhMJFOUnIYdeRHwfv4I5B4y0/BGIk7VILVt99QhcP+HMRR0zevySj/C2yjsdvHZ7L
         DadE0GWYU1GjMM4vg0zM1iglNh6x9yLFbRI2JMDdz/v1dHOzMgCkZX1hstMkic35Iw
         Yp1GfA3rJqHHmzQ/IMWPt1L54WAiwQd31B7+IjDo=
Date:   Thu, 1 Oct 2020 17:57:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3] soc: qcom: cmd-db: allow loading as a module
Message-ID: <20201001155721.GA3046334@kroah.com>
References: <20201001154144.5226-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001154144.5226-1-ilina@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 01, 2020 at 09:41:44AM -0600, Lina Iyer wrote:
> This patch enables Command DB driver to be loaded as a module. Command
> DB is inherent to RPMH interaction and as such would never be unloaded.
> Add supress_bind_attrs to make it a permanently loaded module.
> 
> Reviewed-by: John Stultz <john.stultz@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> Changes in v3:
> 	- Update copyright, suggested by Greg K-H

I did not say to update the copyright, I said if you were going to
update it, to do so properly :)

Anyway, tiny issue.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

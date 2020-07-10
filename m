Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586C021B543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 14:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgGJMls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 08:41:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726828AbgGJMls (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 08:41:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3133820772;
        Fri, 10 Jul 2020 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594384907;
        bh=J7PYdEtW5cpEgdBRUgOkkFdJLaOCK3sIQx6WpLZpPww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IKo6ct7sQo7OWQepRz+ge14SnAYJkCnMP2XE4ID2wT03XwXQYbNkYWhfmeWwrScaV
         NxxvGj9lblXwEaPpQY2V+EcLlH1pbvAhy112xzNr91H7dxP+D4v+OUZWpvWDCNpAhm
         /laQ9vJj1duoLpuJfNxL/0VW1WbIl6lkGFSzHEbA=
Date:   Fri, 10 Jul 2020 14:41:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        georgi.djakov@linaro.org, akashast@codeaurora.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH] tty: serial: qcom-geni-serial: Drop the icc bw votes in
 suspend for console
Message-ID: <20200710124152.GC1567243@kroah.com>
References: <1594287420-24141-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594287420-24141-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 09, 2020 at 03:07:00PM +0530, Rajendra Nayak wrote:
> When using the geni-serial as console, its important to be
> able to hit the lowest possible power state in suspend,
> even with no_console_suspend.
> The only thing that prevents it today on platforms like the sc7180
> is the interconnect BW votes, which we certainly don't need when
> the system is in suspend. So in the suspend handler mark them as
> ACTIVE_ONLY (0x3) and on resume switch them back to the ALWAYS tag (0x7)
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> Note: Patch applies on qcom for-next, which has the ICC support patches.
> The tag macros are currently not exported and hence the hardcoded values.
> Perhaps if and when https://patchwork.kernel.org/patch/11619705/ lands I
> can refresh this patch to use the macros.

Feel free to take this patch through that tree.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

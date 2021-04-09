Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4B635A076
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 15:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhDIOAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 10:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDIOAB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 10:00:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B10A61105;
        Fri,  9 Apr 2021 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617976788;
        bh=aNHzWSjtlbHWhZmEp79W5Ym13lGIg/GnzFxAQTVFo5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B2jVLsPHwCUjchkzZ9Egps92NCJbqFbcJYW+C3nEqt1Mey5b8+moq8iAysOu6fVUb
         P0SnKqlVB3uCcnmAYHu2m5m2qxTW7wjqvm9QGody2/2ckbJiG/eF0DeECnfvUcV7pz
         Kp7Lwkdt5fXLc/SGHpYeiUr4uIKo5WGdoB5ZGHWU6p5l1Rj5x6lM4RsFzO0HyCSIRy
         ZcZlW1Qz4euMIod+47f5301aiuvx2JzEuiwJPelKPpaSatGlj+CJGF+LFVXnk6dF44
         SPQk0HoY2t3gq4uRLWyPQMTjOb0fDTx41Cc5pt5/XIrzgVRoVI3pYeEFgSd3ks5uI+
         EUNKMV0xjBPBQ==
Date:   Fri, 9 Apr 2021 19:29:43 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cchen50@lenovo.com,
        mpearson@lenovo.com
Subject: Re: [PATCH 2/2] bus: mhi: fix typo in comments for struct
 mhi_channel_config
Message-ID: <20210409135943.GE31856@work>
References: <20210408100220.3853-1-jarvis.w.jiang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408100220.3853-1-jarvis.w.jiang@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 08, 2021 at 03:02:20AM -0700, Jarvis Jiang wrote:
> The word 'rung' is a typo in below comment, fix it.
> * @event_ring: The event rung index that services this channel
> 
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

Applied to mhi-next!

Thanks,
Mani

> ---
>  include/linux/mhi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d095fba37d1e..944aa3aa3035 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -205,7 +205,7 @@ enum mhi_db_brst_mode {
>   * @num: The number assigned to this channel
>   * @num_elements: The number of elements that can be queued to this channel
>   * @local_elements: The local ring length of the channel
> - * @event_ring: The event rung index that services this channel
> + * @event_ring: The event ring index that services this channel
>   * @dir: Direction that data may flow on this channel
>   * @type: Channel type
>   * @ee_mask: Execution Environment mask for this channel
> -- 
> 2.25.1
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98B9359FA8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 15:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhDINRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 09:17:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDINRV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 09:17:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9828A61105;
        Fri,  9 Apr 2021 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617974228;
        bh=aYDcN3mJtkzZVii0OX9VTNl2k3rutbr9vY3tMwSyRyc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WAr6u5IK+vrwoXwy52B/AwlsXFuv3xJRWejX83rKAmSS/qS6hf+wmmNW/2CCq3XhE
         MC1jmxb0O3TrjcFPWP3Vjezlv4s2x4tpMF11b/2M/CNCUVJfpfq30aLJ4lJhFZR/LO
         vUDKFvhluXvQuwE3UO2rAtjZyfWo3Wbm92+OuXqaDjE+spJbpSdnFeaGwNU9nVArQL
         D0gFc36UvXVoXfX/EsBmU+zKqqfItEMMsZmwr0AR1iHSLsSx5eVt7i2kBUw0qejjeI
         wAgyOulbE+zOu8W2onYsEz6OplqHrUqb0SU2u1X2Pv787DcaqKv1f6zSeuf6PxBYzI
         vCejtPrGmH8CQ==
Date:   Fri, 9 Apr 2021 18:47:03 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cchen50@lenovo.com,
        mpearson@lenovo.com
Subject: Re: [PATCH 2/2] bus: mhi: fix typo in comments for struct
 mhi_channel_config
Message-ID: <20210409131703.GD31856@work>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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

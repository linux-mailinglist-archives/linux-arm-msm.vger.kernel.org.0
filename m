Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B5B3AC324
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 08:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbhFRGPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 02:15:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:33258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232270AbhFRGPG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 02:15:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9E1961154;
        Fri, 18 Jun 2021 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623996777;
        bh=jNED0w5AnR+TFf49A2R1gRokQJ3wgVwVy2+mDUkr3gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G9pPYFEPtDRQmWCFF0nSnHfpRsa59lBlcHTyK7kG30efaFgiWHWkOTJk3CbpORdwT
         ZHp0QvWIP/8BVRod+BK69AMGxhCIcmwL6TJaPR8wX2qar2RiBzKPxgpfkhifb1DbK5
         5xlFiD5iJDXzQKwT8jT9Xo9bjMi54gaB22urkSNxoWupTgQ4/+7lNgRYUKhZKcJf5c
         dJO4DN67LkxS4vSmfK4OfGa+DEzZJdbzkbP+OrU+xb3sTFhy3qHHiwolYuwbN2XSv4
         zlQCuJbbqRHcSqPMi9zwVzSZoYplz/ki/s7K+9ElrC837CrdZZ20A3HuNwv7znU3dk
         KvPoaHph29Ybw==
Date:   Fri, 18 Jun 2021 11:42:51 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Paul Davey <paul.davey@alliedtelesis.co.nz>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: Fix pm_state conversion to string
Message-ID: <20210618054731.GJ3682@workstation>
References: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
 <20210618033132.24839-2-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618033132.24839-2-paul.davey@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 03:31:31PM +1200, Paul Davey wrote:
> On big endian architectures the mhi debugfs files which report pm state
> give "Invalid State" for all states.
> 
> Fix to_mhi_pm_state_str by using a local unsigned long as an intemediate
> to pass the state to find_last_bit to avoid endianness issues with cast
> from enum mhi_pm_state * to unsigned long *.
> 
> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377fca8f..87cc0c449078 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -79,7 +79,8 @@ static const char * const mhi_pm_state_str[] = {
>  
>  const char *to_mhi_pm_state_str(enum mhi_pm_state state)
>  {
> -	int index = find_last_bit((unsigned long *)&state, 32);
> +	unsigned long tmp = state;
> +	int index = find_last_bit((unsigned long *)&tmp, 32);
>  
>  	if (index >= ARRAY_SIZE(mhi_pm_state_str))
>  		return "Invalid State";
> -- 
> 2.32.0
> 

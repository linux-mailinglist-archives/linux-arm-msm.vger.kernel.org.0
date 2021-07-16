Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8E03CB1F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 07:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhGPFiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 01:38:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234174AbhGPFiM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 01:38:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48472613CC;
        Fri, 16 Jul 2021 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626413717;
        bh=bLl2ek/Iz6k79psgxdxnjSxBYO7VD1ncmUurpZkR8Nw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Im09OP2rEzXbCm7kGeQRSYGCQr4ysGGF3PCOlQGds3wll9MASqe4AwzOBnT0gUU1i
         Npt0UBRCVHGHvuBIcAOG+gu9Dzy7CaWADLApTAMNMo4Jv1qY3Yq04qxDCyWw5AIKPJ
         TObj+dxWu1yF3nYWlIUcPGq7ES57RLfDaLxGkogAH6hBKrVPueAI5vLvImXnNmZh+F
         n6n/l8lpdoWFFO93HRbNmXhGFtaIVGK7WbAjgfSyOtmNrNCioipUckfjxxAB5linNZ
         ul3G19f5jOmRstpyTK96YscPHfWBri2782nJJTnocrgWJNdAE4OsWrpMRE8IIjxvuD
         yHrC/iRqMZDyQ==
Date:   Fri, 16 Jul 2021 11:05:11 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Paul Davey <paul.davey@alliedtelesis.co.nz>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] bus: mhi: Fix pm_state conversion to string
Message-ID: <20210716053511.GA3323@workstation>
References: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
 <20210629035357.11091-2-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629035357.11091-2-paul.davey@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 03:53:56PM +1200, Paul Davey wrote:
> On big endian architectures the mhi debugfs files which report pm state
> give "Invalid State" for all states.  This is caused by using
> find_last_bit which takes an unsigned long* while the state is passed in
> as an enum mhi_pm_state which will be of int size.
> 
> Fix by using __fls to pass the value of state instead of find_last_bit.
> 
> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377fca8f..0706eb046f2a 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -79,9 +79,12 @@ static const char * const mhi_pm_state_str[] = {
>  
>  const char *to_mhi_pm_state_str(enum mhi_pm_state state)
>  {
> -	int index = find_last_bit((unsigned long *)&state, 32);
> +	int index;
>  
> -	if (index >= ARRAY_SIZE(mhi_pm_state_str))
> +	if (state)
> +		index = __fls(state);
> +
> +	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
>  		return "Invalid State";
>  
>  	return mhi_pm_state_str[index];
> -- 
> 2.32.0
> 

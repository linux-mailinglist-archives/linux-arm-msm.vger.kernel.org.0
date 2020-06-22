Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB5D203647
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 13:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgFVL6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 07:58:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbgFVL6l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 07:58:41 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7649206EB;
        Mon, 22 Jun 2020 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592827121;
        bh=vs4+pF8zCbPo5SX2paUNobqlBDYLTJ+ieB7qsSqtQK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wvIhqatZx4FwXxwifIernm1iEymbEe8Qp2gXIL7YcKv2LgXS4AFqw0GR6ksDlw8Do
         wxXtR9Mu6K0SCxpeDGJVoX/zMLaCX9aiiF9JUZ70iJny/AW1aPnDa0cBu46J6NLx5q
         s5Ug8wlWWpPlBfNzqqEOTLAQvP1jjypGb20Nw4zU=
Date:   Mon, 22 Jun 2020 17:28:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: Constify static structs
Message-ID: <20200622115837.GL2324254@vkoul-mobl>
References: <20200609230029.69802-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609230029.69802-1-rikard.falkeborn@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-20, 01:00, Rikard Falkeborn wrote:
> qcom_swrm_port_ops and qcom_swrm_ops are not modified and can be made
> const to allow the compiler to put them in read-only memory.
> 
> Before:
>    text    data     bss     dec     hex filename
>   18266    3056     256   21578    544a drivers/soundwire/qcom.o
> 
> After:
>    text    data     bss     dec     hex filename
>   18426    2896     256   21578    544a drivers/soundwire/qcom.o

Applied, thanks

> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/soundwire/qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1c2a44a3b4d..915c2cf0c274 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -406,13 +406,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
>  	return ctrl->reg_write(ctrl, reg, val);
>  }
>  
> -static struct sdw_master_port_ops qcom_swrm_port_ops = {
> +static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>  	.dpn_set_port_params = qcom_swrm_port_params,
>  	.dpn_set_port_transport_params = qcom_swrm_transport_params,
>  	.dpn_port_enable_ch = qcom_swrm_port_enable,
>  };
>  
> -static struct sdw_master_ops qcom_swrm_ops = {
> +static const struct sdw_master_ops qcom_swrm_ops = {
>  	.xfer_msg = qcom_swrm_xfer_msg,
>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>  };
> -- 
> 2.27.0

-- 
~Vinod

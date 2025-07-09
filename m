Return-Path: <linux-arm-msm+bounces-64123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66823AFE017
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E376C7AFA54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 06:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC57726C3A5;
	Wed,  9 Jul 2025 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jlv33VyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091920E6E2;
	Wed,  9 Jul 2025 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043304; cv=none; b=d1ftSW1WUzlmT2wLID8mdl3EDgJZPVfYOHWSTBQKPlWsw50bk9zyM3bnnZsxfdYmkeKUXMaXXcFI0iWtxEr0VEj7TFGbgfASvEjtT/a95qWHVfFlBwp5SnrGBO0dNZV/BQRoXrZhxnJE4iqBXbkV0n3oOwd0s3eJzC+2PNdNT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043304; c=relaxed/simple;
	bh=zyzZMgx23uk5HwLoXW6RXKUbWJN4sQWUFZEs4KPqiJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLORa9r3k2mmmHe8xokjdMJ8Q/Q+I0uNw7XPcE7kakwJV7cBX8Tmh9WSWJBXBc3yLCnOWCb2I68czYN0mqf6YJkyuObp/+yMqugxTzyxVZ5ZsCRO0neAeVQAb9Q7a+NiF1C1JVqsaUoEadronU3+zBJKPY+tbgVjFC00+vll5Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlv33VyU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9CAC4CEF0;
	Wed,  9 Jul 2025 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752043304;
	bh=zyzZMgx23uk5HwLoXW6RXKUbWJN4sQWUFZEs4KPqiJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jlv33VyU/i4RW79fPwJMVO724xvMAp7dP5iSpmJX332FfTQyPIpse/fIu1cK2DChf
	 gB/0w4JidWlXmYUeRzqu3txt+tOPDZaV8vip1PMfHFiUNnCwnHn6lk2v9c078EEhgY
	 zZenI9TZAKMIQKSaJ2SPG8mB08UwxQWFeKM2nHj4kvntWIKrX6Z+AJmewtw7S9hNnq
	 3mDSwV7DYP/J0ZnE6b/AP6lh0/si9F1RQvyxUsHjchu+CVD78D19lc3Veepl00mmRK
	 0vl+Vo/x1uN9lYrxcYMhWHsfSo3Ur4/qVNvgQ+qgRGIhg4koQcYmcSDqk85LGTVlto
	 VEChxhDJHfM0Q==
Message-ID: <7fc97dc4-fe5a-4f4c-bd43-df89c7dbc178@kernel.org>
Date: Wed, 9 Jul 2025 07:41:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 59/80] slimbus: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075446.3221540-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250704075446.3221540-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/4/25 8:54 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Acked-by: Srinivas Kandagatla <srini@kernel.org>

--srini

> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/slimbus/core.c      | 1 -
>  drivers/slimbus/messaging.c | 2 --
>  drivers/slimbus/qcom-ctrl.c | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
> index 005fa2ef100f..31751ee4e400 100644
> --- a/drivers/slimbus/core.c
> +++ b/drivers/slimbus/core.c
> @@ -504,7 +504,6 @@ int slim_device_report_present(struct slim_controller *ctrl,
>  	ret = slim_device_alloc_laddr(sbdev, true);
>  
>  slimbus_not_active:
> -	pm_runtime_mark_last_busy(ctrl->dev);
>  	pm_runtime_put_autosuspend(ctrl->dev);
>  	return ret;
>  }
> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
> index 6f01d944f9c6..44197493010e 100644
> --- a/drivers/slimbus/messaging.c
> +++ b/drivers/slimbus/messaging.c
> @@ -47,7 +47,6 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
>  		complete(txn->comp);
>  
>  	/* Remove runtime-pm vote now that response was received for TID txn */
> -	pm_runtime_mark_last_busy(ctrl->dev);
>  	pm_runtime_put_autosuspend(ctrl->dev);
>  }
>  EXPORT_SYMBOL_GPL(slim_msg_response);
> @@ -171,7 +170,6 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
>  		 * remove runtime-pm vote if this was TX only, or
>  		 * if there was error during this transaction
>  		 */
> -		pm_runtime_mark_last_busy(ctrl->dev);
>  		pm_runtime_put_autosuspend(ctrl->dev);
>  	}
>  	return ret;
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index ab344f7472f2..880cf3081a20 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -695,7 +695,6 @@ static int qcom_slim_resume(struct device *dev)
>  		dev_dbg(dev, "system resume");
>  		ret = qcom_slim_runtime_resume(dev);
>  		if (!ret) {
> -			pm_runtime_mark_last_busy(dev);
>  			pm_request_autosuspend(dev);
>  		}
>  		return ret;



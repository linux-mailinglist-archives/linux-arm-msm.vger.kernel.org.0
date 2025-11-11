Return-Path: <linux-arm-msm+bounces-81180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF4C4BBB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E48921895DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 06:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DF42874F1;
	Tue, 11 Nov 2025 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/9Z695/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CC1397;
	Tue, 11 Nov 2025 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843714; cv=none; b=BPX5v/CrG56u3nxxYLHXtidQTxou9cWz73OclhmOtIOe7+cqnNsLAf6t1YpoHElTsICR7N5rD96m2CaTCNUK5epvVsm5iYD+zFcapJxJT5+aaBkkFxapevmD70MvaDSRfktUoxBbg8ESSaTMyM4rZOsQnmdldPQYuZEB47Rb12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843714; c=relaxed/simple;
	bh=4C+8EMRFGmXN/EmKCh7BiBdlTLO4aRcFjnZETh4+L/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XR7hNu2ljrEp8Iqv5haNqZ6xg3SkQ4Y334C/SJ3C2Tq8KSUA3tPTNXDXb9Y7oecvrN0sv6GXvS6VLdEn7AtUliH97mAe2DnIk4cl+/Kxkfg3QXRdbA+hHR3tE6M2k51mR5lGjBrcjhfyxdqg28tKx6eWABI6sm3A9q9BvQpe4Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/9Z695/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC60C2BC86;
	Tue, 11 Nov 2025 06:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762843712;
	bh=4C+8EMRFGmXN/EmKCh7BiBdlTLO4aRcFjnZETh4+L/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/9Z695/h1Vh7gGYly5hPNWqg/W3FL8CFYgcouYTeOl1uNNVl88vpEKBfSqjy6JA4
	 HLLu3zJbFofCfhdBlWnQ+LOHdvbrt/dWdlHDyOkTyE4wQfiIHttCEzyn4xxiu53+9t
	 JrgveJWztbYbfuhf7EsHXzoAUXdVzsIAaCdnb3oU8SR8CyNj/RIitTSaCcXYzxJ48z
	 HlWh5VSu/Zn7bkpeCjcdtzFNgx1PbXxiRHxMmXPfP5aE+Wgk/H+Jz1PyYrBIDH4/d6
	 gIvFTx40CvpcJDlH2wXMGXtJeLbYj5oW0PeaUaIjEu3+ooHRAL5mVdm/CTPZtVzTy2
	 gzTky+hylRsUw==
Date: Tue, 11 Nov 2025 12:18:27 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] tee: qcom: initialize result before use in release worker
Message-ID: <aRLcO7dveqChPNb0@sumit-X1>
References: <20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 01:28:32PM -0800, Amirreza Zarrabi wrote:

For the subject prefix lets try to follow the directory structure:

tee: qcomtee: ...

> Initialize result to 0 so the error path doesn't read it
> uninitialized when the invoke fails. Fixes a Smatch warning.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650b5@oss.qualcomm.com/
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b6715ada7700..ecd04403591c 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -82,7 +82,7 @@ static void qcomtee_do_release_qtee_object(struct work_struct *work)
>  {
>  	struct qcomtee_object *object;
>  	struct qcomtee *qcomtee;
> -	int ret, result;
> +	int ret, result = 0;
>  

The change looks fine to me.

-Sumit

>  	/* RELEASE does not require any argument. */
>  	struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
> 
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251110-qcom-tee-fix-warning-3d58d74a22d8
> 
> Best regards,
> -- 
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 


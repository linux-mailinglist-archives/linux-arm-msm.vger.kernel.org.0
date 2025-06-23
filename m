Return-Path: <linux-arm-msm+bounces-62091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62704AE473E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30490189D11C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4383426B755;
	Mon, 23 Jun 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiQgFoRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635C26B751;
	Mon, 23 Jun 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689935; cv=none; b=Kv4l6tuV1mD0lyuCUVGZOykES6m05K8nck0vlUXFHE6je8lPtSgJnI64sIjpfC2BdSi60KIwykc9Ik7X/i00MA5LpEA2IYWSaWBdeRfLD5PuzOnVvVLyLeS7Xb5IvEcFB8i7nR74Dii0gsGzFSxEmIW9rqgPmvXW88fGp6uSLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689935; c=relaxed/simple;
	bh=BWNrsADcgYwZ2dvZXwG1N6G2J7mZGyjM3XJMSbDzw44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE0h+mKDeiwnlQRa84G6a3ObZneWyKAKWI+sMJT9o9I1xYlkr0S6vvp2/VkJSok4zvR/4GQvpQTRtudcVUN+BGIBor8WintgBMeOZCjhFxqpjpMERCMxDPVjw2POsHZkI5qwHkcgXSlNpU0lgKjNKjnbE6+r9qY5queSRGTp9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiQgFoRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADDEC4CEF1;
	Mon, 23 Jun 2025 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750689934;
	bh=BWNrsADcgYwZ2dvZXwG1N6G2J7mZGyjM3XJMSbDzw44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiQgFoRhJD/skmkSCiSbp8PcIJRnlwIFpnOpPNgOFONDQF5xzCKMu3/YOgz5i2ML1
	 CUvseUYm3azLa7D0nYVj2Hj7mYaZFzb5hDxSKrwE0akP0stAKxLyA9Tf02eDHUXX2H
	 caXb1D4Z9YG410lVECHcoVEuNUJF0YeSfTiAKYuFmqexPTzTwHw36bKW/UHhak6RwQ
	 4SysyGU2wnHcd8sQvX0M6UuzjgpbdecktL/s7PXLoQ+VxCJsqAdJSKmIJDBRsXV567
	 z2Uald1ms+kpHEp8h+PcX+ZQnMK3vT5WibcOWuzLDcKj1E+pPMANMrUWoOnvOwOmwK
	 c+XqQM6jvJMuA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTiQL-000000006Qw-1WSI;
	Mon, 23 Jun 2025 16:45:30 +0200
Date: Mon, 23 Jun 2025 16:45:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aFloifxONXnQbVg6@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 10:56:11PM +0300, Dmitry Baryshkov wrote:
> For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
> update variables in the permanent storage. However being able to read
> the vars is still useful as it allows us to get e.g. RTC offset.
> 
> Add a quirk for QSEECOM specifying that UEFI variables for this platform
> should be registered in read-only mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
>  include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
> --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> @@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
>  	return status;
>  }
>  
> +static const struct efivar_operations qcom_efivars_ro_ops = {
> +	.get_variable = qcuefi_get_variable,
> +	.get_next_variable = qcuefi_get_next_variable,
> +	.query_variable_info = qcuefi_query_variable_info,
> +};

It looks like the efivars implementation does not support read-only
efivars and this will lead to NULL pointer dereferences whenever you try
to write a variable.

Also not sure how useful it is to only be able to read variables,
including for the RTC where you'll end up with an RTC that's always
slightly off due to drift (even if you can set it when booting into
Windows or possibly from the UEFI setup).

Don't you have any SDAM blocks in the PMICs that you can use instead for
a proper functioning RTC on these machines?

Johan


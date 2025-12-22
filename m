Return-Path: <linux-arm-msm+bounces-86169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9962CD5417
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 413F03000E80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34E730BB9E;
	Mon, 22 Dec 2025 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpqO5ANb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8234238C3A;
	Mon, 22 Dec 2025 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394665; cv=none; b=ttgw138Imz85VWtd87Yb31k3KYC/FhuyGwHKxXlwD8M7m2JBlGbh/VuSW6hA8KJhIQivQJ6i/KlCMDUZux+acDENw2U80fCSEauFCgmDtSD3ECa2/pGDWhyCLFDn3HGaRUF7u6Hz0kSc2ZzoyxtGAeBZWBbA/pcNUueFWtlYBq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394665; c=relaxed/simple;
	bh=4+r8wRfI+RD0Q7YCd3mhZ0OI5JxMoeUUOk3a4DO8FMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITPbXB7jNJ2kRPFrDt5EtEwlTTuaEoITcqx+mYlNniOzMD+K4t8Ia+DeJbeUV6tvgVU/hPln526zCD/pImueBxXk04uQNL9VxKQXdUhf5cGSl+9LBwlt+THFCjkupMkgfAfioPgFp01bT6GxzdHL2e7ZekYTzGarvR/IYHDqYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpqO5ANb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1EDC4CEF1;
	Mon, 22 Dec 2025 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766394665;
	bh=4+r8wRfI+RD0Q7YCd3mhZ0OI5JxMoeUUOk3a4DO8FMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpqO5ANbb5/lslov44WB9/GEiXeXXaovBLvKt2rZggIbkJpx6VjvhZ99nhRP4Ow08
	 WYrK7m71h6yWnT4u7cVyf4Ut8YSqr6JEzh9Umjf7Z1xEN3Rig3XvecAmyqZkHgO3zJ
	 o6r4CBU1wISuN5E6f7rnyAmhSvcmXsTDHQdvSim3GpprJUe0QY8Sy7SqsopzuAjuSD
	 5FPMY5qItA1mtMIr+GtIh+V7zQgb/e04ZjHKH+XfUVZV7ngWVWk83iTlN0VZNvtRvk
	 yMNwN7VwNidR+lefgrrxhGTqiAMJSV/torT4PP/mNYD+IKKW0DcjkA09BVq6fqbtsJ
	 TKu2USNfaCnkw==
Date: Mon, 22 Dec 2025 10:11:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
Message-ID: <20251222-daffy-hummingbird-of-glamour-fb02d4@quoll>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-1-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222060335.3485729-1-yijie.yang@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 02:03:26PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.
> 
> Guarantee that subsystems relying on SCM services can access secure-world
> features. This change improves reliability and prevents missing functionality
> or boot-time issues by making service availability explicit.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 1a6f85e463e0..1fed7a81bd29 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2010,6 +2010,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "microsoft,romulus13", },
>  	{ .compatible = "microsoft,romulus15", },
>  	{ .compatible = "qcom,hamoa-iot-evk" },
> +	{ .compatible = "qcom,purwa-iot-evk" },

Why are you using ABI before documenting the ABI?

Best regards,
Krzysztof



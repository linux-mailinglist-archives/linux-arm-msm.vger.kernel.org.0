Return-Path: <linux-arm-msm+bounces-60537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2B6AD1087
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 02:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 645583AC4A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 00:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0173AA59;
	Sun,  8 Jun 2025 00:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBqnfaCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A82382;
	Sun,  8 Jun 2025 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749341639; cv=none; b=era6L9XdoTEx2uzalTjSPj+t5bPrTeP/drAV72I4J9u8MiJN18uYWZGY24ecWktFJ31PxMK7bsUYQoO8fOBthGGqppjNgn5XvCe9lHPBsM7mTCTCIJKtBU1Z6ovu9huBbuTEl77nbEA/bjDr8MGLJXLgHtXRESLGcnBE9OzbrFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749341639; c=relaxed/simple;
	bh=quZdiXcvNr3IBppY0g+Z1c7C/jdGgRtoRWBt5ZrMY5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYCBSknRhxenbFKIFweeou6ebBMCvPo1+CFiMX8lyOr4AAw1ABNiDmzqMePjCev7s1m58jbPGBzFrX1rqulL32iaUkcIAnqM9R/oTt4pK2xozQytOYCIf41q5TIAT7lCnYkhfO0kqXfJM7OarJR/SYkMJca5l8NUDYHBR4i7KFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBqnfaCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DFCC4CEE4;
	Sun,  8 Jun 2025 00:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749341639;
	bh=quZdiXcvNr3IBppY0g+Z1c7C/jdGgRtoRWBt5ZrMY5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBqnfaCO76quaRDAFJ/zY7KJKPGHXyxXmPOzQ917mWwC4jLmFf7+u7y2WRaoCpems
	 B9dT5/bv24LPrb+M8C7tXXqa4bLmCZp7x63KtU51b54wQWLRo3ZFTALPCMfuGTMdM4
	 WszzWfXZql6dFuelmbo8SErtO2zOTmRDT6HQZ5oBIRuS3bNk7055Sm1zIe+PxA7WJP
	 YErLjTVlrT7+KbXx3SfLW+1NHHSfzgG6yTyadcClVxvNCNYNhX6be/hA/VaIwWYjCe
	 WVtotFAzRo6g4PdrR5ZWcLt27ckdzfIfF6xv2uEqCg2r1hf4Ph60oxtNbGovQToqMu
	 ADgR88FmyYQ9A==
Date: Sat, 7 Jun 2025 19:13:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: quic_utiwari@quicinc.com
Cc: Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bartosz.golaszewski@linaro.org, quic_neersoni@quicinc.com
Subject: Re: [PATCH] crypto: qce - Add suspend and resume support
Message-ID: <6dfweyi65aoly24nhrq3dc5u3dpaqv4fhdwerc6axu63dkgltx@i5y7lptwnuwu>
References: <20250606105808.2119280-1-quic_utiwari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606105808.2119280-1-quic_utiwari@quicinc.com>

On Fri, Jun 06, 2025 at 04:28:08PM +0530, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> Add basic suspend and resume callbacks to the QCE platform driver to
> manage interconnect bandwidth during system sleep and wake-up cycles.

Please follow
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
and start your commit message with a problem description. Why do we want
to "manage interconnect bandwidth"?

> 
> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
> ---
>  drivers/crypto/qce/core.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index e95e84486d9a..2566bdad5d4a 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -249,6 +249,21 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	return devm_qce_register_algs(qce);
>  }
>  
> +static int qce_crypto_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct qce_device *qce = platform_get_drvdata(pdev);
> +
> +	return icc_set_bw(qce->mem_path, 0, 0);

Couldn't you be using icc_disable(); here?

> +}
> +
> +static int qce_crypto_resume(struct platform_device *pdev)
> +{
> +	struct qce_device *qce = platform_get_drvdata(pdev);
> +
> +	return icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
> +		QCE_DEFAULT_MEM_BANDWIDTH);

icc_enable();


That said, as already requested, please also drop these votes at runtime
when the block is unused.

> +}
> +
>  static const struct of_device_id qce_crypto_of_match[] = {
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> @@ -259,6 +274,8 @@ MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
>  
>  static struct platform_driver qce_crypto_driver = {
>  	.probe = qce_crypto_probe,
> +	.suspend = qce_crypto_suspend,
> +	.resume = qce_crypto_resume,

Please implement .driver.pm instead.

Regards,
Bjorn

>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qce_crypto_of_match,
> -- 
> 2.34.1
> 


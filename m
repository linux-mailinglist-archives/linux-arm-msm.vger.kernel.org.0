Return-Path: <linux-arm-msm+bounces-30467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C09694F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACBA2836C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D9A1D6C56;
	Tue,  3 Sep 2024 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS4BN3u4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B51D6786;
	Tue,  3 Sep 2024 07:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347633; cv=none; b=hwiiiP+XMdKXfwrVHrRkGOZx2lmDgdT1L2YmWiQ9DdBl+2y8Jqkjd2ea6nmMTbDETnmKZ1hgKAADpKsfifk9FRUxWGSXBvuIIr+RZR3aoSz1LqWgLzWyaekAjJ0QMHnPkmFdN8f8ke/yUbcbfEFzUACKBbQMNZOEbqwjq/Z4504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347633; c=relaxed/simple;
	bh=0Uy3vZt8qZjrD6E+O0S/4z71XOnTJ9DqHIMmIgPSwOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhqFtqW2Y+IaEoBwbZ3H47B7Etvuz8hdCCSgaPwmn2ZHw1fEOp4jK4Wac71ajfTJZoO3uEDVqv2xmCbBJtFHiG2F+zUwBRvmn14WPxhmirEZBa6G6pXkyvzbbJOn/pdKKkNWOQXLUPmnjwoTUN4EqrJUvIR4GUS02xpBJNYSZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS4BN3u4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97C4C4CEC5;
	Tue,  3 Sep 2024 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725347632;
	bh=0Uy3vZt8qZjrD6E+O0S/4z71XOnTJ9DqHIMmIgPSwOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZS4BN3u4K1biGvQRK+tKWHBJzpGz9UQzb2I0P++HT3bpUWtznxKIdLWww0jkKlMrg
	 foboshX4vxa1irJ+YktZMbyLfH8IvaDHZgIKjbiKK3GzLMWWhLREv4EaV1gL1M/13J
	 tZNagEeXCOdaLJfe28EYwODoQrWDys8IEq7Hs+f+t0l1Xd+px5t+IIgykTewPXlNWL
	 B+K54gozhJbpfpynp8eJO+/xw66cz+lwaFw3dV9Tgal2O7NnLNwWknu07sO/8Fozsi
	 jg7+lzVut3SgfOMDl66W9vkORgIaUac11fwEBeY+H4tJR5+ikI8i+fQ6a4UQfsVw7y
	 Vvt2thA75RE0A==
Date: Tue, 3 Sep 2024 09:13:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] soc: qcom: llcc: add errata to get bank num
Message-ID: <vtj5liux4hrb7je3ojnfyixor6sk2oy2p4nlvt2rgnzisjj773@ckyl7a2kpa62>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>

On Tue, Sep 03, 2024 at 02:21:31PM +0800, Jingyi Wang wrote:
> Use "num-banks" property to indicate the actual num of banks for
> errata.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 8fa4ffd3a9b5..3fb45e625d82 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -1275,12 +1275,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  		goto err;
>  	cfg = &cfgs->llcc_config[cfg_index];
>  
> -	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
> -	if (ret)
> -		goto err;
> +	if (unlikely(!of_property_read_u32(dev->of_node, "num-banks", &num_banks))) {

Drop unlikely.

> +		/* errata: get num of llcc banks. */

Huh? What?

> +	} else {
> +		ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
> +		if (ret)
> +			goto err;

Sorry, but what? You can read it from hardware, but you add DT property?
No, that's just wrong. Why commit msg explains nothing about reasons and
problem you are solving?

Best regards,
Krzysztof



Return-Path: <linux-arm-msm+bounces-41668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A36629EE05A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD27B1885FF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6DA204C22;
	Thu, 12 Dec 2024 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tT23hIpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88B25949C;
	Thu, 12 Dec 2024 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989216; cv=none; b=SIBQrDkvPHPd3PMzgCdB9wAeLcGP1w+o8v34URPKqX9HJ6YfQvsrUgWGRLpuwgJWDzy60SdD7rMzF3k5lND1gj7I0ACukRXQVV4bspMOVgryTWNPiuXa9gDAte1idmR8BBoBGu3KEYrRlg/z0mzB1HMTl4Kmzm5DAq/Y9E3VeYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989216; c=relaxed/simple;
	bh=Q6k8Hs03LaIo7faNDNXtidBSUYC4c/6GiFw4hUyWv3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D++9jPY1vwElp9iF3i3LHoxrp+2oApxmpg9GDF3DQX3UUFG4G61Qf+sclypGxz9ge51Y6B/JnhrnpBJnM4WygwPMpJvIvmYe1bZ+99+3dfaejzEN27wlGtwU28iYkdsS4jsAcqsfB3WiDbi0hQ8E28UxN6xzsm9VFQlArUDcZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tT23hIpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2447CC4CECE;
	Thu, 12 Dec 2024 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989216;
	bh=Q6k8Hs03LaIo7faNDNXtidBSUYC4c/6GiFw4hUyWv3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tT23hIpT30V9yfa80ppTZ2KXYRYao6mym8r6bSFRsU0omHxLbyPJlbYZfVVv8gTpB
	 kTZ6nYL//RVqY1R7LW8NyetuGG0je4qlrDBwWm9MGbg5UfHckrYDvFuf1aIuiRVRRQ
	 S8QiFsSWGlEEgq6cqVxz1oZ3q3Lk9ngAm5GB1+Ck1Ly+SQkXSaZ4MFEc7NG2TDbxlx
	 uUExGzOlxdZ3xXdPTbyEXp9vpaomhEEJT0fgYoe2r17CxFeNe5U7dAMtLlaU4dYBW2
	 9CFSG/WsSVE4PaRnzrnCaZJOdBj+Kvr3zq3UygkC+1pAJwvqwUaZMOycosCMAUyOhU
	 O2HmIsiOwDPuQ==
Date: Thu, 12 Dec 2024 08:40:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/14] ASoC: codecs: va-macro: add sm6115 compatible
Message-ID: <uyu6mogjouv3cghyuqtdf5saiyes7iokn6jjrhue5xgznq7bit@wcjxebmft3my>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-3-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212004727.2903846-3-alexey.klimov@linaro.org>

On Thu, Dec 12, 2024 at 12:47:15AM +0000, Alexey Klimov wrote:
> Add vamacro compatible for sm6115.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index c781da476240..443dd4dd9b19 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1722,6 +1722,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
>  
>  static const struct of_device_id va_macro_dt_match[] = {
>  	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
> +	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },

Looks comaptible with sm8450, so maybe should be made as compatible in
the bindings.

Best regards,
Krzysztof



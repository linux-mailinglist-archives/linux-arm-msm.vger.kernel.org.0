Return-Path: <linux-arm-msm+bounces-29733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55B9620F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C474F2847F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4831581F2;
	Wed, 28 Aug 2024 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuPBSddc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233761448E6;
	Wed, 28 Aug 2024 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829895; cv=none; b=B+kTQfZDpnJKn9HopZLY0HRkhELcbhpokRkpQ6gHTSMi8KzFWt5QEk9aTxDc/hu7G8KChzOZu4MJnt/g49wPPouXPfpVHk1b56HcBk4tNKgUU5XQd/3wU/hmA9fo1pHnmZNrwvgQnUgd6QjNDSWOC3HUWW5Tt8gwQhw3gd1CZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829895; c=relaxed/simple;
	bh=gUvxOg8CynttzZ5Za6ZfYLZiTiLrgHxxGSZumNJh++c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SddH5CmfyGfPh1RezKQtLWXJr78hpkCoos2rHm/Z/jscfKqR8P8dkbVWr0TBxpe6NcG/dI9Ohirg3SoMR5JAWR/NHf2U9QeS5ojFuW/C+d81TF56lQ/N0UhKzuJNAYUcsrq2ZGQSjq3oH8QEr0YG8dof4al1QIGdOMVYGQ11yIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuPBSddc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17233C4DDE0;
	Wed, 28 Aug 2024 07:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724829894;
	bh=gUvxOg8CynttzZ5Za6ZfYLZiTiLrgHxxGSZumNJh++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuPBSddcGwUqhyVUoKlQeXCm7qkbxtQbHNc1ElwXNAsqz/915jrqExjLjwSahLz9Q
	 A3ULxMgzJPiFfv8trn/1XQstPZxycCm/woGkd0IBUMKyVd5k7z+9wloI9zXwX6VBTK
	 jBQyYa57brQuFiOicUJeQUxNb8fHORgwrCexTJTj3Ggb/nYVGfk50+kfJWxlnt3BkQ
	 jFhTOFrJ81x+fS5qUWFBK79dk1PdWd2WuJIkaXwY3qn3Jlnz+co45AI8/V4c6CoWlt
	 jP8kd/y6jjR+u1+P+4TyhLGt3mYVTlnRtov8hM32y2T8U+w86wDEDLtcjhJkfmsDMn
	 +sZnNTugk33oQ==
Date: Wed, 28 Aug 2024 09:24:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, andersson@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mathieu.poirier@linaro.org, bartosz.golaszewski@linaro.or, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, quic_tengfan@quicinc.com, Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add QCS8300 remoteproc support
Message-ID: <udhf32bgdfw6kfqltd7qo7tvzv7fev4nvrwxwg3tnjnfjtb3md@oy6kd5jnsu3t>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
 <20240828030511.443605-3-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828030511.443605-3-quic_jingyw@quicinc.com>

On Wed, Aug 28, 2024 at 11:05:11AM +0800, Jingyi Wang wrote:
> Add support for PIL loading on ADSP, CDSP and GPDSP on QCS8300
> platform.
> 
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..368aa9cc0051 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -857,6 +857,58 @@ static const struct adsp_data sdm845_adsp_resource_init = {
>  	.ssctl_id = 0x14,
>  };
>  
> +static const struct adsp_data qcs8300_adsp_resource = {
> +	.crash_reason_smem = 423,

You just duplicate stuff. This is EXACTLY the same as SA8775p.

NAK.

Best regards,
Krzysztof



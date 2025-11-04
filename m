Return-Path: <linux-arm-msm+bounces-80342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87626C322EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 17:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76D8D4E58D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 16:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08840338928;
	Tue,  4 Nov 2025 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcBgnSw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD52561AA;
	Tue,  4 Nov 2025 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275546; cv=none; b=P+MMBbnTan74XZPNNSyUY82mZTVt7aYt8RGJEhy2So3unZk7WQFi7P+wWvKG7RbXPTyD3lpHyyyeQFBkcBsvfQky6qykixgPjchMAg+ca68WEcJZG6a+uFIJ8eIVDoVdoQecmAibsIaU+X7HAuBY6a80bvJAeRKuyHBt62JRcJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275546; c=relaxed/simple;
	bh=5OvhgX2ZcGJZgpWuKUOlu57Ix1dT2ZJ9FFr7fu9FnqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JX1Oo9y0uGEKXclquDjwsSJ8hH0A9YVNx3eJ1E/8ttbgl6mftmjz0gdCUCjU0SClLAiwk1CGF4/fdnaToaJ4yyinDpK52LAyzuj9a/+BdoPuyFadcm9A8Vog/+0NhlXF7O6FMA/uiwo1H4eV5nDMZw9QqyawMUyHHEKV5y2wUWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcBgnSw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDB5C4CEF7;
	Tue,  4 Nov 2025 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762275543;
	bh=5OvhgX2ZcGJZgpWuKUOlu57Ix1dT2ZJ9FFr7fu9FnqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JcBgnSw/dvvHQyJqEsR+k1Y+GMGvDHc/fGreeGgeNkyBht0e5vhEkY7CUjYeqU2M+
	 sFAScvFQJMEnet98BpcNkvIETvX1YZ65GXJs6C3DofODAWzp1OsYVFAbgZV+AcM4YX
	 SQQ4fYgR3aVWSSNQCwP3u3obCpdm+021o48Ll5JrOIgTTfQXiFYp1GBKXZx57BJAh/
	 ajueMAmAEjLZS5vVkgf6dMHlsMZfOtenipZEa3KZzswNvOP8H8aNtNbAfoKW9teDOL
	 YqezgTkpzuSZNe4kj7rio/BnlL1+YcgCzGmFGCcjCx/7CilI/VnacAlILw7tJDtHaJ
	 dWODRvBAJ/9LQ==
Message-ID: <ee324fd3-bd1b-4255-9899-a0e1a58ad1c2@kernel.org>
Date: Tue, 4 Nov 2025 16:58:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/14] firmware: qcom_scm: Remove redundant piece of
 code
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <hYkrnjg1UIGrFwo6STFGKeRf--qSPLYkFuXckQNSLhqo75WL969Gk2ZA_gwICZpY0aIMpTCt3WLrO_0aHhqWxA==@protonmail.internalid>
 <20251104-kvm_rproc_v6-v6-2-7017b0adc24e@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251104-kvm_rproc_v6-v6-2-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2025 07:35, Mukesh Ojha wrote:
> Remove some redundant piece of code to save some machine cycle.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..26969bcd763c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
>   	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> 
>   	ctx->ptr = NULL;
> -	ctx->phys = 0;
> -	ctx->size = 0;
>   }
>   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
> 
> 
> --
> 2.50.1
> 
> 

Please fix the commit log.

---
bod


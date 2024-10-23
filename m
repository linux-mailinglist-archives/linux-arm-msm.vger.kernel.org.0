Return-Path: <linux-arm-msm+bounces-35608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB159ACF77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 17:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ABA61C21EE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 15:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C131C876D;
	Wed, 23 Oct 2024 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csyVFXl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E98814658D;
	Wed, 23 Oct 2024 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698730; cv=none; b=foCF6IiNznVQmwAFjENDf27SDpQpGTgBcUawT05AhZp1d1SxV1L0Ndo4XwjxtH9ph87UW6nrR0v4kW+1srmXCusmSGuiXzEQ6sLXtkgI9vDX421gSYUgaQy2FJyV75D4+/TYArfcDuYuPqo61QvmHcGspMf4HlLd1lq6KHJmAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698730; c=relaxed/simple;
	bh=AV5H6hlJaONoA8nAGCTvlAiXR3Rc2bBojnFNOvSUClY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHlS1H60lJ2C0fDT1GrY0VHUhkZKHbtRwIxkEprIXCRi4EhigoGtYInIx3eKVWeDmwRg077xIEHXmiref9JbNhIHwspVLJvlD1bsLCRfkzRjS+M74GRThvG2ThAKLS9GD+BQxt3NM8L0d2TcsqCJY7J35MYMP7JCnNvVDEITRb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csyVFXl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E83EC4CEE5;
	Wed, 23 Oct 2024 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729698730;
	bh=AV5H6hlJaONoA8nAGCTvlAiXR3Rc2bBojnFNOvSUClY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csyVFXl+a9ST4pNz1CLX5BAdgkHbbkNAKXLPqWHSKWThEiQetm0UloKxGR15tXnoE
	 EHw6zTRxoAuprAeOUZHsjjn6+RlmjDHJyLeYT+AHXnbDJcoRS9vMAvW6Kpwqq2Cvih
	 IStNGPnHVAmmKi87DgWmo2uvCjIM51xNf1+hGhBVvPsHlKbGgkwAMVQItDU6fuwpj4
	 TwPafKb8i6mnK/xeRCUPGfsYTu3Hzd3TkmDJuDami0+L6N64nIQnkDUKqzIOlHGiGx
	 cZAIbgwYmuezJ0G1cZDENWIl0dJoLpbkfnqPo6JnaKexHQU3eDiSfARth9BPZa7qwT
	 a1LIKFNZWIOKQ==
Date: Wed, 23 Oct 2024 10:52:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V7 5/5] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <pdyy4zflklvi5syhwt3oklidq3mwizthds2td4qzglhhdulel5@337xsbehgdp3>
References: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
 <20240820055618.267554-6-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820055618.267554-6-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 11:26:18AM GMT, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone
> requires metadata size. With V2 cmd, pass metadata
> size as well.

Documentation says commit messages should be wrapped at 75 characters,
not 50...

Please improve the second sentence here, "v2 cmd" is coming out of
nowhere. Say that there is a new command with a size parameter added.

Is this operation available on all targets, or is it IPQ-specific?


I don't see the relationship between this patch and the cover letter
subject "remove unnecessary q6 clocks". Should this have been send on
its own?

> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> Changes in v7:
> 	- No changes.
> 	- Rebased on top of linux-next.
> 
> Changes in v6:
> 	- Rebased on linux-next
> 
> Changes in v5:
> 	- Rebased on linux-next
> 
> Changes in v4:
> 	- Rebased on linux-next
> 
>  drivers/firmware/qcom/qcom_scm.c | 8 ++++++++
>  drivers/firmware/qcom/qcom_scm.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e60bef68401c..aa559fd01932 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -607,6 +607,14 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  
>  	desc.args[1] = mdata_phys;
>  
> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					 QCOM_SCM_PAS_INIT_IMAGE_V2)) {
> +		desc.cmd = QCOM_SCM_PAS_INIT_IMAGE_V2;
> +		desc.arginfo =
> +			QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
> +		desc.args[2] = size;
> +	}
> +

Please avoid default initialization and then conditionally overwrite
parts of the values. Make a clear:

if (v2 availble) {
	prepare v2 request;
} else {
	prepare v1 request;
}

Regards,
Bjorn

>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 685b8f59e7a6..008b59cbad36 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -96,6 +96,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
>  
>  #define QCOM_SCM_SVC_PIL		0x02
>  #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
> +#define QCOM_SCM_PAS_INIT_IMAGE_V2	0x1a
>  #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
>  #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
> -- 
> 2.34.1
> 


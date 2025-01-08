Return-Path: <linux-arm-msm+bounces-44292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F6A0520B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00E051888BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8C9199934;
	Wed,  8 Jan 2025 04:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTadn/XI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5492B156653;
	Wed,  8 Jan 2025 04:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736309754; cv=none; b=hC20/pJ/xJbbDEdFAOb5OQAMdMSMA2YG/z0mk1Zl4Y7XIywXbUqJNt5L4CEb3BU19JhCinSc5JimvomUSs8oRh4U9Ie6ymDONAdqYKNyjhnp40WpWahPo+mQRDGduRfIzczynRn4ZnI/gfAuCONeg6gptPIDY1oXTdHHs3Z73zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736309754; c=relaxed/simple;
	bh=mSk7cKbdLBTb/D4RmI8Nugh9OzVNEUEZzE5MvGZv3RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6DjnwryHDX6tv/2mWy77I+js92GTOH6p1WAQvyjE7aKYjLdI4pmpmGnA01CkTUAkhkq/iu3EmeAJ6qoPe+lIciySPgxx3JDLtwIwvBoED10XI6mtdH3OR4Yh98dtd6ehBbFWaWAXLWSvsSZeMwSPr1mLY9aFF/ZBBl3nfRAUjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTadn/XI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD74C4CED0;
	Wed,  8 Jan 2025 04:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736309753;
	bh=mSk7cKbdLBTb/D4RmI8Nugh9OzVNEUEZzE5MvGZv3RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTadn/XIk1WkU1Mo1bIFQZQmRilh8EegoNRVAS8OtdIaK7U1DVE2uZ3XxAGTmboZa
	 mz2wnOqdJNgfblcUYym/eCsavsMKqtQgb5d5NmpY9wZWzpcZn4FJql7jQ8oltI4uxg
	 rSZ1goBMiHsjf2Q77Sm4ce/NqBe+Nn3ns2HboWHT4Y5OsHKAjGqiAbw55i1DCkx3Kh
	 C/p8VURUTajy7cnf5tp9vjVj6ogNv7+cyREGJa6NuIqYt+enez6dcSYHbFrT8i1/u/
	 CxG25SYLUdZAf/kadmzMuguf6YemB9fqBTi1pVoaee7uVp/x8bUBas49HQiQPsbocP
	 r4ljfJbAT6mVw==
Date: Tue, 7 Jan 2025 22:15:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mathieu.poirier@linaro.org, konradybcio@kernel.org, 
	quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <c2dnzfeeg6ohlfum3t473s52udjwtoypnnp5kqx7avpe7jd3ys@lhx4zsal2lms>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-2-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-2-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:40PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well. This new command is specific to IPQ5332 SoC.

But function 0x1a is reserved by TZ owners across the company, right?

> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 13 +++++++++++--
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 72bf87ddcd96..a713788926b0 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -580,8 +580,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	int ret;
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_PIL,
> -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
>  		.args[0] = peripheral,

The arginfo and args are tightly coupled, so I'd prefer if you move
assignment of args[0] with the assignment below (and yes duplicate it).

>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
> @@ -616,6 +614,17 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  
>  	desc.args[1] = mdata_phys;

I find this rather ugly as well, so please move (and duplicate this) as
well - so we get it all gathered in one (two) place(s).

>  
> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					 QCOM_SCM_PAS_INIT_IMAGE_V2)) {
> +		desc.cmd = QCOM_SCM_PAS_INIT_IMAGE_V2;
> +		desc.arginfo =
> +			QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);

Better leave this line unbroken.

Thanks,
Bjorn

> +		desc.args[2] = size;
> +	} else {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
> +		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
> +	}
> +
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index e36b2f67607f..9aad9f92517f 100644
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


Return-Path: <linux-arm-msm+bounces-87147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBECCED092
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 14:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A2FD3006A88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 13:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21FE237707;
	Thu,  1 Jan 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoljMy/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39342147F9;
	Thu,  1 Jan 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767273435; cv=none; b=Cn1dfaQ81/K+gaspdO/cQ9165VeZKOdm7yM6yt/tOnhODs32f+dJiChqTzw/ieB8OnMH+XE+RNmfP1zF3E1xg7+5Gw9LPVUxwpukIJJnV2dmjpd+K5IhBNP3dBgBas99tE40tnnccxO9LjUIwp198a2Bmg/BN8iUQtrJv0QzLTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767273435; c=relaxed/simple;
	bh=XPwd7bZcj7K3Ykbn0N5c99PceK+i+NQbGOjME60cYOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Itk3aK7adTVxHSU6PViTHvZ1RxPo1STddFXPrpgYtnHhsmMtB7mFBy547yehm3T7YPPeqoIlsNqBgSfjUe7+vEY7JPNEtok2r4H2fpe8+FXONQjaUvqQlkQQAgfwnusS21MLq2N+TDLL/VvscBHqJUkISSB4kywgPeIhaRprQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoljMy/i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0739DC4CEF7;
	Thu,  1 Jan 2026 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767273435;
	bh=XPwd7bZcj7K3Ykbn0N5c99PceK+i+NQbGOjME60cYOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IoljMy/iiqpVJbNfdLhRbsD2KIOv3zPZLaEZB+r3VBhVFPEdqg4YfSDwvObJWGNX+
	 1lwy4duI7JWIddxw+XUGvqx9guoZfEiFXY577ig170KOrOAdFpa2Pdm6kwXTwQ23qp
	 SLdbtlUhGQFYb2veOXEoxbx2cC14huE8+/RrHPEbN7FDRrfXJfSULEYI57QVKZkPoS
	 zU8HeLShsKFUra22RQcKQ2vpjNyOQ/age2Ej+KAGTuw0zNTMp/o/yBD5/loWuxiC0o
	 0I20AeNLdbdZ/QnRcjLRu2zhc9x86MlH9ySmIulxUAsl/USex68L2LuX5JWtPX1YjQ
	 H0WDuVC5W8f5g==
Message-ID: <df31119d-5c22-431e-a7f2-4ac1203de564@kernel.org>
Date: Thu, 1 Jan 2026 13:17:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] remoteproc: qcom_q6v5_mss: Introduce
 need_pas_mem_setup
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <LvsWZ4QELGdiRs6Uc59yfxVP5ivNsmFaPECgHjalUDIGFmynd4wdMTMDKnO9bNjJJVtFJ8VZfMSh8AZeYugm2Q==@protonmail.internalid>
 <20251231-mss-v3-1-f80e8fade9ec@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251231-mss-v3-1-f80e8fade9ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/12/2025 16:30, Barnabás Czémán wrote:
> Some platforms like MSM8953 and MSM8937 TZ needs to be
> informed of the modem start address and pas_id.
> Lets introduce need_pas_mem_setup flag for handle this case.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>   drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 91940977ca89..3c404118b322 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -162,6 +162,7 @@ struct rproc_hexagon_res {
>   	char **proxy_pd_names;
>   	int version;
>   	bool need_mem_protection;
> +	bool need_pas_mem_setup;
>   	bool has_alt_reset;
>   	bool has_mba_logs;
>   	bool has_spare_reg;
> @@ -240,6 +241,7 @@ struct q6v5 {
>   	struct qcom_sysmon *sysmon;
>   	struct platform_device *bam_dmux;
>   	bool need_mem_protection;
> +	bool need_pas_mem_setup;
>   	bool has_alt_reset;
>   	bool has_mba_logs;
>   	bool has_spare_reg;
> @@ -1441,7 +1443,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>   			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
>   	}
> 
> -	if (qproc->version == MSS_MSM8953) {
> +	if (qproc->need_pas_mem_setup) {
>   		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
>   		if (ret) {
>   			dev_err(qproc->dev,
> @@ -2224,6 +2226,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = true,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = true,
>   	.has_spare_reg = true,
> @@ -2253,6 +2256,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = true,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = true,
>   	.has_spare_reg = false,
> @@ -2285,6 +2289,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
>   			NULL
>   	},
>   	.need_mem_protection = true,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2321,6 +2326,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
>   			NULL
>   	},
>   	.need_mem_protection = true,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = true,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2353,6 +2359,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
>   			NULL
>   	},
>   	.need_mem_protection = true,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2392,6 +2399,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
>   			NULL
>   	},
>   	.need_mem_protection = true,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2427,6 +2435,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = false,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2473,6 +2482,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = false,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2509,6 +2519,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = false,
> +	.need_pas_mem_setup = true,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2562,6 +2573,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = false,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2600,6 +2612,7 @@ static const struct rproc_hexagon_res msm8226_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = false,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> @@ -2646,6 +2659,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
>   		NULL
>   	},
>   	.need_mem_protection = false,
> +	.need_pas_mem_setup = false,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,
>   	.has_spare_reg = false,
> 
> --
> 2.52.0
> 
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>


Return-Path: <linux-arm-msm+bounces-33198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731C9919F7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 21:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7351C21ABF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 19:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF253158D96;
	Sat,  5 Oct 2024 19:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="IB3zN+rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376F1552E0;
	Sat,  5 Oct 2024 19:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156923; cv=none; b=o16a3uGU9RM1iUXnppcKfSDGBR6uU7hJu4Tj2XQvnD3n4J5Rp2RdA/8DynfSSWb80AaZFHcEZdFxH8Kr1JVZ+GJXicmg5wRtWtOdbtofPboD/figMI7s4eE5PjohSeq0QjZfbMOmO8f1caICzcMi9GnxyDCyV+tMKVGHndWDzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156923; c=relaxed/simple;
	bh=xaOaZUUNu/2cKzFhHEZuppymP75/S+vDU5oM68JbR/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkwPTASYSALGiDnNwjtuBoqkTEyyym04Tt7aGc7OTK2NGAv+mD70n8LjXj7KD0axAdlCSYdvPAT+YdQP6nceB/EYja23Qwq/tWx5gWaBXFpJICTUsqz65d8HcAjgnVCDovdPSub88/TgrYWBzjvrxStl5z2l7IEDRLGiKEF0VuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=IB3zN+rw; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id xAXMsi9iVQxq2xAXNs5Dfa; Sat, 05 Oct 2024 21:34:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1728156840;
	bh=URfpVlk/V/gzKqgL5fzn/g7tj/hCt6Ng6C1qW+DS+mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=IB3zN+rw+HLZS2ou1MAi+HKi6PGppbtVR/lXcFQ65WVihhOO92pqBbk4PCrdaDELC
	 1SgzXam7DZAt+bkr1u3Q0ZmBUc/pJ9kCvflGgInhmiP2VWfCPFGXz8vUd/BIZCdROD
	 Jt99s4ETXV2UUNMHE1Mxga9dw6jEKMnBtX6qnwo8lf3fHBLx+0+SZTKPpyNuqAxR5G
	 sPSZZPyqTMInA/T/PhdINsZQsVBC6jUIXoxQdv9TBOG+U/aryTzf4WLrQduuNXdWl9
	 lUUCHHBHG3kwNBbEl+L6BcjsiiOmYn6MND2uOEO+0aKO/O5ZJDtHhli6WmJjkA+zwM
	 v1KavJOWELHUg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 05 Oct 2024 21:34:00 +0200
X-ME-IP: 90.11.132.44
Message-ID: <517d5373-592a-4a79-8c79-14226ceacbce@wanadoo.fr>
Date: Sat, 5 Oct 2024 21:33:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support for multiple ICE
 algorithms
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
 manivannan.sadhasivam@linaro.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
 Can Guo <quic_cang@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-4-quic_rdwivedi@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241005064307.18972-4-quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/10/2024 à 08:43, Ram Kumar Dwivedi a écrit :
> Add support for ICE algorithms for Qualcomm UFS V5.0 and above which
> uses a pool of crypto cores for TX stream (UFS Write – Encryption)
> and RX stream (UFS Read – Decryption).
> 
> Using these algorithms, crypto cores can be dynamically allocated
> to either RX stream or TX stream based on algorithm selected.
> Qualcomm UFS controller supports three ICE algorithms:
> Floor based algorithm, Static Algorithm and Instantaneous algorithm
> to share crypto cores between TX and RX stream.
> 
> Floor Based allocation is selected by default after power On or Reset.
> 
> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 232 ++++++++++++++++++++++++++++++++++++
>   drivers/ufs/host/ufs-qcom.h |  38 +++++-
>   2 files changed, 269 insertions(+), 1 deletion(-)

Hi,

a few nitpicks below.

> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 810e637047d0..c0ca835f13f3 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -105,6 +105,217 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>   }
>   
>   #ifdef CONFIG_SCSI_UFS_CRYPTO
> +/*
> + * Default overrides:
> + * There're 10 sets of settings for floor-based algorithm
> + */
> +static struct ice_alg2_config alg2_config[] = {

I think that this could easily be a const struct.

> +	{"G0", {5, 12, 0, 0, 32, 0}},
> +	{"G1", {12, 5, 32, 0, 0, 0}},
> +	{"G2", {6, 11, 4, 1, 32, 1}},
> +	{"G3", {6, 11, 7, 1, 32, 1}},
> +	{"G4", {7, 10, 11, 1, 32, 1}},
> +	{"G5", {7, 10, 14, 1, 32, 1}},
> +	{"G6", {8, 9, 18, 1, 32, 1}},
> +	{"G7", {9, 8, 21, 1, 32, 1}},
> +	{"G8", {10, 7, 24, 1, 32, 1}},
> +	{"G9", {10, 7, 32, 1, 32, 1}},
> +};
> +
> +/**

This does nor look like a kernel-doc. Just /* ?

> + * Refer struct ice_alg2_config
> + */
> +static inline void __get_alg2_grp_params(unsigned int *val, int *c, int *t)
> +{
> +	*c = ((val[0] << 8) | val[1] | (1 << 31));
> +	*t = ((val[2] << 24) | (val[3] << 16) | (val[4] << 8) | val[5]);
> +}

...

> +/**
> + * ufs_qcom_ice_config_alg2 - Floor based ICE algorithm
> + *
> + * @hba: host controller instance
> + * Return: zero for success and non-zero in case of a failure.
> + */
> +static int ufs_qcom_ice_config_alg2(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	unsigned int reg = REG_UFS_MEM_ICE_ALG2_NUM_CORE_0;
> +	/* 6 values for each group, refer struct ice_alg2_config */
> +	unsigned int override_val[ICE_ALG2_NUM_PARAMS];
> +	char name[8] = {0};
> +	int i, ret;
> +
> +	ufshcd_writel(hba, FLOOR_BASED_ALG2, REG_UFS_MEM_ICE_CONFIG);
> +	for (i = 0; i < ARRAY_SIZE(alg2_config); i++) {
> +		int core = 0, task = 0;
> +
> +		if (host->ice_conf) {
> +			snprintf(name, sizeof(name), "%s%d", "g", i);

Why not just "g%d"?

> +			ret = of_property_read_variable_u32_array(host->ice_conf,
> +								  name,
> +								  override_val,
> +								  ICE_ALG2_NUM_PARAMS,
> +								  ICE_ALG2_NUM_PARAMS);

...

CJ



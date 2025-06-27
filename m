Return-Path: <linux-arm-msm+bounces-62802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E1AEB992
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ABF71C4866C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5C62E2656;
	Fri, 27 Jun 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWQur51X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BAC2E2640
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033869; cv=none; b=tf/t2jHuMw0mjFUvd2fH1c4vdjAID+XmYpgcaaTEAEAsIcXnvGnuHH6NvID1FMdghj7U5izXQsV0qOF1kJ/2NvKNz/PpY4If7lmFg1t7U1vo9G+SGuhUxr02rC0dC2iHQHVJGsOqDYr9ich92wLqS8FQiM/Y12KOaINbXrm8ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033869; c=relaxed/simple;
	bh=zePCVTTZriTgcz2f7mmLaWQPErHg2B77GF7rKoYhp0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJ3Azgy6OxYVcxNT4RAvJOg4/VD87uxQpKtKaZzfyuF9SE0Rlueuzm4bKzqc2KrGplb1f1r56Jj2ZF1lWUZlXWk/dxV6ar6vRyoJL9oSNSESXJn4crDhuKS7CQnLAXsM3KUA9N6VdS9Eb8T+hOsnnklQkfn0oY6bY+YHEokiUP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWQur51X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCKL6009867
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnuTVnZvIjeAKToHVdITKy+P6wscFfw/rq7pHlMa5ys=; b=OWQur51XRMixVkrh
	PN/SU9qhFVHpmJ5y27FOrx87sLh9aMxyYGPaLpQjum7gla80uaPPdN+C5aiLB8Xo
	zTZ+vXobWVcetZbyq0k+PwF47epaaLAGjT+jQ8S7L9pRj9AT7G/Hs+NTek85iBQc
	c6qi+ulKDjnY9h1Um5u+xxrIhLqMOKFVErYP8yOZj0/SZf1o2MWQJeZHYL9pbe2n
	GDZxeg8dHYwQqAN8gbSir0cwaTLGS3SdERFt1tVcInoUco5w7Md+1xL/pf8hxAi1
	bbR4uRUPox+eGHSdvfepvfsgoZ2C3O4kJEHM8HwHkw0Y6k7b3KKPylzpx3vM+eXF
	pqeEvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgt7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:17:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso61055485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 07:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033866; x=1751638666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnuTVnZvIjeAKToHVdITKy+P6wscFfw/rq7pHlMa5ys=;
        b=bqti8amPTOnviGPSW6A2tF+me1FuvqDGULwIFRomSxgbBpCoeCs1iCnurbqa+KD0Zf
         kQwSjzepydMQrQYy/rUNUBwdBBD0x0+rAaqxMAJE3FixS3S57Mcf2StDCNtxY0JS5X8Q
         pk9XVrRuE1/y6SJF1FVTbnHAk2V1UHmO+Vo4POd/MkY7NCiIeCffnHcV8cicRfJwlZgh
         2CdpnOc1QP9z5x0JRIjZYdzpq9fRN4Oe0kDQlqEc3nPEeMGCcoIfsEHYo4AbgRezs1aj
         /BtjB79QLT73p+R6itDN2gRrZrXJw85iQIlwHX46Vg0hiXlF/xooTHpzNyXewsO6fH2e
         SiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPXRAikoriCwY0XqE9je2eOz5PtJStBXHaLCtWT96djIUOIui7f92VK5O1FmUHz6ghevFy1Mzqcma6j6uW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcr+8rpfiO7OHmansqim8qKGMWlurgn16CIgmsInqgsz7w5FAu
	PaDAlfsjP9W75ALpVVjzCCmROWWFyNL7YlPL2shBqDxfyU+r1VAKQ4OXDoK1d8ub2KE2zPaJrGT
	woM1qV6Dh1C+kn1gDt6YgRLok3jH9PS+TAPMdqWZL2X8sNISPCDgP1yJ77ksYMmxbUFGj
X-Gm-Gg: ASbGnctQQwHJSG3f27CgwyPBQpX9olAAy99BH7JTzPjU467AJpYhRCywmk/Lc7K+lNI
	mzdMVOwUNGKGnztvENFMyR0nXKW1cOnKqNh5qXSB+hLSAWNcQfl2p6CXutXfihqzCpiuns8BNgT
	d8BMG8sUXcXF0eNE0edgTXeQCekBpwcPCq+VKzbKTVIkhgWP8VUs3KonzMyMImDi32ZB0cKuPLv
	PIYnXTnfvNeIsc4g1D3CusLQuBqgG/Em5G3p9J9pjw9qOwOIRC2c+41L5zH5HBFYipnLkj9WJQO
	VMRU1T2H57I/sjQSRY6mNrAaPMdNnww20QHpj8vDhluyEVlwHRrnQNFaWk1dCwsDB8Z647pPQQa
	jk8k=
X-Received: by 2002:a05:620a:258c:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d443974057mr157243285a.7.1751033866050;
        Fri, 27 Jun 2025 07:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/yzL4fI1NfmfHkKWxrsKgcbCqgcKWs156oq8WGiMjD8v48UX287W+iIfE46rPYR0qqkS8WA==
X-Received: by 2002:a05:620a:258c:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d443974057mr157237785a.7.1751033864525;
        Fri, 27 Jun 2025 07:17:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a09bsm134701866b.58.2025.06.27.07.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:17:43 -0700 (PDT)
Message-ID: <4a438b20-efaa-48d0-a885-c64e664df9e2@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: llcc: Add per slice counter and common llcc
 slice descriptor
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: quic_satyap@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExOCBTYWx0ZWRfXyq4wKTWzATMY
 wmMROsxTcNKR2ni6MRB0sd6o17AFWkoEx9cacYxZm9AmtyLuD4NvBdSO8Ql6PRPMN8l6F5eEHjc
 63P+TlAONDFDVCrt4jMdxDmNaVsXwXztTzERYuLFv5tS47AxrlDD8wPbEwEQf+k6EnFHqDAeuP7
 b8UKEwQUDdJrfZG2IwHD+Xrf+KemE3bUPsF1ySOq/PUjrPQ6GiBCGUSx4PY+NAm/CitbEQFuc7R
 Ko5/Oie4BJtlFPQESKngOnVYWgF2fYMNOP9R/5zQ52yLh5JR/z8Z6TZ7Be1cngjKoPE9vHQ6O4G
 Emizx0L/nTj3lTLNQ28jDwybIjolilua5+H5CyGGf8wDk5ddSV1qb6yZ7n/ScZGkbUuGcAruwNH
 BF8eP1clkGOeTNkpgI31HpZzNBrHVU32+NIO7QIjRcT3XrHp0XIT7ugTB+SLzsWbI5EAJXo8
X-Proofpoint-ORIG-GUID: hNvIOs1ZXh0ts0UmZdCvGbyNo8xY36Pj
X-Proofpoint-GUID: hNvIOs1ZXh0ts0UmZdCvGbyNo8xY36Pj
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685ea80b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=YlwMA9enDdq0xxmC1vgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270118

On 6/27/25 12:03 AM, Unnathi Chalicheemala wrote:
> When a client driver calls llcc_slice_getd() multiple times or when
> multiple client drivers vote for the same slice, there can be mismatch
> in activate/deactivate count.
> 
> Add an atomic per-slice counter to track the number of
> llcc_slice_activate() and llcc_slice_deactivate() calls per slice.
> Also introduce a common LLCC slice descriptor to ensure consistent
> tracking of slice usage.
> 
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped bitmap as refcount is replacing it.
> - Modified commit message to explain problem first.
> - Moved NULL pointer checks to the beginning in llcc_slice_getd().
> - Replace incorrect usage of atomic_inc_return() with atomic_inc().
> - Use devm_kcalloc() to allocate memory for common slice descriptor.
> - Link to v1: https://lore.kernel.org/all/20241008194636.3075093-1-quic_uchalich@quicinc.com/
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 60 +++++++++++++++++++++-----------------
>  include/linux/soc/qcom/llcc-qcom.h |  6 ++--
>  2 files changed, 37 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 192edc3f64dc3eee12ab5ebdb9034cd0e2010891..b0cfdd30967a1a3390a9c0ef6bc01b333244884c 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -3853,30 +3853,25 @@ static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
>  struct llcc_slice_desc *llcc_slice_getd(u32 uid)
>  {
>  	const struct llcc_slice_config *cfg;
> -	struct llcc_slice_desc *desc;
>  	u32 sz, count;
>  
> -	if (IS_ERR(drv_data))
> +	if (IS_ERR(drv_data) || !drv_data)

IS_ERR_OR_NULL()

>  		return ERR_CAST(drv_data);
>  
> +	if (IS_ERR_OR_NULL(drv_data->desc) || !drv_data->cfg)
> +		return ERR_PTR(-ENODEV);
> +
>  	cfg = drv_data->cfg;
>  	sz = drv_data->cfg_size;
>  
> -	for (count = 0; cfg && count < sz; count++, cfg++)
> +	for (count = 0; count < sz; count++, cfg++)
>  		if (cfg->usecase_id == uid)
>  			break;
>  
> -	if (count == sz || !cfg)
> +	if (count == sz)
>  		return ERR_PTR(-ENODEV);
>  
> -	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> -	if (!desc)
> -		return ERR_PTR(-ENOMEM);
> -
> -	desc->slice_id = cfg->slice_id;
> -	desc->slice_size = cfg->max_cap;
> -
> -	return desc;

This hunk looks unrelated to the problem you described and could go
into a separate commit (can these ever reasonably be NULL, bar
programmer error?)

> +	return &drv_data->desc[count];

count is a poor name (especially since 'sz' holds the number of slices
we have), we can change it to just 'i' or something

>  }
>  EXPORT_SYMBOL_GPL(llcc_slice_getd);
>  
> @@ -3887,7 +3882,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_getd);
>  void llcc_slice_putd(struct llcc_slice_desc *desc)
>  {
>  	if (!IS_ERR_OR_NULL(desc))
> -		kfree(desc);
> +		WARN(atomic_read(&desc->refcount), " Slice %d is still active\n", desc->slice_id);
>  }
>  EXPORT_SYMBOL_GPL(llcc_slice_putd);
>  
> @@ -3963,7 +3958,8 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
>  		return -EINVAL;
>  
>  	mutex_lock(&drv_data->lock);
> -	if (test_bit(desc->slice_id, drv_data->bitmap)) {
> +	if ((atomic_read(&desc->refcount)) >= 1) {
> +		atomic_inc(&desc->refcount);

if (atomic_inc_return(&desc->refcount) > 1)

should do the same thing, in a single call.. but then you'd need
to roll back below on failure.. but then regmap should never fail
because it's just sugar syntax for MMIO accesses.. but then we've
had issues before when regmap core broke.. so many dillemas..

>  		mutex_unlock(&drv_data->lock);

You can also switch to scoped guards in a separate commit, which would
be a very welcome change

[...]

>  	if (config->activate_on_init) {
> -		desc.slice_id = config->slice_id;
> -		ret = llcc_slice_activate(&desc);
> +		desc = llcc_slice_getd(config->usecase_id);
> +		if (PTR_ERR_OR_ZERO(desc))
> +			return -EINVAL;

I don't think it can return a nullptr

Konrad


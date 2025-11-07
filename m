Return-Path: <linux-arm-msm+bounces-80735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA642C3F621
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427543ABCDC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7EC3019C0;
	Fri,  7 Nov 2025 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVqfRCZw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AngP2ziX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51527E04C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510651; cv=none; b=TgTJCNWcVv9TNDj9SUhqL7x1On0aSCgvE8A0GHdThA+cHbhXm7fMlQClJUJ8AywGvQZyx4W27yMTeXEPUz4J8rJKeSc8WTFK3O5vLw05CHYF374UGxbj9otpS0U9L9xrPvAkaNXZYWATzUSf2C+Lm/yFT8Si4F8wEkyekIDdS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510651; c=relaxed/simple;
	bh=2qs1VG1n9bjiENuAjdiCJJSJcQywxwAJEW6SFZp+G7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYuUn0MAQozd2ulDE8VG0TKEjK/HELFJ8Epg+Rk1CLw9Ciu23K5PiRTYxsbBZad1YbmnDj5QKWVuTmLA1ogTGFVoFevhY5uJWQmuJY2QcO/iBV0w8tcnhPsiah/tA9/Fgw1SJgM9hJwMZ6KhHCLqEaG1PWG9Ko/hhZFWO8m65Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVqfRCZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AngP2ziX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75OZMG566907
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VB0as2X5rpIdpcXtCyAvYkLDtHq+50iUEPo6nofU0HI=; b=RVqfRCZwtn03rQYw
	y1tVIWooVijUQhG+dkJdwmLnX130OlTFVOPw9wL5FA8dUGq0DWl/BF0RXbKseiYX
	yGDkrhtqhAZQygkom+Sfb2ndqg5iPHHcRV4XsSRoLmiDsFu1d59J7a5cHwccNUu2
	bhFfPQob8kwarW7UFGPqWRHuWDPmJK/7IPPrJ1omQIMfArGBy3UANVjDyF9uG9Po
	2kZTUKATVYi+uJSeB0co/uKZ4qDzyMvl1mlMOhNnKgZr267lYXRwx+Z3rmKK+n70
	5bnBAi+2vdlF8wgpErX2YNHV+gHnbGFw90XCG4B5yYkmUg8DkSX8SmPakVS6k17S
	++RNLw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qjkxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:17:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6a906c52so1556581cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510648; x=1763115448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VB0as2X5rpIdpcXtCyAvYkLDtHq+50iUEPo6nofU0HI=;
        b=AngP2ziXp0WuszhhiRiXvEmBitIH3u2icoTlDu1Z+9+ANzJ0asPI8JCq4W1+vFDI+1
         ZIz1cCCfDnaCekntEmIbICJBG5M1l7ZnVS8aaZf+dHs2ks+a4RbQmY3mBDoh9S5pYHmd
         ajbZR/+SRdtZ+xHAtxGzeTg8JTHklx6Bj4TnmRu+UFEJ4Sui70vEwoDRsuub62fguTND
         4D8EOQMEi38lo1Gq3NbFmJBmA4dQizS+yy6tv4rxj4ism/yoBCupYwEs5l1oJAhBrixW
         oWDYUJST98jIhlEiFcH5DeF4SDlJ3v5Wprdb4LpF6FpwTVJq7Jtlf1SQFZF0IqjdnMHq
         6VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510648; x=1763115448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VB0as2X5rpIdpcXtCyAvYkLDtHq+50iUEPo6nofU0HI=;
        b=ov1J0S5/QGC7NmaFIcYjkUfY31Z9Ua7x+pk+kl4e35+sWtuPJFkwLl0Q7TVoxvzWay
         83vJffgQuFOOFjTFMQMFVCylW3G5oZIDvRvTc37eD4TEzrO9DgTgtdTxU4NEy2EGIjQ8
         7PZGzQ0FLUTQ/vXrbKhkVATgds8SDlyCJiHGbgX13Uul0yAVNWbY6NeAPyNlNEFe8TPY
         3cRxar+aYbXWqO53M/YZiuZR2420Eb9HUu1DdyBEooQdDl+aUfaG4FOqMHIUqf//26zi
         QhZ7/b/nVNXJPHwHJWNhU8go9groE6p1hYU07TS/zzZMbPAFLyv6Juj2fcMwOFazJ6pD
         IPIA==
X-Gm-Message-State: AOJu0YywcDgBmgoPnLQysVFLLey5KCzfLF40Eyjq99DKQc7oXi3ttlBn
	qCyxVvL1fVbsBBwoaVgaL7wZg3PR9qH3pZPbSUhS20JwiPetXk/UZmc3ygFeCilsfJ1qA+JvI8s
	37n6L0b5hJJp+mHPq5KyCyuPUCohHsx482Lc/YS7aRBbd8Py4lgIZJyp6Nae47P4TPQYc
X-Gm-Gg: ASbGncvbFRRNQuRMdiT8CgDsXw3Tqq13O6lDEDFvS0HHQphY/OMhVPFzgvbuI8aqf5N
	xnhErVmcRSTY2wxqLNFHjEMAPjCSshzavb1IuT22juIU/nIVwHvWb9RPDAOmlfH7Ha4ccyfabVH
	atOpqj3/v4PwAlCx7ujw6clJIBvVQo+59qKZshevFfPQBZPs9W904ScwNvVLKf5eGZcLU69/w6b
	ZIfbehK8uJhDqdiTm26s9Tx22yb/PxlC938ByWog+tpRce8xK2Bksnh4IuevjFDd8GmulOP/Z6a
	oSZD1vuAfDwWBsNfBHwzz+xd4yoQuoP2aCSele9UVku1SOTnMmUlBjr2QVNfX5QPdDyvKvAdyRM
	B1SNgE72dDtg2FKk6pRYIkVp9rKs/GjWLadw9iSTMpzBb7Rc0d6+2enHd
X-Received: by 2002:a05:622a:15ce:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ed94a37e04mr19205161cf.8.1762510648400;
        Fri, 07 Nov 2025 02:17:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+bmYMl9sgolDCLtI/3Z/25Cac3Pm5sw0YnJKVwj4DCLlvp+FVu1J9wmfnutrUm1ga/1XlbQ==
X-Received: by 2002:a05:622a:15ce:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ed94a37e04mr19204671cf.8.1762510646566;
        Fri, 07 Nov 2025 02:17:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm3712122a12.11.2025.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:17:25 -0800 (PST)
Message-ID: <7a5d188d-989f-4843-a10d-0fbad94a9ef0@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:17:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-10-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-10-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cTHSaEfy4pw4P_FMuVdrdpMLtkuD3oP_
X-Proofpoint-GUID: cTHSaEfy4pw4P_FMuVdrdpMLtkuD3oP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX03Ux9uV2Mdo7
 X0VudRkR/1er840E3zMEXI+XfpY+WDcFLkh9S0AC1g1TBD7ZDjvwR64HgLDme7HsAtXLpgvPDpS
 GNyEriX4tMCWAZt2wMOu0SDnfBP7LyoIoUOoSKwZ123x/Qpc+zfSWRfxXmNUs5+pnb8epPXB0nF
 dohZYr9Z1wr3u4CCij42RQqIQHbpjskqH1seWQg9cjc/tBT0L6BBczE8268P0by4Vd+Asr7zsaa
 l2ZUQcP6HEF59jSoLJqTR1vyQviCMTZNv9hNAPiPG8LfpQ21H5LqvoX59E3f8fRPo8SO2JTihcM
 A1nvPO8X0xl2FSp3ZyutWeNOsBUCOieziqWN6CGDcwHCowAgx50t+dMJJwpzchZDqZVwbFfSVSU
 BnVrmQu7gS+fDqC+fq6UtxwgZyF4hg==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690dc739 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rBf8QGEbTI05NIq0_6IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070083

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> responsibility for creating the SHM bridge both for metadata (before
> calling qcom_scm_pas_init_image()) and for remoteproc memory (before
> calling qcom_scm_pas_auth_and_reset()). We have taken care the things
> required for qcom_scm_pas_auth_and_reset().
> 
> Lets put these awareness of above conditions into
> qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index aabdef295492..9d3e45ec73ac 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -625,6 +625,33 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *me
>  	return ret;
>  }
>  
> +static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> +					    const void *metadata, size_t size)
> +{
> +	struct qcom_scm_pas_metadata *mdt_ctx;
> +	struct qcom_scm_res res;
> +	phys_addr_t mdata_phys;
> +	void *mdata_buf;
> +	int ret;
> +
> +	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +	if (!mdata_buf)
> +		return -ENOMEM;

I'm still a little sour about this function having to be separate just
because we use a different allocator..

Did we conclude that using set_dma_ops(some_tzmem_ops) was not going to
work?

Konrad


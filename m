Return-Path: <linux-arm-msm+bounces-35964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A0A9B0DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080E21F247AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C7920D4F2;
	Fri, 25 Oct 2024 19:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuAK74Uy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8EA20BB24
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729882990; cv=none; b=fyb6WK2IqALlhil0kCQYvbF2MxjG7cZcjoQptvDEc+KDRJmoLWe0NcmVwutUvfdTpAX7njWXV86VnilGfSUuCSVAsWm2HHqPGSMnHfKi3Z0g85socKKL+3uVZOZDfJf6bLrbBqszbS3x5qSvjNR4aIZWlIbybqSuvFddKAKCz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729882990; c=relaxed/simple;
	bh=FyZnfFrKqDUkZoMJuDAW/enpzeoKc6kj37YA/BBSfSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlNUzuhgzZm98SvmCijcoXaL7UxA2sG+VAXlbuMQjbm7Gk8B+ardkfbBqMvCVLd5Wp8yYqaevFCWcf2i4vMkWiOVhmz4VGtxM8qvChUMyvSjkIDZrYVIyTNR7zZSCW4J9Jh7/c+UVsk9HpGTVoya/hbgQDd9DH/0WiOoeLbX+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuAK74Uy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAoXrq007689
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+FZUZZNLixikGGdE1Qm6JX9w5/tPIWWBM8H5e+9y4A=; b=PuAK74UyexXMlskV
	ckO24+UwVU8ItVJs37ajGJ27CtLY1R50lRaCDZlGYTVhuH8fyOhuaqLCVXFnQH9F
	uCLDpEYFhtbET5sIDgE+Dj53HcNhgrlmlGGKFsO3Qo6YnD0vbc9KkIOKdN5n/2XQ
	XxybXUmySmcJ9kbGxRNzjxF8nONz0yK6qZ+DJnIgRZirBMlW/e3eeroGv243h65h
	LEe9yNf/bsLXhz+9R0y7yenrczoA480kp9AaubQLeDc0koZ4V7Voz/oYG52vCroM
	wPxqjETutkhCfmWJ7GWKop0OYuB6oT+QmvcqjE0QS865mWriatLgKUWKdWz4ue9q
	GZm9Qg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g9x6hfe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:03:07 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7180917b56dso510969a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 12:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729882986; x=1730487786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+FZUZZNLixikGGdE1Qm6JX9w5/tPIWWBM8H5e+9y4A=;
        b=IJYg/l5Uewg+lHsjGnOku0WofV868jLANHVQ9Fjtn7E7OsyzGv1cKjv/i0j8lLVZGf
         CTMcEGbWgG69U0bd8iGaxi+HMQCVD4OrOSZjZnvrnzIOAzRctrtCbA527pz3nWvgs2S7
         D7jOepd5P+Gtdk6fSyBDTfW55F0UmB8XIa/jRg/i3RgAtNDzMMwhT2BjuP5+X9uG8yS3
         6pyKC/zXA9b4Q5kEbwV0Vip61qnTnMz8H2tqZ14Np7ll4AiFYx7hYgraknSgUy5nt0/I
         47tzUQ0jGZWmBdv9f7BzbfyBGGQCtqBTnfvs26eeDsJfyN/Vfc/5ODbKzXhhMh4hjy4K
         acGg==
X-Gm-Message-State: AOJu0YzrECyBxN59+Wb368ycjuFTP3vN6UJCb5l7KVcncDFFQ+dAfqNI
	czx0TN0KxauUm4RegPfZnmlIADe+ATZLHsJQBpCgPMuOvhO0hgrS/MUkwZWAp2mt40AZNmxFsub
	VNatwk6vykleuCacAbfQS5V3dWT9CzodNRXgDOEfU49QH+REqv5Rn74A54O/k41Rz
X-Received: by 2002:a54:4002:0:b0:3e2:9e00:5fd2 with SMTP id 5614622812f47-3e6384b5cc3mr105135b6e.7.1729882986188;
        Fri, 25 Oct 2024 12:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFROOfZDtFfyFTEvFLix5V9oTgyk1w4b15E9Y6n7jj7tYYo8LHGiuocblz0bZZYI/oVOtbjTA==
X-Received: by 2002:a54:4002:0:b0:3e2:9e00:5fd2 with SMTP id 5614622812f47-3e6384b5cc3mr105124b6e.7.1729882985710;
        Fri, 25 Oct 2024 12:03:05 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec8100sm98348866b.6.2024.10.25.12.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:03:04 -0700 (PDT)
Message-ID: <23f3558b-e620-437a-a014-0bf4e6efbb13@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 21:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] remoteproc: qcom: Add support of SHM bridge to enable
 memory protection
To: Mukesh Ojha <quic_mojha@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-6-quic_mojha@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241004212359.2263502-6-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HzJi_f2tQNc7jjIHsucKd2xFwF5ocJoO
X-Proofpoint-ORIG-GUID: HzJi_f2tQNc7jjIHsucKd2xFwF5ocJoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250146

On 4.10.2024 11:23 PM, Mukesh Ojha wrote:
> Qualcomm SoCs running with the Qualcomm EL2 hypervisor(QHEE) have been
> utilizing the Peripheral Authentication Service (PAS) from its TrustZone
> (TZ) firmware to securely authenticate and reset via sequence of SMC
> calls like qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> qcom_scm_pas_auth_and_reset().
> 
> Memory protection need to be enabled for both meta data memory region and
> remoteproc carveout memory region.

Will TZ refuse to start the remoteprocs if this is not the case?

> For memory passed to Qualcomm TrustZone, the memory should be part of
> SHM bridge memory. However, when QHEE is present, PAS SMC calls are
> getting trapped in QHEE, which create or gets memory from SHM bridge for
> both meta data memory and for remoteproc carve out regions before it get
> passed to TZ.  However, in absence of QHEE hypervisor, Linux need to
> create SHM bridge for both meta data in qcom_scm_pas_init_image() and
> for remoteproc memory before the call being made to
> qcom_scm_pas_auth_and_reset().
> 
> For qcom_scm_pas_init_image() call, metadata content need to be copied
> to the buffer allocated from SHM bridge before making the SMC call.
> 
> For qcom_scm_pas_auth_and_reset(), remoteproc memory region need to be
> protected and for that SHM bridge need to be created. Make
> qcom_tzmem_init_area() and qcom_tzmem_cleanup_area() exported symbol so
> that it could be used to create SHM bridge for remoteproc region.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c         | 29 +++++++++++-----
>  drivers/firmware/qcom/qcom_tzmem.c       | 14 +++-----
>  drivers/remoteproc/qcom_q6v5_pas.c       | 44 ++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h   |  1 +
>  include/linux/firmware/qcom/qcom_tzmem.h | 10 ++++++
>  5 files changed, 80 insertions(+), 18 deletions(-)

This changes files in two separate subsystems. That implies this
patch should be split in two. Or three.

> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..dafc07dc181f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -591,15 +591,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	 * data blob, so make sure it's physically contiguous, 4K aligned and
>  	 * non-cachable to avoid XPU violations.
>  	 *
> -	 * For PIL calls the hypervisor creates SHM Bridges for the blob
> -	 * buffers on behalf of Linux so we must not do it ourselves hence
> -	 * not using the TZMem allocator here.
> +	 * For PIL calls the hypervisor like Gunyah or older QHEE creates SHM
> +	 * Bridges for the blob buffers on behalf of Linux so we must not do it
> +	 * ourselves hence use TZMem allocator only when these hypervisors are
> +	 * not present.

This is a bit hard to read.. How about:

PIL calls require SHMBridge is set up for shared memory regions.
Qualcomm hypervisors (Gunyah, QHEE) already take care of this.
Only create new bridges if they're absent.

[...]

Konrad


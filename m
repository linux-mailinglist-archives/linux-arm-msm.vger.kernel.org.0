Return-Path: <linux-arm-msm+bounces-69175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE361B260E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F273BBCA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08E42D46D4;
	Thu, 14 Aug 2025 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVki3B+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222AC2BE7D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163433; cv=none; b=DOO2benOhJXOqDmegiCy7lIgbB7dWA16Jz95Twx0/NDf0+8wQG/n/plJ9SoXB/tU/6Q5ChBxDHj3486fgTrSKq1uTQVOtIHUPyER50K755BpjMrfoTq6gPbtMRhFVkkI0LypGohBdVnEcqc8RQT6sHmuBD2Kg4eR5J11IlNGOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163433; c=relaxed/simple;
	bh=Ej025DDeNf3Cgctpj8ZQbWDyl9ppZqFWLjssNKcysLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwu86+mTMOaT+KDfdLAt8II1hkaZ8bjW6J7BzbnJ2qXpLliBF66q2jeDm2pSRBiThYJvBUqTlsp5zxUoX+W5RHM4VCZPTZ5JMltZoQ9r0bvI2XJbBsDJWMHh3uvqaGOjonm9FNXhQW+8TzEMnqwuHAE6Qoj9SeTi0K77BBci5Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVki3B+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8ssDG020597
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rr8nJMfQPfH5v6BDXEA9yngasaki1qlI6+ZUchKQ1BU=; b=XVki3B+KzUIq1NxD
	+a3auLWmpQJUUl88yWV9KbFruKeA16xcU2n9N73EeExsQr2iz7EoVYBZuuLA0KhP
	JI3RujXwl58kln+zzuBB9PtU3AHLxNOcMTTp1wD0iim/iQmpS9t+xWxt79F4M/Lb
	9S0vR4yWwuqS52/9FkxBsEBGEZdsWiNdbtrSnRFQzwBEdpITlkEXaS58niLu6P13
	K5N+k6BPK/4QHwHDLONHUU5VLaEcgEo3bFlYBq3Bt3idxIKnIi943E6YMgxog5I8
	aldTwaVcXPLBeuo/ykJQsJltZYbBBzZk07dJgZHgXsg4VXzxlVDuyxHbjoo4eBcU
	zAC+qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmf3sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:23:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109adce15so2838641cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163430; x=1755768230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr8nJMfQPfH5v6BDXEA9yngasaki1qlI6+ZUchKQ1BU=;
        b=SPRnp35TR6OXRDE7E8gVcFopo94Mz5/JNfTwZJHWrCS5hy4cHz3Kt9sY0U9BPv08Hu
         GYRqMIm4gqMBObpQeM+mFvidN6ejfMn+V4NbsSitS0AFyvI4k6JE4uaOZON1q/O8GaAr
         kFloFZHfkUGkt01VH8hfcBdhn5Iy90AGI+Kl9Im41ojAdouQFGz0EZJtXM2dLe7ygRoa
         bqwI9SAp62zp/WPPI8uHk3OkT1kxaDb1Mh1byAlVK0kusL/QZFTZayj2ptZ3RDdM84ZO
         KiDJpExgrg+jKSeOv03m7O5kQyOA8gYzQYhPYjdh2wVKPnOA/0OFfzk56SQ7/PeX9oxx
         JQog==
X-Gm-Message-State: AOJu0Yw99nx59wh1/ugvXCvlQxQE1UkXYOmGfefwUxFSib38/qMwtHtI
	hi3CHc9r4il96yvi2aibNWItehl2EI7wOV40B1L5RMbGFNnY8DxuspPQKZdwuhnYyEVECpDVK+M
	0kLSZVIdk1lOaK/p/t3sVsjRxB9IZRYIcA1zI4UaZE5Gzppws7mguOr3C7nlfhTsngjbq
X-Gm-Gg: ASbGncsBtXB6HG2lHJkxks0eY3hTE1uTVPnDta4vy43AlukRw8mbrht3gzxIhzjHfnP
	n2qEPV/o/kn4/Ghq1q1Drm+xNUwr1M3uuUGtkEhDWxHfJEODqsnuZvmPkRaIJkZviUeEdioQPqE
	rusoVkTjruB1UiLCrvMxT7GRfDrlhYPkEN+YQBJMV+y/5286/vYF15DfG6aIGnk3xnY4YxVLu1L
	UJJqyvQIr1B2ld6yNBQ8tUNPHaKzsYridhjpEHpPvPtGo9ORV7yo48aZq1nAJ8GHrn2bVuUlhKC
	HSc4TD3sxE93bzJx3F8S7LicW5CJ4tUntspR2E3Ty99N5/MQVG0zKfyNEqVoH83lNtelXDCfMGT
	eyIIOtD9pbSLRUHyWRw==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id d75a77b69052e-4b10ab40660mr16148801cf.11.1755163430123;
        Thu, 14 Aug 2025 02:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEmqdtGcjWlowhifxBpEnAQnNU5How2ZYW9ypeoFFwgzTxDN1AK/KzEpZK/3H7HMSaNxTjIQ==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id d75a77b69052e-4b10ab40660mr16148641cf.11.1755163429567;
        Thu, 14 Aug 2025 02:23:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07670bsm2574670766b.8.2025.08.14.02.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:23:49 -0700 (PDT)
Message-ID: <5fd77c1c-ffb3-4413-929a-36437b170591@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:23:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: ubwc: use no-uwbc config for MSM8917
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-1-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-1-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX8BzypqusFfwh
 I5WS3DN91VOcfkcSXJN+NPzcGG3cOUz3CWKukFTGwkgY6qIq78+xd7p+Bx5Nf8e+3Px50Qeuzl6
 NK8JZAX2YQ2VQ8w663FnKbQBSAr6Ud3fCf3IltCSZtZe3Ivjo0wSrpJ8EFHonCuMcNqYLdeSedi
 gWMQStzAGGT42e0uTlnELwaGcbXhFMxneArREBsnTl141gccaa2fMQqolfMCLa8H8pfYDgKKmrj
 1p9hJUD+hdBt1896F6HqwuhfkAUDKvHcUib2tkaPWOpjXABToMHa+uKPJ+jyd9pQ1pU/Tfit0NE
 urAB4rtdL5lbcHKOKmVEa/928gz7hMJW77itGz37Af8eJPgWGbekt5QyXgBLt2z4i0ms9JJ6A0j
 GgvvFiVA
X-Proofpoint-GUID: T4UKh8GoCYHKRkE1LPfM3TWXU_rNJsvt
X-Proofpoint-ORIG-GUID: T4UKh8GoCYHKRkE1LPfM3TWXU_rNJsvt
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689dab26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8
 a=GOBAdVRHtaGIiaGvnzsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> MSM8917 has MDSS 1.15 and Adreno 308, neither of which support UBWC.
> Change UBWC configuration to point out that UBWC is not supported on
> this platform.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..5113c2902bf2ba3711bb14b35bbbb8a2b49b8cfe 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -225,7 +225,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
>  	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> -	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-mdss.dtsi#93

&mdss_rotator {
	/delete-property/ qcom,mdss-has-ubwc;
};

argh! thanks for catching that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


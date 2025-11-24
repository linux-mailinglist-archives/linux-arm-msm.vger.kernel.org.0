Return-Path: <linux-arm-msm+bounces-83050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BDC8036E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EAE35341A13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D422FC897;
	Mon, 24 Nov 2025 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKUl9il+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3bJvgCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CA2FB962
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983914; cv=none; b=tJYLhSdxrw/RGpd9wPO1q943xswAAurhRR0E5sVuoeS6S7M5PIr6jgDkgbpSlm7Nke7risDIK+Haek5OSdPUJZCQ8w/Jw3jeN5OIeP44Oi5sxGf2l8lQiApKQcyOo4lFbjYqt50jhBaIcAzNfOrmYNl9Lj08IxdHNgLKc7P1KQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983914; c=relaxed/simple;
	bh=POgvD532Psv8/4iElHJei5dmrqieujOLDI0+1ls8BCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TW4zUafMKwh0OVtcFun7GWRMtVwZNk1895dOFTr9NwP8LMw6+ko3UBWC+kUdjPhqSnMEmI0uFgXezZg3gTGroJh/avuT7fMRmx1urTcdKjZgHU/mPg5aUbfcgrwKkYVL/IdfoLr0qMBpZxXcrczqPYUophJ3kiaBAsc3/TdFXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKUl9il+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3bJvgCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO7T9fh3112009
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0m+PkJu4/Z834m2Gn1mfXXSme7MGZJ5oYLAYQ+0JQ9M=; b=lKUl9il+SgN6fbEG
	yxuPfkhclWzryU2RWZmyLi8dEmmsE8/INCMG6ErUl32hkogt2RDaOJFN5fL2BhDb
	24M35ZeM3vJCc0q8vuLVQMwJfTpwBi1zHTcOAOQMWtIxyB2mbQrZeD0G96T466f3
	RX6EmUdhlBAVErxHGBOxOPyCg6yQCbM2SQLndfpMcmaJ5TUR6BnfI2U8xAFsEpsN
	oOSfMFofAmYRx7yNDWoz5dC5o/48ikOdtV7IeeTSLURrSggIb0pAx+lmMhwPxj6B
	TRfHIHzkuJViye8dM7bsdNMxlovurd4t5a8lXtDqwwdSmCh2x20iGx9cLjYgxzW3
	WuIqXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amk10gqnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:31:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2fd6ec16aso96183885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763983911; x=1764588711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0m+PkJu4/Z834m2Gn1mfXXSme7MGZJ5oYLAYQ+0JQ9M=;
        b=G3bJvgCJnSAwuYp7T9NQbKW78gkYSkon3nSyD5mUfuJMp1NMNCZ6cASSOzBZqAiTMe
         CnKuHuukU1FLA9wmefta4+3dLpuN/Mk/yy7EGBYaqrtvxZTB0wi1dTzHFfALypDIGi/v
         zqFggEZAKAutSWDh5Tjoiw9V74K+eJIX7MTggLjC78wZYyvlBQjUCIwT86Wi0BIFWfTP
         6td01w9KL1zacwdmVfJ2qf7f1MDz5Zh8e8IrA/+5LupJlW/6MSY6N0CktvaTWn0qZr49
         4So5SbqI6gphfDVvgSAqy7Vu1qXffs/9sFYfkgz1L6YoG/vBePf9FTmFceZWZK0IUM6A
         DUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983911; x=1764588711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m+PkJu4/Z834m2Gn1mfXXSme7MGZJ5oYLAYQ+0JQ9M=;
        b=Q50GSWQJZn3JTb9hd3HdvUYX1XBzyRRDnoO5mmZFfb1ILuQCopFoSTEud+fZFq9T80
         gMDpMB2EkL8DPg/Ivz+mfF1jFASoq1JxfFg2lskMfrI8MrglmCdhzowjwJ8VlDdqd/Fx
         Evl7FIUmqAoaqeMQIsJ645HntnYhm1HClsPsDIM9Ducea1uZ7Y+PXo+peML0yws9lf7s
         b3DYIBO2idH0+mjZk7eP3OGsQjA81RdaF1GC/wwUIrwqjo7gYFTuMqI4HcDGQw9f1n7w
         SxcQzzUEmBiy0ZOGXqO83MiAoo8HY0GTAZDgQya9vrN9paBeao4nOuU3oP8LXadyev+A
         OHVQ==
X-Gm-Message-State: AOJu0YwD54H5CyGHbSGRxatrNNM63eVFhqSESkcIoJBrUHEWdmHL4H+8
	xhrFV37/ulOfKz/4SJTWUX9CgHrby6hW/IGvGlI8MyiLrX+m/HwmJ1ZwvyinWULlyE8+pvQmSJ1
	/8AGegi3dOd7ntqEFuHadCo20Lc5w5/0s7VAKpfjrcUmPfOBmWkO+WKJhIb1QVXe+xlAd
X-Gm-Gg: ASbGnculbphlaM9ye7kLTlpYMr7nmqUJeVytNmGLFR17lb7eu4t0N9bVxt1gvxEbUbB
	OxhTsFfdC7Lr9nLCunN3bBZpEXlPY8AG4EdxDfKhR9NqIkoKNISNzxN6Lec1OnC0vD4TQ3MSo8F
	3PbNxv0M2aoQPZGbRvkL1i0VyswGpy2kYaAKltCFHQU0XjBQbWC5DPixxvlJFumKji0RHyhc7p3
	a3mZ2EtDg8WEpbm1E3qozd2olVE62UBYK4fT6fdyFbyLobR1qKbga/je+EjMZZQnSV+yFwYzlxD
	ipzKoW0pcJKKhF+QC5tQ1xeU7+VdJHOpptfcHLeMZNviExXud0qctEsudw9LI+wK3CZmZxswu85
	BSHN1peyFOfvMvU1WcGFBumAIy828ndc4Mb18/kZ0fk3Vs3xuXXNeVCfhJEAwZLr69zE=
X-Received: by 2002:a05:622a:284:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee5b764240mr104467461cf.5.1763983910763;
        Mon, 24 Nov 2025 03:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ2vguzLUn0pa+csYBEUVfXDooRIujsUhiPcLX4A8hVoX6JZU9DMDYNwgT0GK1SHuFpGTYvQ==
X-Received: by 2002:a05:622a:284:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee5b764240mr104467211cf.5.1763983910281;
        Mon, 24 Nov 2025 03:31:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdabd0sm1248373166b.12.2025.11.24.03.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:31:49 -0800 (PST)
Message-ID: <d7342610-c37b-4f5e-a2bc-1a683f9acf97@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
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
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SBsgs5bbISy9X7hIws9dSOJ-IB5UASOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMiBTYWx0ZWRfX9eWfzUBobasG
 EJPoh8OYZrLffIBoIT7zMoXjvXTHYfywKobhwJn5p+hpalO0zMOn6ExDr/iC+6KzbMVP2j2fbeA
 GWQM5sXEYV4V+zu7JQIp7cwS44NloEy+jLxYCGyieVaHvihsmvTPN2WahF5upF25Ci57JxccVtt
 SRUbV65HmaAZl/zUm+0latIJ4mj1hrOQN9uGjbmoEX+1C0MdQ6aw4a5FB7jiC2OjJEdmmAMWSRG
 WzaPovXDFcJ0fnkSnlcEhW6aE9y4xjcT0SBoS6AwTKpL00sX2s/wt7YCXMWNPXu7j/xpazTwCAd
 LG6B/82WuSJPXydUP/gas0SHQKmhvNdimmLyi90vqcc1l/2DfMDYWeLXbpnEAh+aMlTTlex53Ly
 gAWHJAKuU4QjaIdVbu1gbTNBhkJiPA==
X-Proofpoint-ORIG-GUID: SBsgs5bbISy9X7hIws9dSOJ-IB5UASOJ
X-Authority-Analysis: v=2.4 cv=SP9PlevH c=1 sm=1 tr=0 ts=69244227 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BNBRsNz8S9qWWGfTIFwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240102

On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor, which typically
> handles IOMMU configuration. This includes mapping memory regions and
> device memory resources for remote processors by intercepting
> qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> during teardown. Additionally, SHM bridge setup is required to enable
> memory protection for both remoteproc metadata and its memory regions.
> When the aforementioned hypervisor is absent, the operating system must
> perform these configurations instead.
> 
> When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> own device tree overlay file that specifies the firmware stream ID now
> managed by Linux for a particular remote processor. If the iommus
> property is specified in the remoteproc device tree node, it indicates
> that IOMMU configuration must be handled by Linux. In this case, the
> has_iommu flag is set for the remote processor, which ensures that the
> resource table, carveouts, and SHM bridge are properly configured before
> memory is passed to TrustZone for authentication. Otherwise, the
> has_iommu flag remains unset, which indicates default behavior.
> 
> Enables Secure PAS support for remote processors when IOMMU configuration
> is managed by Linux.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +	pas->pas_ctx->has_iommu = rproc->has_iommu;
> +	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;

Sorry if we've been there before, but I see that IOMMU-mapping happens
before ctx initialization.. can we drop this parameter and just use
device_iommu_mapped(ctx->dev) in qcom_scm_pas_prepare_and_auth_reset()?


Return-Path: <linux-arm-msm+bounces-81391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27986C51D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6B324ED4A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8C830748A;
	Wed, 12 Nov 2025 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlTfbT+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtISGwLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8863054C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944969; cv=none; b=TvGgZMuj8K7d9gFZxKaEm/LyT+c70zVZSasvs9kHrl6LmKEu9TMWKJ/NacCWjGGDYmrFy5QRuFYEZ0RvWWN8WGsE+R0mm8U6ddDU73JiWhBvKlECJ1htKbRV6H/qw6rR/fePYZ+4iFA1lGm/l07eBWqKOdnB9duG16HR1jflOcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944969; c=relaxed/simple;
	bh=ZzpEI9WgfiZ5kliVes5Y9Jfc8V8uQhcrISym6yczJ2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvMO+b2bwmjaL8j7EPEfMFrZFglrpME8ou6gAuJx8t62Afq8snhaHFlseJuEs3fKfZCzhzUrkExJ6zo+8yg+EhbrCfThrXm4n/op6asHE5cPyULuEWWNBhuEMBSGvr6bqBpHQvaETqqmfccQnOT3kTjsUEa5d/D8B/4739zBm90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlTfbT+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtISGwLA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9csCC4077274
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=; b=YlTfbT+TpP6Q//J2
	88dZBFYjCM7mJWQbvLvCgNBnt79B1djKmdfOGuzl/+iuS3qaHSbgt8nZm9geeWJM
	EwucGUm3IpaplnqdDfeWTdrpoCVvJeAa0SlphjJx/CipbmbNbfOWCvoG9sMatwTH
	tHQ/dxIhZuY1GhAaGECAtuO+JzvLQACttntfzqIZC7a19Cw7Bzvqfd0Re5N1viYa
	OGTENQuDwMfZhdelpH3rWa43UBIvTuMqKThNYEGIjsZjkllXWb++ZOtls0/VL7U2
	NUr1jhbOIGY/esw833NUGvru2Hdy5K62Xkeftl/wTpZSV2SxrX/ssMhfqEsxgAec
	VRvoBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acguahj97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:56:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso2606181cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762944965; x=1763549765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=;
        b=jtISGwLAumaL3cq/Xvoi3TWYMeYMkMJQ+webV257MiqHE1m6pJwvvP7b2cz7ifbjGT
         pMWNRUXleQnDf7OMXfvAu+VT05Ki9ihhk4PRGCgfs1tCLv8MvbU8NO9RzvLu0OQOhO1W
         kSKHSjIcIyrWSMkB1N2PQm0/xx1s7CRY4E6U2fdCIYMG9pmX/zFpfxrPRKPoEYK8imaX
         /DYQhqzZHlp7RQAU1lmHwUW9yXyGBm3iVPWLgrheq870MwIUYKZ+PiQ2sIMt+TiX0PNa
         Ksnn3g/JIRCi2zVjTNx3ygED099EpRyY1JGkPVoef0U9Cp1SulV028ckMY5nTXZZiSm3
         PVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762944965; x=1763549765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=;
        b=YJ6pmksUPJDVO69UOFGA31AkH8Lg5wWiUmiA7vPrBqMFCiIYXYav5NmXIo3M60wzKK
         PAr+qbfWaxynFhHIUeHKVDWm699ccb8geD4UnYcwShCLAUK3k1aoVeJwCtxwk2WxgkJ6
         dmejnELXcd/De7aNNowXWOb5/zHO5UD7YzudppnagfdhjoWrgyfjCTVRRoke5BIURvXd
         38dL/+MLw1ZTwyV6kxUH2n7APAmcWq5j8k+RkvQBAEYIboLWYXMF0S15uW2+hOuLaiPo
         HcJJ6j9YOXMZdls5O1LQBqN3hOlxHODtev9sPrnBZ+4WRrqIxKtdI49oDt1YvWDxUzWz
         h1+A==
X-Gm-Message-State: AOJu0YyNRFaN/6BhL5tk++tiTra8sXL5DSEFYvTHSsmp5k4IGxsbfOVg
	Pfnu5qE+ve4B/B/OC+LkRwben7HM38Dy/bn6TOeX9cURtxHDIXugYbB/oO6YZ2OEMrF091EpwX4
	k4bv11AfRFgnJ0KIxzmo+cSQMi7RQtns4L0FplfGRU08A3HbjrKJGjNLhosWORbWjKBp9
X-Gm-Gg: ASbGnct0vuUiOR7k3HKOzIEe1UJis1mNvSIcrwKDNlzEuQRhc5PI9zxhRY6L2ykVCPc
	/anCc1OeMaQwk/fNB5t0Q2KrJqB3/IzvWZw8ESVsgQCyxLfHJAOB+FnK11JDqJoFUysqUMQWr+V
	5Gx45jgGHSDs6QzofixBX0iFDSN73y0oM0CJdXRssanYNUv13MRFnx4KyE8HwyZP9HRBPvI3nIO
	lIZVmzxDO15E0j9V8eKJC+QpsGlj/a2zUBh+qBR0LOZKD83I8EW6bqHcqFeI0v4GyKa3IivbhHC
	nrJ6TyOC+INPRa11ak49xdB0bITiBRqEd6+OEQ5q5kbDaaM/GAvP02dKckkgHJga05FQXkxCV7K
	Q5G3IEhlkCZ0WsdmU/1YeqxKnED6tzfKmbRzn7tp7igHgwncELFCha3vL
X-Received: by 2002:a05:622a:5d12:b0:4ed:de8b:4436 with SMTP id d75a77b69052e-4edde8b4640mr9664871cf.12.1762944965479;
        Wed, 12 Nov 2025 02:56:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHehnHC4uvc/Oy+HlpbxtFmbNd/Io3lA6JdYlICTyBqU+FS0kyknsLAZ4U0LhGMGqz+5Q6+5A==
X-Received: by 2002:a05:622a:5d12:b0:4ed:de8b:4436 with SMTP id d75a77b69052e-4edde8b4640mr9664541cf.12.1762944965047;
        Wed, 12 Nov 2025 02:56:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73381dd3besm103142666b.43.2025.11.12.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:56:04 -0800 (PST)
Message-ID: <8f1caccc-8a49-4c26-aeb4-f46f81593a30@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:56:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] drm/msm/a6xx: Rebase GMU register offsets
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hq8L7QehytYaN2OxDncGFrQ0bjqRXf9O
X-Authority-Analysis: v=2.4 cv=ao2/yCZV c=1 sm=1 tr=0 ts=691467c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LTedVN9yYKzQwah-PCsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hq8L7QehytYaN2OxDncGFrQ0bjqRXf9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NyBTYWx0ZWRfX8Nu4DzkftDcO
 C7ZXXRqaBk3uPUDb3Tj7eYUgy5ir7BIT/A7Ey+ebhQB2B6S3ha3P+zBWgEiX7SI2J7WnmoawTFe
 JLOv1JouO7/ecr3mbnZhONPR/yXA5QgG5WkmAKeJ0uRuMoczDQIJNqqiiwXw0Wh6Pqi29Y95opN
 qAl/VZaXJnUf9wV8FLGmp437e2J3mAswLoNXwGAFpCyoVUDAobN644QmgliehIUKvPBrGXCINbJ
 QuKqWapJwEQNvGYiw738J/yaewHVJ1VWUjBROHSam4S13XqrS2zqNamBgwDrZAtHjVWAVxAoEgc
 rwhfNG6fAtn8lnyy2qKG5yBrTLf34jWr/Ee8NBP/GZ0tGnZn9T9mYG0Qwu7MauyEd4YU2UEEDIx
 zk9HJs/st5Bb/ueQVUYe7DkeRqD8Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120087

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu
> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

The resulting diff is a little convoluted, but I think it generally
does the right thing

[...]

> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> +		const char *name, resource_size_t *start)
> +{
> +	void __iomem *ret;
> +	struct resource *res = platform_get_resource_byname(pdev,
> +			IORESOURCE_MEM, name);
> +
> +	if (!res) {
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	ret = ioremap(res->start, resource_size(res));
> +	if (!ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}

You can use devres here too, devm_platform_get_and_ioremap_resource()

Konrad


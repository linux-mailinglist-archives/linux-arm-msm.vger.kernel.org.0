Return-Path: <linux-arm-msm+bounces-86453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1BCDB100
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AEF63007FC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0426425A2C9;
	Wed, 24 Dec 2025 01:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcFY6khT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0nNWWTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71059245031
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538969; cv=none; b=uqv/kigXHMayOaGKC/jvPSzvdzSwr4SvLiCLmFchJpTfTJ6zMgYHVbQZDlJoHEcVWufnejdq5nV/DUxitKHitHsHi3bGXj6fHu35frrfzG55F7GLBkTZKtnTJZ0Tq0BSEl0K5w62MyJZqE2I/a0C5hdfhhctiPTfKzje57h2WUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538969; c=relaxed/simple;
	bh=MjZM6rq32PlOqwzhpgBKZpqv31pqmyiV0JNTEiW0QnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtXOENSTjcsFAasIwmQs/zCB1S2yRL3b6UzxBnOfHLkn3S1O9YcPSuywbwsQJVbdOOQUX9wur55lO0UAJAldO4SmuOAXLDlpPqo5D9QkL3J3zn19rE9SpANxa1LRx6m+p5kwiuRCh0NG+k9sQhvk2aWI260eAroTHmShjz9v5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcFY6khT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0nNWWTl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXes91206443
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=siMNefyG9BI9iI6gWwtF2XoS
	9bl+uVDhfgsJb6uiow8=; b=HcFY6khTfP3CoVQbJI8ELcEm7O0YtAD7ZYBegION
	HrgUa9q9sU1ojOJHgBCDV/bIXldagp7xd+FTLn3O2m92YOkUVuxbsed3aK2Pra87
	GQl1bipKcKr1FjHXVEfi6XYgnCXXtUlSEuGkrEeZUBqjsTm8tVK66m1BBepyIM5A
	qsWZTEjIkNb8gn2QOttjJf5KsdyjjeHFooMOWuBkHnu97zvkc1HDKEvNEVAdco7y
	/vmmZPrzavi0/oehMbYSvt76pBOhZexkhjV0Y7Fy6OWGRZ5vVYHBOq4WF+NI7W4d
	AFXcKF/9FcOzFvB+PpeZqCKr1gVo6aCW4xWfACgVhg4N/w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0hk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:16:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f62c9ab4aso4380037241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538967; x=1767143767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=siMNefyG9BI9iI6gWwtF2XoS9bl+uVDhfgsJb6uiow8=;
        b=E0nNWWTlMGh6kM03VZ86FAo5N5OwA8Vd1sYlF8/NbqftFZiRtc+RZBOVbBKNkGG0mf
         qBfiqsImxWJNTTrWSOykWLrPOSZjR7aB79gPTRW/NSW11Hagcq+ma7AQvNR+htaH7Flv
         fEmc5nblvY1l0ipKiTniFzB0VGQFh0ZhwNvduvFSAUieDeF4m4YvfzEvaBvjW9d7RJ6O
         elJ0xRxoE+qUbwGCMjTVwZel+HCpG1JQLJhP4/UWzb8SQO93f6MB+T6USbCOGkAUK+a+
         Rn2+BEQId4HLVODTgl917igbT6TCbh/8U9d5ozVwEG6rw5xqtLwXtTxgSi3WWNtHbgpt
         jUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538967; x=1767143767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siMNefyG9BI9iI6gWwtF2XoS9bl+uVDhfgsJb6uiow8=;
        b=tAsaGZcDsXd96F7NFd4A3xrppb3YJXgNQM8Fe18tFXa1Pf6TsG2kbEt2g1pq8xHgXD
         iaYT9IxBcgsTllfYQmfhad7bn6VTgDRx/U+EkphBekdvh1FLBw9Tru+TOno9G+4NjKhC
         Pej70qsCnx5v8FjKVNoDohgxhFnfZGHPdWSZwdxkUoZlW6AtCA0dOdz8Mjkjt0nBhiko
         LqJLYW/+DhFaSWjifRZXhsU7VzRStZqH23H3E6NnuXXj9rgFJn/VRHnhsSMgV9O5l+nG
         5cPJ71DnTnsrTmZ5D7i9XfoZ8ibzo/8zDDHNBR9OxpVUtPcAxVoCmvmtpRdVHIJsJkKK
         u5ew==
X-Forwarded-Encrypted: i=1; AJvYcCXv6ZnRUSUDVBncJ4/uOlnppIy1rtyU2vbI2l7x34Oy9zp2rJISXz8x9oQAy+e1dJEkChrJ7o7vG/OT7ihy@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVEzTO4rugW5RZ8XY/whLlx1jANUA1u0m+x5AcYP2TxjsRKTQ
	yixKSdLMnjzftS/KO5Cl26LGgl+m8zOokAdWU7Lv148FvGLF9aCy/wuaFJqoyVb7U+j9GOdG5zm
	xSO0u5Z2bff0bmLFJsrfSi2Qa5ZHSSwK3lfoQ9gnH5M2NPDQ/Twk72a2k3sFrwqJVyp2N
X-Gm-Gg: AY/fxX5N4NHA2omy+UBsVahT+yHMXiFVOqOxV2DAyQC5RokP25sSzOCOA5evDGEvGsS
	3mw10bS4aPLicV22NCvq1E8HTzclNnc5jDJzgak9APqA6qNYBs5WVN2eEMIWkv963BtahqVML7K
	QswKFeq3onGBjvcgpP3ANZSV31a51uZK8ey6EhjAQz5GLX/Dhmj0O3ksEfOt9j6AKgk+FwDAk5L
	GirWG3tHIKMwcgtEbLoqizk9ptOPsix8niWPAG9NZJKZeqMFYKxkcl5RGD/XXWI4WUSbWBvNYyL
	9/YQdq/rGTzyOWf8lgpGs0cYIsn1jot/dNqOibAfw8Crvl9P+leF7THuXWfdTEj4OZECaC53eEM
	+AJSUG7opOXFzgHo5kE8YQmDvfkCSY2R+27oLUuuay+eTeM0Mmk0Y9ww5KYxaRrVDVWvRmp4in4
	yAnFTwf2gJECk+a5P30HeG6sM=
X-Received: by 2002:a05:6102:6b09:b0:5d5:f6ae:38c4 with SMTP id ada2fe7eead31-5eb1a877d7emr4755701137.45.1766538966357;
        Tue, 23 Dec 2025 17:16:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKCGCoS5VVzpCOhMi3YsvQN+bHSK43bHc1x7Oxom+xEyLQ+RlhYI5632JVxoNTI7WNa7SZPQ==
X-Received: by 2002:a05:6102:6b09:b0:5d5:f6ae:38c4 with SMTP id ada2fe7eead31-5eb1a877d7emr4755690137.45.1766538965944;
        Tue, 23 Dec 2025 17:16:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de67csm39713141fa.9.2025.12.23.17.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:16:03 -0800 (PST)
Date: Wed, 24 Dec 2025 03:15:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Casey Connolly <casey.connolly@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 09/11] drm/panel: Add panel driver for Samsung
 SOUXP00-A DDIC
Message-ID: <unk7loohfu7f6eb5treqem3t4km3ngy3qnoobfw46hb43odypx@y3hc7bujxidh>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-9-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-9-82a87465d163@somainline.org>
X-Proofpoint-ORIG-GUID: Xk5llHIaldAG5wA41gJXSFrNzuJoGGRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOSBTYWx0ZWRfX58NjmmIuQmls
 Xky0eZB9a7xdj4y16TvUyIzOABquyKReS/wrPZJ5PfFnz/RqxPhw1AoIlmUSRYam/0pcGfovlPz
 kYjA6QeKdD9Es1Sps9/d2NGMNE4j4mS5Lylzp0i7AmKfGJxiQST8pXg07HBb13m2wx+muoWRS7F
 5z7e62iIvzC36yf4AHh2X+E9tMTOBEOw906zZbFUMOUng9TZ0rg0Hdj+fCFMx9/T21fTiA6LlRB
 wKBdInFMajMlOrcC1rMafK9gh30TFFhlh2AoSKva/QSqNfaNhnityt6IgUzy7MbQxEBJ4NqgIWY
 U41JNlAkXGX9I3eb8reIhi9Ei8mc9rOMWhTZL9gTuMZNcygY/Ne8/slHIxnlHVHfyU6DrzR3tLJ
 My+mlAGifGztmxao0/yfETuPMEtM3UHMZ0TXjMMy4H5wqF0KuL6jB1f2z/l1mFltEC6ySlyZeGa
 BX4x+O0oG5T57COCsuw==
X-Proofpoint-GUID: Xk5llHIaldAG5wA41gJXSFrNzuJoGGRH
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3ed7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=sOBjPdvQlbgG4MJwbfIA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240009

On Mon, Dec 22, 2025 at 12:32:15AM +0100, Marijn Suijten wrote:
> The Samsung SOUXP00-A Display-Driver-IC is used to drive 11644x3840@60Hz
> 6.5" DSI command-mode panels found in the Sony Xperia 1 with amb650wh01
> panel and Sony Xperia 1 II with amb650wh07 panel.  It requires Display
> Stream Compression 1.1.  The panels can also be driven at a 1096x2560@60
> mode.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  16 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-souxp00.c | 399 ++++++++++++++++++++++++++
>  4 files changed, 417 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


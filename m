Return-Path: <linux-arm-msm+bounces-38830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 565279D5EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1756C28394B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE6A1DE2B3;
	Fri, 22 Nov 2024 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceTL7KBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5B1D5164
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278111; cv=none; b=TPDYFj4j20OehtvYKlOPtOS/+SKHUdx4JkajcNJnRiSFTLcsDNs0ztwPMpWBsdi1/I09I863xLlxw4Xf9bmwhpQMwPauQV6YszW4tYzsjJtlrr0IZ2SvhkhuPyNhRVTFBhIL1sENiMCi/LHxQZSId7G9c1bn0bzMFG9g4x4AsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278111; c=relaxed/simple;
	bh=4NdMI7i4HthevHg5xPrOBrT7ml56nJWGuXa+q7fy4/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kg/RUz3AdBx8Za+4Ntfkw3yoE6yXb7oUjjzMDMQ9ZmVMANGNI43ZWpGZwLIz2QAOQFz8kVignYRRL40Jd+EsLuDzCwcprvGYc75fFjrTmhNWcsKKkDP/B1l6deuBzPh7N6ZrJa5hmXUS2yRuSAnMlTdrGjBSSaDGQ+zXWumR/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceTL7KBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7tZSN002213
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zyqdqOWon+Bb6KDq9EFahJ8KwOZlSLq3h9cfnJbehE=; b=ceTL7KBvdCZ22zVi
	udzdRY3CYZAS9dHzjhEXUYpMQFNAUEyJJWx0j9AWTrlU1Sv50SUvlGWeV1wBj3ZV
	xGDxL/L6fh9buUgSMMSoZGS2b5L4akX3K/u3qqbXWwWJuVwvF9Zs7E9S8GNSp9+a
	G/idSgVQg/kUfpi8Syq65G0aCwvt/YCBlgQshS8wLWWw3wshLoznkEOghhIv2/q3
	AV1vQs78BgOValB+FPpJW+G4Kw2OUqBrW4b6lBmf12UfSBYMgJoCfM4qmpdcHDkx
	ibuMyzc6hyysA70lfHAv2OaPegJF7bTAYNPFj40x7aiCJwHHVIjtgHDhogLw3nne
	Y1zz4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432p0d8psg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:21:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b1456dc270so27951485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 04:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732278108; x=1732882908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zyqdqOWon+Bb6KDq9EFahJ8KwOZlSLq3h9cfnJbehE=;
        b=fXNCtXoOWgrMjdWfDPFIbsZALG6KJQp0qWvrhOZhPw7aEsAMinloagVoqm+4TPT5i/
         PfH4ZjjXZcuF1z1GnnN5arSwe5gW5iXb5w9hQ03mK1dc1I2dNf6pQI3WAw+noiGXHiEd
         lisSJ5QTdAxR+Jd5ZnZuxAP7MAxH+LcnrLJKPEUuCo1+TJFRGQEPBiz86ais48Cz52+P
         zpfzGPaGx7sssK3eCsOmWpVWjXgeqND6NzY9LnsuaAwF9lUFPJ/P8/OLSInscHKjPkDW
         09YScwVTNgDnU34y4jLGA7etAAY05WQ4FyN65Mm4Y5i3wOMOJe1PVKx/dV0zEzUrzQ7g
         4G/w==
X-Gm-Message-State: AOJu0YxfpZdhOE7M+5tceCHhpT73QUK1uz3oiE2SyATk8C71S9Y4GCYh
	yZloM6Ym8W++gNyaL6laJVv1r7TAE6sZss+7WhVO5L85swZjx8MFA+Xf44xlaOHf8eDX446zX3S
	rx9Om7EeNJm90+fchhycDNLbxrsHyuwmJmeYIuBBlH1MpSuKpYdoDtz6Sk6TWTinjaXdZW6Mj
X-Gm-Gg: ASbGncuM2wqbPwEgG/rZTYvV3T+kePJs79dsat7jmO2Fc94NZytYwCJkWWmiBE/sn2F
	RCFP/bHohN2fxGnjqW+dysS/r2kQCfOGehngZKpgx8kJxEKNJGiSqKiQWjuAm6ekEV500gMeBZ1
	SMQrfOdWRXL/ujXpkK6HqKKwBkerebTiEj0tLVHQkf+nziC0tPLUY9Hdc3BvFhivR2JaJq04TF7
	D3Jdr+V3Il5wLtoljpwhaH+rhJaWNAHZEKDnv6VhUaCWr+H1FdzEZrdw0bd+Zkmu4B7z51bpkEz
	hRDx4WaQbsI4bG8Mnqp7QQtJ5Ca0ukQ=
X-Received: by 2002:a05:620a:1a16:b0:7a9:c0f2:75fc with SMTP id af79cd13be357-7b51457fd82mr154413385a.12.1732278107906;
        Fri, 22 Nov 2024 04:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHmLTbwm8pNChveHbGVRdyKfjc2M6rbis5hRH/aHBrK0D9jZQQS3R1hjWKmaZIuM4R3iO+zw==
X-Received: by 2002:a05:620a:1a16:b0:7a9:c0f2:75fc with SMTP id af79cd13be357-7b51457fd82mr154411085a.12.1732278107496;
        Fri, 22 Nov 2024 04:21:47 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57c19esm92298166b.154.2024.11.22.04.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:21:46 -0800 (PST)
Message-ID: <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:21:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241121164858.457921-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sonhtC7JFS2wjBhxppId0eYsKOYXCw5H
X-Proofpoint-GUID: sonhtC7JFS2wjBhxppId0eYsKOYXCw5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220105

On 21.11.2024 5:48 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> helper macro to make it easier to add debug logging which can be enabled
> at runtime via drm.debug.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

[...]

> +/* Helper for returning a UABI error with optional logging which can make
> + * it easier for userspace to understand what it is doing wrong.
> + */
> +#define UERR(err, drm, fmt, ...) \
> +	({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
> +
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)

I'm generally not a fan of adding driver-specific debug prints..

Maybe that's something that could be pushed to the drm-common layer
or even deeper down the stack?

Konrad


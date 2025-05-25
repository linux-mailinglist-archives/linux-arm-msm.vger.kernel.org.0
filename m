Return-Path: <linux-arm-msm+bounces-59328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DEBAC34DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613431895F77
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 13:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDF41EFF89;
	Sun, 25 May 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTtQ6ytS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7251DACB1
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748179670; cv=none; b=pDdeT5bxEr61y5OA7H+sAFhyNTaehLwPfJPsdBar8FNKkLVBRCcri5131DbRkx2tddX+ThWM74rFZsJpNn/aRT0zxXl42zO5lew10QVwdbVirPGv4CMXIKWx/cZ7r6n4tPGWV2bGr6lkhctZ7slRwmlRebmGQ71wn2YNgMZVJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748179670; c=relaxed/simple;
	bh=z/PMOxakk5IgeR4a6legaQJ8OmzM57gIWk0OTZM+RUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSmt5ohzIDtIGfVi9T6NeIFkz+Piz6LcGN2ShKubxueg9cV+eeUnoNdrU64ufz9piV3XN6SHhUWi4q2CjmZWwHYk1DrSM+D+59nJfmz6MAjFp1+iwk4YmXjmpj6VYtismo+UnrkVXv4oxkv0xvYfuxbUxuPGfqgvDNlqd2+f6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTtQ6ytS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P6vHbq005246
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9r6KW5fddf0fFGQEQ3bRjg8l
	wC1Gp7I35uIfHw+Mcgc=; b=mTtQ6ytSVXonoqF6UazAvmKaZFONXRDdvPIIb1vN
	OQQ783VvPBxsuFUh39CXXsnVcjY+l6twTHS4PXylNb16scBmpv+WZkCK8aljNr0d
	5F1d/Bj0fa+WsbuPFzlZe/hTOj2Coq9wP6WbbGRndqvRleH27xUnez16qNIviLFT
	itrz//sk3OKwdwaC+YSZhCh5boaIdxpFx58k+sSd8H1z3IuSKqv8Zj3EF/MlOXqL
	dp90UkDf+1s/UpBFJ4yYVrjsL4imAoUGZKUvSe2uDkh2+ryWcispdA58NPJYOoIu
	WDLkpJWFhxo5UIOxK5rJM3H3Dcjkedj/a6Kn1n/heRqDLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3tht6uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:27:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faa33468f2so15986326d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 06:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748179666; x=1748784466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r6KW5fddf0fFGQEQ3bRjg8lwC1Gp7I35uIfHw+Mcgc=;
        b=oojsvTp6FRv5hDSUQWLfaX+N/lvvZahGNf2Re5Z/Wr+sr9N8fCDlC3JL3Vuoa8YPpd
         yCgU4gsy8ToCPbGcRoPAQ2Zjemq0bOQZ6FLOt8C20opum5nlkYVTCH4kWmDzIB6Ve9v6
         hPYuzJFfjW7bYkYK7fW2sOc5tDjKqmjq44sQhtMNoOLEsP1Rq22fhuY2Iy3LFTFM5PG2
         FOAY9BJmI69hlLSMyeIBfbslrudPjfvzz34lSNLGNulA1EKf8R99NdHXqSYkujPdMhOG
         lzlfX7Nckcm7p1+rZrY2M9OQ5MJD4/GxdJtlh+mNJ8wB7Vr6NRbselLrr2fmerfoeMKA
         VU0g==
X-Forwarded-Encrypted: i=1; AJvYcCXeOtGBMWbQAc5FmL4NHHuI4wG4Ro9FW8MZSENMB/uDnuFrJ0D2gmGBmlvIK2yhoanq8zlQjUNwdu+wiMj3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaf6nEMh0KrDnK/EXcW8TSfypPr99djiQgJ7ZNQ/dlnD8YVpgy
	rrrKxmSdaI66Sb7kYZ+XpHwWOmykn9CJOaAlewrqtn/GaasTxyGxIolWkcD9EGMea0YiKkyjhfo
	aZ+de//46Uir1vc+/HxlSQBh8Zh2dipU/1Y2ho0cUxH9psw5m6i8E8lh26wCJxGOVenTG
X-Gm-Gg: ASbGnctNYRadCIet/IwaorE6/qOrXW8/AiF/l6kjEkoGcMRCi7Eff5NrWoDhQCr979Y
	auF1VCB0CvQGdmmQpWrHfOdQTofdSwxJuitbd7fL5GU7Fwjhi0wvqKt9Fm5HVx8eHAwYYukH+g3
	7RirpvJ0cjP8pQJqqwRRu6kM/6I28MZbLi1zK85KXjcKMh29dTfARDzJieXYsi0e79YJ6URPhID
	1eVFo1cuZ6olQZyO0QN5SkoKTzbmcolVbBnFpHIakJMr7bHmvjJCJzH/C2E2jAXoEwMQwaJv+u0
	MN/W7JPILejLPYkuQtm4EFM9stPnDfEk5zk23vm45dFGigv1yCN1tPXOi1AzjXaqO/+Ofqdi6kM
	=
X-Received: by 2002:ad4:5be3:0:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6fa9d154d78mr102762316d6.25.1748179664510;
        Sun, 25 May 2025 06:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgaxGvN49G8O1azKAeTm3eC9Mixw6SXaSCIord4AH+tJG20I/jRkJfh93URYpknSxkUr2bXw==
X-Received: by 2002:ad4:5be3:0:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6fa9d154d78mr102760426d6.25.1748179663267;
        Sun, 25 May 2025 06:27:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd099sm43826151fa.57.2025.05.25.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:27:42 -0700 (PDT)
Date: Sun, 25 May 2025 16:27:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/3] soc: qcom: qcom_stats: Add QMP support for
 syncing ddr stats
Message-ID: <lt3p3hqh657rx7knpvoxl5il7uohrcllmi5lk432st6nap3vqa@jkgpj2rb6daa>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
 <20250525-ddr_stats_-v3-2-49a3c1e42db7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525-ddr_stats_-v3-2-49a3c1e42db7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eKBr8FuD3qJvNUDNgLEyPZ5B7WUqLZYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyNCBTYWx0ZWRfX8eQzVh1v9h1M
 d12xSgKLEPRsXs1O/oFosPRpIrMHRafU/BycWN4zIOYvFAeDZH0upowzmTZSwHM+JbCPdCx8u7Z
 7icRzhwfKVNeloyZqlloTa0D1Neq5eNa8MoL1vTbBoTLHsfd5bZ6p0FPxi2o2WXZROtx3/eTbNn
 SdOty5pBvFxrpDIl8H0mJlnLDu9MfcmVCTXTeTSfa9c5heQWkuIriePu2aaYOLCcG9Me/Hi2XWZ
 YXzTUgA2jBDWlgJrl6XHMvRO5/hBP8Yd8SucKEZxOjHdSbF5KapdmUGk6Kd/j+PCAlMaKaiMIIz
 v2KPhh5i+3GrABdYBPbf3m2Uz4lZzhjrmg0+UaIS3tolHS4nnSP85kGZU3/x8qxSYxEsnaQLv8L
 3/CmqKFTmRU9AJI5/JinXC5cZXOc0m6GVyAkhMfhBR7/mkeajRB5SYqo0Xo/0zzuC1Vdxdk8
X-Authority-Analysis: v=2.4 cv=e94GSbp/ c=1 sm=1 tr=0 ts=68331ad3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Prqm17leZL3r9GWXGqMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: eKBr8FuD3qJvNUDNgLEyPZ5B7WUqLZYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250124

On Sun, May 25, 2025 at 02:25:58PM +0530, Maulik Shah wrote:
> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
> ddr stats. The duration field of ddr stats will get populated only if QMP
> command is sent.
> 
> Add support to send ddr stats freqsync QMP command.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> @@ -310,6 +329,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
>  	qcom_create_subsystem_stat_files(root, config);
>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>  	qcom_create_ddr_stat_files(root, reg, config);
> +	/*
> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
> +	 * The prior SoCs do not need QMP handle as the required stats are already present
> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
> +	 */
> +	qcom_stats_qmp = qmp_get(&pdev->dev);
> +	if (IS_ERR(qcom_stats_qmp)) {
> +		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		/* We assume any other error means it's not defined/needed */
> +		qcom_stats_qmp = NULL;

If you return here, who will cleanup your actions? At least you've
registered debugfs files...

> +	}
>  
>  	platform_set_drvdata(pdev, root);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


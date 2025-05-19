Return-Path: <linux-arm-msm+bounces-58439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DBBABBBD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6E2189C555
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9472749F5;
	Mon, 19 May 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4FeyJbI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2926F475
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652423; cv=none; b=nU/3vA21bAsh32v+PM4Ho1nF8EgwL/vM2lJjUj3E0w4pkc4Jn55TOKC2Wx3fAMgL4G2s+V5yf0u2NW4/Gl6vsqV8wkZTNnE8zVQFkCdStsfzhGR2llzDyh3fCWWDh6t3STkKlISNodqIfsZgUNwGJ12o1jaAIWk6VJ3B62NDG4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652423; c=relaxed/simple;
	bh=fFmjqnxgeSmiyzEOPvUC2pZYL/wVtsRdLROklYyM+Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BByyegPUfqAmA8s1cC+nUOdFfNxuaQ6JQogqzZcuxdMZ/kSsdUp+Bbc7Bqt5t02x37HnH2RK2UMOBEiLW17IuzRqigRCbO/h/jz/VpBELTsDTO52CtzInSP6G89ySyho2xdS38Zb3RxVSvSt4k3I3IE5JMqOIbFMvlNfIsNZN04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4FeyJbI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9W3Aq025924
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AR3Ehus8X3xdnq+Qo57YslQ+
	CRLb/Q5bFilFIz2nOhE=; b=h4FeyJbIQExSvfT7G+6p82PPzQbsTO68g4UGOPX+
	Y2/tcD9XHkpP8WKTnJAEsmrC6niddSILbxN5ENl6HC20Kaa5peeX7zFh8wLY/WcT
	0Jl8SxYV+0jFcOG6YmgygBxLGm5AzKHP3iHfUrKV+vYjk1+hdaDuYjqNfhc+lycC
	aiq/g41myBF9oZAeeOW0r+LhIvymBtFRajUgRGRQnpNuuL1bomkzP7BaMR1+he4h
	LvM6C/8umJarqhJ/uXhUryv7wGVb9pdOTAua1AEW0bcMsBX6dsSeHHFAC/t/xezC
	EiMJ5uZPAxLslyOiOOZ8yVfn44WxV8bARPFwnQlyJStqVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkym6wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 11:00:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso94254366d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 04:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652419; x=1748257219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR3Ehus8X3xdnq+Qo57YslQ+CRLb/Q5bFilFIz2nOhE=;
        b=pi90bTv/vPeE3lgvZD3k8TspqhISvK+4Kvec2PKlQwHj+at78fv1TZ8yVWc4rTomB2
         iJQsZmbJMIsWUUz3W4cnFsGuT3OCLz07dIen5+hNYcCZh2b37eEeoyCsp/YA8176Ij3a
         1XW/orybvLU+D81rcKWHm39DE8hYAA8UrIwMCYEwU4XQqUUKs2ksxS66wuoU69zyQimf
         GpOEyCDCfZGm7YGzT4lsHrQQhl7KrZ/yVeVziMdaXcTZIYqozyfT5Hfj0yk7V41DdPOr
         4vCegCCQ7jj6uYiaw2CnPd+ofnJJ04NhQcHQoE0TQgCDFv2pCqqio30AYR2awKcaPRRN
         nFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAZyspOSS11sTTpMqkQARCVQQ1v0qGNmbtaHKrJw2leh7p5lP7CUpAeAsp5k8Dnm4jz0cyx8zeRlnbkUbt@vger.kernel.org
X-Gm-Message-State: AOJu0YycxU3DxV52txnnzp4m6bR6mSWAPPD/61xLziG7iDPPuMcENVJj
	jyo1fVLZC0cA/A1j99ksNBzDzLQGFE4McHHzy0+YsFxL/UhU8xXIPo9DRgqujkBIRJOr/Gn/qz4
	Kdb+fPWRMDyk3h+Yqm5m7ozhOeoHWf9FrEc3O0hVJimQH7Cozl5AdemXrcr0i7RNltcB2
X-Gm-Gg: ASbGncukJYet7S22KEo9MPtoyphM846rkIi/n6nEQ6pFQhfuQ/AAHZNmhfLoEKNXbsF
	C/e+mB/GEq7DJC/psHHcbzDLuDx8yyE57+gUIIV68/iGQoXGuiWDKWAZixdhXEn8XQPQzhY/7sy
	00ksD+eIyVujh3o2/dGpH+JljFb4scn5bIDpKFnMIR9Ob8YO+gQyr40Nhd/6SYipaqDLyhoGj9M
	folI/LSEwgxrTZ3/pFNtMmK0m4jvdcM9GXxjyg7rog853kB5beMc1q3bITV0+Yx4DN5+GLLEKfY
	tnzVa4ewKXiHvZwhu72URnKsqzBozn7RQYzWkI8XvBedxJcdvD0+NGI05NehVKm7SnCAg8KsyTI
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr194273946d6.10.1747652417977;
        Mon, 19 May 2025 04:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKLoOs77LAAd2FaVlz7S0E17UdAYw+X90/56bpj496u2rqnN6gHMaHcHAnyDBiwJmiqq2D2g==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr194269906d6.10.1747652415358;
        Mon, 19 May 2025 04:00:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7b1sm1779835e87.229.2025.05.19.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:00:14 -0700 (PDT)
Date: Mon, 19 May 2025 14:00:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sdm845: Add error handling in
 sdm845_slim_snd_hw_params()
Message-ID: <e5k5zslz33in53ivbqttnnkt7whvzfay4uwxmi2o3m2a6c6ahg@5kpjzcyov35h>
References: <20250519075739.1458-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519075739.1458-1-vulab@iscas.ac.cn>
X-Proofpoint-GUID: Vme4YhqWmvbrEPPQzl1ellQ_UOZ7LSlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX3qvljNNYa49/
 j968x+LrGkH8QeVOoAIdC1AWzjSV2eMGmWFqEWlQFA7H9zOefOCCfsVu8TARyfMQYhy8W8lYpLj
 UOozIa39EzIlQfefIiN75YL61Rd+xXcXazM/QalKuBCkJh3PGLVFtq2BwbPdayy1TB3KvI59GZp
 zdCCJPKp8aZPfVAULmNoQEj7gn7YhhoLJ19Uwpjya4kALvwqWkoXm3jX/CmDSf2Pd2C+tAeP6ZY
 ZXURVx+6Pp4MTK3U9V2MfaO+hUExiKz8Kc7ZxNrw6g5fe6WI56yZgpnE/ZV7Y90bp+KjMxX3Epv
 4266e6lO9jWhvvtrSK77wtGQOfRtpcF2YZnaoW76Tbjqrw8/bnCCpw89QZFkUVLvjpuVeQ0ltmB
 1VUrQ3RisYUvuqOI8JqQf4BKCA6x46XubCicoPz4AZi/JKy1Tw5fJnQADEbEC8zVPiY9liE3
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b0f44 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fLaHX3QtLFUqQw0t1l4A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Vme4YhqWmvbrEPPQzl1ellQ_UOZ7LSlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=715 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104

On Mon, May 19, 2025 at 03:57:39PM +0800, Wentao Liang wrote:
> The function sdm845_slim_snd_hw_params() calls the functuion
> snd_soc_dai_set_channel_map() but does not check its return
> value. A proper implementation can be found in msm_snd_hw_params().
> 
> Add error handling for snd_soc_dai_set_channel_map(). If the
> function fails and it is not a unsupported error, return the
> error code immediately.
> 
> Fixes: 5caf64c633a3 ("ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga")
> Cc: stable@vger.kernel.org # v5.6
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/soc/qcom/sdm845.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


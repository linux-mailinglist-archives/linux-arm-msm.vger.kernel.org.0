Return-Path: <linux-arm-msm+bounces-70393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E522EB3168A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6411886C79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83D12FABEC;
	Fri, 22 Aug 2025 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwgxJk7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2872F8BD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862973; cv=none; b=FeN2Ixzp1Gju6Fplu+2EVW0dXSeImeX1rBESd8dzXYEXacHvXtKDfFT+URldAznCfC5AYg7R7CeNOMvql75C/ij0EAbtkf7wZLnBcnBuBJsudf6I3VngJkd3G28Rxxxd/XmTHzN+XNhihNUz7anjZZGGamyqlJH9QwDFQzTxupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862973; c=relaxed/simple;
	bh=AHqeCFwpaR+XWyG+EuC6U9h/5Qte6yk9Tr15/2zCm5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6Vp+bcxKntkHfx1gYvbsc71VMBp19crWWUXeGfu/Zvj7LYBByP1MQTqiHl/Tqfj3QKXFfnIer8W9A12MD0doucNGi1tIkCOt5pI3Yc1EYw28gASFK27ezRu8F7ONe75hJv7lMUMpNKlFQQNs3U3yrAqA436sQ+8/hvfTqNC17s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwgxJk7q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMQU011136
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mw/UDB/7pQXVTX2eHOkG8b9
	9y464ysBkU4PLObgT+4=; b=cwgxJk7q1Je0QT4YtcE7cnsP1azGpggAmhfeZ+Mi
	cJsDgR490szXH+nqyumFgucJnIVpxN3Rl5GRNRcx0dHxNHetTF4oFROK8L4rwbmx
	Ghlv9JH7CKgqLLhdGhnUFqXB1d+e/C4Y/P7SDkWmr5Q1GqyzF0k+AK2CkWD/8kzd
	1aTmVG56ZXxbUDpLygK5Thh+HuxEqZiPP5gTI+bpblBZOBXqWu4KM19kna3wpM6t
	hjVTn1p19wU9J6IdeWM1jSY4e/s6TMRFdxppQ60M841sfXYhobUEKwZQg3ppo8xl
	SapH4849HNVdbBYuamJhIUfPmiE5Xr6r6WzTYJlTZLDOig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8evgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:42:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d7c7e96ceso64451326d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862970; x=1756467770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mw/UDB/7pQXVTX2eHOkG8b99y464ysBkU4PLObgT+4=;
        b=xA0/oGW9JRVCbmgHc9rJeTp6HbXHh2E1EMSBu0duoSco8SLHC+e7cI350GG1sA/Spl
         Ycvm52emvz0I7sV91/yNJkQfzlEcPngVb3OypEsK+gJbct4m4/8xmiJaZx/+R6oL1DgA
         4WAhEjMzjU2BuiFigMNyJNU64C6TFKsQXi+6fRJst/d+pn8QEfYDT8/CJm3r1ZdET0H5
         8hxtgosOVOD6uslXJwqqO4PhPL/j8f7y9xGM7F6D/ykPn1pYpMJy/7w2rCte0mjty00U
         eI8vbIf4TCQ+Nr+N7Eu0cXsl2R9e0YeH5CVt80y/JvFMi4Vu8EW8vbLEBM2Z2uk+t8F/
         JKYg==
X-Forwarded-Encrypted: i=1; AJvYcCV2VCJ3782ZJy9WhjaCpeuEwCHEcsQeNkzsc2JCav22aMeCrpigPttvyRqCySt0HSrg3CugyjkiDGMl/zVg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40jyGF8NMXe5QQYB089t7VLC2ELo4Oz6dXCmFI68KCO56rctQ
	xI2VJoF+EggGv6HkFhb3wWS2B4dUDIGWv7EOYW6YkC5C4O4IsitYTxB2pDLZxgb+agtzrMCtzZS
	k6SvmQVk0iAEf5zWBL3443kudMHr4aj35a+FqqIoIBTOEUNvCss+PN1B9gMM1PLdag3gU
X-Gm-Gg: ASbGncvDGiiWGXZWUT0QKeRuoxvZ5MkLfNUD+byHU3sJvuKgV9uOe322ZlN6C5FE8ak
	fZyj9NtBg4UcXT83+ghMY7dlypq9B7xn1ezf8FWozjJqg4bFHIIeR0wdczNad/JoSJxq9igCrcE
	exQKHdoyaF/yHedct/41qxOnd+LJc0u5cns2lr/+1NUWKIvcuCnn00I1GYQaz2DwRig86L2zmab
	GEHXcpVwgWNnc4G/2P0tjEM+TvzEZjoSfqiLK+aH24JnhwtgDiNdzJ44jTi/A48+b7kv1ajL2kr
	4oO5GVPy/zPTW/Z9rIYvWiWPT1UHw4443KNmnbT4GL772ezNoFbLPl7aK4I5CWALTXLVXQddog0
	a7iGiJ8PS6tjUzQLteLj8G9mJxGCmy9tV4ol8c/+lJfY+JqWBR/hh
X-Received: by 2002:ad4:5ccf:0:b0:70d:6df4:1af6 with SMTP id 6a1803df08f44-70d97238c31mr25038756d6.52.1755862970486;
        Fri, 22 Aug 2025 04:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0KTE4EBh/7HvpDzIMoDw2jPtywPhs513cF9E6lM3AxHNbAFd068WoyXeIrAeKelFl7dCsLg==
X-Received: by 2002:ad4:5ccf:0:b0:70d:6df4:1af6 with SMTP id 6a1803df08f44-70d97238c31mr25038536d6.52.1755862970041;
        Fri, 22 Aug 2025 04:42:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3354b208a13sm7287061fa.70.2025.08.22.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:42:49 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663
 GPU
Message-ID: <tapfkre772lrar4l6ik3houaq3ki5icqliu3tj4k34hvlha6rq@2tbmqra57bag>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfXxb7thGIQHWpb
 b1R0KDh31Ct1da1cr5LlnTi1M5Lp2BDL+/mZgVLPzaW8AGygPHzKQyFN/xJpZdF/oz+qcT8PRXf
 ymvhNrPHHl6Nubyw3oLkcYSJLiaBDbeHX4xWEbL3XxL7MoTdyMyuVE07OZK5c7KZitZp3erjJsr
 rJmISzkmP5qJiwjtThGaDroBiGYxCjuADt8huQqo+b7zYY7hmvM1oseFanrRPbTU8NFvqUpJoEl
 iMKB7dSR5i2AIO7uj7pLHNLBAtiHaU7eMstZSK1jl+7DIxUEDHpzPSfbXH2hOE776rkZWmiXgoX
 ew6qS7u3/HxQYrA0gLBVL3c8kWCvzmNnyD7H4i2mhPRnGv3mnm4zTmkm1k6Nj2qg114FFzbw/+g
 l96LfqfbC6yVqUGdRSRPxRiOwsjayg==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a857bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhNRLu-bMZbuYH0aq7kA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 2TKj1l_RJFgOt6p0Aq9efpjUmo63-Kyz
X-Proofpoint-ORIG-GUID: 2TKj1l_RJFgOt6p0Aq9efpjUmo63-Kyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

On Fri, Aug 22, 2025 at 12:25:30AM +0530, Akhil P Oommen wrote:
> Enable GPU for lemans-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


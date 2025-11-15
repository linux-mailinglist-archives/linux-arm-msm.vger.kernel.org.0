Return-Path: <linux-arm-msm+bounces-81928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C43C5FC36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 01:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4215D3552AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 00:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1D642048;
	Sat, 15 Nov 2025 00:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxUYZC8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMMPrTeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB71799F
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763167812; cv=none; b=e+64eGzMEr96t0h0umXpsQg/I8XwT7GlOdBwxXqYcYWj0hEopu8UUtTz1pQrbHasvUl8U2GuVUJirXKqDAZDDRGcDIypMzSrO9aBPeSUG7W+tVhl4FzCPLiMDItUYnkqsq7NoGl8rA3WvOKwMW9V70lz+CKD1tD9TWetW1GWv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763167812; c=relaxed/simple;
	bh=+dCIM7GyD9F3DqbhMwxLnbXvN7e8ybxmxJOUHFdGcLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwUgOQmbZFA/9PFk/temOIKr0TTf+auORun3pDfyy5+kQUzlKZFBDoiQDXkbFJ7+hTPKUXUzW+xdYwgwgBSt7b2xVVu3HvRFtPgVy0WLfzNtwOUdZAchwTtH8Xr/TecQaWz9f30j5IF8f2nBkexjyn/+UE35TpEC23mWIVMNP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxUYZC8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMMPrTeO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQ86O446632
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qs9XNl6C5ygh9qZUkoG6dSnI
	2cAtbM33aIVEqpZU3HM=; b=LxUYZC8H3vZCJgDMaslziF+/Q+DGDpgidTjmxz91
	36M9bXPQASL0FtjnxYfrUVa1RxfX/6Gx0QRblsZWir9/aZGk9+AO/Bx7/lK6htOu
	Kld39VgMAHM2tQvShW6rixT4ooi/0ZDEkCQl+CHmcUqd7XlYKDhy9nIkb/l1G30P
	8MUMR014eDXOtxX+gjWzx34mcc9JA6nEV5BeVunCkD+NB3z6IefYWUeHupCjzzTd
	AzfeiCztR72AYwahKrSIIHEMhcWT5EQsRTFBaSGjKloFPxSK9SPAbPxvOhpNAzVX
	fLJMN8YRUPS0S07zPbKtVfvjn6QEYSfcvTnlirAT3vmhkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae7cv1bms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 00:50:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823acf4db3so73274906d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 16:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763167810; x=1763772610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
        b=CMMPrTeO5qkMu6aQaV7BUfdOS+92Hd4m18Nvryy34CwiBJknFtuZdX7Cldc59JHkzK
         vF1Xdl564KahQ9hdP4nC77xnvrwnbrThvaaoZuedCzEFzLxHb7yWjPQ382xZniiRvvRP
         NJWBwrhxBRFT1nwobuVmNo+TeoNUGM+CzEDXCdCBau8iVUg3/InuplJnPuMymWK9Jg5b
         5IKdw7Yhzf68eGQcaEK8xPlb0Zocgn4NzuESLllff+9EetLz8NjpVrDQ94aOs4DkByIJ
         Bj1snFB8bavKmXdahvrgZaQXQWxTykqKXuhrnT3eYRYXwdIbRtb6Vps70d13mPLlHriw
         xIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763167810; x=1763772610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
        b=T77R6dPP+dOrvcau3zmGiJlEhg9zWnRzLT5fq9uK/8adjUn7JYhnJrCUk7I2V5JsVf
         uPScKY046K/2RrbcpIA7mxnJQ6e3dP6HFooYHSQS0dYZONChsG46zL6fG4P+173Y+uKq
         DoJ7jaZmMTx55dvfSvYkUBtMvSAor4xaxCa7qGOnvZl8l7sNjheVaOnYCXmbxS4du3PC
         EzcwKVm+TlcQttapcDy9+R68t2yyqiHexuUvGtBteYmf0nXPIAdtnaXPgjxhvIqk1FUG
         LHHTgLOVjdepioOVGGkbHFXiWdk63PrnE5WyMTCj164xzDCPSYkbkljzrmfofGg4/Jfp
         Orlg==
X-Forwarded-Encrypted: i=1; AJvYcCWsTCTCDdyeg8ywMZJogyGdaTm3GMENjgrHqG1k8gfjph9x8GQ1pkHFePiw6skG4z4z0BVFl8aUMPtVXUfn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0UL/LZS5wA9rRZwqkADEpg/Te+0HClugFMn08rCIylECLrqu
	C1PryiS46p2InqeX0eLXXDWd/W2XjdRTvbuJiP72nkQjTZdU8sL+4Ou78x5GmUasninZOXnTXe+
	yv2saHGDd2Slk3ofRg7ZnqF6+eb8m28fvEGuurcq5s1/862zexkPbGR6KvW5TZPR+7+d1
X-Gm-Gg: ASbGncs6/BxGMjvUE6V5gwWs0kaGDQc9QgzsALaCIyIkmgRuw3tXSglcBhl02U3Q4B5
	SjEt5u9ecrs3NXdrDGHubBDR5GtJ+YAP6JSevKF6iLJ7GtcO2QFDSdJycWiM93SlKkc4v4washz
	pwTyBM3HPw3g7Yt+o4xTVw4prfPsoRCUj9j1auXLxo4amDv0WBViiybqkVbqEc/NcIx01iBaGyS
	7jasE+XYh0dJ+hOKTroFJvDS2WaUW3lUfLUC9JgPX//ovBpHBuuaXsg7tHvj43nf/qpcrzXsSQm
	Rh7c+EYYErQNIMgc86vt0CHPZ/fr+i/5jKYweidYW11CDg3ejxVJY8GjgyDLuYOzAiB7MikdxYv
	BikPaSOcD9OA6lFB9g4rysZ9zsoXZ8f+pNT2jYoA2CSU+GBIhQuPzSPPBx3xgC/RZdSv0kJoBzh
	i+sTrjQhqFZAZR
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id 6a1803df08f44-88292699d47mr77113506d6.49.1763167809737;
        Fri, 14 Nov 2025 16:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjIFGATfZLfaUZaE3KWR5c8p1sYfBsOVpYyQEawnaMA0DTE16Ifr+U3lmX3Y+76mKypsKpog==
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id 6a1803df08f44-88292699d47mr77113096d6.49.1763167809268;
        Fri, 14 Nov 2025 16:50:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce0822csm12716841fa.10.2025.11.14.16.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:50:07 -0800 (PST)
Date: Sat, 15 Nov 2025 02:50:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/ci: Move qualcomm baremetal jobs to lava
Message-ID: <ursdbkco5n734zhfqceztib4b6vxb2juq5jfllzcjeuctd6lvn@dbdbkbr4csws>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-3-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-3-vignesh.raman@collabora.com>
X-Proofpoint-GUID: ji2hKJAuEJdxvhhgsexrZDDcyFoZTVmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfX97Z5Q8urlzx9
 +ICbUDjw4liIscRy6u4S9T5WVv7zBE9t18pVhTPEtoIMnykRxHgejd1xa0YsLj2t5RhQDCVc/2P
 ulZ7NzU/8HnE7padbfZKeWuLz5/L+n57mZz4CDCrJvWwROgqIkabGnCOHro6s1IDWwg9rMTqX4s
 CkYUkGfHtacs1OlUclQgAm2Dg9x0gIZQUEAsvnsIjhxN0Kgi5qWBrNNICn+c+AaSkWPvF962DXB
 grokW4ByNQGxEbxMOY/ToZgH8WFU1FIE7QxA8tQw57+QA2rrDYeEXe0TfQmgg12/1tyYh+pHbEp
 9A8vCAyeM3P6dOhYQpvgUOTe8OmXyI8ROPsyuF/9IeXz7Vos+jQlKH6QvvUCjVsxHgij4+MqSkg
 D5Oo2gnaY7IHU3SiawgmQJgY4Cwpqg==
X-Authority-Analysis: v=2.4 cv=Y+z1cxeN c=1 sm=1 tr=0 ts=6917ce42 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=Oc5gQ_T1tCqBBtY5fQkA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ji2hKJAuEJdxvhhgsexrZDDcyFoZTVmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150004

On Fri, Nov 14, 2025 at 08:30:51AM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 27 insertions(+), 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'll try picking up these patches through the drm/msm tree, if noone
objects.

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-79310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C020C178D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 01:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C68422ED9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 00:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420F72C21F1;
	Wed, 29 Oct 2025 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEkOydok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyffjzDH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125E2C21D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761697853; cv=none; b=Lestu7Nv9NMO/27j3zR8WOPqBFsCuuk+AZPMnRfz6D2hSqKSISlOtg23KmS+MsmEG66MBmUvCfxPCyx9j3ohtnqAp1xliQ1zS37RLD6T812T0FNpcU9LTdNP7gsii2awt4cx1BVLxTtB4Q31coxpYqH11OwmzHO2vH8QByt3Ins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761697853; c=relaxed/simple;
	bh=9qgGv0i5pja2BOANc8s8On9La64eHzUUc9FhCRqGf38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQqkde8/IR5u/TO3Na0AbtiUGLOk/9mUGKfleQucgoUTWKH/5cD53i9KgTWpg2vMqTFvKPy1rGZqXBmmpz9JIj3NGIj3o/QDOKSrG2yo8eakHrokZRKRHdZEKceS1DtAw0v46ZO/+/TlYC3+m1TLRnKocOU5y0GUw+5n/RHy1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEkOydok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyffjzDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlOj52554348
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=; b=CEkOydok2jsuebK7
	kpCmaL52MeJ5wtd83KVpZ93pw6a8ivyGoAe4/IN62UwP8/CC0AvwFH31OWtXDb3R
	HntjABQQEzPVs6jIDdUi920cdXtHZUjmZ7vpD2t13AiUCb1tYkuM8++zHyqQyGz4
	VAWTqoL0HUBHbmw8jKPBQ0FhxLILRGO5YDR4dYOTSOHFpz+ib9IeEZk89HCjfty3
	zWOn28mMtKlB9l81pecqJPZpEsvpZTmrVxMVhZ5ywNeBqm/26CEHiwhbznmlnCJk
	6MO6Yb6K3aTwRV6ALQRiPldh5+gyok1mObEd2sD00Jw/z0WUPq+/L1XDlYcMDXwa
	O8EZxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10n5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87fe7c9134fso38657636d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761697850; x=1762302650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=;
        b=CyffjzDH/WzcBSH89lN09mGuJ2Yn+YLvZh/Skqj8H+95wUTgIoIJKFiiiNL4C2ukEI
         AZ3Vz/qW4k1XAt30IbjV+Ks4VShOyQ4QRUarOFR5th5SxMGTD5ZtWHjwTX9dkb2JT2z1
         Q49wTuKNGrMklUiKVXX8vEyLqoZkVrBV0e6FG8MoVIKWjxiVkaBrjaCVghDwbotRwAUU
         8Y3Sl8639WBKOcwOYSTEbOGXMXJ02FYYO8pIPxlOGfbFCP2MYxBUg7a01y3eYinMlwH3
         eC1yxFehs7CTYxAfL3D5bBdN/Uy7ZchXcSuMQcgg+rVGZBfVNyeIeAxlOxDIqQgQm9g+
         1rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761697850; x=1762302650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=;
        b=rPDSp4Bn1gDjor0AURiotFQx+Yq8/PiCghFbmBZkQYCDKS/0jMY4V1UUq5VPdzbSjk
         Nu8I7xRbYMVmRn04EfjbB0PVrlbCRvTQIR00f0KjwNR7DlmQaUtHViKRCi7KoaeDKMrA
         RqtF+CN0XsxP8+fpyB0FWk6zzzh02AISiMC6Waq1ugrkVsXHVA9V8K6oiG8Kydehb4mq
         xb+PAHxFx+TIqGac5/w3UOi417s2jnj4CuTWysMKkTrJr31mTH3YX49j5X2W8fsJOtPv
         BKYm0Lk0wz4qR+AJKivcemzHl+OIW1qPnIGhIzwIDorUDrvWTkCdrJsP0o64Zb70WNId
         piOA==
X-Gm-Message-State: AOJu0YzFe7AAL7uHDjbgkTZGHNYErAPAVIcYmjN9cDCxM0cQYBSyz8ga
	jpDVfDfrMOS55Q4lUDqfmxjf9ZPeM/2hrduBQzdjqXgqcVVLKdEfd64b0vhfWpqIDymT0rzZh0Z
	4oWEtWO2EnGpYAzU7f6fYz0FkeNQ+y2xKBeKB4P4p+mZAx1O7whM2qTYo/GQwG8JSEbkj
X-Gm-Gg: ASbGncutkEzVa6A2MxENIKIO9llofxb2qrVKX0JQm4RWVS/7i3dXkE/dfAYXbwrEFh7
	qn+npd9yHjH3TrBrCjsjM1qT+qnxMYbCRcAsK+Ibp5njEcfBLgAzx2gqApb7GMZKfdoTxSTVC/A
	TUXAjiuR3UwuFFtKnghZ+Rtug6gH4AW+vvetK2VJubWnPG3sPNZ98zB8Jx1qLG0jcobov0jSIRn
	RfwqF3DRVXU7Ids4HtYT7e6fUmJrscFfmjJ+RLhB+ccihEB+6GEPvgoDRGqZBPuo+woojsXCa2a
	NjBZGizuKq5/uGC7TPSATxeDOUbYLdtEsYNNyfEt+nox1EZOiwf2f7rLv9XL2/XzFaGzU4bH8vK
	Tssnnjr/qTdM7YVrk/6TVjSMTJnREm+3TmPb1n/vA1O5mqXl00qSOPweM5bSokGd6ugKelrR6qV
	kUAtp0uUO/JOMX
X-Received: by 2002:a05:6214:d62:b0:87c:2805:9fa0 with SMTP id 6a1803df08f44-88009c38648mr13965096d6.65.1761697849802;
        Tue, 28 Oct 2025 17:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSnLbnquq7Efq2KCwiEYWEnFhYg3Vhkyj2eKpcDAg1Bjm2R9tCzuRidVUDhLFOw6pKZFqx3w==
X-Received: by 2002:a05:6214:d62:b0:87c:2805:9fa0 with SMTP id 6a1803df08f44-88009c38648mr13964546d6.65.1761697849177;
        Tue, 28 Oct 2025 17:30:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:30:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
Date: Wed, 29 Oct 2025 02:30:42 +0200
Message-ID: <176169780826.3761968.3488141100025074954.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX8324F+iKJ+Ta
 Qro6UUbIkWbvUyJsDszwWv6ZXs7RVAYsSinumoeNAoQ9C0tGusfSm9jNAwAzzLvaxwauWvoS+Pn
 gxD5nOA35tLf8Q+t3f+Y7HLlTfwFi0nBQrDU/jyGI3rJEOAxTXr8VwLlwSL7JUn8c+BQHmd0iSm
 KoDhaJbXaQobcezQ4+mI5wFaUHwm/XB6cpZUFKAiZR0v4sIMFvovVF/CKq2ut46CqWpsQ15bJbn
 tpDTrxPynW+pb9TdAy/EWyNcEJtDde6b5QOl+RdTLNYPx78vmbrI2eEj8U7EImzL7ruKKoQEXqz
 DICk7gzg0aq8fbef+gGtz/cYFd2ycZthXjNQ7aNvNaUso7k/1+jjtppM1l09f/qIvraD1ATEA6A
 vOMsajHN+gcgYs/LGKrDeC264V4oZA==
X-Proofpoint-ORIG-GUID: 4sqIWRgwsCb_hbUp9WXvPCjgRod1vmkP
X-Authority-Analysis: v=2.4 cv=EKULElZC c=1 sm=1 tr=0 ts=6901603b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=8BgOjkq8Mluc09TWGxQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 4sqIWRgwsCb_hbUp9WXvPCjgRod1vmkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290001


On Mon, 27 Oct 2025 14:09:48 +0100, Neil Armstrong wrote:
> When in bonded DSI mode, only one PLL in one DSI PHY is used for both
> DSI PHYs, meaning that parents of the secondary DSI PHY will use the
> primary DSI PHY PLL as parent.
> 
> In this case the primary DSI PHY PLL will be set even if the primary
> DSI PHY is not yet enabled. The DSI PHY code has support for this
> particular use-case and will handle the fact the PLL was already
> set when initializing the primary DSI PHY.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: dsi: fix PLL init in bonded mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/93c97bc8d85d

Best regards,
-- 
With best wishes
Dmitry



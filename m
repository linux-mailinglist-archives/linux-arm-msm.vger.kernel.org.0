Return-Path: <linux-arm-msm+bounces-53524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A71A8058D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95DDC8804CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E2B26B2AA;
	Tue,  8 Apr 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCnJ3igm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A0A269CF0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114075; cv=none; b=IQjpUw3Kj94rQmQi2RBmgZJrpOrscLceMG0c4MMcib3sE0OvdLKVgRsQqIgKo31FQY1FgHN31cxJ8RGjmGOgy9+VRltK6gs24pfk3MpNFZQCBkckDbL2AlzCVgOiVRGU2azYhFEPIUL2nPAN1AZ+8CRFcAhBcyI1Ov/+D2esgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114075; c=relaxed/simple;
	bh=doIBbH06P5ovXkVq2McdyHPCl29PiqcG20/MYPUBpE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTSJbM9mrQeHzfkzKNZHqYEyQT7fQxVQI6ARpsOXFJMTkgCoc9urvRnvsG+/rOyWKNijji5h1gZ0FV9m5xD7tJO9BYFhHW6q9j0SjDePFRDNDG5Y+dSI0DHBEE0UmBslR6zofEp2MZ/RRL89EzfMNsiA5hEX/UNgm9S3xCuXXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCnJ3igm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AVN2x029478
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 12:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vFThqq7ILooH+RLGqVKM/XdZ
	cU6OAYhPWLK/0HqsQ6M=; b=XCnJ3igmR+clyI6eG7KCsy4++SCt3rnvgEcoddjz
	hb7g1vwListu13hpLmJk5ufeGmsBt0Qdu0SnQ/QRAtTZfdE5QShMPt8TbeY7A41l
	VFsCbPyorFtJTrjqkySeyNxr8C8CHT5PZGvanfmxNv66Cvbl1PDci8yRDawVnuAd
	Zc+YHj3bC/Vgx9sgZzbgdUB9JZPfXjP9ra1wzTgm9rPrPVNGFkET1SosGzdGwTbV
	67RFqwbcoSc3ZUYaJ5uURcPI7zK7KMC/shGPG8BM8iXpre0Ofe5yGNZJ8QhOtwDN
	ZO3Q//fI/7LjIqCriXeZ+MbfbK+sqhgGbmnKIv263WLRtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyypse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 12:07:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c5e92d41so896924485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 05:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114071; x=1744718871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFThqq7ILooH+RLGqVKM/XdZcU6OAYhPWLK/0HqsQ6M=;
        b=muOXnGt7GOJlgU91fbSj7z3IkLTWOJYcMvv6dP9Y+MiDrs0UjkBImrKcB21JK6+NjF
         /Ulo9HgK6r0QJ0LEdI5eCd2G4s8ZLagEtJRtyWRynvQKhGx1uFlDwGJP0xUbv56vPspJ
         70w74eHJP1V4aw24SLpn8/p+uuD1RN/dYwbAPoc6xMoapTAbIg+gbk5MQY0GftKgpxbS
         SIqpF2JjL8RWn5cUFGM499/GsOZ6CF5T1hQcNug99fYUrUF7rgOIEL4VoIFgmxxvhLIn
         kspStZAI46zwxejyJhDV50Akn6ZIAXA5Xbg5J9uWUac4nU/I/KTkwxMdJC/HBM9u+LbH
         5+MA==
X-Forwarded-Encrypted: i=1; AJvYcCX0QoHgGPKVsmxgeBdGk2fZZCqCPeZ9kjPT7SN5uMI7yr5fdv99UHffG8mFFeFlpLUL2QadCsXykFzdd6EB@vger.kernel.org
X-Gm-Message-State: AOJu0YySpEHAtG1Sxu7oitK5CpIUe8V7klXjq02syhlhZoQCdMKrDWut
	pRgKo2Oug4wRzLEXL4WA/EW5TAYnKLyLSgPt/MZ+3543pNtDzM59cPDloYNtL7VCdbqRKEJBPyx
	ktuM4GbOwTCDuEOw7gnbwe0AcbzIsxw1az2fZVSx+39uZEDgF0kp3TvqIjXiJZmis
X-Gm-Gg: ASbGncsOlBOmJ54h7e4+x0HHsnFvfe2gzYIGVaNZp/KRDcgnx7VTm2QgUjAf//HM6tV
	OLT4KM2itRWhfAmmTvQ2iKXnFUoDvWOSlsV7i1SpjPZzeu7WPiAzYEx+SUikDSvJlWJtl4vkrK9
	oT+D49I/82Qg7pssqjKQsgHa5bLDVtaiyXCc/pVSEcwAT1QJkdZS6VhgvnJeCkNeMXTYEkWYa81
	Ge6QDtFOtOPU1HozPW9MKZiAxYCmapilXRQ7quEtFuv2YXTxNmMT6mtpOT7o79Ox6meEf4UxZDl
	fDYlQGmvzJvQjLHHHXBjoEkUK4EPBJQigBgnlvQd3icEQ1FVZm5A3TdLszI2tWF19AypeZGyorW
	/ezI=
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id af79cd13be357-7c77dd62725mr1589591985a.24.1744114071333;
        Tue, 08 Apr 2025 05:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/xFz1Y/FUnJgwy2p/a82dsZcDfNqrlyFtWekzBv5M8uIRg3fMoN8KW/g0lGhJUXSQz8Eyg==
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id af79cd13be357-7c77dd62725mr1589584485a.24.1744114070904;
        Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493668e87.209.2025.04.08.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 12/34] drm/bridge: tda998x: convert to
 devm_drm_bridge_alloc() API
Message-ID: <kgobwv6zldlyb7vxyy4fyhe73krnsjr6aczpwl6agompne3tiw@vyk4m65vaqul>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: -7qBuBoR3tgpurNWO3iliDe0LI2pa-RT
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f51198 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=hcs5bi09U0a-O7-gtRoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: -7qBuBoR3tgpurNWO3iliDe0LI2pa-RT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=888 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:27PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


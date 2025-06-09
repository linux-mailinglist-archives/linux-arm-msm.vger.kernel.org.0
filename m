Return-Path: <linux-arm-msm+bounces-60679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBEAD2626
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07733A1A91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CDB21CC57;
	Mon,  9 Jun 2025 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrs7N1q4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6CA17BD3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495273; cv=none; b=XKU4B52riZh9UMThzmdHqKuy1SeM2hs/S+nTlzQMrpweHRfDa+M/iltJhlwuBuDl5ZbkV6YV4YhGb9act/lxtTsvc6ZHoDwRhaDD+Nm2DzKnp4fDONcpUJGIZFesMBYhQb+t1rEzNFPQTdoV6l9g/EAgQBad+I3kmZp8WRMYhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495273; c=relaxed/simple;
	bh=E5QR6jQFk4D/Qqx8U6Pj01fxZiyXoVlpz3YAjVjpI+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5nqT+h0XZ6fIvzMI+fATMkADhNysR9KMSAnQP9ErER9VAZYJgdZP9GTQ62lH5sTVH5+DQg82c4ihxM6l++T+ZE3D25/OeKCE058R4lb7AQkepy/rO9nZehfpXJ28Um0NMLAMsOiuAt3JG+ByYprfBBmRoWfw/ShLv/vW22tSkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrs7N1q4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599UUpN032491
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ol8PDG/DdkJ6brMjCQQkiTgY
	8p3wDi/HNTyGiH3uujY=; b=Xrs7N1q4BL8pGdFZFko+/h5MmbRBA5Cg2qicx7fn
	sNZcVPieF02AA5TGbJlY1kttzTNEM+fqjv/AWrBoqtEaJovLbUixIPEgZUe7azuX
	yYH8engzC3xfiA2iu3gKnRbljmbKXHA2+l2ysESyrMhotjWnjB6Ze7QND/3RrseK
	z0ALHpQCxajEKIPWEuBCivTs+IMK+6YSjcIwFyYUEX/P33u6jW7n6WpH8HMWHTJI
	z7USDKL8uejVZ2S/L6b0V6/baDQxy4plucprQzhtlEZGNmgVV60FvXKd1oaBh2hj
	4TDjfVQk8v0apE42uBRpsIGj4p0BctBSly4drSfg6DFqgQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75u8hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:54:30 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2d50f1673ddso4356606fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495269; x=1750100069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8PDG/DdkJ6brMjCQQkiTgY8p3wDi/HNTyGiH3uujY=;
        b=B9vKbGtAdKDUoCpmTHMYpKEktXVfq5xUMCYTX5QE2gfdQPOEYQwbFK9iHGe0XvFAaB
         qvXuSbfoDs8Fdx0ISL7ZrZC3mXqAhbpk1OJfMhg+ZdVQBSwAdcPqxHy5mtVHXc9R0gs7
         ITIyo6jGn1GLD8R94igJ1dhTm48OA9jEQdL4Yh0Gnvbmke5nWyO0Z+9fWwzjbeSMyz4V
         l+5k5kTWlQEnBsyx34OHoKfgMqYWADdqD2SxI9H3tJH0pwW/gvZ6jCPnOf6qE3sbZTAz
         RanhiFhh8dV3Pc3DmyCQywpF46D0/cTziE7OEGlXxg4ry6Q359y1JLjn8glyA4ChZPx3
         5uug==
X-Forwarded-Encrypted: i=1; AJvYcCU5wW1h98qNh7mIzxZPa3NvA5ZY/tZhrmYtZCagQHlD3/5mkC1Pzrfl1atyfSTN+RSf+bdry/WATf2r+eiE@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgyqN56zcJwpkRkYaXa7cCzzzTBKOr5QvJmf1CI0IR4nd50cT
	LyMtVz4L4/BQVuB419I+A5e/9v1PiCSsEFYx6KmTWpR46da22NT5EJyuOatnTD1IjU2lCP4SQG5
	Nsy65DsbkW6oUR3hsPqaAlH408IcFcgYUqp1RbecPgxjYuyMXP7MMLAi9M7rqCcX7yeESY041U3
	L1
X-Gm-Gg: ASbGnctJZJGm9L+4OgvTVXoxXgn7PLtQKJ9ZntWvZWx3+0ueApeiyWoLxiDLWeOSCxu
	bA7qfP7RHiVZItH14/jjW8122VbCB+Kqq0J0pKTSkfqXmPQtnfuUrz4sKAvt78wxIsVus+UoNy2
	iRhmWrq+ZdGDGPQV5dTLcYqMxxAYzQ+sINlnldn5vQVF86whqNjwkiGiaMvnAj4NUUHVM/D0HMk
	Y3SrVfyrW9lmyT/j8vfNkZfheOVESbZjvSXczU56A9Cb0tbRR26hzLR3kK0mLN1Ur2+3K8Xq0JX
	Np7XWVI4gUFQreAijBDHj30UPpGQEFrPimMPIJkqWDJse8RwiuczwSyeJAA1HSkWolZRvLUYqHY
	=
X-Received: by 2002:a05:6870:ad85:b0:2c1:ac88:4a8d with SMTP id 586e51a60fabf-2ea01130a85mr8696220fac.30.1749495269448;
        Mon, 09 Jun 2025 11:54:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO2dqN7vYHPlmZV87m41nP8/ZqssxU5L+Yh0s+1ZIu2+sJsllrp9Mz+wf1imIYHMK4S61yLQ==
X-Received: by 2002:a05:620a:2b83:b0:7d3:90ab:814a with SMTP id af79cd13be357-7d390ab8376mr930036185a.24.1749495258901;
        Mon, 09 Jun 2025 11:54:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d0476sm1266162e87.35.2025.06.09.11.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:54:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
Message-ID: <jowyn4tkqy3f7tiqzkp7nw627ddqgzgqms3q4rp5kveiqh3xc7@wzbhbaxxuftc>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: RmogqhgAp4o5m05S18CJru_07dgBwAYt
X-Proofpoint-ORIG-GUID: RmogqhgAp4o5m05S18CJru_07dgBwAYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX1/ryDqm9QXlv
 OhRt3VON7LZtJ54FSp5d/22Cw9YPXAn1f3cBby0eS+nEGr0j1HZwG9lBquTp0UgjB3ehFKLh1HU
 B/fz+iZts066tN8ENvTnVpzaQNBkhfuwILv/XQqZ6j6FcN6riemDaqd2beyL5xa/FQNTTMtIPDS
 41n6G2vV/NvoTCAdla074Z62eB5whuZGLBMoKQB2LQE2qWIo91qJ1BnFV7yCcKIn1GjkYlaLhrO
 mLGOEeB7WbnT0T5SJPkV52+YaiYXAGiOGPJMu7PG1/js5L9+1YFiCxrdb9of6E1Peg6eMr4bJMW
 80yod40e+A7xYScoSxZr6Tn1NwIl9ZKdDjg8f2hDJ/ie5xK1YBiyLbpkWlr1LWXK8F4BPupGkDo
 0DydFtq6SFlmSRw24jMaGmABYh3t4Jj7mSfPHPgWdz/ntI/LD6xhr5p8fEUGgQCg/BiGywVC
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=68472de6 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9 a=CjuIK1q_8ugA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=702 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144

On Mon, Jun 09, 2025 at 11:24:37AM -0700, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


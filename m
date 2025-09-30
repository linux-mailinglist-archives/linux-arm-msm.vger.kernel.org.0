Return-Path: <linux-arm-msm+bounces-75576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED4BABE52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D77017C9AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023712494FF;
	Tue, 30 Sep 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbPXCIfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C923D7D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218592; cv=none; b=k4KtqFDCCgD3W/qkQTgoglZbyuibtaASE3Sw4FZKCn+28Wov7OMawIrUCSBFCjsdUbu7VCcAUu1On6Q1OH8HfexLBfIF/cDYfOW27wzStJtGmyuB1VweRsHdy4P+RTUgtUUiOIicJjEzbchN7GFKv4Vyiy8N3/Jmr3P7E1qAyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218592; c=relaxed/simple;
	bh=vPPstQsecnnkIWa6DxFaHD9gRnqYStgZOVelTzbVHqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcbQ89a89ZMtabS7olglT3WINogdAda//hrX9ipk6x/k5TvvZKt29hbZ7A4tlHFpVXviQCPzOclSA4avqQmFPZS72kOvHdoc/JBkzp2Ee4i5z+VcyQW/C2WWJu8jQ7vzXJV1VU/P6gV8pz4xDgJ2pvVvYMXzcEGc8yEfGQ6eO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbPXCIfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOo7027373
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tcDYvvx/kWESRIwdIUfePzUj
	wXfd5DkiWsQQ0UqQcPs=; b=mbPXCIfsnKiNtisq0erGetEyK+l37muV+7YinheB
	bYj644FZBNuf1NgkhSgSbqRlm+TYG5UJuTdvExajM+vrUhtwvopVf/wSpTJ/WkqC
	hu2tYYX0OahWkjx/XHHgJ165uF0Hdl0hZ0NmfphU42nznbmNIJHNgJcE+NtGueab
	od5nvAuCN+cVzlntj3IJiIy7FHLagNgVuDVgefB2uDbvVHjVWmKsT3TunRetSyK/
	SXZxXbuQKgsXBy8egQfp4FHYNPv0FfnA5OKfkxqjjmN2DiFC/r0Lp+ZgdSNra7UX
	qUjV2tDvYdey7K8eKSeHm1dSYSwas7M8x+dBmnqjSl5Xfg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851g1gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:49:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d905ce4749so110871461cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218589; x=1759823389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcDYvvx/kWESRIwdIUfePzUjwXfd5DkiWsQQ0UqQcPs=;
        b=Nz9aa8yqT/wsr9VCzxwi0DUu2cfaPvWSsLNat9SQOgUmSpAba6qGbUhRjOhH8yc13q
         PDP41tS3eBWrbYL/ZQBmT57hVlNsZHn6KKxuDudEhKhp9BfjKtjD4q1EyOWO9POn6aza
         9KzuTIa8DDnHxCMOdU5qSRzChDJkkEGRRIghxYYU3ceZmZYNT6JnZybSl1jcFegbUg3i
         llZr47o5s6NYGpwYRZgTZHJPhM2lHd41AvSV7kG6zDoNZYcWhp83wIZ3jhq2HdoUB7Gp
         I5gFsId0T9VeKUw9moKislEDFXoPcozExvZdZWVGm+d0Vj5CoCwqiVBh6ydSZqg8NnVf
         Xpqw==
X-Forwarded-Encrypted: i=1; AJvYcCUxyD79W57WWBkgQyl37nkxbaLeEaSsYEq15A+RW00gzHXVLJlzTJ1Wk9qfJLlm7xp7Bq78tleAEMoBRpOL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kHecmt7KrXN7AXDU4sIlFLwx3yVdl+bvQGySxZzBdPIewIaq
	yx1/kAm1f50BywzRo1o05FEZ2kiYf9suuj0rpJarAY1mahjAv/I+SWwc4KEJAQ5UzfOMZeIwVFL
	Wn6SnbGhs3uUdMHBJw6rd9gV7u+hobvvajtjfeMGpfW3Gg+oKVVg93joDOvvi6rennJiR
X-Gm-Gg: ASbGncuA+C5b84qKOXN+mHCTBbv9MSPm754bI93APCKWv+tKERDH+epa9HwC0R0TxYe
	6PKnohGiIsAog8w0DYNg/Y2Ze5ICmAbuOljzhWkgzuSryPk43FutfJ5MByvJvezmuemE+5WaWXX
	GMPfCFVKS+tnJSfJeMAdO3wbcW1DBsfYB6rtMp5DjybZqE4Yxhv91xjDEOMRKqy8S5SiRbOj86s
	SvkTeRx9JhLYn0NGlK32TQ6vC5fCUUmtuSGcRHUs+blBROuxeFJ8zfL6EXUNWu8Vyv0rCY+B7RX
	k8IonddyFF7UcKZK1hWH4A9NgOnBImxQHROcy8rIZhgJfsUhzfN0VEBvj8Oi0ISNcEoHCPIlFay
	oIJlEy8ExjYr5VkNeNDD+Lv3bNI2xe24X9h4WR8CgdHMHlcC4R63XNbfpkA==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id d75a77b69052e-4e325d772ffmr15078711cf.80.1759218589292;
        Tue, 30 Sep 2025 00:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1NOqQxAPdQp+Dh3rh+AoIDtXwXlBUdceAQk5B9YJWaQLrY/hOzC1FHHQS6Zz8p9Hkpk4YgQ==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id d75a77b69052e-4e325d772ffmr15078221cf.80.1759218588705;
        Tue, 30 Sep 2025 00:49:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58567242ef3sm2908507e87.19.2025.09.30.00.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:49:47 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:49:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
Message-ID: <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db8b9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=219S4Ll1wpRkBpzXM0IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX1CrhtHhFH9yV
 WF3gZQHYtTBL+xX5/nu3jx5YNNWMosBinuAFEeq06gv+kwk6R61PaYRpnO3E6thB8+P63PbeMyM
 bWcfTny89/+fiI1Rmg/e8KknxWywi8MNKgyt8KqfsePd7H8nW7JjLGil5z1OmgFkFT9wBIzLGnS
 Svc1NIzYZeslgeJCd45RsfhVzMJ/DWxX64r895Vhh3obnR1uAlD55HemPe/jlq+05mb96OZ06uN
 qD1nnEiYqs3enV3aJxMls0yAhBjcbArUlLo7vQ+XpVlg79im0q/alp4QtQFdS2qsQswd8I/W9HK
 lq/IL6DR30Pf4Q71rQQg9Sm7tsiVn9SOA8Pbz1ihQtQYWDdjJ6QBs7lqZNPms4CCWwGjhZx9hz/
 I9bu++u+Ljb623xy212zhf5vkhmAJA==
X-Proofpoint-ORIG-GUID: hW88lUx3n6Hkv-LR2Ao_eA4fqsrH8sJF
X-Proofpoint-GUID: hW88lUx3n6Hkv-LR2Ao_eA4fqsrH8sJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Tue, Sep 30, 2025 at 11:18:20AM +0530, Akhil P Oommen wrote:
> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
> configurations before GMU wakes up. Also, move these registers to
> the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Fixes tag?

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
>  5 files changed, 49 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry


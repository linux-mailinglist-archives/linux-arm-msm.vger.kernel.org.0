Return-Path: <linux-arm-msm+bounces-82423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB96C6D1BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAA754EE3B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A6F322A1F;
	Wed, 19 Nov 2025 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QA/DpA+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbEs5mX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AC321F42
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537321; cv=none; b=DPWxvZWV7ZjL6aZ2A0vw6ZazRtyc/fW3X/Z6ivFW1FBbxWtm9V2BdV1pZAfAN24WkaDSxKf3Ul1+DaCB7GecDiPThX3iW7YFYJ4RoEjEf1iyXxbTlssJ24s9EfXYF2aMCZckKKzCHFU1j+9tsGrzdTzi9TYyspKyEgxPXTxABWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537321; c=relaxed/simple;
	bh=Sx9GGuIrjLFcxEnkWJHZB+sjQnhpDg+ynEZyANdQVMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvd3RPr6AiZ2T7zLnLMdvYLd7NRJZfLxu5G0YdaBdjSLzuprnUSiGabGtkFTnSd/oBymYbcjuR7VMN5/xHksm8knshAY1qsJ/KjiriqOBjvM/2ysnSqid3rE75fW1gmTmMvmm++RmrHCp4hM65yrPLRp6SgkwNrcFlMrIP6qaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QA/DpA+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbEs5mX0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ2E7U72755312
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8F6tsr+Y0mCAYNRXqHWtql8i
	o0OKhfJCKZv2IA1/dx8=; b=QA/DpA+UCM6D6A5ksdtM2sywgq+h+LzbsP9RDuj5
	m4pK8oM2M0695vJFraUckgv8PmelkZ/N5FvbuW8WnzUUXcuXqPGFNKZgTETy+PvJ
	H2vT/dkeNSwWq0fyQWfPBA7SyqbJVUlkOX3OBCxWdyPPN/GrCTZFILzum1Ai5el3
	KmVg/oITEHLOyZrtzoJNpZsX6/6G0qjkuGQWd/2zd5C6KxBlWJABwhj0BFfbjhZZ
	2IV3vBsgpPy0A2vopTObhXvunK+UE2Q7yvkX6c7NUfgo2hrH4LxKCZvoeHamWkyV
	TpygTfkp7GHuV3qFzokgAsPzF64H2uIkiQd3yeXAq+UbwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj3mfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:28:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b26bc4984bso1052385085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537318; x=1764142118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8F6tsr+Y0mCAYNRXqHWtql8io0OKhfJCKZv2IA1/dx8=;
        b=YbEs5mX0r0FOxzO0Bpggd06qgdU1y4N0zD914zjiBOn75zJfeEGcxEJ1ybpr81ydGB
         z/xvPReALUZqPyRsN4ig0Bc2o5iBer2FK8XtDb8VVqUPrRx3R/cTltDcdMGKHItsqFgl
         cLC1zOyfzFA388l/LueKDYog4ph5MRPJqFzqluht6WXuP9P2AZ2DEbkJ8Q7lsskizXU4
         wW4a66t+934OW9Fy4oFy2QXau2kzgmuqvm7jQHp7daEEbIm/vJ2pvZz+7WulTs4tekgK
         dOu40JBbW2E7URAuIa6GC/II3jMrSzizHVSJiOD61+pEwihJT/uXY8bFX+0t1vE4vlOV
         UTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537318; x=1764142118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8F6tsr+Y0mCAYNRXqHWtql8io0OKhfJCKZv2IA1/dx8=;
        b=F9sTmSUDW4Vibii0H+6k0tBHZBcOe4IlA/oqNCeYBAzclszjh+JLKxt4u8/qF/oN8T
         9rjaO4yuGNoojK7nT917bzzCcy7pl+/1TWIMHS68pfJsVmXZhGn9mQwVT5a13SvaQv12
         TAKDqGvP2sZ/qUqQPl/oCngmUojGeDJzEmt007XlMoeWIBSNr6z7ioh1FDujeorNwkee
         lMC/d6cW2nOHpWuirpWx63j3j78IphFU7+j+Mv9NOQephc/VwhxorWHy/EgPzo+dWEU2
         HRDfLUi0t3akruraIksIixhTA1+YsBhUgfDv9JUOncrECczDctpUkDT5ydOKUBzjK5gU
         3hXw==
X-Forwarded-Encrypted: i=1; AJvYcCW3YBWgQ/w5r0n6Ql+3PT29I6mrDSEDK9V6umL7BqGzde0AEwc78bEPRtrtO4GKOAonh3U0jdZIVbAc1n6D@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMKI4MRrn+Yy4J+pHVno9wW5A8cMWuv7AhqmLuOjzxHxB8bOi
	NQbs6d8pVqLCgkd30/AR4z5oVdNwiCplIY19jO3AU16KD+rucRJ+KIKTnSrz9DjQuaOhgHoHae3
	7pOUsBlaOcYz5rTPsFNxWCbpELytqcgT7ctLRMX+sSMAfI+jcNqTDKgBpyfog8tMoz/VJ
X-Gm-Gg: ASbGncvmb3fXcD1lecMN2ISwXPbxkRizA5TI9RUq6bFz0/ZmGbS3MyWnPP8PosC8syF
	Xylfd0wnxJ584cVbdZvTeBU1fYm4szu5LnkR99nWBdJc6n3Pclt27FuGJ9Yyi3u2pa9aAvTlUCB
	nwwavV4Q/oaKthSufHf3qDYPJuMM39bB7BKEATUWSVrVeZo5omPSvv+lLZ8k0t85XHQ8BM/9o5Y
	m1W+P/D/dlYKtBfBvPIHt2NqQRZ3LyTHE2Yd3dtXfg2Q6M8Mhjuj3312aXjLWVsJqOusqYlcDpR
	kPQzleckypyOSzMDc5hpctBqOea/VoGy5B95oMu5pDO7r8U7nARpY0ukIBOsOx3Fx8so/kJpJfr
	8Zp6Ok5wppdC5Q3lYnsC/aW6Ytn0R8bGmqWJxFnFIf52e3QHQQd5cb/jDTxVSp1K/vZLqL7b98v
	ZumK/wrS7piqh7MnfV02dCKLA=
X-Received: by 2002:a05:6214:27ee:b0:87c:2847:f7bf with SMTP id 6a1803df08f44-882925b1becmr231604806d6.17.1763537317525;
        Tue, 18 Nov 2025 23:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmqu4l/1lwgBqhj/Al6iB0IsTB91IKNEHwScXTc29DhfUQ0y8XmgfCWtAYGvoeLUhwuKcxaA==
X-Received: by 2002:a05:6214:27ee:b0:87c:2847:f7bf with SMTP id 6a1803df08f44-882925b1becmr231604376d6.17.1763537316583;
        Tue, 18 Nov 2025 23:28:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804004b5sm4540413e87.64.2025.11.18.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:28:35 -0800 (PST)
Date: Wed, 19 Nov 2025 09:28:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/8] drm/panel: sw43408: Introduce disable/enable
 functions
Message-ID: <sioljpees3e6sfygylxihk4kagh3dcfk7xpaydd4y5tip6apng@5zdkogftr3mr>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
X-Proofpoint-GUID: bBepcT4bmSujhoARkMWm-8WQh-arqf9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfXxJrH9lgstitf
 Z5PVZU/0aHfAS3Dg0W4wAFy/S4eYsuitl8nXOD283IOk0Wr43TpIiBJBY1uf89XgsRDFSdzfU81
 aNphxdIC+s+Ze6xh9TaMsaHI/9K+nd3A3+aBzy0Uuxs1ND36ss4wuao+PfHtADo9aoQwxtk/cPg
 EQZSzL8VsjRN8wGsDseRBmts9Lrcu0Tm+1JaNO8+lEPGByPF+6nF8kpCBn3MqsYR9OpP1ENncRr
 nDO+yQZOHYxqdB62XQzg/Pqm7oYQsRcXAw/H2ocXS30z668/b3RmjBoy6rPkRAhH6DIHqXodqtL
 7VrzhfPFmM1QHJgPgA6Q80bdFW2w5LxuXjuXcrcNnI8A0/VfA1uwls6h87+8Ge15q0kQpBA7Nsy
 CaYjBIjvCrRruTple9ua+GRj7f3row==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d71a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EXGSQNdf1jmvRekyyJ4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bBepcT4bmSujhoARkMWm-8WQh-arqf9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057

On Tue, Nov 18, 2025 at 12:30:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly cleanup, introduced disable, enable, and reset function, which
> takeover parts of prepare and unprepare suitable for splitting.

Why?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 83 ++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry


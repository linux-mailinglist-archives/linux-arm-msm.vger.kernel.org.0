Return-Path: <linux-arm-msm+bounces-63573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F5AF818B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196C94E1F98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 19:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6B229A9F3;
	Thu,  3 Jul 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewcoEFtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA131E0DD8
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571949; cv=none; b=O39qFaKmqNvolK/1Ka+sGKduqpjJ+OpSUrAb07oe1trrBTxgLvU87KmgoMUxGfaJ7AC3GWGQ/OQiPc4GBSKtc+9VjAct3tTNrw7UXEMjwQJyHW8Q7l4CH7QvQ72jear8MeHBG5WUpAYtmFiSDJ8w12FryES3eYEnsGspEt0yM+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571949; c=relaxed/simple;
	bh=LQPTbGns/pbiTHOdx0vsWRlLOnEjd9WhaihJG5oG7i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF8nF8s6GipBQQTjJxdhdbJrO+DIVQR6vjlSjcLp3AjwhqU8flZMz+MzmMNqm343qoJHy4TCglh1RQxr42/b3d2rPN7U48zq3eRcSuQVQOPpsHV5CwrfNl29MUXLzWnkRXz+uRoh0BdLtsLUKkdzRXaWupJNM6PJE2X/mWizCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewcoEFtM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563EgiUx009719
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 19:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZCM7QMSDxKv2qFBgS+zVkBmh
	E3IR8xSI0qRlItQCwdY=; b=ewcoEFtMIcZSBpo75EPx/BH/CxTkkphmZBNkiuxu
	9Udld1HDoCowXgie/z+7iCgs4fHNay5rp0GSM1qTQvITb7z/VxaWBxOLlKTehZuy
	er5HTFPjJUxQuOTk3nnA4XNwdiXIVTXWTtJFniD8ktHLHoBsMRBu7WnKZQnfyR6U
	K0yFFaDtCzrIJEvE6Q9PDtVZPXKd2qtH+027PjDWDt1SzGrTBnymoVhAIvrvNjUP
	u7B2ymKP7pNQIGx3MNH40Iai2Q1/yBLqybPKJp46plETX5SEHy+5fW+hgbmgZmKn
	KV1f5bwVmUHDq9aiVnMNwSsh8hRyHQ/G0CWi64wUwzLG0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw1q2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 19:45:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cf6c53390eso15278485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571946; x=1752176746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCM7QMSDxKv2qFBgS+zVkBmhE3IR8xSI0qRlItQCwdY=;
        b=sK1eVHCRv99RUhkEudIu6XpRbDArzoUFnW3sxzvsT5W3QHwqxkBeDBUPZwmADPPcpO
         4bz5W8C0lDBjdWWmbHfiwuQaEj4x5YcMoXaAmJ5xBSYik+U5VKHpUfOKkfao36+Duab7
         gshc3spwvxCksQjqVLKm4y/etFIXVvBQ+JsbV2p/oUIS4J1SVorubbUqWISGFxviMBwm
         jsYNnNqRV9CSeo+1K6rp9rH7t0x3T7dUBR1EHKjGwSBTqMjG6gkCWd8ZuJZTCefURst9
         92yHnT5e5HLYoU58JeMbqQCI2JG7oIITw+wQyUeGH6l6kRKvwYQPyYbGtbhxHLuZbaqX
         ZnLA==
X-Forwarded-Encrypted: i=1; AJvYcCWy3I3wlAL7OKmRwTat1rT+doP73vhvcv1yrwf6/1GktFW+azVYRsS0LTVYJtXa61AMTHNkyY9jlhR+1Giy@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSCEN7FI4Y6RI2iAChRZ1YrkXv46JylyZIhJbDOWNqGYjelCZ
	MSuKkr6JLzhCZUSKDaALzQJQypuSjlxhdChvliXMaAao2mZ7h8nHt9yo+Loc5d3912ecvFxq5HJ
	U6tcQqHiajk0EOKSFCi75T3Ud+cysGI755PJiz/eNx0CkDhh0GLSdYWv1Hx40QmoKWQvWqTpSBw
	mzREDUMQ==
X-Gm-Gg: ASbGncumh6vcLAN3Sr5F3otGEwJreqpfvNeVU5D/xM6rX20PPi6PRNNNhZ2VfVyxSfk
	qPFakWKeG122EzMpd9XQj+wqXxZsSlXOCLjP49e+AMbg3/o/dTo/pbbeGLnDvw7ha2nRATMW61V
	5tigO0ad/j4WWbYfY0ntiRuLIeTpiCfyc7AzwWN0g86SAJhFhdwSdxyV9j4I49xgm5fn9dsv+5f
	+oQwioTJoRB6ELgNywMW/ZBEW2V99MXMKK2pzM/yzmmWyFroUSc61TnqilwsysEd+3AiNz0OvDi
	pyR9UbzV1h8xBKFW8TIZLMDIr1vrg2ebyBBl4xBEScYBVWOezvJAX7VNCI7rhro4OzYR+wz5gg/
	7wX9ACJCrkIWxlxztCCjkktnLeYXYyquFU0I=
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id af79cd13be357-7d5dcd151fcmr21173585a.28.1751571945586;
        Thu, 03 Jul 2025 12:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS8RFdz2f0aAezmbC6UWYhes3/5YevtRWhAWpjVXlYu8m9CftEOm5G+GE1c6x1xY4sKoE/uA==
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id af79cd13be357-7d5dcd151fcmr21168785a.28.1751571944980;
        Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494483sm55037e87.99.2025.07.03.12.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-ID: <burq5f43rrr544kn2kdzd5mvdi4yep5yz2g3dfortldchfqag5@23c7ciirwrfv>
References: <20250703183442.2073717-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183442.2073717-1-robh@kernel.org>
X-Proofpoint-GUID: VgpjG0aC-r7c9TkvTWax72D6CzVALQKC
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6866ddeb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iv_ZzY4-czSJ8NSb4YEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: VgpjG0aC-r7c9TkvTWax72D6CzVALQKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX9itKsac7rLFl
 bZzsWZp1Zr0BExLZXhM8Bb29AJBBqCWsYYvbTFIWPcQ9ahHxqWXkmVE50oWhp89GVynleOfQjsq
 O6qMOk4zk9QWJucXMTrQjcPzt92gnty2Xfk/gOBeldLSRf7+ZrIeVYLqdt5UNDTW+huw4OaflgE
 Wm0kENy2MhC6YtIFrPnTMaOJFHQ8OJt1EYV/NVc8PWo5YYCZphe2a+r2wI0GRT9tXBC6cPFo5Cr
 6YdRG9OdfqaPw9D8k0fLRK0oVpw2rQC+2Lqt0E7FlwoRLY0KQTFPwdRxV5mP+QHfBvipD0Hxtgw
 SaF1z2AegKO4UaEXvV8FgKwWmWrGuqz8Yi0DJ52bCG9Rjie698GBewPRyAI/rxj/O/ORF6xU+ii
 6s0e1YRQNIMZg7aqyqFGA2uWvJpFPznCNOJnicjRp2mZDw+NQhpuPbmkf8lZFrgZ60Xal4D8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=737 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163

On Thu, Jul 03, 2025 at 01:34:41PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The original code did not set 'zap_available' to false if
> of_address_to_resource() failed which seems like an oversight.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
>  drivers/gpu/drm/msm/msm_drv.c           | 15 +++++----------
>  2 files changed, 10 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


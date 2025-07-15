Return-Path: <linux-arm-msm+bounces-65070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2DB06530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214B116466F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 17:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469C227465A;
	Tue, 15 Jul 2025 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lm0sNmuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A726D4E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752600853; cv=none; b=pk9pCsho6epTjJYQOQ2Z4wamZK6XU3TIaSDOHPaYEY0bUSMQwJ2tr3M54D2fbGA1mLyHgg0504Qa+1MauFIk59YQ/7jfCAmJsR8G5mRZadtIs9TgBslmW0Myt/h/2Zq7vqlCeqX8iKE00JT/9sI0kbGXmWZm1+kGelzSna1tOrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752600853; c=relaxed/simple;
	bh=nwBuJDFSMee362Y+5uNbcUsUqvmxAOxzANn+K8hlvdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8/bFf4LId6QlJYElsQmEklzhha3iqGnW/r/egxT5ljr8i7FF0uzf0saW1neZkICcxYRukRIwNTwG6mSI4mk/3sXwd2PwGoLy8F2ynfhZf6Nmud0EkamSMiljclZOCqSbpN4SuK0fM0d6HLA7VpiVSGKCndEXEqtvkdyPdqDDlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lm0sNmuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDEDc024488
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JypJyhcFPpnntV0Fi6GrShtL
	07+iXRif1HlidBTcgdY=; b=lm0sNmuS2x+XCWmaFseLstBKv6hHjV2VnOcbQsqE
	m4vsZ6uFoBU1v6SIde6ad4NqjtsdfVYqG7BRZ7VdzDxvAonzBo5TuyHmiBa7AlK1
	e58hAlS4q3eEPhoEd3QPrRUjuhfLTGLz1asCgXsrZfsF/pgaF9MT0Ks1QoLxy4Rr
	Madhr/xqRmhRlWXq2NXMvrCvlo6L5WxcCMIKukJgJDE9UEYszhe0BnDYxVdmpeAH
	pMgry9I7roDBK+22QwQwUKD12rf6iYqHLnKcGl3+xCoHbLDMnXsHvv32BndIUsCF
	r3C4IjA5KZa7WAbFvSA7urg1/Ci41puF5ttNAML63GEGhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpc10a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:34:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e269587d8eso433035485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600849; x=1753205649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JypJyhcFPpnntV0Fi6GrShtL07+iXRif1HlidBTcgdY=;
        b=WURAUMokyJW1YBOfgwb806g8n6tskI9AhAbN1WjvttgvwaDBHB6k7cfUAOCuiS/715
         FF50rZb39JsB0zh5M9tdzXp16aWOkmQbtgd1IE/PwX0QDrUdMcMSIpYAIlu5TPgIRJuQ
         KyWEwgVqX2ISbsaQbZHZF+Gg7F9tkAlhf6vefHrQVk4PJQOLE/4Zm2DeMxBZWB/6uowZ
         7Bg03JZvXw4DLjjeoojK3fDcM45aJTDumKtMwOT43lexLwVZrf28NQGuAAGKkOvf/j3h
         qxm+gVlOkGkfEZraCAshLjTQfRrHls+aYwSIiJ48K1DLNAqVxi27zju4m077R5qGz1PD
         n/aA==
X-Forwarded-Encrypted: i=1; AJvYcCVP25GDdMvjxqV9foOdNVLYsgc50U0kRmqRT/nI3Es39wVMiLUMEdAZO2jxKZq3UeINh0Cg6sr3mIFJjIol@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xihQ8coVosQWHQtCvoj2bvj9WfIhO6hPHzMzjUCfclVfAK7F
	UIY647Ur37pYxDvgbCqfbEVaannjmoj9N5gxJQCll1e2C6dcXcsHq8S4FOUWoOBo+mnzi7cZ633
	RQC2Gqok+J1ORfzLcrep/mcNa+g6Onk4XdYhCFu8tF7EqaJor0fdFbPp1X7uqpPyRNpOI
X-Gm-Gg: ASbGnct5Ywo5JvcW7Xk1Kdw41JLvpAANUiQhFX/ktnAd37Lx5AHMThJ35R+kwriXUoI
	boQDMF2mzKaK/bUQViVkwImDo9c5OjkQ6wCtyIrz7dvG4hzE2MQgNNxkPMmwZXF6Ie6l/Pk8d03
	OmfYqr2SAL76aA2DZFeDIzxC5WeujY3i3HhpdXlL0JifH0rj03SzO00mYEjds8jAAMpF8V98Hc/
	VdqdwFKjTv/0Q7kAG9Ads0+W28KTznbaGlcbFAIibBrnsAnWY17nTtsyNVTr1r7oSLCDIM1E2Tv
	v4ATjh6mmww/ZwSK4/mVV43/yAxEZyEdnXPEX6KWIRWM8FCb0LsRCxx2SZiCwdJX1eUkVtevHH7
	1L7H610sK5JwXxfZ6bI7+DqNym+5We8PYztKaqZfM9wNQofw/M7fk
X-Received: by 2002:a05:620a:8804:b0:7e3:2db6:1163 with SMTP id af79cd13be357-7e32db61251mr1076168585a.43.1752600849395;
        Tue, 15 Jul 2025 10:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL6kyp3qxt9/dJrs/jluSwSavkVrcfUF4Y8b4Wh9p7uPXySyslxIIgIxjH20UBXqn/LFCbcA==
X-Received: by 2002:a05:620a:8804:b0:7e3:2db6:1163 with SMTP id af79cd13be357-7e32db61251mr1076162885a.43.1752600848967;
        Tue, 15 Jul 2025 10:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbd4asm2349248e87.2.2025.07.15.10.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:34:08 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:34:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
Message-ID: <u7djktpqezpscjjuvdwa45x77cnkkiis6wdvah7uhjonbi6r7m@cyjqsarrxegu>
References: <20250715085227.224661-1-quic_lxu5@quicinc.com>
 <20250715085227.224661-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715085227.224661-5-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfX18Gji5FKuDxN
 DWPDZnG/9WZtQRf9nXv3+7WK8sNhQ+rMTFbhG5yGgx/38TvrkGSQfJSwIzVvBNmwTpEgYG8Espj
 Qari3zlW8X46GNMXmr9BGiNtGW6lc8wRpwtQzU5M3dz4+xqHvYueDbm/oI0ktGe+eXzBI9SXuPM
 DjzPL1dqxXoz5MCIy1hDSUhJycxtgsl3u40vKRHheGy8lfayNahO7ByXbddi1TFTVEQO7oKRd5u
 MVitElEauSuGyEoBsF2PrGn1CkKfLxEO5HAxJ8gsdnk1h8Gmxvpz5j1QM7IdDfdwd+jCX9hJS3A
 1bcxhjaU0nSgHiIl3iloh8l5JpSMBNhrRYn/vu1GgWFjvMWPGg6ZIqfvuWSIgIvhR7cZaT8EdUb
 H3vTAwhJxb8YQTJ3XBYChauSm+l/LJYcrJ9QSfwL0pjsszhcwfEMJLPy1mZA8/Xmqd5ynAdr
X-Proofpoint-GUID: Pa_AqKbhy4o00Wagzsv5dX16MJcvynHz
X-Proofpoint-ORIG-GUID: Pa_AqKbhy4o00Wagzsv5dX16MJcvynHz
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68769112 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=yJLdw4DFOlQ0Sc0dKNYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=962 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150160

On Tue, Jul 15, 2025 at 02:22:26PM +0530, Ling Xu wrote:
> Now domain ids are added for domains, which is different from userspace.
> Remove checks and log messages related to 'domain' field in capability
> structure. Update UAPI to mark the field as unused.

The order should be opposite:
- Domain ID in the uAPI is misleading and should be ignored, drop it.
then
- As the domain ID is not visible to userspace, drop extra domain IDs
  and assign them to the DSP kind rather than DSP instance.

Otherwise you break uAPI first, then "fix" it in the next patch.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 15 +--------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 2 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry


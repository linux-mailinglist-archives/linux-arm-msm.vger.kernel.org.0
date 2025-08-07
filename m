Return-Path: <linux-arm-msm+bounces-67998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4234EB1D70A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F007E3BAA66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 11:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A212230BEC;
	Thu,  7 Aug 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDzMOl7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8C2367DA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754567645; cv=none; b=nSOOTu9YhgYjgMJ2uQJXDp11FCAV+Gi059StfruFOUKFlc3Z36Gkv3CLlHIpM5fEIC76rEoszpi3sBdnNRdf+XA1Gltyxe1zBLNcrGR7mhUSOyxqDdvp2SHqOa3uck/2a7rZZG060aEiiLwKm4/rdY13mA97erucpywY5Qw49YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754567645; c=relaxed/simple;
	bh=ZZJ+58v5xVPIVDkFEIoUq75jX+V+PSTGi4Gi+0x9868=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnTg+1/Ueb9+yaE1LKwy0AmBg7+e8Iw/5fyp4D1s3+zIURYf7XZkblOEfMsTPVN2GMQPfgIr6KQjPYmLgAD0XeLQ8vhnDMLa+G8nqedT7wqz36gU5d2NTokctoPfgPLa3L0EVk6JdM9IPen5EhS/Ba0nRcDgC7Tbv4RaLXSAA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDzMOl7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CuSA011702
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 11:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JmsYXKB6unnEWfBMH3uLtxy/
	JZx2U35Fps5OvfGfeC8=; b=fDzMOl7xqzlv7RYzExEPyE1icsp+4hkb+9Whd0jU
	e7PGg2yS3ezCbYrHaKmmIC4RapiJMwvGHJ5IywhH1TeZ9lXiprHRHKLmXUiuqVZt
	dcShI5rNTAMeVPpcJVFpNtD3P/KvQuhvxkoB38huTwb92DG5+kmF+0cS9bthmtsV
	MGga/q16G77lPAW1UAncjlUI3S+OhgWXBbJWzUBOozYVO8uLeL8faIA8tCME28X5
	1S8AXB6QyRH0DmhhN40mQekaOH7eL8FNCld5VP1Qut0+j1gCAM76O9oZFmuuZlbv
	CXoBPsY74I8oxMOfE9UD7Hm8wxTjkazXrLNqSTjk7mZ8tA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy0w4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 11:54:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08d73cc8cso23560081cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 04:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567642; x=1755172442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmsYXKB6unnEWfBMH3uLtxy/JZx2U35Fps5OvfGfeC8=;
        b=w/U4H7yP5YIi/oe8BHiRO8IbxXfTxrH+hTEoecnR77Mt8QXmams15HUU8d/hb3tByo
         n8ufGEF9PWkI8835aGIrDKL/JpYAGatw+2yb9LqBSW/S/JwaZ9ec+xNIQ+7QWQUmsRoh
         sVAea00q+0Z+pmv1ztGhCKYdKoMo5tZcMZgtGIYMgO3upoTBM/7wKzoFjM+QakDKVko5
         2iprhImJAQd7HirKtmimlLYQWsVHVP2ar28ZFcnILdrPoDhbHKB+p4+NdNdomfZi8SQn
         SKC+VOCx6qeRlvlBMHGNP3tUJHD5FjlKiBMojH93p3uqba2m4NkZ3jjiWt9x5fMmFVm0
         pC5A==
X-Forwarded-Encrypted: i=1; AJvYcCU6CRiS6rnNtzOuz91TeBw6TH6Eig6cl7+iRwFbAfNjnKA9SMoGkOumWVDjFB4HHxVdYQhbJ8aZQUp94bmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtYMtWpVcT+ed3ikqTKJxTEDCCAlASwOvy3UU6T/0L0dJt/znS
	aHUiOdZ7nIF65TTKeyZV4zzkB47iY6nEGSr3ywoh+bNfj+TLDSj3BppKwIjsHZq54wtZgxAXjh3
	bK+9LgzilFn2o8Uyn+Qp1JjFwyWyMLAdM+t4UlshoJPXiox43+iqUe4UQuWwL2Xqt3Dm0T1+zoN
	6giFuIVw==
X-Gm-Gg: ASbGnctAjU08YZ0CKm+mAVpeVcYmodKOlRSzBoHJj5NIIqXXK1H0QOcOYMjGzbf1uVX
	Vq4HWsb6U72qtXf80gjpMWSMX1sv2/6n2XR+fca4cvyVcPRdDtUeE36rX9wvrDsCOxu289ZqZDe
	umbhfObIj9x6/357D+Q1FbEHSFBahgfNreduKu74exNRwov7xJuIL6anlGtCY00Xk3wSnP6/sUz
	klWJqZ5uiLwfYAxSV7o6PRGETu98gvdisI1AFsXWoijZGe3oZLy0Cjeqc7WGEIglcrbg5+Ewj8i
	ski3txhelJ8weUDkaoz/rWPgVXGllF1Rp5El2ZrT4Vvvdo+CJgrxo42rLuubr91B32rUm+Lc4Hg
	urJYf4Of29EiEQC3C9RCQUfxLYFQMi+9pvGRMQIscvMC6uu3TrG7l
X-Received: by 2002:ac8:5a12:0:b0:4b0:7170:8559 with SMTP id d75a77b69052e-4b0915a001cmr123089011cf.40.1754567641701;
        Thu, 07 Aug 2025 04:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa8xjZrgk7JKGa+kcJ7fkcp9cBxJaas2DISbCOZ14pSOMtXEioAO7a/COluo9VEZGCXO56jg==
X-Received: by 2002:ac8:5a12:0:b0:4b0:7170:8559 with SMTP id d75a77b69052e-4b0915a001cmr123088521cf.40.1754567641205;
        Thu, 07 Aug 2025 04:54:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8899ebd2sm2602768e87.42.2025.08.07.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:54:00 -0700 (PDT)
Date: Thu, 7 Aug 2025 14:53:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <pt7dlwbxcipukwc734ftspj6ekehtnzfwndb7rqx2ihpxqwyzn@m2pyqy6nugdd>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
 <aJRMUzF0GN2LFIZd@trex>
 <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=689493db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=7TY_VEaP9L5SwCdglBoA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bLlIREwsJ-XLsOURH9bxUp5sfqFSutA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX8G6cJrJu+kRH
 NvtXxlAMdjABUtL8ZwuorgdMyr/a+bZxT/WDJOhuvuZNJX/YaYctBiKzhTlFQeFVqzWufpQM1Zw
 F1IVue44bVM0n09UjB1SV7OGD8wQS6zDIx3iNmAiyorKmptlN2oEixegHfgySvH5KRqBB039Jkf
 rH+tjJ5VUJtqLL676pz18DpwuJj1XoS2X1czEJRHqqlcBZ6mORgwRc0cZzZQXV/V6POeo6wxNiB
 7ftOcihIDT7yEBG28NbUVkRs+J88M9brgwMfXvmzUyZCMvL1ddFPd6YIrFQGBCG7nFCCPFi3OTZ
 eYi5ts1Nxo3PyZTVliC/hBWmLQ4fnNNe3MW/vew9Kk8P3zULnchkxLhPs9jU6kFQrYLS8etiMLJ
 rmFbad/p
X-Proofpoint-ORIG-GUID: bLlIREwsJ-XLsOURH9bxUp5sfqFSutA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

On Thu, Aug 07, 2025 at 11:11:31AM +0100, Bryan O'Donoghue wrote:
> On 07/08/2025 07:48, Jorge Ramirez wrote:
> > > There's not alot of value to the user in that configuration.
> > I dont know the user base but when I originally did the code (v7) I was
> > thinking about security conscious users (signed firmwares) who might not
> > be able to switch to the new fw release so easily (unnaccessible key
> > management and updates).
> 
> Since the driver for the LITE hasn't been upstreamed the # of users must be
> ... zero

The question is about the firmware side: if we support decoder for
6.0.55, users can get video decoding using existing distro firmware (and
just update the kernel).

-- 
With best wishes
Dmitry


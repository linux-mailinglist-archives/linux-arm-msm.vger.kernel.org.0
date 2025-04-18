Return-Path: <linux-arm-msm+bounces-54692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376EA92E95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 02:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA9D1B63027
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 00:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD59C33F3;
	Fri, 18 Apr 2025 00:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWHSHncb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5005C372
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744934606; cv=none; b=KRsvxrd5tLEyWlUvGEx4HMI25dipgt90FunK9XwaXgksxnPzfUvhmKXaj9duGuSl1fZ7H/9kA4u2/iMRNVXUfOlx0/qv0HsniMz66wCK6vdIBUj2TQ6otBgG4MBR42lrZPTCGAFAnq7alGPvdFAhtfqaa5DsR8kag0u6He31kyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744934606; c=relaxed/simple;
	bh=xkDQfit0Ny3iyzLvzjqr923cX1Xhwn74NDE/lifPT18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMmr09BMFXcec6oPNLFu5EMMUXDPau/AkPvyCqqxdjgOdnn9f1oIYnPP2zJo3QZFBaO1+fSEKZnoMvsCqsEiLNWjLFdFHVGSxItzTJF3aX/iTHnGASw6G5Zm0fVPAJYbVbI99Je84iCMyZ9PTXUFjGznolMyirSQWKw6rUJQZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWHSHncb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClNPS013280
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJkocawK74IHVR8GG2dYux9L
	W2UbP5wOCkAP2RU5Rpw=; b=bWHSHncbmPt6gikdLZmn1hyrWc0tm9hKLyenD2UF
	lshwKyh6ufPC+1ezDuhAOcXZGnfhOwo4CLMtQYAgU2kV4ShVqCSvCfYXW7A/2LyW
	BYWops45xStt4Yaps3vvBnmr6ciPF/LhixIctgQt5yuQuk3fSp/tkzzUkh/Nuiiv
	65w0RYSnkd+axqZpjNY6fdNgixFPYnOwjuU7HIzkix8V6U1ovIMvW/StzfNPbS9+
	g8YHOu/E5M3qFYlin/30kFNT5G3S2adUtLQeeqF9P8Opx/lGo5Z+PUCg+/Oj0YKP
	lYF+icWgyV/SFO73vVd1dawj1d3l095re5/ow88nxFm4qA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvdu5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:03:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so1295225a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744934603; x=1745539403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJkocawK74IHVR8GG2dYux9LW2UbP5wOCkAP2RU5Rpw=;
        b=PqDBKvKRQnGfbhJ4Ey2q+2xSq1onpeWLwjpXuwYo+9ujilUFwn7uX5eychJNtoQsg0
         eotFr6hu299Haq2zmpZJM8gMCAck7fcOAqo1dnx+oj62DzQ1s9UPBS1U1/7vQrJS/H32
         +iVn4nmWvHsGP70E6E+AnfFmmBENhsIAMX38PwjkVbomFFqUKucA/y+Y6CZVYAgnz2zw
         JHG6LtJB+IvJZvJegt7sVB3oKg8y/CUYCOjCDfhKtJMqgb6JnP0OyVQUilJU08RYAwri
         /sgD3f1WHmyuSBZfuY+2s665O4n5QE5tPBsyzyhLBJX8yzQZbzJqLfn84CcEmckpo5dx
         jyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZDTgZ35OFQDREb2w6Vfgd0qQz/Q0mFz3h9OtP8zktIq2KkPPjWRzGlXp5INLvFx6DY3OTCvp1hXmfQRQx@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzLpimxOzRUQwDgJxt4IylbI5d1u61PallGwzpGPK5LeYUbId
	r9cAfDE1lpkY2h69rc28LchSYQgfDu9rPE5cqJ2uJuNx5UJpV7ozvw1yD5fAWtztx4SIW6Gfy3Q
	9D5ZVEc84IzudIbotNEmWP/aTdpUeQe31DpdlHbJ2q8/Xo4SamXrmvmRLy9FiKmEYIF6FEHuOF8
	v1SCnMgKp5BRhUxVwxQR3xAdMEyrD5ziTCXsColg8=
X-Gm-Gg: ASbGncvLpxvTPSaUVTatjABqx3h/6z/uMId0bsoJvxY6YcoqHNvAQzWkF/TEv7XdAKA
	Zy74f6OuFEUdJ03VSY8lfQJWVhp/DG/P2q7Fu5a1p482Ky6gZX142aFuwrQArfZiJmBaO4vgG9n
	wb0JmDT2ndr6/MMLHeXstN3H1y6Q==
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-3087bb4d0bbmr1348852a91.13.1744934603069;
        Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3zEHzT/caZi4wnZ175L8zlXV3e1qMB/QyXjcrkOHqa4wh1gNr+1LZYEHvAQ/csu/mkfLj9QPTnPMCwx+vTk=
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-3087bb4d0bbmr1348781a91.13.1744934602616; Thu, 17 Apr 2025
 17:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite> <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
 <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
In-Reply-To: <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:03:11 +0300
X-Gm-Features: ATxdqUHUTgGLYvTODPooo91SkskG-gwTNA2jG92kWlujJbztIUTMTuUwe0XuE_s
Message-ID: <CAO9ioeWgtsTtMmqm4w4KTYYSVOWpj1Sgb6D4oy+54wBHU_DZ8g@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: sMDV6E-qjVlumRbLgspV1pksgQ9Oo85b
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=680196cc cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=ni2JVXtQXpgTILOyzusA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sMDV6E-qjVlumRbLgspV1pksgQ9Oo85b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=585
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170178

On Thu, 17 Apr 2025 at 15:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/04/2025 13:12, Konrad Dybcio wrote:
> > On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
> >> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <lumag@kernel.org>
> >>>
> >>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Addresses do not match. You re-authored the commit, so now everywhere is
> >> mess.
> >
> > It's git's fault with replacing the linaro address based on .mailmap
> No. You can easily see:
> $ git show 51a6256b00008a3c520f6f31bcd62cd15cb05960
> top author is like you say - mailmapped, but Sob is my @samsung.com
>
> $ git format-patch 51a6256b00008a3c520f6f31bcd62cd15cb05960 -1
> What is in "From" field? Samsung, not mailmapped.
>
> I believe that's a known problem in b4, already reported. I don't
> remember if this was fixed, but till it is - you need to use some sort
> of workaround.

No worries, I will resend.


-- 
With best wishes
Dmitry


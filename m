Return-Path: <linux-arm-msm+bounces-80686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B1C3E52E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BAAE534B32C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD652EA178;
	Fri,  7 Nov 2025 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akoRC4Mu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUAkbeUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207781BBBE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 03:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485391; cv=none; b=O/Q1K3yDLarB3RxqWgEcfmkJ4lokiOTxR5iA3G7xa3dtmSroB2CmoeOxKSheYuXCqYAPgOD6AXvulm+Cn7sT3IoIYjDQy8Gm+X42JXQxHQbPDmNKKQLVWJOcs5Fa8b0XLTAz/biuJt5Q2hu2WLWhEDuvHmpVeLQ/z3C35iG4Jo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485391; c=relaxed/simple;
	bh=1morzm8NYa0wAvKPrknK4exKQLvQ7AJODwCifEu2fT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmdL/jwSs7hWbMvBB5T+a9p11GQ8GjMzqvJhmti82yv/FDu04CFP7rAXNyFaYj65yGRErlFsZ14IWp0F83buJSGxed8VTz/obz942Q4bAynnM+TP9MurA2qG/xQLN1Rk16f8Wms2bb6qq6w+W+t2zxfZS+MIahBEDLeAEyZjdD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akoRC4Mu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUAkbeUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HBsFD2326595
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 03:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	prIk2oxefhTBMGizLe5VBrcTGfPiFu9uI/8uXkNkJYM=; b=akoRC4MuJEYOHcOn
	GOEn/RdiVZ7pF80wuWp1tK7XtyCbDnPhVvV5K3NlayL39B5GLS7OVb0OPNdyxT0L
	UwlgfdmR1BjFq0wfhVEVCFiKlGUEBscmUObbhU6iO0ubpIMbjM5bd4E5zZ9OIj/X
	M5sESt2ytsYmiRF9TZzGrnbfCGUz9t5UFOM0LLFFFQZ1Px0dlIwUfHkLEc0iZu5J
	C8PQpcWoDpAL8QbKj/ol9Er8atBO+i01LkHnRLNc9NwK4T9KJoGjhZqUvV45MzJ1
	jeXa9gBi3NS9yHmaKTLj0vUUWVkMeUOZRSitKpdZW3qD8yQVQTZr4APjMCvGtMJ1
	ULCOfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v4bdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:16:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso8415801cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 19:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485386; x=1763090186; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=prIk2oxefhTBMGizLe5VBrcTGfPiFu9uI/8uXkNkJYM=;
        b=aUAkbeUYR2CzB1FT67n+T3F2ltWI+PArEtEEU8txJTmTc8ivPVxERb1agImDues9mR
         TC/SIxDSnzdeX2xxDu03Dz7S0+2FijpQOqxPqAayXzROEs4x3khG1NWRRfHheZxnV9jC
         PKgIjsVEGSQc0so4QDwvWYlRY3fIEjjga+lrHyiq11/Q/CJi4JMSgwQyUEWiR7l4yiuX
         ThAxTYLiUePZraKJMeUMF8E9L16lvNLjPwj1slpeS3bi021hJPrGw834J6PK/saaOP07
         iq1rAMSUpWn4EaGuuMS3ix75cwA6RRSSf454nXn+6phlz6imMZKr2hirY90JaslG91F7
         7jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485386; x=1763090186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prIk2oxefhTBMGizLe5VBrcTGfPiFu9uI/8uXkNkJYM=;
        b=oA7LTaqOYtc4sMEEo7A5UknjdwKaFURhaCsloQbmp42bc8+nY+TPE6Aeb54HQ9SrNG
         3wkUKGsEnUpOPj56DKdNXfxghfhtHNr1XC1to9+Jx05/8JvkrHf884jlqw6TB6rbprVM
         g2eb16EA5OYO1YysoUnYuCYnxVgXDufA/5b7HOtCklGNEsUIRk4C1aGzdjFOyt9oO+Ir
         eutkglrsbUydnDTh4Fj7Uu0LsG52nI8lXtXU8DxLGQ8dwoK4Wk+DYrkhzvDflJxqMHEd
         HNQj0CQQYtSgkfASwqcUTO08BYZAyBHFEeoiTaZJ/3bzjKkcJFXp6Cj9SojzhNv74Isq
         7rig==
X-Forwarded-Encrypted: i=1; AJvYcCVyx0OniwErti+/uynCWlszNWeQK4vlz7k0986vcYkb42DMB891viF5z8pCDIJCW/unZAHV2GR/VINb3cBb@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSjl5hXcE32OuftlBLTSKtQwTM6bGuEhvyaAL4YMKJ+/hznRj
	h5EGHV/ajV87+9lai1R1YVy6h+nHXSIsB7bThuOE6TEsHpLSkK041kc2kdwJdcLeNU0jfeyGWe8
	klraKZVqhGuqArncHUBzhll/HGIRXqJWCzWt/3GNEySIeUo8uW1z+Dr71DHmPSoyPn7he
X-Gm-Gg: ASbGncuQN130Gljs6yynqvUHzIsCjCtzNBv2cx6uLLqkDKfjqIiWg/Fo4vmQ8RrsVkg
	W9GrQACVSq5YwggOvTMnkOL4axmrDytSrvI/1fZvNaeIH0HBaHxFD6fjgw6NlQbIucxiRMpJWRq
	baDaxr3aGUZULxwncLy/OkuIUPYNyT2Fpf6M4AhOTtXigBxYrRpbNwl71RX6pYvESc0EitTJ/cw
	SekTTp/vnn0yyVKUB7bSvuHjtXCFUtnL3+AVQjivXfcb/pc/jFyyJcOGlywVYK+Aq6X6ie5ZFST
	gEPKqX3I8nnLVfzUA0+mdQHqcJ2hau1Wd60Pe62f381zsl9KSPxoaPqTS9Z0i06x+pyMSIu17LK
	nncAKeswfOY5NYQj4AxOHvJJdrmHk7soe7/eflf4tGkRIFScVeMB1eEK7v8VVF8ITpujjDiMwq9
	rGUauZ2skUVvEI
X-Received: by 2002:ac8:578c:0:b0:4ed:23df:6a4d with SMTP id d75a77b69052e-4ed94a83250mr20198661cf.68.1762485386328;
        Thu, 06 Nov 2025 19:16:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrhuAniX3epDvEEwBYOamZ5qOgePgMzHNWTJLDWUcznPxtnIGIxwFlzJYufCft4rDvBY1XrA==
X-Received: by 2002:ac8:578c:0:b0:4ed:23df:6a4d with SMTP id d75a77b69052e-4ed94a83250mr20198521cf.68.1762485385913;
        Thu, 06 Nov 2025 19:16:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b779fsm1134734e87.56.2025.11.06.19.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:16:25 -0800 (PST)
Date: Fri, 7 Nov 2025 05:16:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Robie Basak <robibasa@qti.qualcomm.com>
Subject: Re: [PATCH RESEND v2] devfreq: move governor.h to a public header
 location
Message-ID: <cdzlgnun7kpn24hziut23njsnlnzl465hdquq4zfmur7ylt5id@ioaqt5ilixwt>
References: <20251030-governor-public-v2-1-432a11a9975a@oss.qualcomm.com>
 <CGME20251030182636epcas1p2b332b417c1c42fb559a6f34e9e9f408c@epcms1p5>
 <20251107005809epcms1p5f33e9560755367f0ba4b7df82c87fc85@epcms1p5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107005809epcms1p5f33e9560755367f0ba4b7df82c87fc85@epcms1p5>
X-Proofpoint-ORIG-GUID: zn4QdH5vjpOvz7p5bGzRVqzEuCT0nnvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyMyBTYWx0ZWRfX6C9PqEvyyRj3
 9d3b3A60yavvMIFDLWmgRWNI5hhw2yoMPt8wUtxTYPdftp+YW669A1Jgf1vpn3cA/0J33d7NPt8
 0GhMqQ9xtzO0kxQs0F0CHTVpo36nQhCHq4ZYaUtux9XKbu/GIFf07OLZKzb/cfqtOen9Knz4Srs
 pNtz4NaO3+YLtKHK8q+KtoLJ0YsU5PimqT37vW9tZmjuSrS2LlfPiIrb+Nh3g4FpfkIqAusu1en
 HiNRHnFOGCF5rENKrwhHlh5V7vUz03iKhecU8s3r6He8fSDg18S0fef6hSFp3Z0G+WqfobPoGj6
 MPEIFs3jecgd3PtXJ4+7N9ZKk38XOegL/+Uo31YOEliMSa/Gxw2frwtotHtKrSgQbYGdEwMjd6T
 bebNXpf+fNsw6szt2IJk+kf2BOZb8Q==
X-Proofpoint-GUID: zn4QdH5vjpOvz7p5bGzRVqzEuCT0nnvM
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690d648b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=40jZUBKxUhFIhurt5UIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070023

On Fri, Nov 07, 2025 at 09:58:09AM +0900, MyungJoo Ham wrote:
> >Sender: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 
> >Date: 2025-10-31 03:26 (GMT+9)
> >Title: [PATCH RESEND v2] devfreq: move governor.h to a public header location
> >
> >Some device drivers (and out-of-tree modules) might want to define
> >device-specific device governors. Rather than restricting all of them to
> >be a part of drivers/devfreq/ (which is not possible for out-of-tree
> >drivers anyway) move governor.h to include/linux/devfreq-governor.h and
> >update all drivers to use it.
> >
> >The devfreq_cpu_data is only used internally, by the passive governor,
> >so it is moved to the driver source rather than being a part of the
> >public interface.
> 
> Hi!
> 
> Could you please direct me to the governors or drivers needing this?
> (Qualcomm drivers?)

This has been prompted by the Qualcomm KGSL driver:

- https://github.com/qualcomm-linux/kgsl
- https://github.com/qualcomm-linux/kgsl/issues/11

But I think this issue is not limited to the KGSL driver. Other
out-of-tree modules might also implement device-specific governors.

-- 
With best wishes
Dmitry


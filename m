Return-Path: <linux-arm-msm+bounces-52019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E7A6965C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 18:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F84E176D7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 17:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1F91E131A;
	Wed, 19 Mar 2025 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4IKUdhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76901E0DE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742405162; cv=none; b=Lip6MvSG4yyWO02WTQvMA9EK06wrXLdpXlN/EDaPO1g5kupquDl7i2DR+6enc/CxWqCehD1RUWlcJ2OJpoQd3Or58RKNt82V669K7ONpJD1WWhQmj5lm4bWfaHJQcxkI8fuSA4Cj/MJb3QrRnISGtnXMdvs680xCzmMZQsNNDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742405162; c=relaxed/simple;
	bh=xWlwplV+ekInbFsUxRgTauEuEgk6dMw8nIVG3sysQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqdTO6FK2pChs5frv6zS4AYIgYb7fHMxvTNr+b0Vbhn+hSRJDcY1KsWTFJmoquersUEkj7bS9wf7fibOa+aNKj2dyVHBU5OSjT/vIX1ctnrxYflKusaoRvWiR9pzA3VKTLh9PPsT3fDOIoo11bycf7MbUrT+aoFt4SdUgGOMwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4IKUdhV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDu0F3009925
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wxTkGbnrj2G1AAERlXkdXjST
	vimabqMigiyhzGpcsNs=; b=i4IKUdhVb25iQqlHQyI4tVrN6igUBit9UBocggcP
	1a7AnHYWIcOPTbuHdMANqFkBy1Por4VMEVmLcrde8N34D3RJobN90CmEN8+gW5qP
	xBpyCCpDTlVWC8GLejse8Ih33ueswRS7ey2dFimN+w9Un2lF/YpDikChWoaC6iFP
	exD7cZEBY0RsiabXOldUuB9sw1sF9xxPFvyny0VSDnej4HtkHjSElpkrD3LSTyhs
	AGARsGvBYXtbVvqkBbrCyVTB67rTjSOMCBNzTo8qNVk+Kj2pV5ZmaHPLFQ56DPwZ
	hhLrEHVjyE4XSbr1GSMqWEEJaYUzaw7nOGn3vo2BnqDBMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxkcky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:25:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91f6bb296so123286506d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405158; x=1743009958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxTkGbnrj2G1AAERlXkdXjSTvimabqMigiyhzGpcsNs=;
        b=dROz83nqLIz8ZOssfMwJLVx7fMdBrnK9iljUrnMIa9PV8msPgoglXX5LYHmaYRDziN
         ehkYYaJLnn1tJ8MW/TXNKVeWvS0ENhMI0g06zLT3oVbCR9AxRUVqGj0IotPQVKiXGGyG
         uAcNb6luqnUgD/3iAf5zsr2TGlLnMEY1rrWLyGjAMutIt4EXZw5xjcEVsdyXAXpOf2Bu
         tqDMJGwLWfCeDIzATICVuwVdG1JH4Re8foe6XVZk3pk8x/vQ3vA3EWhSthffmODNPBBt
         cKnP8skbWWdwvUvsjDBymhTN4BuejYZ35S+ouOV4wAIL1pxSkI6p5Zw4wLP5t+fTEIWV
         RLxA==
X-Forwarded-Encrypted: i=1; AJvYcCVlJ9MKGy4H369U/RWlMvO5zf+XQ8xwAmWrEz1+hAWZ+FcfdjavnzMLMITsl5m1f3knLIZbBkMh2cfPMDhS@vger.kernel.org
X-Gm-Message-State: AOJu0YxOr5LZp0Lqj4PyG/dpTyiQvoXFYyapifa82hGA3+rwKG66lW17
	/4UK5lnUCPaXr7kQ2N8GJBwnpbLgqo4GcdwIsCPFR86meJN7o5TZM5MplqeRz3QlRUCbKrqgchQ
	Sp5DN1JGLT2r371B0ATJyp7yBtq3JIKKVMtdgMUVn9fYbifnhPR5+4qRWDNLhaqf4
X-Gm-Gg: ASbGncsZHRU7j6YCbLHm3Myg/LQYk1GCdWPWYEmhH9PxviWVFeGOyt3lQ1O0nGGz3vx
	Wq+7MwEUPhMP7U02T43mxNsIlF/eLpDvTfKdUJbfQHxfQNp+CXd6hjMz/6AMUKOyFzu1j7mrYIU
	jEaA0smAN1imclbUpYR6MYK4hRkQ4J8VOzKPfKSzgvuHHTvfRbn4zOdhQweFPwFGeIov2rRbkqr
	FVxLEfL0qB95UD3+Wo0aoefnDwuP/bJOkl0h7+SjRJ3ms3355AYNlH/PeH544Aep+MAg3Weoh72
	Sz/Vgmf7GchGgXChCUrkXXJeN+mazqCltBT5+LQDKh2CsEuT2JZzwj8TMVanZ6wim0pp1TokI9r
	4uzM=
X-Received: by 2002:a05:6214:528b:b0:6e8:e8dd:3088 with SMTP id 6a1803df08f44-6eb29446070mr53033376d6.37.1742405158304;
        Wed, 19 Mar 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcStmY6qruGD6vBp50x0OySWHCpSi6v3rL7uOiQJh632CHkOyH81K+9C72wFo4Ponx60tgYg==
X-Received: by 2002:a05:6214:528b:b0:6e8:e8dd:3088 with SMTP id 6a1803df08f44-6eb29446070mr53033006d6.37.1742405157828;
        Wed, 19 Mar 2025 10:25:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba888039sm2002361e87.203.2025.03.19.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 10:25:57 -0700 (PDT)
Date: Wed, 19 Mar 2025 19:25:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sc7180: Add specific APPS RSC
 compatible
Message-ID: <rg377etwxv3yupth3acak4ycthahi7sennm54sbah55yqj2qdk@vip4xxkbsp7n>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-2-cb36882ea9cc@oss.qualcomm.com>
 <l4vd2xmrowmmtefieb4cbirq6ntkvnwbhtpxcyzwdeok2vgtt7@zqgqndumgecv>
 <881655b5-30c0-42f3-863f-5b6606a3e2cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881655b5-30c0-42f3-863f-5b6606a3e2cd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67dafe27 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p9JctohuHJosm6c4YDkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HUMWpzD43gnDee7mEovlodX_eK3cTmTy
X-Proofpoint-GUID: HUMWpzD43gnDee7mEovlodX_eK3cTmTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=935 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190117

On Wed, Mar 19, 2025 at 03:14:42PM +0100, Konrad Dybcio wrote:
> On 3/18/25 10:30 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 18, 2025 at 07:35:15PM +0100, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> SC7180 comes in a couple firmware flavors, some of which don't support
> >> PSCI in OSI mode. That prevents the power domain exepcted by the RSC
> >> node from providing useful information on system power collapse.
> > 
> > Is this behaviour specific to SC7180 or only to ChromeBooks? For example
> > TCL Book 14 Go or ECS Liva QC710, would they also use this compat?
> 
> The hardware and firmware representation of the RSC is identical, but
> I wanted to alter the bindings required properties based on the specific
> possibly-chrome platforms.

Should we instead have a separate compatible (?) for ChromeOS platforms
only?

-- 
With best wishes
Dmitry


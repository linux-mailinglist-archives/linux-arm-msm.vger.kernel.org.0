Return-Path: <linux-arm-msm+bounces-66622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F59DB111DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 21:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 775503A476C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 19:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176E92ED85F;
	Thu, 24 Jul 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9JillTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B10207A27
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753386100; cv=none; b=livSPDbh+QAfMZy4xe0phlyvEvHeYCJHlL7clvFUOLCr24uR/fkOspkSjhVMUhgiQSjOHn/9Ut5K5zeSgygT0RrqATL9cphzFKBzXTy5McvK3lt+8niuV5O3I+dLm+HKIMmj4fu30zOB9JgdgVhUbBWBW766fw78ffE/mY88Bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753386100; c=relaxed/simple;
	bh=pM1HUgksEDt2HUeKXQq+VqyG1755uI2VyU63d14RMxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqu1Jv9isy6pcheGE9I0J+H8C0KlMfmVKdkuLt1vu0aDUcJL4IzEhE5uuzmOzW78y9LzmEmaVLporSiof2Qn0ROAtdre8Jv0dElaGO3cEzzHDLNCKQRTKB+NCks3+72y04GR/NUYy0BgCgRS0aqgzf/1nAEkX/XPAa+1raVAsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9JillTe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OHx1lH022193
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwNM3mtjau7uqQilaPmYdY7ZPk417VPjIHda79n7D24=; b=f9JillTeN1WWZHH5
	ZY3pIKR7gBlgsbTV8nCfFkTwKQFvc5kAKHYZv2Tuj8F0FDRD9jScKpxAp/K2jnaB
	euatl+Z9Tsi99VFiPUFZdOBnCGc0I3d3Jx8BF33TP7IxPwSyl722y8Z3ZgTaIgfH
	Bvt/53/FSMaoTtatXZAU9N5bKFUAa9xDFVCbyz1RzCKGaz263feye4ADoqGNI6w9
	NaFOJuXW3mu1PVZ9howbmHPYzAbpkvSRfFgJrxlQt78K0uKPrjADeNIv3eokqoAv
	CeQRDXO50Jw6HStpgErl+H0NVJCIiz+OAQYbMO6T3mZ/7BBEkwIOGDQ0EO+F2g/b
	WhrZVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kmm1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:41:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-706efc88653so28944856d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386095; x=1753990895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwNM3mtjau7uqQilaPmYdY7ZPk417VPjIHda79n7D24=;
        b=HCVWpK75RicZgn2YXgldsUqAPXAndV/vqmA9r+pWUpEiimYbjttVAb8aA88MotgLia
         Ip2JQIS462CFXOwAz9MKs5JQbmGZHVDHOsnWqfT1C2wmenhD6sIrvXzI6D1e8uvcbNUz
         RTjlRWk++6ZXDMMSaVNk7nTDvcaHS/COKGFcMKbrUIvhEXaQjKKdozppvbGDqxcQ8Vty
         pqZw/kl1PkQIhw95WyYKDE/qz19p2axzx07yqASzbUcfaWsZNmg6E4/ZUzgwpQNrwsg/
         FrgfL+MkMaWZPxsVH7eS2yFDqtzV/ewyoc76vAY8/Eri8IoxjdJEwttv5i0PR1mBvXuY
         fSEg==
X-Forwarded-Encrypted: i=1; AJvYcCVf25h01Lko+qzUKahEp+QdceeQ7F4Z3Jtvu2QPWJdqbttuqkm41wRIBN+Ad+/SHYACbCNlwYe8n306lmEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxXz1LaFJrg9BuD1/8MSZH93Gfc6fxOwL161SKYXnR0E/ajLMUa
	x+zFSVdrbf06jKVc8IFGLaSTXy4HGkBnxC1CnkPjeKjOJVjEXcUEPYA3iJEQuZ2BN7+9p7G6pQr
	dmlX8XovEfvTknuUJ5LjPSJU4lqrvYV44wDbwic9V169DzCdVPqUDjvlKUTqEzli/VIKI
X-Gm-Gg: ASbGnctVKUSF0G1qJ4ESZZRtuIbXX22RKXqkau1tE0bCGrE59HuL3y9+1RRFZtTAsUQ
	HG8vrIRsMTYDBgP7/AwFYZ58qSiUNEbY50vw4eU47/g5F+qpAXT5fncs6bZiiZZM65AELh36GPj
	Ks0qQ9lUxunE7N2+W40dGOgB4o+9gcDI6QgHRt/DesNQzzG0SRO7g0cYIDgxY3jJualeevjdYbU
	ttAkAH6SmqjvI3ETs6fHrYr5yDVqr0ywU3mQ3qVSAlsmle2hbS5ywr+fNtRVK4YeJEO9mmeDcif
	f8niQxgLEaE8fEHDT++QBYbZeIXcW4rLLZHWiBOJa8l1janOqY8TzWifIousznXaErfLDWuQ5aP
	vSxEEDybFp0Kt98t8izOwUzrLYZAZniZvj5SG4S/BIzfyUo6/b6nI
X-Received: by 2002:a05:6214:2508:b0:706:6967:71da with SMTP id 6a1803df08f44-7070069c664mr109753536d6.38.1753386095142;
        Thu, 24 Jul 2025 12:41:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQDqKstosSneJZpb85nOhQ+2TXw7qj/NhXKc7lo8KhtjTczwG5CeYfAMo04mula3VPY10+OA==
X-Received: by 2002:a05:6214:2508:b0:706:6967:71da with SMTP id 6a1803df08f44-7070069c664mr109752856d6.38.1753386094418;
        Thu, 24 Jul 2025 12:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c87a88sm501393e87.152.2025.07.24.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:41:33 -0700 (PDT)
Date: Thu, 24 Jul 2025 22:41:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 01/14] soc: qcom: Add UBWC config provider
Message-ID: <jfslenwbfdoy7qz44on5ckzuljrxfjce2encitxiz5pws2iecl@2xnwdlpppmsk>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
 <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
 <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1MyBTYWx0ZWRfX1+EQy1/mrUnt
 vwa0+6FeZBq0w7OPUPiiS//O9H8m+nWWYbQiM58JS2DBej81opZqMyghCjtw28lnMlIjGMCEx9Y
 Hl7D/UiBiK47TLHyPTGVQhjW1gZZ/7AApvB1YGU9QmPw30jYrgB6gSc1OdHFlCB+xcyAcgPF0SA
 3f7fbjSyTWzPX4I9QNtNj2arhn9QgCIXUnIBO/BVyFkr70LIShuTITjlPSFJTkNRvp27kw3NpWE
 tmKKZg+IfdHthEEr6oyDz+5lR5FFsR+lJ97pf0qSLtGKlefkx60w/zVTsv5KLsdkkpriFaXUkkH
 DIz2kSMOz4SN35zJxB4Lgi8Om4nan1bxRr+NHt7wlq506vEQO2KohT1a+eLJ3ill7eR7LGU1D6s
 FI4hdZyRBsymSTK5Ws5PyS6P09J40GcoNT9Y4J7DKek1ftWOM7G4f0FPrREghfZOC4Y/1PWN
X-Proofpoint-ORIG-GUID: m0DAXhKgQrGvkzhpY8_jk9bxlBjogxG5
X-Proofpoint-GUID: m0DAXhKgQrGvkzhpY8_jk9bxlBjogxG5
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68828c70 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xQNkBhgbifyRU6rVYtUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240153

On Thu, Jul 24, 2025 at 12:24:29PM -0500, Rob Herring wrote:
> On Thu, Jun 26, 2025 at 4:02 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Add a file that will serve as a single source of truth for UBWC
> > configuration data for various multimedia blocks.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig       |   8 ++
> >  drivers/soc/qcom/Makefile      |   1 +
> >  drivers/soc/qcom/ubwc_config.c | 251 +++++++++++++++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/ubwc.h  |  65 +++++++++++
> >  4 files changed, 325 insertions(+)
> 
> > +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> > +       { .compatible = "qcom,apq8096", .data = &msm8998_data },
> > +       { .compatible = "qcom,msm8917", .data = &msm8937_data },
> > +       { .compatible = "qcom,msm8937", .data = &msm8937_data },
> 
> This compatible is not documented.

Oh, fun. We have several qcom,msm8937-foo compatibles, we have support
for display on MSM8937, but not the main platform compatible.

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-79751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5067C21C34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 768BE4ED80F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5762A368391;
	Thu, 30 Oct 2025 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+q//aIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4iAQRN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAF246BB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761848677; cv=none; b=a4M6MYpN8zKItqFB3MsQWabO3JEyECGVi1EMpMD6FyAwghxn+Al9dI1FEI7SXzHj8kRG8dDIsHaz7RL+KeEPGbrxAAa/NNnKjrkw4UFxrj6UBAj/6vildvMb9Q6DiOVMA7TON1xnD2SqSwEKqbD7oSy1eObjTOHSr/RFGvPsNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761848677; c=relaxed/simple;
	bh=n5LDDnU31B/FU4hkVylg5WKwzdJmETUQKTTzRhOKfsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6dw60vFmHbZF09bzBSqhrJmvkeYw0sgYBt2hWEZemziZSzDDkUYRJz0HuGc/QDmjbyanwZWIthVWoIs2VaH6QdIiiv6ZsBYVaEqh54xUCspa913UlaprWY3VZknFjDtkv9DgT2baV6VWE1pXotZrry8TJmi7eBuLQijUSyLaog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+q//aIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4iAQRN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UD7k2W2622985
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syXUOD6JoN9BeOT8Ps+v7SB2
	QPgUbs++JkB3a+FX+aI=; b=X+q//aIJYPavTm/MJPOaMRJnxV388UO7RYFQCWvK
	JjVcniBUwCX1CaGgS8IBovEx11gbOmz+apnTAa5WXHAQAwSWCXlAzcbme/YjQAW6
	ldmw5uxe0LF92pmZmqW4HH+tHa5Ukec5c/eKlquYkm0lEhCAv+Imdg9NeDcUhXjC
	8+AgnFGp1JiUyzEbLgO3Z+BPz0OxBWQKXDHeF4pOUmV2a5m4nPrArDUivC0378+y
	sMji2N2LnUx0aSS7Uv+5VZIRyt2bX70YWQgWl0WDnMQU69HuAon/igIMoHj3pKVa
	8xCzUEcnkL2q+5ohUXhM2N42XFD35qE0ms3YGsdRlCi5Tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxj9d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:24:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e884663b25so35940311cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848673; x=1762453473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syXUOD6JoN9BeOT8Ps+v7SB2QPgUbs++JkB3a+FX+aI=;
        b=L4iAQRN9DXO1eznCaNfMRvre8dvaRlLK3GJ4JyZUqDqGpSJppHYbmSFXSFME3TgLQ3
         o3C1NO/25Wn/YyV5aJA3YSu6H9S39wsDyJ/EFqMfufCrEGL7O+o68wihPJxOr7pLY5Ue
         9BnPpBM4zJ50ngNNk6QVL8dhcFgY8Q9CJ5KKCCRXqQ8sfWFwFxGHsfzsgzWbcfaJHXiz
         u4wBXDKp71mrGr17r5NrxZ8ATjlLOfpd+AGMIHvo0+ZhaNVDFcyu/PtdyJn9c99JoGF/
         0hoLOdiSyIdnODgihyK2PKNXOm/54/s1+OyS9/aGc4e7SFkwDP+2uKvHBM8O4VvxZOSM
         INqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848673; x=1762453473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syXUOD6JoN9BeOT8Ps+v7SB2QPgUbs++JkB3a+FX+aI=;
        b=QyK3H1+3DAIZOUPfDx0Fz2Uog6fqHy4fj3mRo5mb0G7XU9oSh1MhsEfJjJYYRmZbDn
         9cV4t8k0IXQ7q8yyu9lVPiXCKJfky9PITKhAD5oPVJKFQ0GA6O4IDAv8Pr1MGIAeIq8q
         JU1jfIfkeD06INSZz6H802D+fqAIB+0oyH/4aJsYmRlH7eIwmZEr5vgMmoMP7xz+7uuv
         ME4xJVGGnJyofoUP3Bke6dYbkxlT9+S77UMaa2g2XpFSRXKMTfIx3JXaTY6NHUBk0NlL
         WjuY4Qpv4rPpU+xJlbIk6tgRYdZHwJg9L07VhzmWpnMOCjkYjQBYHoMKSnXtPEMKq5CA
         o0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpdF4Mg2mqVJ2OlqvzG3D7GeD+IapNfRoDn7ixfA6HdEJ0vhS0fJ+TkFmL3GO8AIUMqj3KGd8+Hw0ih0U9@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSLhQDuCFwkbV2zINPUdJN7RgNSql48I4WKHb2BErbc1WobfA
	s4zFjMZhxKqoWcPXJX8l3hH/NQxMsH+rU6xdBRo1sFmcHvoRC/UDAwfIW+JUJVOwcQRtTyvnjyU
	2GKc6I1EIFjGh8TB9xE2w/KMAlDM8VdkPwfGDO0BDCUzmdOfNriIacOWWxFov9W8P4ky8
X-Gm-Gg: ASbGncuELcUafhmYvE1TsyIqmaLwl4dSs3ASlowQ0bqVzl9pZRmKM7FjsdLZdY7Mnup
	garvyG3197EukGg6trCKuq/xPoX+T5hSOt6Th//PP4gm86TcGr0shU/y2zYr65ajktakBIYML9l
	sXoPsA7SYNVTiVZfehjOyP94ArIkwahvONnzDG+1Gyn772ik4elfQ3Qu4kOg+NJaBW0dyUzqIrV
	aFGJjvmzowqNDmbcAxZc3nIZy84o3jI0ocEKAkg/c1Kpp+KMm6IZS+v+hVJc9GRkR/0B3tx0lqE
	UB8YENVXrmHvJoko2WOtmGP/ROnlNpimOaIP6Q65aOHQsUlLsDut6CXrr8Coi3ojuBAizLobw9g
	eyr+6s70MKrkUsEmX3bdEs+U1M4lqn9DS5JeNLbpaooWL0hwrlyH3/cYgcLzAPJIcQmHXG2T6eb
	D5i6EL82kXIIRK
X-Received: by 2002:a05:622a:44c:b0:4e8:a3aa:7a89 with SMTP id d75a77b69052e-4ed30f97698mr7501971cf.45.1761848673059;
        Thu, 30 Oct 2025 11:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmXHfCUfcD2P7/jhUfHS2Z3Z/sOp48KQ53I4Yb9fWNOd7sgUr+yJyHxsPDN81BBTCGrNVwpQ==
X-Received: by 2002:a05:622a:44c:b0:4e8:a3aa:7a89 with SMTP id d75a77b69052e-4ed30f97698mr7501491cf.45.1761848672452;
        Thu, 30 Oct 2025 11:24:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f87f14sm4837077e87.112.2025.10.30.11.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:24:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: add interconnect paths to
 USB2 controller
Message-ID: <hlj6cyeybsct4flwvm22t4u5coeyrlwcwfol2cuzab2fjkluwi@frs6m2sjyksp>
References: <20251002-fix-msm8996-icc-v1-0-a36a05d1f869@oss.qualcomm.com>
 <20251002-fix-msm8996-icc-v1-2-a36a05d1f869@oss.qualcomm.com>
 <7ef8ba74-4e9e-4b19-998e-40917d997ca8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef8ba74-4e9e-4b19-998e-40917d997ca8@oss.qualcomm.com>
X-Proofpoint-GUID: 6wAcz1HJxeIbtFNO_710dSL1lCAASwNC
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=6903ad61 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nBxtwQxsS3NGOZXr17YA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6wAcz1HJxeIbtFNO_710dSL1lCAASwNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MyBTYWx0ZWRfX3ohmpXDzw4MO
 MWgVgtcTQ0xgTyJqUqbSxTAvzxLokAvzii4JNpi6E1XzxndjOn9vbILIKyMcDfxzcWpeTY0bvqK
 R6bwnmon1hnb0pENNyuOLg22qPXU8AQEaBjo2f7iUwSVaNnqP6Xp1t+z4/43npnfCjAskJmQEOB
 PIuqUqExS0IO1RnEuUqdim7+to3DkasGbBDUDYmjwgYGGv8PbMZp4za3rHTsOCAyPbAQI6JtPof
 qieBpjlM7K9ycSclxjaEi9FI4QY2yyTSoS0tfnfEhGyz0Ixh3K8Avc5WwrxxzOLOmeWuUVcNRyM
 Rzebicdx7OErFroi1gzqgC6DvyEYJoOOs9urdQTayfw1mUYRgJshpifVs40m/rXPrWq1WFMjjQS
 9dIEbntAsCCKU3lvqSvlH95oKFykDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300153

On Mon, Oct 06, 2025 at 11:30:52AM +0200, Konrad Dybcio wrote:
> On 10/2/25 10:53 AM, Dmitry Baryshkov wrote:
> > Add the missing interconnects to the USB2 host. The Fixes tag points to
> > the commit which broke probing of the USB host on that platform.
> > 
> > Fixes: 130733a10079 ("interconnect: qcom: msm8996: Promote to core_initcall")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > ---
> > Note: without the previous patch applying this one can result in the
> > kernel stuck at booting because of the EPROBE_DEFER loop. I suggest
> > applying them through the same tree in order to make sure that the tree
> > is not broken (or using an immutable tag for the icc commit).
> > ---
> 
> There seems to be syntax for this, at least for stable patches
> (which we should probably either use or add +noautosel):
> 
> * Specify any additional patch prerequisites for cherry picking::
> 
>     xCxc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
>     xCxc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
>     xCxc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
>     xCxc: <stable@vger.kernel.org> # 3.3.x
>     xSxixgxxnxexd-oxfxf-xbxy: Ingo Molnar <mingo@elte.hu>
> 
> (deliberatelly added a bunch of 'x'-es to not interrupt the maintainers'
> b4 workflow)

Bjorn, Georgi, Konrad, how should we proceed with this series?

-- 
With best wishes
Dmitry


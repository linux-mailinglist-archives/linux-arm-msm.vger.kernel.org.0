Return-Path: <linux-arm-msm+bounces-60531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE9DAD0FA3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 060DB16278E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023731F91C5;
	Sat,  7 Jun 2025 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiLmEOCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541002066DE
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 20:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327092; cv=none; b=V+tZtuFI2L+um+2Sey0fN7Rot5Oz/FP+If1bTO57gas2fXxheHbSz/5UaHnpgq3H/0xkDNrxxhZ/v6UOOKDHAzmH6LFChTSplg+u8wcSvrjk5w+zR4qJx7fRkcVJOQmE39Ur1PLhFY2Rvr7N27Q6UJiDIWnyBRYRjAbRu/tmu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327092; c=relaxed/simple;
	bh=QVWBlggtwXPRmOBYb+OrVaPcduin6bVHx32gC3Lt9wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DklJd9zqBnmlNcDWcZN1+ZDybWqpc+XhAuk6o9g7T5Re2IQfmTsb/cvBDP9Uy/lEtpS6naexHUgS+PsWS8bEX5V19xFzZK+YaoH2GOXICW2hbYnPsQfSvggTsVWqwNNSYcP1d3dMORtoCxP+EHpxd/HABfDWr+K42lRBc8BxPrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiLmEOCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557IZjfK030351
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 20:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XYyaI0FB+UTRojumzU3j18br
	P22Fad9SfaLy766ifSo=; b=aiLmEOCmVGDPKjvXK+/1dU5cgp8O05uABTCqjmCr
	iN3xVVrMQXKDweoHyj+5MJWQZb0fXhfvHhQR1zUg+o5zBI8N2e7ux48AtKrsXMjx
	FVnPNjXMLdnfM2v3el/IjTA3i+kqMwZU6XqSX7dgfeYkl/psWg9lC+AI3IVrKTM6
	94U6E2K5dNjf5UaZ6OhyuzwFUZh39puxtImAFyEfrDtNF81kuACTe/s3wNtRG+ZK
	ru1VF6EvfEe+rNkEPueODeM5s/vOoH+NjlXT69DJF9rSpIG6RiF3XIG4uFM+SQZP
	0XlMO34Q1DYqpdg96aIx+pMDEOF38/a2BSw8Ddh46Ca1CQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9h32y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 20:11:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so718102785a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327089; x=1749931889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYyaI0FB+UTRojumzU3j18brP22Fad9SfaLy766ifSo=;
        b=wjIEUzX6qz5gmHkWqYqtGD547amyOGoxtmIW2m+fxQFNkMxXDTzvk8tsSY6nt6D4zj
         rrubbKOGoR5ouerzgmILAFaU2chKUO9AaFulKDuclrJjaKLIhFn6O65g7/pZlcQL1N3y
         09Jlf4+61W+89UarSGu6goFlY1VyLHXhCOrSAqN1YShf1OdSulaOHOom+J9jVYtmF99X
         +tEV2pgLtfV8lRAIEeT+1nQO+8hFSss6fE1HQSwiBPNojXx+KDGdscmWM/2HTouJnc3h
         Psse9wmbC4vWM4mthnhJaVNjaOcneZxj67ksmCaFmWcrjgkuldbxI/xlpqNHVqUJmDkZ
         Mohw==
X-Forwarded-Encrypted: i=1; AJvYcCX2llDN/9vYdCxAVxHtegwQ9WTSztEy02CBY9COhTMZz0+lGgsqp5A3tUyD0NqQEqVk8s63+PWVbE0g0M3d@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQTiD6oJiAYdY86bLWvpd5bUTgWiT/1yk6wgoBtjzBTofRQuI
	WnNsVXT4Jj7/a1NKZ62we2FItNwk3TNjRfe+1wbs2SDSYcJjt+gDLBkCCt7X5fUwHhq6ap1/4WZ
	oYjnUJu+dKcKSrXufWREly+fzhXPrykc47kyo4ovTrn0w31oaBg58uapuAbhE4/CrE18t
X-Gm-Gg: ASbGncuJsJRqVybn3EKKNXdL8/3fE0iCqYG89s0GmlOOvcOwpzH+06bjlbvRUoa4jYJ
	Ip+6sNiWt07zzcRidzG5ehq4QvmFFoRnG8mji6/Gn4zXes2GWHtB7EjlB6mgaGJNuY2hffOYHoo
	CfXTlm4hyp2KYb3gUadERDXsKfvSc8uqciUS2dObR0vDxVPgUFeR1YNYGxhxbfqZw5FL6EhHZtj
	tdgRqPUnIAWg3pkDdiiVN0bL73Y9CJfgwryqul5UukqdW7YzDVWjagyN98+bBVvkd80zo9TCRqk
	NjYycTk6Iy9ZWNPse0puDc/ZGEvDovRwPkdRlCv2zXM1QZQO0rpsbsPN+m2AsRuZSDGTQYECJQd
	A8oKX/vSxYQ==
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d229896449mr1172214585a.31.1749327089180;
        Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4olC6W9osviXHPQUeq/X1/7+Ru45fu+N79/NuD7ijwXEkSq5aoqXEsc9qfndAHioC3BiSg==
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d229896449mr1172211185a.31.1749327088811;
        Sat, 07 Jun 2025 13:11:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1ccdd53sm5543701fa.88.2025.06.07.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:11:27 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
Message-ID: <hpnrky4frqjr2a4rdinbsizm3mwdognx2qmx76u7k6g5ocgeab@4vtgu5qqsquv>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-GUID: z58CpARnYb106wa3vMy4bUTALTOGup2f
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68449cf2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ei04IxUCSHfnpyqhzYsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: z58CpARnYb106wa3vMy4bUTALTOGup2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX+qaFknxMiHQU
 ZfwVF8Gz/5VXH+GmcITbpeNZ+iNpaieg6caC2FFi55k+Vc7QmomuYVK7IzXBShLvYOxab8JdR5t
 YTlLMXsm9VF6an2LmfU4Psr/ykUkHHOr/joGTkJLxjOlEZ4EF4VheJmWCfPZoTC3RjcJboD08A0
 c0zPumfFvvhYcVMlTX8U/W4ecr51U4gGOBhoqF0yj0oJ8WAVdMrlcd2QoJPqOeKQWJFxukIhZfB
 zXMmlO2s3K25lkubSYRI5zs61ycelW8J4iAAW2FSfyd7QDA2ZuS3HVUHhGxZhdh2r/FRveQ5W9a
 WPpBnEADjwoMATCJmrPbo7sYqfhdZhze/ZBkTA76XY5E+bnrXGkTi9Oh3bB3FtQP/thwKijWKdf
 H4AaFW52UKVSLtvGnVnGYTmbZhAzYtiAKGpESfFm9Bybeo7z/PrXld64RQEnqA/Sq/Q2+2al
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=790 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147

On Sat, Jun 07, 2025 at 07:44:59PM +0530, Akhil P Oommen wrote:
> In order to enable GPU support in Snapdragon X1P42100
> (8 CPU core version), enable X1P42100 GPUCC driver as a module.

... it is used on Asus Zenbook A14 and other similar laptops.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
>  CONFIG_CLK_X1E80100_GPUCC=m
> +CONFIG_CLK_X1P42100_GPUCC=m
>  CONFIG_CLK_X1E80100_TCSRCC=y
>  CONFIG_CLK_QCM2290_GPUCC=m
>  CONFIG_QCOM_A53PLL=y
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry


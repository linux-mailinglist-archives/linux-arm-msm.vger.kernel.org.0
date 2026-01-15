Return-Path: <linux-arm-msm+bounces-89117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD12D22BF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE3D3106A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5716A326D45;
	Thu, 15 Jan 2026 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goc+EG7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UG/DDc/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A249326935
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460988; cv=none; b=hLfGl/dSdQJpNTzicgryOutCbu3DXNXY7W5JKO/iEwWb9wx+5v/QtjtrjtA0ZswOfzGhY/NWDXEYWaIHLjSwmTr+B/ACkZLaiVlr8bdO0IROC0nrGAtHIbIxCpmKqG4PV1yhx5ivmfu1VPLECKJlmgjBx2q3sHkXwVyjbICRir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460988; c=relaxed/simple;
	bh=Eu4SSC9UnFJ0um+/LUAHOao1I8rBQ6XMZgYBCIagHdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4+lnesxBJIW4yZJXpwe+S/3b8H7B+LYFVGH9BfwOanX5CO+/mFHMev/wIlha0NHF+vhYJi5ieGDMTEXthv8bNyahWJq9ck+aWXdgheMwUActzTcY8ZGKef+G/FHYGqnjQk7YXv/2srQuyOxovXzjKIO9nMuAWsAIRBupI0b65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goc+EG7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UG/DDc/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fZi4606112
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/asDblb/TtKldHy+Wfrk3mjETafhWJ/JkfQAT52LXMs=; b=goc+EG7p7EFJk54i
	pzHAHC8TyWeCLBTXHddaP7z3ijRFeN+c5/iloHhATiLamHu0RG6o518DbCYar5VO
	wWrsRB1B0Eata9y6Cb7PMW6/qzVrB5YwzSw7aJf9oYuqiplPdOMX8gxL2ymC1y55
	aLO28nfdh6wDI6ZDX+SCCPFYX/LvCtTX2QYl9Js1dAEwk2ktcO8CJhztR9AUYXmF
	nRB3Ga3W7Ahep3dBl5BjuDyaGHW6/kQ0D2HeCIWmMLIzPydPD3cq8HDB6PD01Bps
	PrnDjPgd8MUaE139P3tov+IYZTxNphuAlu7zfWCPaI8J7hCdn6L3FFE2/Xj+UpR1
	e83ZKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna04vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:09:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2a3a614b5so162748785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768460983; x=1769065783; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/asDblb/TtKldHy+Wfrk3mjETafhWJ/JkfQAT52LXMs=;
        b=UG/DDc/wV8Y2O1YuVqUMxv0cwtSCY8pkYQrGNjo0j6AipjYV9jFu+CYMVWRSq2Ss6Z
         YrytOLvfrGapj8ON+Ma2PcTYehuBHbl53KmOKeZdPt3Qg6hsT1q3Vk1Slp2LDutLrPFZ
         h+x3Eu+XDlw6BVs1wovoaJTc1SIdjdXl6w35J058gzw65uqauSzCRSSQ57d7VvOuQ3AM
         l8CC2ZBasEzAa6Sm6VGvexErofgf8uTlfTYfQxYrMgk7RXXkGNNIfCkUhBZxLhV//Sf0
         vzbrLa5YGvOSY3/bKitxmmOqQldfADYsLuTY3G2gGhyuBO+eJYNReXLtMOPfPvQg1RWa
         yQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768460983; x=1769065783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/asDblb/TtKldHy+Wfrk3mjETafhWJ/JkfQAT52LXMs=;
        b=aNUCzPohwWEN14oy3mPgiHeyfs6I0oIWs+Tp3J3wtMqklRdX/xw4IlxQ7klQHssBW9
         1mp0taFoYVk339B7N2xjDEC2ptj6q8DlFjoSQnVuubtUEHw46FLCNleAGO/VpJ9WJc1B
         iQqVx9JiiazGraSz5RsNiHUQ7Do9/nyNNPttvfxT8uj5yA0/bXHYIsIlpx8FZHLXmieM
         byalzkhYyOdLRHVhJt+IrfO8dmc3YCjrAJD/qVOr9/s2x3HPX6eRWbtiV08AIoupT9Nk
         782YHMLcL/S3m7SH7n+dp0OX1SKahJH+pUV7EoV2XQMV+KuHSn7etYwvGCp6f9yW/6OB
         Ab+g==
X-Forwarded-Encrypted: i=1; AJvYcCWeTc4RXT9M9/feB+CgrrLIvdvdxya3fqy2eho85xDuewilxf37r+c85cdoZZE4LkZ2pLerJiZc4XT/X04d@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSRq/ZF4K6feontER7077MPh/0Ni7P/dxKrdnEZ+12BHp0git
	Tyg/4a2u3x/WILjSQ27MNeriN5+YrdT2/y71oBbBwiAUPrOwNJuVpkMJ1cF3RwniTFo6wOtK4/9
	Cxvko7R8isEIv1f3Ha92lyyxQHqNiAEoMyaAJy5oEvzAsxxdBIyGtPPZ8KY6htODLyk3d
X-Gm-Gg: AY/fxX4nW0mEfdQbA94+Y8E6g009LdqFEwJDhH9noLdQ+74EWvS9nAV/Cr+BjTICm1H
	vkzdCRrFpAAdRQAQpCFNoOK2nzk4/Qz0k2T2XZJLDWwj7sFn0VLz59qdD82KFcZNQmOJip+RWfL
	fKl55HrAtUCo4Lc5sxNEuSPR50JwIPTIWy9aJlPJvVykObII2c4OpRpEpb5eyZRVav/UoH/qjwh
	e4FjH4JgmEXlWUq5bu0xXxgIEFt+DjpH2xrr4UThz9b50Y86nF2Q5bww33oyzJ/XUGF4B438aY6
	pHfFaaqlNm8fY5VU3dndVHWMadtJ/lJ5QCpLPQDE+RtQ3axqyDlRJGWwbPPhRHdc52yIL3qTwqC
	6xr5by23EHuhFyOY+4ODUP4dILAJN8zJ+CtmNT4rpt/kZmOEA3wwEuW7d+Cr8PrZuxQgQCbc6Np
	xA5szyHDrWnzni/M0wCgWTV2Y=
X-Received: by 2002:a05:620a:4482:b0:8b2:eea5:3325 with SMTP id af79cd13be357-8c589b979bcmr306247885a.14.1768460983086;
        Wed, 14 Jan 2026 23:09:43 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8b2:eea5:3325 with SMTP id af79cd13be357-8c589b979bcmr306245085a.14.1768460982633;
        Wed, 14 Jan 2026 23:09:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba101bd2fsm1454874e87.11.2026.01.14.23.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:09:41 -0800 (PST)
Date: Thu, 15 Jan 2026 09:09:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
Message-ID: <4c44mmkpsnj4cn2eh2xzraiw73xmhtx4qm3xiyhecm4vyou7os@skyj646r63d2>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-3-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-knp-dts-misc-v3-3-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-GUID: yXxX7NaikRNU_ayZ8wyFI2R-Ichy5pF5
X-Proofpoint-ORIG-GUID: yXxX7NaikRNU_ayZ8wyFI2R-Ichy5pF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NiBTYWx0ZWRfX+lYkvQ6QpXvx
 SML2P9FUj+JBUqf4REHjP8K12seNxan81JE2XDzJHUtEI1gHXGlKp3imsDYYiLBnW4PmZxEduQG
 ExwU55uglc4PmsEQKd0OauJw0oULw0G5eIDg/th4PDR2rzb+ThWSwxShn9Ru0cn6LUFB5738o0Y
 OtvkRAJSW37XluP2ZPk4JkciWKECUMz7cC6Y9Y6KLJMmSvmH3kdonePQfphWuX9T7kMdWkljyL5
 eYwWgYZ8lQvg87jOB+vs4SaHMxlaZVNeMcqHy4Of9DPl+PVBj0AjUoHDC6vrPelvAVRXH2XiXDU
 nJsobFwt1WUQ9DtNtdCvht0us1V8l1aUaqjC6EVKnujd+O+Y3PCsT+ejzSUpwOGM66NUrS1mtqH
 IRvm3iT/G+flrLf+MroRFW07l/Jvyn84dFsPCBykG/PFI8ozlq1pVY1W4JF6lnf8l+NdNLMuuRF
 7rd/rjthStEeuHU8cMw==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696892b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgRqWzm8WD52ZFsVCEYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150046

On Wed, Jan 14, 2026 at 10:49:05PM -0800, Jingyi Wang wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> The Kaanapali includes seven TSENS instances, with a total of 55 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 130°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a critical
> trip at 125°C
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 745 ++++++++++++++++++++++++++++++++
>  1 file changed, 745 insertions(+)
> 
> @@ -4795,6 +4879,667 @@ pdp_tx: scp-sram-section@100 {
>  		};
>  	};
>  
> +	thermal-zones {
> +		cpullc-0-0-thermal {
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				cpullc-0-0-critical {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "critical";

I'd really suggest having several "hot" trip points at a temp less than
125°C. (And 125°C for critical looks way too critical for me).

> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry


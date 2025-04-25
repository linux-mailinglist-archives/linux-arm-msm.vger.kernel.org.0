Return-Path: <linux-arm-msm+bounces-55696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40598A9CFB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8745C3BDE3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03921DB92E;
	Fri, 25 Apr 2025 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aynETfNJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5BC20D509
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602518; cv=none; b=Ak+Erq/JeghV7NFgbg++u8xN1Lc1U4MRlebve2jl8n0rgeWJM6glcROr1rX7Jie98Q83F2VRb+TVA7wgigoNWiqADO/RYHO0UkL9Uss4sGnpK0NPY6PEh4w/O4sA1STVGE6N+NTaRuJa7Ime9AkkVYSm7Y1dMkYyWVwc/Dj322c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602518; c=relaxed/simple;
	bh=hOAgLBo3rmrxxikvNXsfBO4Ojj0ysk7D3E29Qc8z9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfW2RLXSTU7N+v9bdWveCyBnOjU7IW0uzfcHlrFQKRQs9e8k0MbMPpBMrPhy78t3AuujAB6p1yOy59+kgwr+qR0YgD+FmDMwkE9E0JyEgpuilU5IzoLAfKYZdkBD9hXo9qH/reN2SCIiDUMydaVng/XnJBLS6cs/HwQSA+B9jck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aynETfNJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwUh011506
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iYju3EJrtvAUizjHu0/EruE+
	XkPNrQlYf7FCiID13iw=; b=aynETfNJo4fdKRQLlL/4QlV2AkETluH554IM58lo
	bPQZnOqSUYty0GoJ5DUfpDu58qv+1h6d51oT1a9Ku6stXydR0vQddkzgS6IWsS+k
	z5COtFcIgdKWUChDxwFWTr1AlaknUVn5x/4ZKXVJjCfh+6nVDzB0zs4cE6nbPQHH
	Gcu/VfcJsBy2LPTW2i2z9OKU32k5C02nVEgkdhP0DbNwd8JyacidI/K3z5xsdquE
	9ENN7h5MTPWTuBEMIrbBXoepdX3H7Uw7hSFEycTzkWMtwHO34hDOjkErozm5ix4d
	NW2lqnP6yyBVWpPJXMZKq7RJkuApGDPXeCa+SBA47Sw/aQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ssj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:35:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b3e4c176so52775776d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602515; x=1746207315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYju3EJrtvAUizjHu0/EruE+XkPNrQlYf7FCiID13iw=;
        b=XvPU6rE9Xa+5gIHuH89Ed6NNm1jgLZTGgbf8cLZGLwjGub53PHAAfnt91A5Ki7gfTR
         ET5WCxB16h73iXmE+UMv6jakOE4nTnRsRXgGbF4yEh3P7qFUqQLQBv/iknrMzpfFSSwS
         BExRCY6cWpQxvXLkBeNDscx9Ex+wmtau/Xnl9FOJmwIAApDN3FnpwvWHM933ezSvnqgD
         5WzBbX0UjEhz8ePJNzRJvPdV4UT1P+xHIUrq20H4tnNHbOl1aG/H1q1x8DSUqbCfWbCp
         o7VdhEGLwD3C+OpUZR4j2/Fcay4FrVTAFqu68IzkX9TL+WPpsucWj6Jizc2Xd4Zn7L83
         Wrpg==
X-Forwarded-Encrypted: i=1; AJvYcCUI7c6TrTyxxB6DyQchzGvkyXaz0dMhpfc1xp1fQETxRVSShoHFJLA98Jw/mdKbA/zaBWjRr0xoXEr425n1@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzuXyDTZYIPGB7hO3UA6M4yPLQ5bkxDjWHDeiI+dQOaiWp5B7
	nUPKqiex8/oDtpy7dcbiJzmLtMv2BFSdQygy7Du0eQ3y0fNKR3Tb5sND9zPKZjD3BJy5DysTkLC
	gqtGhVIXe5nDTQkkqWPp0gqdEmz5e9BH4JS6F504s5aCBLY58+81ybhSxyTV4hCgA
X-Gm-Gg: ASbGncuLt/3vz1j9E2Dy6KGMZQLTRKoq5g+oKFCGRSGpJT/Lj/uN1OmoUWl3rK16nE0
	8CbiyGKTapFv4DGfkx4lP0WhdRQQNvNLr39GksJn1VDGNtMgku7mNB8z22Jx1jT1baa52XVQBkf
	HvMDOvvofwAbg/ZRuE7J6JxOGI2q7kIEB1x5yT+GNUv4lpMOCOzxFrvDKM+TW0iWVFtwL0KjlSR
	BAA9GADvntHq0hazkqISkllwmK5/NMHgswGZAianz07oICAo0m11C5UWznUvAspRfz90xRA7SyW
	Hfx/HiJBpGLVCu86GbwOKAmmu0ueC59RYitNlXRurBAh4YR8Q1QJl6VOfnalJlTd0BUTuCNiHmE
	=
X-Received: by 2002:a05:6214:3015:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f4cba51c2dmr52746276d6.34.1745602515283;
        Fri, 25 Apr 2025 10:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJZmtrsMUpGVmcWNWgVpvUyF2Bex7W+EyH/Zif0B93/CxbcE+0Ez8V8EAzdLQZ37qeR4952Q==
X-Received: by 2002:a05:6214:3015:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f4cba51c2dmr52745946d6.34.1745602514967;
        Fri, 25 Apr 2025 10:35:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659b9asm8398381fa.19.2025.04.25.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:35:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:35:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] arm64: dts: qcom: msm8953: Use q6asm defines for
 reg
Message-ID: <44bdd3fgf2e6wfmlfjcj4cepooa3g3b3rzwdsatzrkzre5rkll@24jxskma27nw>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: d850Z7G4-nmyPV5pvMVn_qmolRNRx7P7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX6TZwXoaUuEW2 VJkmeEpZ/7RcSDoWtL2CMANOwKim1anVF3J04kamLwElKhRA1HcACaDeoJMysBnmKS21hqmb0Nx uZkvtpdLGBkIo7V3Tvp5KM6lWDQD6FyBqYHlaPgCOaiTs1ccJwf9xVgFy/MSM7a7CsCcxvKe9R/
 +orKKGu+URJrIzuPj6N5Pshtwjwj8ct3L5gprmGf9KY4hxn6iKM8kUcjg4OqmZYWEJ7l6JGI4ha 8nk7ZwVoaSE7lCWZecN0yhgcyaw6mJVHpVMyB1vVIM0D7bvVopH/ojJwQwHrnVCor5kdiHtuCxQ 7KwSTXbdEFceI1Xk0SoNfInIlUrmSL6xOuwJATNbklzUMMjzs1jlCoCmdkp08M4JoclmMGOmDip
 XpAjVa1a+UjLJTydeyERDvS2wUnLQeghgiL9icSfb8D08/lydf132YAB9rYEBBD/ElInsGMf
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bc7d4 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: d850Z7G4-nmyPV5pvMVn_qmolRNRx7P7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=621 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 01:53:42PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-52027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF48DA6986D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 19:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81D837B07EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 18:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DE220D51D;
	Wed, 19 Mar 2025 18:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlzCD9vX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC120B812
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742410345; cv=none; b=D/Bwhf/VJrPq3AZ0tGh2EcJv1KLpybJftJPRjLjezJxWv5aKHGxomnv2eytm2N/ZEHokHDZToRJBRj+18yAPknBUyYbq25sKRngob6OqpatPEE9+PnvyVvanyHZnIyqMAw0npI45zQmu69PadCbJM8SWEaQz1xevdrqhFxhbFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742410345; c=relaxed/simple;
	bh=0M6YQDs72gfV+jsPgaj46ufU7WjDlWBfzX2AhI4YCFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krl85aSFM9CerO+1m3Bg3AUmQx7ol7/Kp4Cb/cAJ2e4MZTHaP/9BKWaGqArWgQLEB+axhV0WGJ9hv/KkqV9PwZ61/nsKdDdxbT1fCa4bgnPhy2YwNMJkr7mPkFz3OK+1ViVJnxRdQS8PCj1Z7GERSPAbWnQ4gxtOUg6eI5YgPqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlzCD9vX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JF6eJq015878
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o2JrlZxInygffkbnIxhe0MWZ
	Qd5M4umD0iQoB70ylfs=; b=UlzCD9vXBnImeJSObQDo6GexmUB7rfazi4TGHiQ+
	cSIgSGWbCUEhdYeuAPj9ed+AohmMi7ZImUHff8kduA/LZ9q3AgvIplGvbW96g83u
	BQyGg6CehrPXm8rT8Pydvnu2yRiSm2TWsaWnXEodAbrr9nJxwWqkhOivk7FCnbbw
	Y5PAhypdTSXyE5T6BRjmvJTgxTLUIGoH7D7+wWlwhrOSDG5zGqyLvTFbtT91+bga
	Sk22YEmg3PNGk2m1UXQPRUs7Witoo5kDFcR50ztBZXZE3n8ecALaMiTA7fa3x8ru
	3HXW4l4nqRonLjppn91kbuNLHyR5rvEuAQfJb8k0IVesnA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g09f0kff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:52:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f64eb467so70191586d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742410342; x=1743015142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2JrlZxInygffkbnIxhe0MWZQd5M4umD0iQoB70ylfs=;
        b=agm/sbKpkwvgD18S9bQwoxEbszM6SsuCCwNU+UTl+LnJ/YAdNCSMmM91aWofg2ZSrB
         IgkOz+KBEolQN9NtZXuYcqCUpTN97ELHPhoMWzYzZBNbPQ8VYbu72Nq4hLbLRyoOn1Ds
         wREfStp9zbHumu4krhidS5HyI94MjhwdXiU3VAezQb82pl0YyUdmr5my1y4za0DuDC14
         O63bVCZVeJKYoxIlUNloCYl0+72KV1IqPZvxALTxtR89c6fPNAcovQ3OiFe08J2zJuyQ
         VZyKP8EOilb/JEECFwsdHtaIz4gj/6dwem9E0zt/q7n8v5N4NmUNHFGWZVcqKj2JZ8qY
         lAEw==
X-Forwarded-Encrypted: i=1; AJvYcCVTlnYnwxdJsKfr5+JzL3RtEpT2Rw3pOVvNAdclGLUcZb9pgWK0QivJkqrhxo48OleU1O4SEDHIfuqxXDth@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbFeosfvhvRfC7g0ZdAxP7dFpKWlFx8UptTuYJjz5RvnoDi4M
	018lNumdEcFy68ImxYBf1is7kRgNXhzK3vtLWjH1RR10bH907xuMcYBhK+sVvEm7gEEDwdgr5eG
	v42kplvqTItAmJzNRoVoA8pG4g89vJW28yb8VYqJU+beGQBYH5Fp3FEYwbfE1pwTG
X-Gm-Gg: ASbGncuUR0RUQ5Xc6BOX/tA2/V57VicNfw7d3kUhkeEt6e+j9XwwVTxC0spehRTxiOE
	nxlU2NKhIn9LmViP7+i9wDJmcjadgqeFVYgdiYXmJ+9dB+wcP/3SzP+seC1eIQo/f2f7IQ9qroA
	PDM60Heoe9UTmXiIJFJvJMuZWmZBfsVt0kAtgw8N662nc1Z0v0duTYd5UXunhZglAwMhyqE5p89
	PEtC0lDtpN97kIJL9+CC3y8/+mgP7zXMK+yOdSCUUjY6VTfh3Ftk0jQqMM4Df2Apt/e0G+qj2uq
	dHT/pmlqVadxTlTkPleAcmZ8/zcUtcodkOiJPWCx9yMbTScNnr93IR3aRvCa7uRsqnb1VCV7POO
	YPvo=
X-Received: by 2002:a05:6214:19c2:b0:6e8:f60b:9bf8 with SMTP id 6a1803df08f44-6eb35329e00mr2748686d6.33.1742410342236;
        Wed, 19 Mar 2025 11:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyZio9qkdx621sRV5r0hgdNA5GgHPEN2TxpyMUdo1RgpYx/nbTusOZVvGhm+AJZBFm/raHsw==
X-Received: by 2002:a05:6214:19c2:b0:6e8:f60b:9bf8 with SMTP id 6a1803df08f44-6eb35329e00mr2748356d6.33.1742410341934;
        Wed, 19 Mar 2025 11:52:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864febsm2034961e87.134.2025.03.19.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:52:19 -0700 (PDT)
Date: Wed, 19 Mar 2025 20:52:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sdm845: Add specific APPS RSC
 compatible
Message-ID: <vvygjk2bq7vpvcthkboypucbpcr7t4yzngincrpza2quew6jm6@bjyao4usc2lh>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-3-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-3-cb36882ea9cc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BvKdwZX5 c=1 sm=1 tr=0 ts=67db1267 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=8V4trvCbKhewGEgX0-gA:9 a=CjuIK1q_8ugA:10 a=PkAOt9_mmfBkvtOLxIEI:22
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: L77rOMYrrBndpR8m7NUMv2UaypxBeUUs
X-Proofpoint-GUID: L77rOMYrrBndpR8m7NUMv2UaypxBeUUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=702 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190126

On Tue, Mar 18, 2025 at 07:35:16PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SDM845 comes in a couple firmware flavors, some of which don't support
> PSCI in OSI mode. That prevents the power domain exepcted by the RSC
> node from providing useful information on system power collapse.
> 
> Use the platform-specific compatible to allow not passing one.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-80046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F0C2968C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 21:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 085234E1CF8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 20:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548A1FDE31;
	Sun,  2 Nov 2025 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhgEr3rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTaUZbHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7EC19004A
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115694; cv=none; b=hy5g83SME8GAMtOAFRmjBA4+fa0DjVRbD2Urssffvu0xDgmgRgaXz2zeuPpc+FFVjQjhzRRI5p/B1X+MgIOdnvRavmBj3FxVTMkLcp1x2qBhmP2OPxSDg1BS+FtsRvWZOdTfi2F5h6tmNUM3561iEEcvu5Oa5RVx8MJSEhMXROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115694; c=relaxed/simple;
	bh=VgeAkwCeejVu8BwItTn14xHraSVbXgTX+41/0xFrTfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bu0oCJxpFOmDfurGI84fJ58kLkgZsIMdNPh51ALSsi7chnRt1JQ/3Ajmu5JOnbzGXu+eOlY5vXgxFPcjyC4T21dO490YCbWyPLzostEYBMgwX4RjDdGDV09mKYicUaLZXNDCnufzoeX+kGEdfrY95/3xvZ3gk6twoYenY5LKieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhgEr3rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTaUZbHm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2Jjhor1111212
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 20:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V0zYBSXV1Wbg4ICGuc9vdNuB
	b2yaOaIQEkc4Ki3XvtI=; b=XhgEr3rrjGfOuQ7J0vfAD6Ig5+P65q7kiNW3VD1x
	KF35EfjXmuNk+bdd5Be/km3q4s0LIcnlDoE6oYP9r2pMtZZ4N0JPtLLTdJBUUUne
	TUPZTV6S2gW7v6iUhcvW6ZMVA3IEXbJP0iMqPQWlPu94T8goer/L3K1BZcRatq7c
	RLzG7mQyYcSzELOB6hJtxXBWhD+rxXPI2IOcVSfC9ZzTAk7CWJpdQbZcFcU2cs93
	LlaZm17CYn9hTaZCVa/5pZC0h1CRhqYaaxYWNNgzvCNpPticmfW4YrLN4tQAJdGV
	b5vLpp7S0Wbq59HAj4VNxT2judjMReVlHKiKfLeaqaAqZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn2tj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 20:34:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eceefa36d0so109922651cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 12:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762115691; x=1762720491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0zYBSXV1Wbg4ICGuc9vdNuBb2yaOaIQEkc4Ki3XvtI=;
        b=GTaUZbHmLf19lKTo5Skg8iyub8HFhcjk1o7MSzl1SlFy5HXiJFPVJWShqrrcZXX7n3
         R1GcUSehIzJOzwFf4hA1+A0af9UctuIY8b26WpwvQz4y+a1HjjK4URFIyiPDjjnnlfa9
         EHDB7BK/4tXJyhPMCFvig/cYS4vFyVjRXT1URoaYYYTPPmzh3bW+6jDtqti1sQatNGAZ
         BBKaR96FDeVWRm6O92VPSbV/lwDqiXsZc3TRFHiTEUR/bUv8J19jhKRXsWmkeYTz43E5
         zFim0cK8mrv5PC74n3qa5/yYhoGA49D6Xth984e5/HkSGMgDPFvw9LIB5gO7CzaYVdxD
         OCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115691; x=1762720491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0zYBSXV1Wbg4ICGuc9vdNuBb2yaOaIQEkc4Ki3XvtI=;
        b=ShIfX9NTMrYyFpxp2hutaDD3GQ3d8+XC0W+zVIJ6++F04fp+xoF7D+XFUkJ1g9YbzU
         BT2ztvDTMnA2uW5pbMxaeAf/TcUjMDlUcseszoij02qDgRsEjr6xmDM1bAk+3lQTDk4J
         E7JLOwyHvlFodicDv3jDQktTdVqVeGnK15MbCRXQuXH9cJ6mgF7JIe27nm+uwg4wHN1N
         cCTq5XSzIgbBYYupP+PBhCUJlMf+vOdwZPZ/Q17Sxe5WkBLbqm53TPdF65onwpob8DYP
         DyU545PvreyMWnrIld0kmgaDvOIZg9SAuge/YtkalRVB3nOXNhxPUJxEIJkhkcWpVjvz
         EamA==
X-Forwarded-Encrypted: i=1; AJvYcCXz/JB1j/gaIoCeplHqv2nIUK82pgDh/ZQ2CqL0pX8a17vJQc2NlZ8eqd3rVmuPLrgoIrpK7hsl4aIKA9YE@vger.kernel.org
X-Gm-Message-State: AOJu0YxsoFHS8FhgulZ4QWFKQDdj89Nw+eADYwvU15qNp8NYsF8ofoQD
	+1Qd7lWa8aOkhOYLczMPV/Gfmk9HJptmyUkMOr/GMolyGGM+OnxG/qlsicCLaCQGtRePe4isNMc
	tO5BkahHPoO0kPzPpOh5LbZ3GjVqFgHS3rDSPC7mzOA0ZDoP+evKGa9D1PkA5B2ONzIIL
X-Gm-Gg: ASbGncunQt5V210CnOtfBsVrXhQggWQacC0BqPS6yQ7wSvhwu2au+O6qvfE5gc57UvA
	FDU5eWcInZfKthu7i2QL/9EfuAHbqZ8t0scZkZSbZ4l3dOFDs+PPCZSIHEeVVuX9nVU4FbCBdl0
	7NRLh/jYYj+EGKB85sp88Y3VZvmCJv3b142brdZbBQ0tTJDRcaiyVp6dirEHEbmD86HNpuWS5OX
	appZ6vJS75GzFDt7DfXSc7sldNpFfcwgszBxxBMoLzSVpqUf1ZE0R5x9WcO2GqjsrvdDUiX/ByD
	4/tnmqPuWXznHl0+hDwCGl9aLVmnHRFi1YfeaAgy99dauj+PlY7cTzYNqAL2pB3bXKkOTleMjQu
	xjE7LWaNUj1zE1PjxCnB6Xwq9+rK6fxLpSPp0jAwjL0TxQUKCXdWEnA/L1o+rflpW7YplJMsc8B
	XJ8pGrE00E+u4a
X-Received: by 2002:ac8:5f94:0:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4ed30df33aemr149576701cf.28.1762115691142;
        Sun, 02 Nov 2025 12:34:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYpwKRMbJOanwKK0p/tiAo/hMX92pwn4wJIyK+wbQmMbP7tOcp7BMR6Opqokznp0/88XtYqg==
X-Received: by 2002:ac8:5f94:0:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4ed30df33aemr149576471cf.28.1762115690706;
        Sun, 02 Nov 2025 12:34:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc07fsm2295200e87.89.2025.11.02.12.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:34:49 -0800 (PST)
Date: Sun, 2 Nov 2025 22:34:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/bridge: simple: add the Parade PS185HDM
 DP-to-HDMI bridge
Message-ID: <76xhcyzdaka3fuocrr7nz3b4gsyqlgeloellp25t4cidy27yqz@hjqyp6k5ap57>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-2-9fd4eb9935e8@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-asus_usbc_dp-v1-2-9fd4eb9935e8@hotmail.com>
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=6907c06b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=DjrArkTPs9SnCZ0heLIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: z6107nvBbFJ87zY35kB-BIXyXZP9FhdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE5MCBTYWx0ZWRfXzcMxqD4KMnzo
 dDd5tgvsvi8gPIB3XxjkLst8/Jv2fD3LGPi2LL/X3vquuyK2wtGLLnmv/LBnrGyprhvIQkvnV4A
 TnQ8fu0T8LvOk2T1EJFIMvrBRLd4TWeChVZXJwBlH3GRdM8b0NoyAEz/SWNs/Mvq7DlSmdfoh1h
 Ipu2m8W8OBeco8uxrlvGWGhOWag6JvTVzwVAjvqLtyCERTMkDVwF/L58ZYt5R1koJigSRsEspcu
 hd8wdh2gwTBLAkcpYUTaAUqCLNJNf220ZGNADa/VIgH6loZeyyWYcP1Vtp0F6HY2Hoz6fxXmgqP
 ZKC/zYwlewAbCzvqmUM7GQowZzuby7ghKiBqlCe1t/JwzqTQ8PZtrFZ0y5+fI8KCAE49xfKFfaF
 nGhGozTscnMXkhNuWEB/Mj7y3Bz15g==
X-Proofpoint-ORIG-GUID: z6107nvBbFJ87zY35kB-BIXyXZP9FhdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020190

On Sat, Nov 01, 2025 at 01:54:13PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Parade PS185HDM is a transparent Displayport to HDMI bridge.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


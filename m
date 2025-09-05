Return-Path: <linux-arm-msm+bounces-72295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C967B4597A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D39F3A0336
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E72352FF6;
	Fri,  5 Sep 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8bULyHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982CA345743
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080024; cv=none; b=dGYCPW+mDuw+h1F2EE0sjKe4LjKAIL5TWDgdS3Bcvpsq18EINBo7gj1c3suMskKHhCtcedgbYXbYAhOAbP5FrmGHz2ZQ4T1aRZEFbFbHORvY3DGNJMohWBejB040s8eBsp99EMSSpVcvSc97CG54uYRfhvGHbBDjhs8/bDP0NKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080024; c=relaxed/simple;
	bh=h0O09iRsf9dHfeMthnJk999pMS5aMUcInRudkzUILkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uw+DJZ6M0lPoDTtwppLsXsZxsVnfO86MeW5Sv5sGkWmTDI8Pp25ScF/IrTGtQ2xIeu3bt07WbHXxk4EDKkRVwiurJjHVdj1IEeMZUCnnvV7e69gY45TUoiWeoskC51hHW01iT8xT2pnHYUQaJuJCWF8YVTZHFGF0edtGx+qoZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8bULyHx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857JKu5032238
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LEqUXc5cbwTjOkkBL1dldf4G
	sxuKtt2JT9JVdaymvUY=; b=d8bULyHxtMyy4qKNiXFY3gFBjl+3oJl1y6bSpPD/
	QcfaJvpSj4Fsoa2XWuNo3HoorvWL+qCd7f/DVfvWB6pE7hh7zQ8WEeCIfQ+wwT6S
	w5Al1qefwhoV0WxtQWY5pqjLdtiureWuFqmAKyXstBrp2dp1qDJYhvSyTuReedqR
	QPzK1VztV7pciEa4bzqorSv3m0fhDnmusvYtD39dgKuA9Eu0yslelaT9KamiRY2Y
	SIEvqfeULowexsIbINxuoiJzfvNrMaTGFAgaCPcsN3DI3U3+cMuWVOgZCZntgp34
	MUxKXsh8yERd3uqUR3OgyO4ifCxgEnyjP5MZ00gIhdlQfg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkemf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:47:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7224cb09e84so38929386d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080020; x=1757684820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEqUXc5cbwTjOkkBL1dldf4GsxuKtt2JT9JVdaymvUY=;
        b=hfnmOdqq0ga17NjAie/oIWjTa/Wl8w7QMny+703XTH5AKhDlbCXxNnxMtCkoT/e9O2
         Df2XwSjpYLPA/fVmFiaSX1Yw0pjhy37cuTdCmLENdamYNT5oLU52/RvDJWbS/jWcdYM3
         sOIBP+VELPq0Hs04O/KmUvWnx7El8Dy9ZeqnnDzmJIwo1zHBucb4N81oWeYWom7pI/4/
         YxyjlemLgTRHn2B+o9voGHyer2/AScxXY5nVCqCC8o4mX6ETShFBHueUAwy1JMysi00U
         q2MCHHWxyMHVLp68jy0CSvrtj+Z/JvqHo0m0/4MfLyFz4EMtxLu3WLosKJlLao39AX7O
         aFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5IEgidLYv/RBLfi53IexKnUa+DbGPQvYWgoI0Te+ZLpZN3zdMjs9+imDV5A4Te//Air6HuaNF5M3iGGYj@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQefQa/iYhVds9ikaEK7fYXo3e3LptpH2hscQDvYHL5xhCRhy
	Xoqldpz2S3ZK9kRisRvdZ1louYnTjs7O7AMWH7ghdqTQdCyynAOfe+z0FG3sJio1TGtI3N8UtMD
	c7Q2pKJwDKtiZGwTsWa72wDNpSmFkIzoRqj0eLKWQIcCPBL1hWOPJ3YxxanMU90B1bQzc
X-Gm-Gg: ASbGncuZsvCyTM6gqU9vsm2y1TvGrErGAp4GAexGxVeTVr0pPGTBw5hXIV3OwV8DhRY
	EmKssAb+7Nl9x3vrF92pmHhlzrE///RLWgoA9kpmKoG4LvoZjaEHVzLGm+n4RVJ/7dipkwVwgWz
	C9LLPJHu16DWZCLA2qYCWXR/VolGju8gG5XlC+XbJbZTfvRZP3FBWv6xw3hmeh3kItAfil9aTe1
	15TfxsiF5aPfbRmNf4BuQpnRFfvLvbYxU/I+bi4a9+StVxu0DkVTC8YKfMNjV3JW3BbikWud1Ca
	Fo0kRN49EOCwlxNzj+nqSVOYgCspW3fQOZ9LyyMCFpy1HgnD+tgTGnj9YMmsiJxFGbOM7gIJ+JN
	3F7E06RO40zGPETrkaWQ0TNcD1HWwnWA6sEBDw8j7vBDOX4svNIpM
X-Received: by 2002:a05:6214:1948:b0:716:fdea:db16 with SMTP id 6a1803df08f44-72bbf3fb1eamr41244566d6.12.1757080020450;
        Fri, 05 Sep 2025 06:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF99i4+ZgNHpEENrXMMJgwJoCqpA1mmRHdqXIu/OPhQnChIfbPSAVcT15ZOYrUVmX+skG5VYQ==
X-Received: by 2002:a05:6214:1948:b0:716:fdea:db16 with SMTP id 6a1803df08f44-72bbf3fb1eamr41244306d6.12.1757080019748;
        Fri, 05 Sep 2025 06:46:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc63c8sm1812504e87.61.2025.09.05.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:46:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: pas: Add Milos remoteproc
 support
Message-ID: <nxhx4ocjpeeyyttqqbzwfax2kf3qd27cbfurvggzgds5utplyr@zt3vk4zpmy6g>
References: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
 <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
X-Proofpoint-GUID: NK_PoUVAC2YG2qoT_u45uBDBRnaojvKZ
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bae9d5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=ENn5GrddmNxYPxOGv5YA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: NK_PoUVAC2YG2qoT_u45uBDBRnaojvKZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX9FQU1+HRmfwe
 oorRcDwr9urh+fMVGmtCfQj0hT2QcKzM0IBrd8QFY+JrRVGWAChl4jYdH9ORNUZPOoG4lm8iBQf
 UxLgRwASPCP13TcAMDYSiQ4aO9Is9t1Ecnndn6X6zu5hwISFMm7olOviTZWUxy7FxBaUsVXk8z0
 5OVN0GFieUGj2MroZg+oeISv0cS0Vo5x+iAXZpDFHSST2E/4rHrSFznoIQksnK067Pe/+lhK0mr
 vuLukmCl/cSIQpPlNLjr8hLCK+ZE5A3oFNjXCdUlFn2bxQ+ah8oj5nwadhxYTwvJI5+2nOYU83A
 qsRJQcjREP6MlHVE/W1ZVFeehbLPr5EOgs3TJNS0H6OHempM+MhbDhLolsYz/73K69rsoLdblxZ
 PK5sQ7bT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Fri, Sep 05, 2025 at 11:37:05AM +0200, Luca Weiss wrote:
> Add the different remoteprocs found on the Milos SoC: ADSP, CDSP, MPSS
> and WPSS.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


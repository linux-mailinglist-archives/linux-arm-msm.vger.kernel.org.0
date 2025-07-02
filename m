Return-Path: <linux-arm-msm+bounces-63473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF4AF653E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 00:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 337097A3460
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 22:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74E024679A;
	Wed,  2 Jul 2025 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrfFrXe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826834C7F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495634; cv=none; b=vF61rdBA47PqYF7i3BCE8An6CvbpgqZlImbnZVo0++zjYKJ3ZxXXFohTa1+HQGP4gR4m7SPVff+dcUulBLfYekXrIghpwBcVSi8lXSFVikT0UTuB0FhiawtjjMuipCxTaXx8/DmRYHdaa4GNdlqvTsdJCSmQUZ5tRHxLquhEqm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495634; c=relaxed/simple;
	bh=fKYrShfy4eijBV7nECTRWv3J853kJl0gn/F00vK+lMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSFKU7u3HELQA8S6gx2LyDG5TKLxEDaQ2b+K3NszZbqWcC6+8So1mVQBdYxypFXae95i0tNrHcuc43sbvo04Pvug8MjtCHdlIZ2qgajpUidjzBGbXxAptW+5jS4Sxr/2TuNhnp6IF27Z+POQ56mdGXXfpSw+MrQRhoufRyhGprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrfFrXe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EFZZU025382
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 22:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m75rRNh/55YNUo8oud19uqS
	Nh7ztNCNjf7HEJhz4Jw=; b=DrfFrXe+I0mvhum2HRzezn+EXJKPyXEcy+lFpiXD
	yOW6Cz33OviCyc9FH6nvXpgJomdo/eHdhOG8aJTRmhOs1ghywi8LT3qVJZ1pxOD3
	GyhruPTn6GEwW0yJPm8ALH1doE311dSlPuVVheig2nl/QFP/k3H5UtbRBlkFzk0R
	64iMHYOn5V68PVk5s7LpCywTIpe72+rDeaQuJwMGen2pcr4W34h3ccIptIGUDJoP
	z93TGYaaZMIRmax/U0SdcL8yN9FvAE53uNRVqNPy01th9lcZOlKG+K/+ZSrD0CUk
	2AYUnGEcREoX4z71rFOJ3ex5ZlmLHJFGznZITV1RC0/zXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64uc25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 22:33:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09bc05b77so150347985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 15:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495631; x=1752100431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m75rRNh/55YNUo8oud19uqSNh7ztNCNjf7HEJhz4Jw=;
        b=O/OAjQMOHwyFM/bLoEHlBb5bm4KNc5+ZdXz4Ukzj1iWs6QGaM26C0aFmOIBx9JI4ao
         NZ29mcTjrwEkDR+ztYWvAExG9wabkIK0f4+NGCN10t0BUeGFVBONi7zKd7CteMBqEs2d
         esVqP187bUTeY6/5DPiSWLbnViqVJqNDfMul8/L3P/8NZ40pfeiPyDc4jsDqwJE44pX6
         kgo8snHE6ikDw4eitTFePQGai6nsP0BnUkEwoVmLpazct5g4Wu9St6rWn5sWDgRT2yvr
         Wazy2XYmMa82sHZDI+Px1+J3XKuMhoXra/Ih/8g06b3VscrwIA+DsqP5LIqwx6CKjtAo
         Q5+A==
X-Forwarded-Encrypted: i=1; AJvYcCUj4mOPO4FmMSn/YhotZkFxqO+jCdovx8vuqB3nswS0qXaCYsrPZNNuZaBC8uQXE2FCqqplP69j883Xj4Ll@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3XJi5RytG77wiLvrPhKXs/qONyXoHYZi5Zf5iDeHpNEISXh7
	J3TojIO7Af7bkTw32zCxu3ZxSnXsAVnZuoAfj2ZNf5cZrQERdA5XqbJIruCIvYr2niY23k09uhG
	YzuhyRNopNoTTi/s8af9MjSj07I4QcIUp+qfHUMJtzDfx0NLHw7Tnpv1+V2fW6GzWy/0k
X-Gm-Gg: ASbGncuwj8sDqDcR3gWhuPyEGwM7bUjh896hbYIKZbx62xEz84AHBLTlbGdlzHRhW7z
	XLmUYwGsDi0FC7uK1l7Yf7uNmxJTO/tTzxaF3W0KolAFi5nBVnyYFmCniJm631OeslWPTKRFdwg
	yBIfQ8BNskhP4uIaNf9FIhykGDAQbYjxXvq46FMx6leVbMQSczvSB1Gnt6zTGk8kaM+CmeNdyU5
	G0DHic9G+j6CkzD+lIhPdpPuFt2XhzjU8bZ9R+UTi4fKwX7OeaiA5cTsMBKWrDaJ5GuEbJ1g4gf
	4vlNF9nksJfghac8Eyw613Et5vuc1PDNpgrp/D+MbjSFU9VptBb/mC3x+IwGMKyClNoVy+khHa9
	jHW6SroKZIf0gfrVrf8fLAuM31MMhKr+Y35g=
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884199185a.47.1751495630619;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqHg8DuS5Rl+xyDTUq7jRwAVjwOfUy86K5mPVVKk/oqcQL3wgwaOndDK7teOB2+3l4vN8JRw==
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884194685a.47.1751495630175;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00aa6sm18743291fa.99.2025.07.02.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:33:49 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:33:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Milos pinctrl driver
Message-ID: <xtcfzqhwmxgyui7fyn5bsms52nnlflalhlkvkinhdc2sxdu4l3@logrn3cjupez>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6865b3cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=JBPsfPNCSnIN1veHQUAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfXyXsWhPK7hiZB
 EW6bYy1Rat0u9rxF78Cb4Q+So2DuZeWlL9DhUUKKyWdvQJxFlFX7akpOnf1VjgmR5K6gOdSQJ7Q
 7aOyGLEbyJ0hecYcN0IP24TE0nZcBOvFhiOeyJ328iwsNnmsPtiKE1nrbv8i3lbfmopLLrgVFm7
 v8VWvcn0CfDTvD8X/5coEoX7HYsI8HWPwBCJICyJxmkPpxfFt7ZIVXm1aYYOuvVA/I4VTBXYWIM
 keal/5UC1NLguPyzbu+lUgh4Wp/0LwEqmFtsHdNw2b71mKCuHqVhWhjA//0jVKXCK8ZeRhHq6lX
 CrFors5rnVIMAE5EFPMVw5eUNaWMARYYaXqVOq+xggI8OAHpEt421r6t2Q69p1auBx2SKRnTWwZ
 gib1qGGkSeuo++97wPXkmqhA/lkEYF1NvHiC7fhw2AOdty1lVwGFZRMg8EuWzpuxGFR6Dvrz
X-Proofpoint-GUID: qQ8U-71MmkD4La4O5fCJRIVoANWb7a7V
X-Proofpoint-ORIG-GUID: qQ8U-71MmkD4La4O5fCJRIVoANWb7a7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=986
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020186

On Wed, Jul 02, 2025 at 05:56:17PM +0200, Luca Weiss wrote:
> Add pinctrl driver for TLMM block found in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |    8 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-milos.c | 1340 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1349 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-84279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5ACA2330
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93586303B28C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8192F9DAA;
	Thu,  4 Dec 2025 02:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8ryXJTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDPJXro+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C22BDC14
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816499; cv=none; b=euqC6fSWvV1D49FjeDycKQe3ud0kY3cPa0zG51tmqlZDNS8kK4hDluyqpn6PWwmaXOFaTUuvO0bSEuB+rH3oo7gtGpOo9U9PYGHJSGPpjJSC8oaaZYdkasEwIV53Wa7YYntDvFvPXvq9sOt7GW5mbyW6eEqROkCPDlM++EhBUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816499; c=relaxed/simple;
	bh=8LwW0ncNvC7Jn6rW4REn7Ts3cCGqcozUA6R+v5PmULQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puy8pCyQLAXsZxGW8q0R4WSBaFhVxjm7xT7S+lx+x5ywVIfQGCAwi6VasgUnYNWE4QR+bYsB9FlUgpiKWEWpo+MmK0pnw3+V9HPNVuwXURDazhjYbkgPIN6J3zzPUQPNdWpQFZs1rWc/L5qK3+gBcoqDus1RKlSSlc9GAf7NtWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8ryXJTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDPJXro+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3MiIq11536254
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R8nH/Jxr1XXhlBUXCzt00jTp
	bm/hlvq5AbQmav+A8WQ=; b=V8ryXJTbzQf7cEvJr2xSJYiMEDJzuAYu4O5zoZ7V
	HK9a9X8+M4l45o0EFjMQ/P9N3rjjvdbnUzKm8fpJ6MGDio4iLCMwvkfOGgTgDPAZ
	H8TsIY/7J2gyC+HdtJPfKDfFoOJPJrNsMt9S5+qSNx891z3/tAFubD0aJc7UeKCM
	lUzMkmJk0ZPYHg91V2+HT6hlA6/PUOo0v8KToGuaBGWjhsNJbWGatWRS20rxc/2S
	AlZlyHQPzwxchiWQCTrh9hOPXG1K2mxNuchWozRW96Q75ZaQMkuV9QUwtjUbESiQ
	5hUlmXPv9lENpY/mWg5mDkoL5Ap/lXDNsoLb62W6mmslAg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0htkp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:48:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88234e4a694so14080756d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816493; x=1765421293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8nH/Jxr1XXhlBUXCzt00jTpbm/hlvq5AbQmav+A8WQ=;
        b=aDPJXro+9YOauvhLpgkUwyk0I4MK3jWZ4mZ/vgKdIkdWRrQ4K+/VrJ1LngM/thWyo8
         tfteNVL2K25r6a9ScWLwiyBHNNmM9usDnSGLNWD7IgOM3aRH+sSzoOPXZvcXKqiGfrPV
         y/bUdxfD3SxcLSyLP34pqByM/qXryuhK8TmUTI4REuZzNE1n3tDYmS24afslG7GiQPMR
         eWjVSaf1enG08RLtsvjULyWysx18KU7gyOpMnTbFFPIOe1NlHYJCFkiAN6PbU25XG55S
         pIitRzMG//YfW+e67JgqfereWZ23LF2xKxFUTvsZLm2pFFQVTnJ8bXrq7sT56rIWdjiN
         zkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816493; x=1765421293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8nH/Jxr1XXhlBUXCzt00jTpbm/hlvq5AbQmav+A8WQ=;
        b=F28gSpKSaZSRH8uevxN3vwuRqyRixVgWPyyqnNmamMlKj/QNh5mqt6ck7yY8XOrgpp
         e1UedlWa8ocHNHGPnTN0/uzfWMOyVM6E6Nk2UXhsy1kJDC3YpU1+04wpdxhCVaKdnyno
         C09anWGxg1IoQLCJE5SMATXrWspAdEdo3irdC6EaFQOEgTT46392fi7ZL3Y6rJeEr8Wc
         /di81skyp1JFJNgBsAFAck45C318XXH9lepy7oYxagbTy8EXmnpwDjHD+WHSV3MMAT1X
         1kKSbRnfUPuxvoOyYqbhtnI2yHoldHgjGy/KkOYXKWWYGPlFnM3oq6irWKVqzg3dPMO8
         vXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYJHNIUml6Vn/hR2pvkyq+L1vUs2ar6Ucua0y+1ySTaXJkEMnTnuQ94Py92DEMRuwJz0aqrsPpEZB3EYM7@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPcuuHVG/CikH85mFZQoNu6J26k3PqLfkG98qwbI3TrGjOk1F
	1eTo6czZLcx8g7JQzVg2k12Na2wfsj06FZSiNzV/SxrqB/kF1RNoZS2akWoRG8D/skCONhArpNd
	N9tchF3rqJgkBDwLXz8+MTe7qY7d1FivOMi9c17BnGzWr5NxplrSXNM4A0UktX49FsBiQ
X-Gm-Gg: ASbGncu1CvESgR62q8TZ27Li+ySrQYtQLXbi9NTyrjuvYRwYK+YQrECuiYR1quZGzHs
	1/u01UTi0xQYTH35Lw7lmLow19LstxbN7u8sza7T/1vKSjLLkvb5vL7op6gQq3S1MzEY1tnojvQ
	+O//0sIu4A2BBLJBmwAVIGgrkxH2v/BodYE45jAVY9Jsy0nQYdsnIfUeHWF3oVq51h062Xl/sDn
	uC4lEuVEOGjEc8FcGRfkeFK9i5pY1UhxXSZ+EJcpTdme8Su08SEfERlr16nnJSWhGz2kgCSK0U1
	NSJMDvwd+vT7lVHryWRxRW4H8qqe2Lg0XfHyTXymVlRSyQCWwX0agUiyiTXX9T7HX5XYRHjpfyx
	WD/ud1I6N/2PYAF+R+eh76lOJt0V8k3IZulfuT65//WRnxZLI9xMFPFyy4TKXFNXr/Y0lQwJlEz
	qAw/FNq8BK+vgiE3cUayiYeSc=
X-Received: by 2002:a05:6214:470c:b0:888:24a5:90fb with SMTP id 6a1803df08f44-88824a593e6mr22754706d6.19.1764816493297;
        Wed, 03 Dec 2025 18:48:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdl94FaFQiVzN68l0kemzDDsgWMzFjQmOHMh0rBL8E1nsS+YvNrzEoQ0uegby0Gp2Qf/thpQ==
X-Received: by 2002:a05:6214:470c:b0:888:24a5:90fb with SMTP id 6a1803df08f44-88824a593e6mr22754476d6.19.1764816492856;
        Wed, 03 Dec 2025 18:48:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7c5sm28585e87.11.2025.12.03.18.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 18:48:11 -0800 (PST)
Date: Thu, 4 Dec 2025 04:48:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, krzk@kernel.org, geert+renesas@glider.be,
        bjorn.andersson@oss.qualcomm.com, arnd@arndb.de, heiko@sntech.de,
        ebiggers@kernel.org, michal.simek@amd.com, luca.weiss@fairphone.com,
        nfraprado@collabora.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: defconfig: Make I2C_QCOM_GENI built-in
Message-ID: <zi2btrqshzjwrmpu6uppaqvwn6tqbcnijizjoccqkoegce2sel@aa4hsy6yhabh>
References: <20251204022132.287243-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204022132.287243-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uE4klA_QM4YPkfrJGenPbWsoYDm1Yfao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfX8whJ1MqhVddh
 kHeyHP4XFOPgP41TkoFSW8+tmSpgrK4xRmKnrxTz6tgRgvLBUDOytt2q7w6V007v0jLziFX39pl
 7g2fnyV0MFPdG6jXU6iGWa2GmIyhFVUACJg8QixE3Bm7pwSRt41lhl6JOSWahR7qS9dzsHbQgfl
 YMRGy1d9RtJD/B+PSBQR7yqXX6tW9cje9mrGMqpbaZU4S8y8vyHlW85M42R+aakWhKQtjQ85ukp
 HINtRtFzHaGLct8PPqk8TWvEzsOgrOtpB3AkchXId83ctdskkLcLatX/OBV+ieX+raF2HzFUUoY
 u3F0AhYRgfnHx6Ur6UvRWLVUJxfKUTnyC+rxUSM/KxcdQVuOK7q16xysDbZXAy2XEA19H633Adt
 mVqyFqJc6FjwfHH53YTL0m5sdJUzOw==
X-Proofpoint-GUID: uE4klA_QM4YPkfrJGenPbWsoYDm1Yfao
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=6930f66e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AOmk99ZuvmNafHNR0iwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040020

On Thu, Dec 04, 2025 at 07:51:32AM +0530, Viken Dadhaniya wrote:
> Require I2C over GENI during early boot on some Qualcomm platforms to

Which "some Qualcomm platforms" are we talking about? You got that
feedback during internal review and... sadly you didn't improve your
commit message.

> initialize GPIO expanders that control SD card detection. Without this
> driver built-in, the kernel cannot detect the root filesystem device
> when modules are unavailable.

Please use initramfs to provide additional modules. Other boot-essential
drivers are also enabled as modules (CONFIG_BLK_DEV_NVME=m,
CONFIG_SCSI_UFS_QCOM=m).

> 
> Make I2C_QCOM_GENI built-in to ensure these systems can boot without
> an initramfs.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cdb7d69e3b24..8d85a2255b07 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -562,7 +562,7 @@ CONFIG_I2C_OMAP=y
>  CONFIG_I2C_OWL=y
>  CONFIG_I2C_PXA=y
>  CONFIG_I2C_QCOM_CCI=m
> -CONFIG_I2C_QCOM_GENI=m
> +CONFIG_I2C_QCOM_GENI=y
>  CONFIG_I2C_QUP=y
>  CONFIG_I2C_RIIC=y
>  CONFIG_I2C_RK3X=y
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


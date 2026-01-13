Return-Path: <linux-arm-msm+bounces-88767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F260BD187AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CB68300EDA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F62F38BDA4;
	Tue, 13 Jan 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu9OWRU5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGh4p/rF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C538B7C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303522; cv=none; b=eeBY0DWOdB01sAQOTSYqkeWq6MxGzpZCdTJXOvApyJ4G5l6KXwQAc8XGitUPamRKbVapFCObJ9iMegAHOkoJAaWs0a3HHScaWNHEOo0ixTMjcrWZoWuqKZMTDIcXHfqGqBRWVs3AET51OxAsUf2fk+tume+ExcvoqrSUumOQ1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303522; c=relaxed/simple;
	bh=t86HNZbxi/Od4G0LzLdE2D7b55P6uxh2O1I7RX6Ozlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyYtfF0l1gYLo7KhjExsrKgELKJHFJMcvb1NiojNzC72Wo7SJoBf5MDuUxKTAvwLYmzkGIK6pcRZ+FXUAIn3AVE9y2krUML/McnoJE+a74zqwLYHmebzka+0TJcBR4qHjv+Je2WaGWxTKzHpdjd4jl4w+PI+GAEePrHZ6S6BhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu9OWRU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGh4p/rF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nMrn3734990
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Kf3Ro/8NFkbGB+tKehpxW0a
	watgAh1Ax7t4rv6CRBg=; b=Zu9OWRU5PSQtmzMrQzVrVzXDJFWSuu8l10zRlg3C
	CEyq3kdbKqTp6IKHeuOj6mbRAIT8eKS0NP7zAmj7xOd63hlph9rYPPZibk8RyB8W
	UzLdwrNXDK/56Xu9NwT4jAMc2mMtdFSO82Y+ZVeEW52H60pNUxiwvqWXPEkHyziD
	sj8JK97zr7L2cz+aieywmN6EGKBdkmpv1UTarjzzWKX7Px2hwJ8cVme/owKjp5LZ
	FC1Yt91bWerAmEMdzc3glLPYOCK7NYzw4l8BgGJBCDqyKLUbxQfoLdS2IUM3gJzq
	JBk5QPlQPm/+C246gl1+QAdOdMMqtN31l3W8sFi9jx88vA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng8790xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:25:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c38129a433so1980640385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 03:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303519; x=1768908319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Kf3Ro/8NFkbGB+tKehpxW0awatgAh1Ax7t4rv6CRBg=;
        b=iGh4p/rFqygpymiXAEm7/ZUzBDlT4dA5W0nDiR3BqqQknpH5qIXxRfhJybAZoDFnRD
         P+wCZ4kN6baxfu9vAe9sDmKAfyyb34uYjxHymlQjuF+Tym0iy3jDXK3VA7kdSSbpjR47
         36lGUZL9MSPLJpQXR13LPVcDU/UPS3Acq96FAUt2en+pbqUJrUUMaZz9mO882usZBexe
         HhLV+7P0fUn+vzzuM9gzjr9AkpmGVpTzgYo0DlGd8OrEMy073KRv+hvCTCfdZ50T8Kn+
         5cpuFie/6gphi+L7Jn6woWEZIKT5gAC4Jmkfkxazj0EkPa7oEoz9WxR3FArkVJjUhwPq
         Lihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303519; x=1768908319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Kf3Ro/8NFkbGB+tKehpxW0awatgAh1Ax7t4rv6CRBg=;
        b=EE7zoPqA9TjQx6uMNcu37zIqm1y9eUMySIUnl0AldYgVHc9RJouytEiKMOCgAkDI8/
         eeEMXjchOGdsEcIEi8endAqsefSqDYDiyTqMU8BxeOuZ+7rUsLgy/inECMkOlcKS71rk
         XBRGPAY3ccyah47iE3YRraBtF7T/SwuxwZnHFrRXpd+hqLpcTjFbYCrrJ5pmF24QjNek
         ozDtOuUwBKW5clPi4CupY1By+qG0kAHtAl5U7ALS5dWQKLhHUngJD/t+MozdGmGuQLsA
         KcSqpKhSRCrp+ngRrK8YF0Un4tp7VUJKFT3vf4o60ui/0AXmLYUQJz8h/myXE70Yr3J0
         yEVg==
X-Forwarded-Encrypted: i=1; AJvYcCUvqRE3Fm9ykGULUL3KAfc+8UBsMTdpo3oEXBe9g5A1DJP4fx5qp3zGIcgeOJUzG9QZR5la3xFtSo47Jxss@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3DC2vFjF/55692fg0bL0OgTmgjvkNOx8rmxcKw6cGSJ6+jIs
	d9BkSVGIR5o0/qQmKwkwPKNdb+0PpmSdW9KNZ8fFRgSyVcY8fSowgHbAh/Mi8+//R0waFrbh1aa
	GKQg8heiY7WjF4o5Jfewge6vijTQ9hUZtFrop00g9MaFnM4b2/BY50QT+ChEplHeBJ370
X-Gm-Gg: AY/fxX6C08tFhOKRtq9KTnZsefPQVZ0uAsLLGlMCf+lSPlGn0jmK4WhBhGmWU8l+U/N
	cMfWlMtxCAPuQobO6WKHqDzTFi99kVxlsRjVLaAHpKbzn0nVzni7NVFMFl+d508MPKPrcN6+3mQ
	2CRV5Ik+jGt8e5b356eDEaOPAxj5VpDq0DZXHhXgmhzmnsgk1c/sW1onjabPIdEfeuODvunLkKB
	84uz4G4oOs4ZrVYmB/Ti1g4fZ+f0AvXx5nTLMbWfBvlR8w2svO0C1RFD3LfjWBOQ5ygXtIWqxeT
	6u09V0L7s0adbzQU2w15oq+PUxzoKSHaw71N1FkBYqoXkQBtnfoPYzqbCuPeHSQLM2h1FN9Uarh
	YvEZcy8rHw/VVlJXOl4hC8GXDDRyb5fIv5vjPlpYO1Nl7P956DcECoANo0j3OzNVx21UQ9owf9W
	IzqlRYvP17zJ0xEDSHRim0rKA=
X-Received: by 2002:a05:620a:d83:b0:8b2:1dfd:f6a2 with SMTP id af79cd13be357-8c3893a5939mr2915865985a.40.1768303519359;
        Tue, 13 Jan 2026 03:25:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1hsn2ilnwEbd6t9Ep084bkY6hAk+Z97Tp/O+7NvrOBFZdHTyDztXEXIZbBkcRuTwh5lAbNg==
X-Received: by 2002:a05:620a:d83:b0:8b2:1dfd:f6a2 with SMTP id af79cd13be357-8c3893a5939mr2915862385a.40.1768303518852;
        Tue, 13 Jan 2026 03:25:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5db54sm5670677e87.64.2026.01.13.03.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:25:18 -0800 (PST)
Date: Tue, 13 Jan 2026 13:25:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NyBTYWx0ZWRfX3bYXQBZspHxJ
 W2K+SSIx4xJwDJfo3WGZAs65TsqPxqJGdpMtNn0bX80sgI5NlWKyjUDqK6gEE7UGtk6fXyZCDhu
 XCNfVwDSMpKt3zuKl8JlH2vPqzXrWRof9fXdfp2RkHBNUDFUJpBdeuF1QqWoiqLUeefa0Eqhifr
 QNlVm3/AlEqUtq0qHcNEH5eAgn8rXGrhW19LPqak5dz1/uJiRWhLvN++qeFDikCFTB/WSCL7YrE
 ARvxfYPkk2N4L2QfF5NWT4oRPacUkOHWsJznA31HS81TRbMpOv606Blfv0ElR0UCcu2wB7YjbGe
 4z/G9NRFfUYXi2ewc7TYO8mmatrhhncJqqYoEKFp/ckKyRCCuQLCKD+3OilXkte6JDAh0mMx5EV
 iN+1GIAqn4jrJ9NW0Ztxq2Rm2W4tJP5I1cXWrEgEGUAOPchS7QwwX8G63vzJ8qa51Qc0RVm1jsv
 4ZncyRaJoZr7GlikX2w==
X-Proofpoint-ORIG-GUID: nprdv6urxoXwRoFVRmZ595Qx7pGzxtK8
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69662b9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c_hA60C45wluNUwf66sA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nprdv6urxoXwRoFVRmZ595Qx7pGzxtK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130097

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 
> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> prefer SMCCC over a vendor driver can explicitly enable it.

NAK, the userspace should not depend on the exact kernel configuration.
Consider working with distribution kernels, which would enable this
driver anyway.

> 
> This avoids unexpected format changes and keeps the generic SoC sysfs
> stable on systems that rely on vendor-specific identification.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> ---
>  drivers/firmware/smccc/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-51836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA1A67EAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9A319C6E38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604801FF7C0;
	Tue, 18 Mar 2025 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkxBtbch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12391C6FF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333594; cv=none; b=YqG6gm4ADTbSia3vVQeQED3Leokt+qp7onyZcy2rgEnLXZ8eVLk+J9Ps1AG3305QQl8KzpBizZRkgl3I1KmfAiZorosYVNhVttG6KSW8SXLfMfNji+MSevlVY2lqFtnazgdYa7RsBuUCOUvBpY98yqhTBp78NVbia8tle4wyDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333594; c=relaxed/simple;
	bh=XxxH7Wl2RNgHRITz5y5KV2ZjNKcScURwrYps/17Kl4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngw6s6BMsQhdY6ZBjAkm+YoR2FKKGzwOJfWULUR1TaYJyXJKND4dC0hOoohv2Q8WzMCTxaC4oUM9NlMt7PFeo4y7TDm3wRWWoazA2J8qR5teNDqyOYQDlWYJwd9wG4vG0zHbIbHZTYFYZvVDmPDzp+UEKPOX+0msdZ8x71RsAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkxBtbch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IC04YD003699
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HWM+O/ABS+bwChQR1xXmZHPj
	aip7azCOcMWJO4lqEt8=; b=WkxBtbchZlgJpxW1pOGDk7HaMZUEBujS9UXXMFF4
	w/EBDc8Ix4dwozNE/Aa+6+paFxAvv7nvJH7qH9UN39040YwmNCp/Kl2i/CeakAhZ
	5u+m8eyP7fiyJt7OJGNciHzSNpRTzHpeYOLfO7PoG/uXRsEbiDKY2FiJ2xu+8zUd
	ykxG8hEWxQYkQ7AmjbOJw9oOD5ZtTxDvzKpfskUqCmyLui9L/cEajd/tkXCbwGDc
	GXvKQeUuf26AFfsXGl754HGQW+JYK2gyG9k0SiTWzVbzQ6hDWbdJ2o7Njgk1h9F+
	AgBsl4JzAWIw3Dv1m+kz8MYaosCvzMQYr5V8MuvEh2hxhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010k3k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c546efca59so902950285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333591; x=1742938391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWM+O/ABS+bwChQR1xXmZHPjaip7azCOcMWJO4lqEt8=;
        b=D1OxjlVJa6B12A9OxzQMwMN8wehV3PyHy/J4BYAC8wivYyAM9rSPWzL7TwYkUWCn8K
         nhfP/UzDDNz2ts9pnV0DehA0Aomgl2h5gtxH7PuoF/RezCsPilksv62o294F6SFNiTE8
         RzROpZLpgSNWns8cPzN9V7qyiGX1beN6AQuRcL4E49jvmyGimTrEOat9iT2p+q4/0OfI
         OLoTmBnIqK39K1ibKzISMwC6gcid6gAzZaPLDfBYIT4hroJzZo0GjIo0H6ezS3CHTzRa
         pGHuIONBYMLSgIF7IrfbzsNo0wyxzSItF/e1ehPvdPBLPQrysrQLgGSicrqDXlu7/au2
         LVJA==
X-Forwarded-Encrypted: i=1; AJvYcCUbwoBz24LncUz0wTfMQFXj61eCayFVmn52lwa95vSANPT6FJBSsvAAkSvWdK9gZ05ytjD7wTeArNcSLF3h@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYl2SZz2MV7ni3HyIpBezkq7GY2e7HkQAtbwo9MnIgybLckmZ
	VQtC9pU/OsZP1Ld27a8WRFbeZRhPhPjSGjm3juUopVjXtS8DZaZR2ii9QsCWgXKlG7sJNi1X/bV
	CkRrtOnO01UYGvK+7Y/pWX91/NmhJFobrhEERGyEsjtpk3liyIUXHFqbtyEd+RIRS
X-Gm-Gg: ASbGncsJ9PdA8DvUekcq1X9iYH/2YL4x9zM+r/Ydaa62w+8eT8VPUMxOcFBhdv5A+nL
	ajld2hnUKqh8xUyCmoMlLE1QDwa6yje7TuXlqA4gaYC2WAkb20t9Ozdf47VcQZlptkv9thLG7sE
	EUEuYGCvkjl/5AIFvHty4tlOHrVllgsACUSWoNQAg45D2QkDKYZv2odxWlpHniSptJT38Kez8Mj
	hrvce3xELnJ4Ryf6DaJqcicxWEGgikPrvfvpifr9fQrqdKRsFV+70gNAExIJuHOD5fkoC4MsDam
	zweTJxhi/fDL8DMT7UbPlma30XmNqq8Qf+XxDYHmCode4+hpCXeHjpGPdZ76HeSBECoqK1L9aw+
	VEWU=
X-Received: by 2002:a05:620a:4550:b0:7c3:cde7:a685 with SMTP id af79cd13be357-7c5a8396ad0mr33661785a.13.1742333591050;
        Tue, 18 Mar 2025 14:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRZBo0QGmn61PGE7V4h9Fp9fhf5n14AdOu0ZUsVrghTVbJLnoF8kgujmhYrXa+WQyRmL2iAQ==
X-Received: by 2002:a05:620a:4550:b0:7c3:cde7:a685 with SMTP id af79cd13be357-7c5a8396ad0mr33659285a.13.1742333590782;
        Tue, 18 Mar 2025 14:33:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864f9bsm1791651e87.153.2025.03.18.14.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:33:08 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:33:07 +0200
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
Subject: Re: [PATCH 6/8] arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD
 supply
Message-ID: <3adym6olojyjwzzg7cxgng755uqg2g3bo7haymkpxvpi35fw5p@pyl2nv3ftz2c>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-6-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-6-cb36882ea9cc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BY52_fNp-bpcqLdKdeDD7FKzCdLLoxai
X-Proofpoint-GUID: BY52_fNp-bpcqLdKdeDD7FKzCdLLoxai
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67d9e698 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=czvDKQ4P4fPyK2hnz74A:9 a=CjuIK1q_8ugA:10 a=PkAOt9_mmfBkvtOLxIEI:22
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=719 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180156

On Tue, Mar 18, 2025 at 07:35:19PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Set the supply as required by bindings, to silence the warning:
> 
> 'vdd-supply' is a required property
> 
> The value is inferred from MTP schematics, but it shouldn't change
> between boards due to specific electrical characteristics.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


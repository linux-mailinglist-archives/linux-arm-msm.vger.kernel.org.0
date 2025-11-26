Return-Path: <linux-arm-msm+bounces-83470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D50C8A616
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C18A357A46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9084E303A13;
	Wed, 26 Nov 2025 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omo5ZC73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdG86tzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E734302CB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168036; cv=none; b=kdAY9mdBNMhbTdgGmgyEVte9TRYcVx93+5DomPj6hSuVEuYXrIuMQrzJpcKfevOMNsggE2tzHVqLV+ckGmpSW0tbyE/8sYNitRtAg84MprDVLWRbViFoV4sLggM/GDB3/UEBW6ZfRJW3CtTAd3L/ECXmmInSWj6CvGUJgYmg+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168036; c=relaxed/simple;
	bh=Eon8982swap461jNuY7SXuzLgQoe187zDdqMW1UQvKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXhYwnB0NdQDAfXKNkQvSZ3Wo+vcSeU64f1IL7YcaaDpDCFXuzBKUYzFHYdY7L+Onwz574XWeXgMA3rhcAb9xIQ4DdLss7xndJmPyhi89tPsn5xyKmNILFf8gnaVvu5VzJFz4D/Bpn2HwuNaiJphAbtEgLPcAbPkxkCPtOtbkX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omo5ZC73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdG86tzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6VK1k3890277
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ZUEjnUCCK0JIG3JUS5Ii/sy
	vWTzLObg8cbEzR2hy9M=; b=omo5ZC73IrCxVqeETim7CtOztKHwKmkgAOEE5eBU
	gM+h4Q8TAt5+VpNlRbPNnFa4qCt+gP4uW3cm0yvolYKPHjlJkhboBOkI/BWc4Bbw
	HENl4DmMLNxYbEeEtUyzeJbuu8wIEu+vIeRH1RzkGZXg/WdukgXa319NpKDLjTNw
	qjme/s1+InySS0HJr3yhW/TWj68FEvXFyb8NEw3EWmrhCapRUAA3ruQt4xrY3K5e
	7e8u/dO9kMyr0GLPRe1YK61QW3smY3Ci7dbnftbzkxB4URF9MOpmgmVKcFIuIjWm
	SRgt4m9by+8qT87S/QHNH5a++UbxgH6cDNZybxgtz/lVcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmeb4ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:40:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b26bc4984bso2539584385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764168033; x=1764772833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZUEjnUCCK0JIG3JUS5Ii/syvWTzLObg8cbEzR2hy9M=;
        b=YdG86tzfOnjYKq6zVtveyz98RzzgO1m9mVzZHHGnTpXyhvVbcUUZPOn8mSTaAG1lqP
         Qfcdfmb2unt/BRHbcT8DEZd9QmXYZ4ptD3q3S2CjKZkaK0whiPRPZ2TGZIFSIuG2PXTK
         8EY/Lsv/y0HFrgD3Q8M2u7NzXf2UFtJuPRh07eW+hk4usGhlghdoRIPHxhH28lCZlqzx
         qAJV25vqeh0wpx8ZV6mDPSCwlgnmW8dzB9j87Uq0R1fQci5fjRJh7QLKWVm7XPhUh+u5
         LqfHL5J6LUBvHstV5wzRomcnnM+saklDUcZVqqmgOPrZwmSNG5Khk6+JLDVEYWuhEshg
         336g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168033; x=1764772833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZUEjnUCCK0JIG3JUS5Ii/syvWTzLObg8cbEzR2hy9M=;
        b=SjlGdEvTHTdaoImM8Q7lWbO/OX4AZ34HyWhR50RR4aSPdjeCd3MFcL3/hqOaZlhlxH
         ayfaGV7C6fcePCmpLiqE4N78f8Z9PlS8bmElH6dtASvhEBbkpD/TpBqkpXK0hmsipKsV
         l8WV/vqNEaW4Z9OrI6PmOv/flIAJenFKJmsHKxaZpXmKIAlaPZ8ycZLIPtjHg1dPDlbH
         NdYyGU6xJfR2GAqG7s8CMQDtYKHuSKsH5w6g4SYc07OLbtIdxF9MsmeaFA3BYvDG+mEp
         +7iTWZiqeHI/FowdHKsWi1HhrD7HC3uk0tDcmNA8hryeg+cbFliBHpdmpi/Ndt5PQUwR
         TIcA==
X-Forwarded-Encrypted: i=1; AJvYcCUOyUdxKtv+viw9NhdtXW8bmuVbSHNGZAxxczNKwGjrM7ztEUJ0EekejTkjbhsCPFW8lvD86slFTu3Lg9VI@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcr/v2HsGZBxCW5rnlF+/0AXEii+z3+UU/ZIMjJo6l5mx5JJf
	jie+xNh44G3LT2cGiLArB8nwj4j06zQK6n/gzbxweDamOlZgsVjygFkPGcUpBqBYaQTkpNK/Mhx
	XAjDeaoT8NA6XML7cdOz4W+uOg4YwWUCd8G0VZ1MLzjkSGlRqbVl18iFdYCusSLcIBi8K
X-Gm-Gg: ASbGncvf/yGht/hIOB43lujeuJsiepoF2ItZqRF1mOTu5dGOQaMiwvHyx9KzNbKDnmn
	+upI/XJUPvpLFsAphP9Xsd6cr4bAltUBkjJ3vOICQ8tBYUddfjnhtPoXEVtBwIBXRQw7PDDbIVD
	LoY5oJHmzvFwKzmm8oa8Z5ZPzjPvi+sK09uJBJGbwzIoh1Yqd5lFKDPSjmHMs0Pz687XJZTe9Lh
	pB5/K8TcJKCRUVZJnNjYD3HYZaAswdFhY2v61scY9yrhLOGKEBM+WMbP5UQ0Z73vGr2f9IYgBUF
	U+kJcx/UKJgWLd/c907aMa2HUPhzUL1J+j1EHxVmJxOOXG/LDho30WahDCESvNokKyEUB0GZtoh
	5I47igiNTrfLiIM5sR4tsm0T0hb/c948cnmzb6vFt4oaBoQd4dmbVVHMo1shvHkVGMndZVP3r2C
	W366KNzO1Zqwf5jJ+bkWshsJQ=
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2485355685a.90.1764168032682;
        Wed, 26 Nov 2025 06:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp3wUSeWxCbqnY4bLYKUrg2wuf3aNS2sdexjo3KjQDa70tqm6BPX+WmzJtlJW5uK+qMO3d0w==
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2485351085a.90.1764168032205;
        Wed, 26 Nov 2025 06:40:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db87153sm6085150e87.31.2025.11.26.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:40:31 -0800 (PST)
Date: Wed, 26 Nov 2025 16:40:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        stable@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as
 sleeping
Message-ID: <m7kk4bcmaft6at7isv7p5whvcqrfpydx2ajhp5hzi47m46rzds@gjomcts7c74v>
References: <20251126122219.25729-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126122219.25729-1-brgl@bgdev.pl>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69271161 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tJZk5_2C3ecUZBiXCX8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEyMCBTYWx0ZWRfX0zr6nAXRJEMu
 zUMPSgbOvS0fVVawvUzwUQK2jdHlAaVJ3/wvutrc81Ao0RxvzkuvLFgVUcoMR4blUs/4I/nLCsC
 otvWVweEEdC6PMYyA3QmC2i4EHRPXtE/+rVA/oRl+VDRhexatb2uYAqR6TZeuesUsW+s7IPIlfg
 ZRTc3em4d4CEa7Ybq9Js47mvnHr8phlpRmJV3MafIVdQOWBQKttTMoM85B7+pmmK2cw2ko26Z1i
 4m/YcUuQEazVZe1S7YuyeQ7TbWpJycuUJPQzQK6LWdDkWRJ/0JVKTBkf95sfRvoLGTioexIGuzC
 S1XgQxp7DZ/uuQVTU++4ladOb3eGWh3RaEfhrRDKfs/a7M4TBYBX/ZlWQt3aqqqqwrpyGN0tIJ5
 nbPywkNLeKdHwO7NYOfmbnCcMJ86LA==
X-Proofpoint-GUID: tL-Cwc_0dG9Fi1mxwthLI37U7OimnE7V
X-Proofpoint-ORIG-GUID: tL-Cwc_0dG9Fi1mxwthLI37U7OimnE7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260120

On Wed, Nov 26, 2025 at 01:22:19PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The gpio_chip settings in this driver say the controller can't sleep
> but it actually uses a mutex for synchronization. This triggers the
> following BUG():
> 
> [    9.233659] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281

Nit: usually you can strip timestamps from the kernel dump.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> [    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 554, name: (udev-worker)

-- 
With best wishes
Dmitry


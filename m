Return-Path: <linux-arm-msm+bounces-73028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6BB524E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 02:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B9827A904B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 00:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8BA748F;
	Thu, 11 Sep 2025 00:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxAooDmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB614414
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757548905; cv=none; b=PP0tbgkgGeiMIbbrbOmLYad/rZiFA9/FAAyN5L0xSn01OFkO83DIHcc5LMn6l8elac83qqysNCcg/71JhnWYbJBZn12ZJD9xeh0uXJ7g2jwbfUVkgM3jYV+9PT5O0SEGAwbC4tSXJo0XoWnsn1gcfNAC7VqghLFIcpAXzW6B7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757548905; c=relaxed/simple;
	bh=SB9N+sI+8G4mvBryp4BJKi1IVFXxHA3hyZok3VfZH5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHFD5qLXzJ3SUw2QF1Cm83VlSe7qFj9i7NGcnWj7F/FPu3i1GRe+ZpmfXJtHyXMSFBVkphphLBgC9P8Jm8C3glu+5trPMNY5TC0iY4AeCtzSvVgh2mjenEvMx3x04kevUIl3QZrY4f1nIATqyCvq5fJAOfrtUBzYRNlfzQ7lweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxAooDmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ANhDCW022148
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 00:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ssHk0MR3leUPXS1eErL4m3b
	O9D30qutJLy5o4w/GPI=; b=lxAooDmcJkqWlFAR3sT3tUYa5zRZReqxaKjyx+q+
	fXc4aIS9YXzA9rjRBeVguyP5oD/fRETDwAaiZJ2owTDfwUmJMKNvzDs2kjR4gU50
	vje6i9sBgsk/V6DPYOO2EUbRJ0lc3kJMGiuf9HQ1TcvuZEfVa031NmDtAaJFoSO1
	42kBKst4YJ2SaBd/ZWylyeA4CpcaG8e+1zVBTHtKc/f84usjLmsyXCQ2glitC0qp
	cLvDX9Q74IOLujgVCldtcYddIrXKFZoHyWAx9/6kuWxVDpKJ1k9fHgZkH3wgfXDl
	CyhkMoHw8j1uSZk5ZYHOfUuggdTMIe1QtYLxJm2A0pbISg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by95n8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 00:01:42 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-544b12e328fso17160e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 17:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757548901; x=1758153701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ssHk0MR3leUPXS1eErL4m3bO9D30qutJLy5o4w/GPI=;
        b=N+oMypBbAM6f0CAUkn351s4/oOZ0WA7Qagxhds5l5MJtwoDPPxgJO5qD8WXFpiXRUT
         4R8fvBnp4va8DY3tn1YGVnF6lEtAm0pjxH0A0BgM7vSChFp5EzEsf/kIQl/BUxFX+REC
         fVf7cG6xPOhv6hGZMlHMc5pHvUWSp779sjnIj8CDkCiaFnC181ur0UE+vfpalS2uzDkr
         kVxorl18eznovFWUNQYJfZoiorySfz4IHYRVPaeTBIifpRBlx/V4OTAK8TPAJfSzffTS
         Nf+9YeBl7M2zucD4ckiXliXUfDRvpfKkGnj1ZmUe3auFTaEA9js4yt3TWbSK4eHrOPL/
         Z9mA==
X-Forwarded-Encrypted: i=1; AJvYcCXMD9QxZjWpwWkpoX6OpyGBHxEsia9hGbSFRwVHbqTmuQmLHWd953+0ha9K2jncVy6uDo6VLqJV5mcYJGr9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmr1F/FMP253SyNdAd3O0n4TGq8ocAUL60ct1eq3G+QMBtuQls
	xTr7VPT0nK+5AlZKFVPuYu2gZPUBloW0ti3ZTWir93HiircSVo949PEGpuGv2I+TZQmZQkiar9r
	j2gSKcy7M2q+4SyKKZVymnbGCUeuJmrxITRlEvAO64+b5GCtFa61/SfGQPCM2iAFaBjCY5icBuq
	u7
X-Gm-Gg: ASbGncuAPPq3idvgVfQk61EyZOD9oHDg07x5G9jr4tni6xSBZXupZzUU2YGU909QsOU
	QRVUmsvXJeZ+PShehwZwXVTpWqpXQG+xIWMUhj1D0SCJq9h0mUvuMiG+vCpXWbgT/UJDJ7hcp2I
	ifb45OCF4umSAYYEbMAFhKIWGnE3QjiTnZFzIQHFn9xD34amiL5CQw8R1YIjIkafswxjPrffS4E
	jkLqJGPgszwODdUE6Q7UaI5d9+9M8i/cKRiK4QhDcAmYkQvqyNrLPQ9MNRX+/2aHjvralNQf9Qz
	aw3Q7zpZ+5I2qsCLND7tcAehSEMHTJ4jLI8tL0QAYNO1x6KLIoD61SDAHTWnd+fWeaJnVlrVGsY
	twcFjhJDrj8zhqu1pKhPOf88OYGpatQbct5eGIvR6hZzSbOx2F+sv
X-Received: by 2002:a05:6122:3d05:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-5473d47bf22mr5786022e0c.16.1757548901575;
        Wed, 10 Sep 2025 17:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaJQlOSyFqlengO9hG1qMSeWHYmCMLahQJhuHv+8HeoNe1vwHzEtQ3ebepX/z3Qg2HtnLVGA==
X-Received: by 2002:a05:6122:3d05:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-5473d47bf22mr5785971e0c.16.1757548901152;
        Wed, 10 Sep 2025 17:01:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8211a4sm202201fa.39.2025.09.10.17.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 17:01:38 -0700 (PDT)
Date: Thu, 11 Sep 2025 03:01:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Message-ID: <2tnzsjw3xy5jct4bcmahcwhjbzlmyxgcx6fzlz5qrzxume2uoy@phpcz6mnydlt>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c21166 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=7AODkVuKAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZljO1qPqrEt1h5dnOlAA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=sRHRY8H3vKB1GfNvUtpx:22
X-Proofpoint-GUID: 7voD9PxL_sXr87YebVyPRI9HSxIKJ48w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXztVUhkHt6Dhg
 j01EKQwapRVO4AJE7Qnxxrfl76k75BHLCTEeWrg5Gvk9O5oC5Ol3ca3WqhDO9XEUQSE+qk3Eb88
 g8IQEaPg4Bs8daz6IivwEJzNzJtm3QYEk3tegsCZ5iW/vpU3LxgNybtTfUQf48QeovPZwHnF8Bl
 +Kqs5uOTIiGvatqJRqfLJkrK1wglsCI38+i8MqjVl8m2lqxY14ej0VsHZZfnG1xyUKILxuGVMVO
 /Enb67BZdx3yV3NZ2ySepPK/ZFMlxWbGIglz9ZxblYnYBgIUmAI8LAYCU7LCqj9gMwespwOMpyU
 suZwalKiWYAhF0yX9PS8s7IajIpLRlssBiRUKkQoNlAeh6eoi5bzl/AIPdcnIJwdl6+LkeOYRWD
 xUsvpiJV
X-Proofpoint-ORIG-GUID: 7voD9PxL_sXr87YebVyPRI9HSxIKJ48w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Wed, Sep 10, 2025 at 06:05:36PM -0500, Bjorn Andersson wrote:
> Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
> a single board compute with 5G connectivity and AI accelerator.
> 
> The boards currently ships with the Android Boot Loader, but replacing
> this with abl2esp allows writing a EFI System Parition and OS partitions
> to all of LUN0, and a more UEFI boot experience. A prebuilt version of
> abl2esp is provided at [1], as abl2esp-v6.elf.
> 
> With a (very) recent version of QDL, a flash programmer from a Tachyon
> software release, and a full distro image, this can be achieved with:
> 
>   qdl prog_firehose_ddr.elf write abl_a abl2esp-v6.elf write abl_b abl2esp-v6.elf write 0 image.raw
> 
> The following firmware files are currently used, on top of what's in
> linux-firmware already:
>   qcom/qcm6490/particle/tachyon/a660_zap.mbn
>   qcom/qcm6490/particle/tachyon/adsp.mbn
>   qcom/qcm6490/particle/tachyon/cdsp.mbn
>   qcom/qcm6490/particle/tachyon/ipa_fws.mbn
>   qcom/qcm6490/particle/tachyon/modem.mbn

Is it locked? Would it be possible to Particle-signed firmware into
linux-firmware?

> 
> In addition to bug fixes that has landed in v6.17-rc this depends on
> [2], which is available in linux-next.
> 
> [1] https://github.com/qualcomm/abl2esp/releases/tag/v1.0
> [2] https://lore.kernel.org/all/20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com/
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Bjorn Andersson (3):
>       dt-bindings: vendor-prefixes: Add Particle Industries
>       dt-bindings: arm: qcom: Add Particle Tachyon
>       arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/qcm6490-particle-tachyon.dts     | 877 +++++++++++++++++++++
>  4 files changed, 881 insertions(+)
> ---
> base-commit: 5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
> change-id: 20250910-tachyon-e3548941397d
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry


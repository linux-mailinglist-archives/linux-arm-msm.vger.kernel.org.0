Return-Path: <linux-arm-msm+bounces-73742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63DB59B5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75AE67A22C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA72362096;
	Tue, 16 Sep 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhF5aPWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F73629A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034995; cv=none; b=hiaLy7a/A8C/LGFy1V/7BZZD+TCIkaa/LK2K7uUT4H2rQ9t8Xnm35xyJfvsdHVdxFeQ2jKcLcslkjbgMa/3zOGlVMbcawU1zlWfOD84CMWQUFtmN82zre3p101YoBU7woZfJRAzZqvJi8Zzdoh+W8wGsaU/pqwypG7ovr9AdReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034995; c=relaxed/simple;
	bh=l6DkM0pOwEX3zjhBJfh9PR+c0J3tLQzthpKfI64urDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oG+SqvBgcLQyRwwQdFNK7uuiIfvjk80TLv45u0LCgdagrp/MFarVJpdT0Qrn3KqZXG3aW17gd57uCH11aDf/Ej1QIZxOc/d9k+prvPVNBNKFC0of7zjQtHjOvPwHTzJ51J1sPky1Hxf99NxKWIrFSO+MDSFqSdkjllS9BCpj8h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhF5aPWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAAwNT001630
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=voj9VSoE133vX0xE3fpc2jnc
	LrpvdrOCJNA2G6rHUfc=; b=bhF5aPWJnN5LhVHC0wwplVJohISfjWlrvByhYpu+
	oAsBGDdPh2DWY6xRBJAv1LT79+4DgyQ5XLIZFtM0IwH35C3I7iy1cC0xCHeebqLr
	hZfOwneiX9tjmsRsmywnJ6qxlE2mwaezVdnttmEJ+zJ1OZjDMU5GtHGeDSeCnttu
	xIXkXIoYADM72pDmRoLdi8z6GI2fgfg0k9xtW5hYGVCcMHGMQ16q3Xmy/6T88efd
	Q0Uh4AJG82dbmcyOmRU+oKnhk6GtqLCvjGYNKyLEmUz+PHa6guZLN/laOAJq2IWw
	YPipHZ8CBOWMMuNb8p/hV9YuQweChk3oCYDT3vmJGBunZw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqq08q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:03:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-621825089b4so5014161eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034989; x=1758639789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voj9VSoE133vX0xE3fpc2jncLrpvdrOCJNA2G6rHUfc=;
        b=HS5KsBChp5SEQF6c1Kf+JCcT2D6ybsyH0AXK4hFhSO3YHyrn8MdvhpiCre6h/eE723
         kHtqtKtveaQDPULqJv/rtahRURxkJrccqKhEicfxk8+k5+uP4j0zvGmxBi3pTpRyFX/P
         hQuU5rb0mA/DyVYH/kCHnFPjKVAtWRzGBkf4TLq4j3iLflvPBcfGrKE5BBD0oI+Zt6xg
         OapuVMDqS1mVDry+yRZJhsJWV4AawaiYNTpkdUTTZRz8K+pxhFAUhjUsC7igXXZZiR9C
         UTsiP9soRL6iKCbrWHDpeDeUByeLyW2gc5rW7YpFWW5unYK1OwsMZQKeYcB9X3NqgCHs
         5S3w==
X-Forwarded-Encrypted: i=1; AJvYcCWGHChaxwvqCdWjCYXIn/WoSV4T/9lUzzgLHSC/UF81ifagwM9yc/RvV2sEpKzFL+8kcEGgrJproBYI3Ra8@vger.kernel.org
X-Gm-Message-State: AOJu0YwxRQY6PUdNN2f/tKdh0ub8lWo8IIBV/dR4yTCnb3kbsoOW7199
	lY98lX8m/N15/1Jp9kC8eWHBVLOtk9OFiLHSls0f4z9r98P8/ArrmA6UPws6VzxVU+e+En40U6z
	V2rW/0f1aNwPD/Q0WkNLbggNHplVJlEU+775vNdj9XgGLpSfztLjrMGK/5QaJ03aCRtvP
X-Gm-Gg: ASbGncsT+qXXDWeExJS47b5kzqqdnzmzTsqnDpi3nfpCi2rfyg4YAQr3Ut/uXd6NBjp
	By7GriGXaYSUfdhrzVQJMJ3QqsMZtXpWNkgZRHGH4Db5H67ncYX/E4RHV78X8big4BIDgjCAa+k
	Yk0eEeTlKKItuGcUnt+xqMJhFiBP/Uip+2hn2jk/KlS9frnZ51e3vjMQKK8LXDhBUo4l/84r3Jo
	007pIm0zMLr7tUx1ANVKi9jEVRLYMhBvjAtuhjRZ/nTGoWXOYduhavM8cv4wtm59cclNiVCP/nk
	B5Cpvn9v841/38R1Njmsxv+1wYdfbQ8OFu8NOUCJT7q+URFvYiMjnsjPPw7OOQJskAhD72lqpL1
	6KGwdgydDo1vo1YJCObo+Ca4Cm5IqBR/8EAmQxUXnuHcZmGdyFN+k
X-Received: by 2002:a05:6870:3913:b0:30b:abec:23ff with SMTP id 586e51a60fabf-32e5886b3bdmr7740093fac.33.1758034989069;
        Tue, 16 Sep 2025 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcisuFcv2atf9H79MHkvJiSg+gdxORbtbE3n2z00jFOxZfPYG5xjPkQb5n2gWIoRN61G0dtA==
X-Received: by 2002:a05:6870:3913:b0:30b:abec:23ff with SMTP id 586e51a60fabf-32e5886b3bdmr7740037fac.33.1758034988279;
        Tue, 16 Sep 2025 08:03:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a6a33ba8sm3410574e87.46.2025.09.16.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:06 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:03:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove unnecessary cells from
 DSI nodes
Message-ID: <kday4tlzjmycgfexiaxgwnan3a3nfxt7sgslncsktcyw5bmr7d@nmjtdm3gd2sk>
References: <20250916141931.601957-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916141931.601957-1-eugen.hristev@linaro.org>
X-Proofpoint-GUID: y4YL6WBqvUHP4gSasi0oCpxjc5JB_Rug
X-Proofpoint-ORIG-GUID: y4YL6WBqvUHP4gSasi0oCpxjc5JB_Rug
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c97c2f cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=67COZcyXgys7xXrTGRYA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX4XBIf31fASdg
 kceky7jvVYuWngRX9wn13Z48goRVgd5OPzvVgzSgc8hhzNmCgipbYVzpn4r+C5LFseStpfwL7zt
 XEDdpVh9FrDfp2UK6EBD9e7T8d7VJqeof5yxQiyAwX3Up4aAnq50/C84T+cn0UjCx2maRYvjcvV
 VF7J5A4Mvjy51vsuwaaBahQORhjIsUPZX2rgVh/tZnHwax0+t8eLv0bv2GCIFWWqahVEdesoy/a
 gK1UJpHlw7qo6jHltMOvRMKeb+e+oI3/cnFyt+7M85e9KDIpVXDgQftFJfyZfEN7BNLCGX2cv/x
 plCPgqTuUeKK4h4IWebyrEL44C9wPVxpE+Z1n2CiUjz50ncPeS/uzmb+dQbDLDjyq+VUxjTy3Wf
 +oR8k8Rz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Tue, Sep 16, 2025 at 05:19:31PM +0300, Eugen Hristev wrote:
> Fix warnings
> Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> Fixes: 73db32b01c9f ("arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes")
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
> I haven't found a pending patch for this, so here it goes, sorry if someone
> already sent.

Thanks, but no. The nodes are correct. I don't think we should be having
the -cells boilerplate each time somebody adds a panel under the DSI
node.

> 
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 

-- 
With best wishes
Dmitry


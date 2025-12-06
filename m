Return-Path: <linux-arm-msm+bounces-84546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B04CA9FB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 04:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4F78305D843
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC5022127A;
	Sat,  6 Dec 2025 03:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3iTVbx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGibg+wW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0591DFE26
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 03:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764992141; cv=none; b=W5JdY5Wi2KfdR4X1m1zGHqYS3+zF63o+uSBrGH6jOIZt6iwgbHLX/alAVB/0YO7QDs7o7WQ/0SgBGmZWX1+7slK+mDiEmKXUm9h94HAkV0PeFXv6xUB0b+1jsZikFS0nXYf5ewDjwyFdyAoJ2QIuFgkXzb0GT/1bvK9cDdn4wuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764992141; c=relaxed/simple;
	bh=/W7+9pVo4RSNIFtOIikLqxLJgtA6F948bY6gz3DENhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND4McgjELP919gUsz5T1xY9ipMq2Hkxt68UVC3N1dTIItuCf9H3sMHKEedLNC6PhEX5TLNAzxtByVuynxDe99zAyaU/5c1GQPqxTp0mcfm1GCZ0Puu4CaueEIskY9+3YrFQKFU2vvFRK13E6xa0wnj6j+GLZPPhyrtD9UXs8XME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3iTVbx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGibg+wW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B63QbTF2575049
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 03:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IXPcbCBaPEtCMiINSRS9p4GH
	WlWr4Um92ZlmDVQDvTo=; b=L3iTVbx7dVdcXG+O9jJyH0p75W9XT87kBHMEUB9Q
	htsTLKbh29AcH47+pzItGPY/fSInYKMGroQhXtKWW/+Cojd3CplebDqmofmZOTcT
	rJBrwhjeNeQmifbOLcaiNiYK+/xvcRkhCqx/XRaUeoNK0xLhzFu0Pna5pSdmoK+I
	ubmMtKiGbCebb6ctER83GUjfxLzCKs98VX3Slqjbl8KriIyBIge92dzE6/UMRwN7
	fMZb7q/Cz5DnnQMCIg16AvC2ssam1MMZyzJIrgZ/aPC8ATPp30lQC5byXZlUYqdb
	pZvRrV+FCTX5dj49O/6/r+/4S1nDyyxQ/PpUgJaPkp58Qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjv80ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:35:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b5c811d951so44570085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 19:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764992138; x=1765596938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXPcbCBaPEtCMiINSRS9p4GHWlWr4Um92ZlmDVQDvTo=;
        b=UGibg+wWoTOzSP1GyswfpsJsn3xnzNJDubdkGDaZw4R9uC86Ywb2LNFfHiUh3L0qOB
         xEoJAdujGKzslfRiB7KUBEWwxeICyEpBYR8W+qSccl+tyGmzxQAeHIRXbT9MJcvyGSmm
         kzgLbAM7WMzqgBvaXqKMOnQVndo+vTbXXj5mJRYAho23oQWORXkVFGnw1nlnxEeWuUGF
         3PUg4dEnZXHFngpV1JsK9qMVZvDr6ZNjW6CCDhW5T/l/3lZ3kI2VIgAtI2gG0tjv2/ih
         5KBte+K59lvVFDdDy3Zk/hBXa5yk/xliXFJb4cqFT69528nxeUd+zf14v0gMgZXrXSVX
         Ok0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764992138; x=1765596938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXPcbCBaPEtCMiINSRS9p4GHWlWr4Um92ZlmDVQDvTo=;
        b=WBXGT8QIPLM+4szYSsxBgbeTS3WYBQV2Y6Q++vNdMcILKruKb5KQSa/J3qGfW3gmjL
         jxjo9JR1Slx58PmDlDy2JvkVD1RAogzYvcLQWDjsTB/o0EcwTaw7e42cJuNYlmZVzNBS
         FsRI6vGwLOZmIv2qG3HvI4R4ea0XwEW9BQVLG4JJ/oelDJC+JKi2NhAM8JucdI9gKrVV
         AQjdzV44ImEU3u0jFSVCHrMm1jFzl9vJh/TGSFP+sr8TU6urOdoAdJE9VNv7I8lvFoM5
         e/UQBO6V2c/uoRpmi3qThGyWCYiv4pijRGR9EB6Dq72ideqOtF86/gonm2yx+vC/rNos
         /q6g==
X-Forwarded-Encrypted: i=1; AJvYcCVqPUPBKkq+NV1YxWp0dhBkkxAW7WVD7p/ufdDjfZvEPJzE8P4cPiJGxwSe6Mjd09MfNHFBnHtNpj9pPk0t@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4vv02AhI4kGZqH1gAm+1zUAC+SCuZeS9BGgvlTjre3kYwGa6
	V9KjfvTfQ2ZkY8MGv2fDNzXVZCrNcsKzQY2CxxlAIS6XmCmUkLYKr7pSVPQlyK8Bs2ggi7AlVJO
	6NwaeOekP0DUbQOZXryZk0cSzZK2jhdKeOueqdJvXrKMmS/SIciJWF3FMw5v5mAok5O6H
X-Gm-Gg: ASbGncuWPsM16I9a/SuWPBbS39fAZ//aklHvDN6a3GWlyjVfUnjbASnu/lXrT7dHL7y
	+R/20TlwdMKGnwEqFcxcA3yv9xVnvMb1CQq/gaWKm4T6esLFixEwEIJcKKOazcoxYw2rDk8pJ08
	rUk9TdZADObeaAiA7U72+w+sCbhEbuS/EJQEz91bIn0Xv9Ym2lHpML0ryd/p9rl6tPboRo3YtXi
	oE3ZxfLWOth7fSvg86TRsrttVn8fuGHiRxplZNYeWSvTece1qqwprUmiVyWpCrYqdGT75fZqVMM
	e4g7lKNsTetXw4GsL5njQEtxth4fS+2FQMWO5T0VkbWv3tTdrgJaV/gIqRfFknvJzEpTr7wPXvv
	DJZ6KO7qIL/k22QJaVx6nnpgkVHNdTqVgEanve7NjUyuiJv6ZwxADvGAngw7IIu2cII2WnLTEVk
	9gYaKAKOMZebxMrQbkoNtVdoE=
X-Received: by 2002:a05:620a:3190:b0:8b2:71dd:588e with SMTP id af79cd13be357-8b6a24f64e7mr210231685a.90.1764992138349;
        Fri, 05 Dec 2025 19:35:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUbE/SHRgDvUvm5YVOFdimtJ2ZhaIalFbIGKwVQ6n+VX8QscibWner/JGt2413Nypt1oy+pg==
X-Received: by 2002:a05:620a:3190:b0:8b2:71dd:588e with SMTP id af79cd13be357-8b6a24f64e7mr210228685a.90.1764992137950;
        Fri, 05 Dec 2025 19:35:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c28026sm2035628e87.71.2025.12.05.19.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 19:35:35 -0800 (PST)
Date: Sat, 6 Dec 2025 05:35:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: qcom: sdm845-oneplus-enchilada: Specify panel
 name within the compatible
Message-ID: <hsjeuii636bzihsbxfb5e37bizagcseme3czhesffpraa7sufx@qjzylz7jbktq>
References: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6933a48a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=alNsdzoY9l9OrmpsANkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyNyBTYWx0ZWRfX0ZAik+CuuBbG
 cltmKsHLe6ILgFztULwE+wb5P8nrbBO+Y7lBT4yqFoOkRHLyyuDvNDuNHMLcQapgoBfI76tCX+Q
 GF95I4FdTfH3nET2EGIZRdSF+bwDsMe/KNQWHzxTuyiB8JHl3LGV9cVn4yc4G/Bp61trUJ17ukO
 wMD7YzYp/Y2JN9fR9658zgrOBBPj+cN2XkGfO8anGSJc+27F0sYdkeDlUtJUbVSwpYYP7kZtybu
 Iy8mO+NAejYFSuyel2CMYzkqibuHxuYrFgeeCKWU6UC59jUeSIpE8h2KKjWwfarxm5Js7aSvkFp
 Ru4dRhKaTIkHd5faUbdcRxERP5bfoA1ZAVzulRhf/zL/COoX/pWVKvEVY2A9czWiqP2WZ/AQaDU
 nz5g8uebAUAi4vO1hGhrc19B+KRw2g==
X-Proofpoint-ORIG-GUID: s6QwIovd1bIwUY4fhQJhCNWHabie-3lQ
X-Proofpoint-GUID: s6QwIovd1bIwUY4fhQJhCNWHabie-3lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060027

On Thu, Dec 04, 2025 at 11:41:24AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> New device-tree will work with old driver as expected, due to secondary
> compatible.
> 
> cosmetic: sort the node.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


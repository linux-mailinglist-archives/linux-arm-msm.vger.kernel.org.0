Return-Path: <linux-arm-msm+bounces-73692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 536BCB59490
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E204E188EB79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AD12D028A;
	Tue, 16 Sep 2025 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxxFqk+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6222C08AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020434; cv=none; b=d2oPJpICgoMoc9/R+z5eZ5Eiu7WDWodBtZMtHDhG32v/7zs4UZunod+irdN39rInzHn2E+BO1PupLFdn6sPyhaoQWG5FYQszuZKQ+1C0B7nV0UIe1K0OzGeeNM0lFY8636T8hVthdJucYitrURYKXTfAhoohkKoK05ui/Ju3G1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020434; c=relaxed/simple;
	bh=M6Zqo8Ymcxu6eRx/7fcnIg/xojiXutzI75zXFiJxqNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRJwTy654XvDkLJYKsXCcy4wj0bkMt9ZdZxV6nkklJVoTP/QanVbzheBNeoNrvA8kvb5wZw//klwG7WaytuBxUcG5kRBj6RPVfmyp4v9d8E0GlkpXXVMJEFHAk1SquZDCI23SGxSqTJh1yfZP8Kwum0b2hdTa69JlxdgrzCiUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxxFqk+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA56N6005286
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vH/Rjq1TuanzbCVidX6mw4sX
	aElF2T/40jPPuQxAJJ8=; b=cxxFqk+s3TclutWcPBPpzYKxUvMqL8f+BX1NlLvw
	ABaC7fj13xTysRPsNiqHutQuPgUXUfajjvhnPcgnpF3yFjWIDJC8tU0AofVVaW8q
	b+A2/WlC8ytZpKXSJSWwCR9IUSv56vUbt5zYFwbxV8qRkdMEIqNaNVnek+qeUd3R
	aOyLlZ0T9sbcnTkZsSV126/F7ICaKJFIN8DwiTUrfEiT+ksKZDUAgIKXUmLOzCSG
	tpiEucz+MK2winOlvCc7US0oDuiJqYqr+hC81zk5kAIZkcezCUHAzvC4kZqAtD9j
	aW/LUY5E9540RHna9YvXk3SxcXqqWJMQtGOJL3t1alw8/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n497r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:00:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5fbf0388eso70802301cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020431; x=1758625231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH/Rjq1TuanzbCVidX6mw4sXaElF2T/40jPPuQxAJJ8=;
        b=ckNWFUST9cBtKu1N320jtV/kz1kl3cjlzbBXBvYNaf8tfrLOzuAio4P5RSZsq6dHGP
         u7oLc1u8FNgx5vOQ3CUYAv83Mk+BITKLZR1xfgkSyw1LWEdX+lzAS/ksH82Iw2BDgt70
         b3AeknpcIB/aOyuaoU+FCzS3Y7joPE/xJV3o9BJcSXIomAVZ2qWjJJGN4wbIyA/rW8Dm
         E2IV5GErgpf7PUVegRnTvFK8CqfN8xUdOIAo4Fs1j1/8g9OHrMy/LpWQ8VRRfWyq12a9
         Y+a0FsYQV24SzmBtJmm8/nh41PNH+hYhsdbjvnty0CDjtSrCpghH+aDsbjZ5+y4HmCPe
         Ev9A==
X-Forwarded-Encrypted: i=1; AJvYcCWjyA5dViGykBKVrgUHnMp6fUc/+JeniyrQyYfFQ+RNNAabZHOwHRM90kcfWQUCA+quKuIWAhxBbH0qsD/J@vger.kernel.org
X-Gm-Message-State: AOJu0YzCWzmz7bzGacHUeSOW0byuJ9eCy/WHlAg+gPtHVQk7MF48u1kP
	MLluU9Q2xL30OPycUIAYXj8Zjrxi+zwReEwHSeBo7fscd7yiwumivFK02vGvdEuG34AdXTKHze3
	R1F5pZMirU0z/tdt2kbsNaoTUzPdBT+3R16gUahYseHEfnUJlDGkdT/7g1RoKijylj19B
X-Gm-Gg: ASbGncuuTolY6PSGGk6yLd69tIPZNPrfMhLEbTAkZkzCTTYSlihwV2Rd5dEtpX1A9Fp
	DZd/6RxOTfDGeX5rGZvd9Gk+IOrme5ieDbn2cdUxMwzwvZuK4PEzVM2n16nG9JLC4nM8CTHophn
	68DIXynn3XR25IemfV2x67eZ3HtxESP2Y1P69T+kQlZOm7Vytg5G9EcDGryxRoRtAzi+lxL6RL1
	Hr/h94LiZ593QstTr0oO8zZJ6fKrmMzoK52Jm5KGgX/DS8bdPqdL1LpAT6rPN3sfIxtMKTaqPAV
	PhTqAS/F6yZe/MQ8MmieqbEQGALTmVTudxvDb6JmswIt0bbgR4d3RS2cmTmRyQLWlbPUM/U924q
	GWGHyY/sYc61rQKLQG0g7AuGL/Wq1n9OqONEZD7fa1YyHW5bDKzi3
X-Received: by 2002:ac8:5d04:0:b0:4b5:e12b:9e1 with SMTP id d75a77b69052e-4b77d0aff86mr159715131cf.60.1758020426805;
        Tue, 16 Sep 2025 04:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEqyqBzvf06O0P8M/2FvHMvziCp9UQog00iNc315yVML3/M3tQIwWCuaULaNoan+pHArDzpA==
X-Received: by 2002:ac8:5d04:0:b0:4b5:e12b:9e1 with SMTP id d75a77b69052e-4b77d0aff86mr159712941cf.60.1758020424897;
        Tue, 16 Sep 2025 04:00:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63d9esm4235593e87.70.2025.09.16.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:00:24 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:00:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 06/10] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Message-ID: <kq7dqqjaw5rgdx7nubycj3wuwqor63e37vploqw3efo6qa4oir@faorattts2vs>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-6-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-6-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-GUID: TKfCyEJtmHE4GsZ2Fx9AsTSjCbwKYnNG
X-Proofpoint-ORIG-GUID: TKfCyEJtmHE4GsZ2Fx9AsTSjCbwKYnNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX73bPy6lzfNif
 xve0TOAnnHR3PsfJW8q2OACus+/yQ850V6rijsxsy7LP8FEa9wxUTZg66O2jfCpahbjx9ZWK7RJ
 umISMHGM/UVMtSfmLtJuS/zH3AOdUJT9mA1nljmlm5j1fAb/sTQMnd9+cortj6jpD8rTU+KjZBe
 7sLxTvgONGibP7EzqWYcsN2thfYciBnvBIDeI8/yxHKtxA6zvEOuBG0uFclusnxqaeBLFF/hiX2
 LWVOqMnqag9VxZkSojKNYZATxX2KQl8boH8NHB+lG6N0sQ9rP/OTiebGf14bv0bVlreyD7TyaAG
 7IVrJ5+qrmFFpgZfmXDuckB1r0xCu2CG2Sr8wjUXsfclJtQXstR0+J3d+xURBIeJwFgnIgWWMQi
 /l5ctMZp
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c94350 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=woMd_khH0HIeFH28_EQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On Tue, Sep 16, 2025 at 04:16:54PM +0530, Wasim Nazir wrote:
> Enable remoteproc subsystems for supported DSPs such as Audio DSP,
> Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> firmware.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


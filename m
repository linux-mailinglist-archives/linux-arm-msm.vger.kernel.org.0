Return-Path: <linux-arm-msm+bounces-74661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB48B9BB47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 21:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 410D01BC226F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D9026A1A4;
	Wed, 24 Sep 2025 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prEOj23t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DD20E005
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742214; cv=none; b=APZEcTIq3IP2Z2HrHQQp26HjY17meop0eGOIDzp83t/X/tPskwDqIsz4iZDQsTGqvzEd1CM9me30cspEfXjMuD2eIrrCawXLHRfjaYq2t6Baj7jr44dugL6DOc1GawGlfq/a0qv1YzinqI+KwyyW1p3cqzvfWNzewpqbjW5TPso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742214; c=relaxed/simple;
	bh=Cq6LipIkUE9syfPqdg6mldI628jIm+60Pxd69wK/kDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju3NJF/+q37IwelRYKIegClevxaOJOgmcejA/Yh2Sk7676uDD1h0fLBTWimdI/XogI1lLmM9p9NZUwJKfBRD5q1IZS7nhJLOEE8zpwACwy/leFSmXwodM1cCUoDajTKCmRt+Rj7EcitVkNaBoI0YhnVl5hkGmLN6+jOf2jtpfZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prEOj23t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwoOT025572
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rBfMnnfWt3L4feJTU+lsPLM+
	2GHenz7Bt8xSF1WehQA=; b=prEOj23tKHDiF1migpbqeu6tOAWw54UOl4XdDMbY
	5AlfEUkGmZXlfoofa4Bv9+zedcL1LMtnhmB4MXA5GgwWXiOvJnFBfWhwDYlQHwNH
	aX/0ql+ebc5sjlUwUwvBpbfH+F+x4rM493SGyAVeCPV0PLQukxxi0lxPW7wxS6hN
	QCyqQMjqFHC+t7aMnORh6Pi6Qaf7mbfRRTcYzTvU0cvdDcGReHkPytbtwJFdv9re
	uyI+4BocQPYeoJVdtCt2tTHcPhBoAtb37WzoVme5yoPupDMvdauqtaaaWFFktFYK
	2xyK9MVqmb9Gtfo9sJWlXeM1OTnlddhBXJLp9PiGZ6NLRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyewvc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:30:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso4402471cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742210; x=1759347010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBfMnnfWt3L4feJTU+lsPLM+2GHenz7Bt8xSF1WehQA=;
        b=m7s/g1QBpRje55kKUen0H4HblZDGGbKZxmet2oZnnshATnic3UKuXOYfVTUnMmKGom
         FF1xbtO0ARM5wdVfJVC/oZHBVGuE6oQwMZPStUGaKzv7Ohg1thksa10BkgnUSgEGSgU5
         HUfrF78+zm/o1JXsvx94wNWKhxEYru4yFRlH0DgWG5vWj72Mymoa/3l3eWIjHMD/gO/9
         gv9vK5jY4dmJ9HDR1dSfJYnbZCF7phthfagojuT5VGFI6iZjpSb09Ostx4RQHw0kiHe+
         AlZ0GjGopQ27+rjDh42pRKIJCo9JpuUY7zqov3/7Has2SMzzEtrgMjIr/lmM1vS2T3IU
         0spg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Z7IfdwFONCMLPdjw4n8YePgV3OlsKenHiPl0EyDzOvMo9cCJOP2MwXJmq2tKbcYiSiW1IFU1iEWGUPbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7YLuLS906/Sy5VGvXayWH2/NGY/YSKvICJej8XHWCMNXQjurT
	x6KuzniMg9vTiWthjb5qWfVwwLQfJMCx8Z/whBp0keWv2RWVIzcQ2ZlCWEb2Xkr/Ej3JIOZwoT0
	9LemtLftA3C8wuAaLgl/+Fj7uleaqH5UPhg24M43ZroOVQNb0K9+QssLoHQikQw13unpW
X-Gm-Gg: ASbGncs7+9wfqtNCvPY0HDOKeVRbxr7DmCNbG/VvPdXU7a7zaXa+D+wSJdK84Rv8zbR
	SpDLUj+IxL2hooDBstRRvrkvNW0LpOvLou60vGG5XQAsNnpoO81BpDJFLdDFiDdKn8YOHtOkGBO
	ilKMQ+Y87BJPs+dfuYjyssRECvrm3fr4oKbXwb5ew90XKWUtx0Fpl5wrpofUS8pu55VxCQrjgb6
	3CnJL8sxl56QcXUeLHxOLFyFHNqduEKnSrUT/QQ4j+kKuIaVBYxxmLO0HWWJK+zoaGOaj78gnPb
	Jun/vI8ubsjaBe3Rx39rAOb7u3mK0M4iL6otYEuH5CLeKdZdpMrg+kPCaxEoYc5HXTtpn2FJrcd
	JkAT5SPC478Fh1EzLZm84p9pbrP3ARyUjMl5ScwK2pSt079QtuB07
X-Received: by 2002:a05:622a:84:b0:4d4:bb65:eda3 with SMTP id d75a77b69052e-4da47354dafmr14275951cf.5.1758742210365;
        Wed, 24 Sep 2025 12:30:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWcHMG4HOiwIAPrOL7ZzQISPy6nwaAhZ4vWAdXmd32A3hnTKJfG+uBNcsuFtkWL1uneRm3xQ==
X-Received: by 2002:a05:622a:84:b0:4d4:bb65:eda3 with SMTP id d75a77b69052e-4da47354dafmr14275521cf.5.1758742209787;
        Wed, 24 Sep 2025 12:30:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36815abf943sm30163341fa.61.2025.09.24.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:30:07 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:30:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Message-ID: <gtao4eak2hp2upsjpfudkkjlrcoeelddvh7x55y6nshiwla4of@wv5yu6a7g7cw>
References: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
 <20250924-radxa-dragon-q6a-v4-2-10d584f2c806@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-radxa-dragon-q6a-v4-2-10d584f2c806@radxa.com>
X-Proofpoint-GUID: Md9yZmvv12tQlgPyb1J0wd_RUVaNFm4r
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d446c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=JC7H1UVUsGpFjcbbhlEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX1nn3nuyqAO2N
 cAenGVX/ibL0bic707lKPtOpj4rChnA+y394ftwb8ygbb5FFbbayvZT84OUlLrGMTD3FAw8uwSE
 JbyV0InQwF24SY9BFI229208AKI4rE8HyzlrNVRAx432vf2dZaGtNNAGQ2IMLvpW574g1VWoxrO
 3WKx/QqiZYGEk/A4k805dz6/ydRgvAGo2mVrBnGhoEeNqudgk6rMKKzEG9zEQPkf3yBtrtwH2lG
 zGNpp9hujYxcDO9wdDrpDpPT9oJxfBNEStpPScW2C69IYjGvoxFkvYF8VKeQinsI+TidtVo5Bpb
 20If8tx11LyXKBgobEK9g1G9QeZvMqmVbeVbpj71XWR4t4B1Y6AS/rfUT3JfLoad3r4FJHf2pxm
 EU/QoYXV
X-Proofpoint-ORIG-GUID: Md9yZmvv12tQlgPyb1J0wd_RUVaNFm4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Wed, Sep 24, 2025 at 11:07:10PM +0800, Xilin Wu wrote:
> Radxa Dragon Q6A is a single board computer, based on the Qualcomm
> QCS6490 platform.
> 
> Features enabled and working:
> 
> - Configurable I2C/SPI/UART from 40-Pin GPIO
> - Three USB-A 2.0 ports
> - RTL8111K Ethernet connected to PCIe0
> - eMMC module
> - SD card
> - M.2 M-Key 2230 PCIe 3.0 x2
> - Headphone jack
> - Onboard thermal sensors
> - QSPI controller for updating boot firmware
> - ADSP remoteproc (Type-C and charging features disabled in firmware)
> - CDSP remoteproc (for AI applications using QNN)
> - Venus video encode and decode accelerator
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1107 ++++++++++++++++++++
>  2 files changed, 1108 insertions(+)
> 
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs6490/radxa/dragon-q6a/adsp.mbn";

I really hope to see this firmware in linux-firmware (and DSP binaries
in the hexagon-dsp-binaries repo).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


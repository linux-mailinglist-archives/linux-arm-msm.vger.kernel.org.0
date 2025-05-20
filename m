Return-Path: <linux-arm-msm+bounces-58785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05522ABE412
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA0A7A692A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2679F283143;
	Tue, 20 May 2025 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkiTnEhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADE25CC45
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770671; cv=none; b=uKi8AAndqjJB4qyPr/jIcFvm5JC4guP32hKCm0t9cm/zpj68ZpYDvndJflbTsbMY1z/qVNn80/7SIO/TACIyOsb1qqNEPfE0AIIAmn3XJ32vUUYpUVgjD9rwJreKAz1Dykd8dODV8ROHY4+I99nI34FjMsH/cXlAkFfVJZjMcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770671; c=relaxed/simple;
	bh=OQuO2MX2mV1qr8a9I8/izutKfXng/fSywHuJ73ey4iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bD+QpAfvNylNgQSbGcu4FwCCpN8FO2rDoQWoC/w5JC03ddYEv/c00bSIvwSiV5JIafDspfWO+UMSmIMK0XBuyamKltv2zkjyDQ+MyAMLn0MmyMCCJiE2/UxwPFBqlVI9RjjUxNddRZSZmkq2wYiF9MmNOsJAXFBKJjEnKsFABAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkiTnEhC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGgF9O013444
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pc28nC9P0XjjUTuMWViHDCd7
	YDNUjNlX8fYiEK3QnUs=; b=PkiTnEhC3vWKHZ/T+7gfZwGXnYi23ge2NdrGCBls
	fScnV3ydcL4y230s1Y8yYJTEMJwfCK8cBzGBLMAcEls1kUsIlRhq7pi+nZzR+Lh1
	KGMhuNE9mfxeWEiHnUtkcD57feeb2djjv0e5osHeFwmKvT3H0ADfsTcBi5Wb4TAA
	rwdtnjr/butNRok0fpg6d0XqijeJLQLH5tDrhw5m3b53S51PRqm8u4f4akgyUT3J
	L2JudnKy1Kb91vrZkB1I/kqjk7f5IeUHT194h1KPAtSpXi5ZZ/dft+KGuQMl+dF7
	2Wltg6uMsKpbl0Qgb74x84pebmMAjbSLLE6sgpynVo45zg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6gfxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:51:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b2f0ab27so70875346d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770666; x=1748375466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc28nC9P0XjjUTuMWViHDCd7YDNUjNlX8fYiEK3QnUs=;
        b=nHMd5Vf4kQFgOD6Lo8f993Hd0rB7sigBHJKdKYIlQ+GE9NAq+MkiJPAk8l/UYMKRGo
         QWTXSyjyAfptZ3iCKObguQMSiPXqEpEdwxucek7gILSvYAysDgL/XEEvh14c7sf6QMhW
         B6URCUTcxVI9ZHGgFLpkm9h+qQpfaqd7zIJiZO8njUEWq75uZ0AcvZBkRuc731yb44rN
         j9OyQe7Qbp4zFWc8tjxSZhSH+NiK2ivabIgN6D7NjkaMW1yCNAc0ri+UEQ3ZSkmr/mUL
         0Hop12Gz9VHxCVI6/HtzSU4QH3ARTqCWylAbjm7FvVueGdTbvAJsK5eFocCzNx0fDIRC
         hlKw==
X-Forwarded-Encrypted: i=1; AJvYcCUinO4h8Yuf5pqo9hNO8jjMg+UrH5bam9KQW8XClDrjD53lHC8FUJBuLrK6VvcKIm6ZnraPVAXFxrJQBFAv@vger.kernel.org
X-Gm-Message-State: AOJu0YzQj6OPPkTletIZdoi9+22eo47oau7zsPRPLoQyfvIMcdGcLXPL
	1JMmRIum2Sbj71dQyKY36e33mcAIduSh7MzvGqAizHWybmEcfCt6WUMFKpchNRQEmQPR12Lz1+P
	iOCYwJhh0FiSigBGyXnbmx5+8564+t6bygCDkJQUxbC77uf+pHvs9IitacR8Y3OcwVaXs
X-Gm-Gg: ASbGncuN8SehyVD9RpC3D1jY/aDMz6ZzJ59XRvvvskCQ+IrDoe1eAG1A6tXD9+lHMq0
	P/xzq804zHaZau8eleh3O71JO3cjMYXW/LOPFSwgT7FRNUdcr5h0zJldDI6ZM+0X1S0iU3YjGi2
	0h7OWSTdL529W+SZCqw3kXOHZtGBoUZ8wylAb9VSRweVR5Mv+wwmPhvrWxaoB0NtMFbFMOiiNhP
	jZxaQnlCjY8hP8B/yVL47P/BENlsFpg+YgU2h8hU1gjHfezPbvNUxQrZTU4GFMlMfrnqka3xy9W
	/yrNiam8XmBV4FHLKHQEq3EzUwXr7xnsgol1H0yN7nAjDIDGgQUbMTmpPgG98eORY9+IsR/+7D0
	=
X-Received: by 2002:ad4:4ea6:0:b0:6e8:9866:7398 with SMTP id 6a1803df08f44-6f8b0827d98mr304389646d6.22.1747770665786;
        Tue, 20 May 2025 12:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAlrRavO8GE8YIpqqEJZw92ZUYhqQUxS+53ugRsRkVied/hyGm7s6YLVBT/5Wgbq9F8FR9Ag==
X-Received: by 2002:ad4:4ea6:0:b0:6e8:9866:7398 with SMTP id 6a1803df08f44-6f8b0827d98mr304389056d6.22.1747770665301;
        Tue, 20 May 2025 12:51:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3289f29953bsm19216051fa.86.2025.05.20.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:51:04 -0700 (PDT)
Date: Tue, 20 May 2025 22:51:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: vincent.knecht@mailoo.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] media: qcom: camss: Add support for MSM8939
Message-ID: <wc45nu55l7venjmz7mllvxofd2j2ymmj35efefrejaupnyf5xy@27k6glye4n52>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
X-Authority-Analysis: v=2.4 cv=VL/dn8PX c=1 sm=1 tr=0 ts=682cdd2a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=I8k2uAQB9J5w4mxu1W4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-GUID: 5HbeHgSGhqFTm0LqwHMAByqN6FFnr9TS
X-Proofpoint-ORIG-GUID: 5HbeHgSGhqFTm0LqwHMAByqN6FFnr9TS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX8rlHryoB0UK3
 9rw+BZZidKgI+yIxe8QGNkvWE6lD8BsJU5cAgi9sYQCt5r+Q84KBqoqGL62h6+sJc2hNhuF3G0N
 9lRXXFfZSxgRWe0ct9VpX/eY4eAnRDt4ZRWMkIHIJmRf7+FEQfGobLvqoCthc0JEMMzMBIjQp79
 BIZJOWTa/nbS7sGrXqwuJi1hFM0+EaT3Ve0pW3Lwt2P0oxHA3dNzdvfjdDnvM7i2u6DuOVE1Vrg
 63ncpszMX1tpehlBUlJevCDLrl4wpQyfPtGuAGHJ6yJZCWQsKEAUwc4e0+UnQ86QabkSq/eC2r3
 a/sIgK9RvofKSGRgoMJr3jNivnqXlrTq3YfigMQBoIdOopRbM9jMdJighK/KdZTO65iWHIAjBXn
 GYrPlh/Z5ZKz/yvFFDUErZZS/OhHHZmZxrGEDleKU/5MgKD+Bm0f4FOEGxOyHvCuqcCI34kJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200160

On Tue, May 20, 2025 at 08:39:07PM +0200, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>  drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>  drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  11 ++
>  drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   7 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
>  drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  7 files changed, 184 insertions(+), 2 deletions(-)
> 
> @@ -742,6 +744,15 @@ static void vfe_set_qos(struct vfe_device *vfe)
>  	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
>  	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
>  	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
> +
> +	/* SoC-specific VBIF settings */
> +	if (vfe->res->has_vbif) {
> +		ret = vfe_vbif_apply_settings(vfe);
> +		if (ret < 0)
> +			dev_err_ratelimited(vfe->camss->dev,
> +					    "VFE: VBIF error %d\n",
> +					    ret);
> +	}
>  }

This chunk should probably go to the previous patch.

>  
>  static void vfe_set_ds(struct vfe_device *vfe)

-- 
With best wishes
Dmitry


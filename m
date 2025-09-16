Return-Path: <linux-arm-msm+bounces-73668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C35B59339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4EDA1627B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E58302CB8;
	Tue, 16 Sep 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIKH2PUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD91BD9CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017877; cv=none; b=usPiaeWrzNw2oDObo7fADVVvcfqPfTL6W/3w5LXl138aFCrc4Ex/XtL5EVei7nTBIM1SlyxAPbY7ppMN9YgZJht407jbrFatdU7k4aVGEeOjuChYlvNOfs0c9He70rRo7fdPo3OM6K9+01LZFY/JEUyZFu7BzwRvIVcPd0toOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017877; c=relaxed/simple;
	bh=/cvaAE2HoDQnjzYGy471yA14D/oJLdLlepOzXO6YJTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2WOk/PzMTVBoFrY3/D5gi9GSBr2h61uilRYfYUl+hfcNDhyxlPifSLi03/wujHg1I6Bhmam6mJ/JBLQh5GKQwdKq2DwQXCSITxkVeonOZ/9Oy64H3HAH/XYnXJv2M7w8OvqorKWj/Z9ak3mmCudBulRwjHLnYecq+1Zr7xvVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIKH2PUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GADP3M019573
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Er1pNum/WmhMsDVwFK5vpTl
	0bY+Xaqs3dc/o+OSOUw=; b=CIKH2PUeyqmm4yHUnP0Kod6NjJwBKmeJCzMVunQ9
	ukcYme1sv6tyUgnK0nE0u0OMV5O2J2JJSVJ70Bz9KNKmYT54hQlIfnN1g7coe+Ph
	bOzmveFKp6mqhPqPZttgo9XLwoKAfcYIrXdkbhKWvUWSjuajFCTNhva2CJZ6J0m5
	3jHsG0/vf88kLi9wbCBrOAGn440ViPnLuhrxA+KH03faI7jE35Fgry5emKhxfm+8
	VzwIgVD9HVXqMZM8rhtSGoBsMjEFgN3KHxaP+NLvxkjvaHjINiKeR7daN60R5MmX
	pnEGAZli1y4uEdV8OduZHz7QulKGFv7KZPxs+xwzTBT9cQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma8fwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:17:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b49715fdfbso175832161cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017872; x=1758622672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Er1pNum/WmhMsDVwFK5vpTl0bY+Xaqs3dc/o+OSOUw=;
        b=II6rDyffl3UNkUI3jSHrvtrUFRMQgBvOE5Gy7GW1WVDnk4IO5+odrqIbMuPabHWaOP
         F9fXY2f3TMWJiDyzBtmHcDUy3yUdzMMkIMuHynMqV/F4X4pNzVVx53r22YytZ13pWwLP
         lJMN3Gh0baFAwRe4TGcSF1qhLEoQ/BhJC7uLLknfBOyn3Ho5pTu0MFeuUk/aGmriwX6F
         ay36iSnindVnUInbOZjOiRo2iM+8ILv2zS87SvGxK1rCFS5KmVGSat0AD+OzxxIYsfVe
         +UTzZVJGrkdwOPicHaGIGDC9UTsaqCiM7FJLqF1knIk1M1LsjQYcM2XwHw1f9lOXYJFX
         azuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0f3Ewb+iF/5kZii92PZb37gbp3+FW+Z1+mLoaN2HkCJRo0+AVnqkltYsVvLPWRIiD4/n35YegA8mNXtE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96Ji5xUOq96jC01+RmsaWMVywSQ9arnDoPlrnA2O+ussDJnPi
	q3mwHZYG/yA32IXz/9bz5CMtS4WZ3fqHIN2IOI4FNHVRAV8d7qEIe4MXhq/EUnF1BBVl/OOjPyk
	2dbKxgox1dyVihQ7ctTVTL348eq1m5UomY/cctSkt0nZSG0rXVRscN/GbEtp7thgotkJq
X-Gm-Gg: ASbGncskoHYhFONLXccIL2XTZlc7mL7ogN8R2NkaN3Zj25CV8yzQAcRLZ3o1oPtbCde
	gpgRnga5qAQYdb6o4NB3089YH/FsUD9LL5Z7BqeAPc+hUh8Em4FzX/HIOctzQ4aQr17cXDDVG/V
	GASVLHc4CIc+4eJGUoXAdkpNjRo/d7aiQNjjm/ZuLSBe66OdvUAcH2sQwcdtrPNIwG8l5nEkjwH
	CMzAe0zDSLrM1n9babQZSCCaVsMYIJAiJJWAOHaosvVugAp8dDMrM3nRaJEgEoZIft90g8ccf8N
	mN1Va6QO4fwp0mCHVT/aSn2YtRSf4Q9oeoHbxYu5zsfp+1AM3Un8Pv+LYGdCMFUhTRL5MIhgrnh
	MYLMoMIjE8PjxS8gsJ7SZkYfhjP2b3YZqMvQZzOrriZiscSnSRon8
X-Received: by 2002:a05:622a:1f16:b0:4b1:247f:4e0f with SMTP id d75a77b69052e-4b77d0e8accmr201211491cf.57.1758017872359;
        Tue, 16 Sep 2025 03:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG3/RyuWQfRZW1mY1j1shvOvp1blH44FZkzAOAV9d+81uzHG2LCJYhHB+EHzub9I/8NxYxnA==
X-Received: by 2002:a05:622a:1f16:b0:4b1:247f:4e0f with SMTP id d75a77b69052e-4b77d0e8accmr201210971cf.57.1758017871659;
        Tue, 16 Sep 2025 03:17:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5d5e70c8sm4310701e87.52.2025.09.16.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:17:50 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:17:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: rpmh-regulator: Update pmic-id property
 info
Message-ID: <le4fsudu7fh6q5sstz5zndizfssgiycswzhmzuoioccxvth5mo@weyftlxiohlz>
References: <20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com>
 <20250916-glymur-rpmh-regulator-driver-v1-2-bb9b00e93a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-glymur-rpmh-regulator-driver-v1-2-bb9b00e93a61@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX8Qc54Ssf3F+3
 pwS3dOVLPj9ikR+SRq9ts+6uLmxZMApSQgvjv0Yf1VIey/HGSqUL33jbzQ6gYjuLMdLVrku/g5l
 e6fxd6k5mxayf4dWqIlVTCwKI7Wgrv7TSh8F7bgpNeXgcUbu34gAZTY4M2vaQgRk7Te0GqU1Uqo
 CgKezQWp+z22cosraHTHpQDrgx//nCyMC28ntdrz+mNRtsUO+jv/0Mrlzo/ZGDTRadjbjNy2hpa
 AgjMX1jK2zETh6p0yZ5NdCixDojkOyOrXY/Eg4wQ6ry/KEdajKUtF1EeSympiA3NKNK9vY+vqzZ
 2ARuiAZse6LtPBk5OHG994nMibuVRiyK21QLofsggFZ3TgUIPb/RwiZJvXA8PzClke4kihTY+i+
 w1pXDdIw
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c93951 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8Yl64O_mmtZwUmTP7D0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SFpGIDKgdGNkoXnOs0soI0XvwSHt3f1a
X-Proofpoint-GUID: SFpGIDKgdGNkoXnOs0soI0XvwSHt3f1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On Tue, Sep 16, 2025 at 01:28:16PM +0530, Kamal Wadhwa wrote:
> On new targets like Glymur, `pmic-id` will have this new
> format `[A-N]_E[0-3]`.

This is a statement regarding the patch. Please desribe why you have to
perform the change.

> Update the property description to
> reflect this information.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 40e57b10ebbebeff130871b6d978df64111b6f29..40ddc64577e78b5c0dbb7b4e8893a08e8b37c92e 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -108,7 +108,7 @@ properties:
>          RPMh resource name suffix used for the regulators found
>          on this PMIC.
>      $ref: /schemas/types.yaml#/definitions/string
> -    enum: [a, b, c, d, e, f, g, h, i, j, k, l, m, n]
> +    pattern: "^[a-n]|[A-N]_E[0-3]+$"
>  
>    qcom,always-wait-for-ack:
>      description: |
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry


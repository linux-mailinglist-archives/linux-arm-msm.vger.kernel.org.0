Return-Path: <linux-arm-msm+bounces-79273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABECBC16B15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 20:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5851B2854F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 19:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67DC34679C;
	Tue, 28 Oct 2025 19:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHhMVulV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbCKWHxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC253321CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681472; cv=none; b=ix97VTGbCzhHkKRQYzLZkaBSSTXCgIjt6pLnA0mBTUGRfWWWuec02FPbBb3pgJ8OHhhJPGQ+Q07cEVRzhzdQdLpMr8P3tEnPMNl8NTEr/ShTgw1W4HyNlnyR2ZmVUE0E+AeRHYerCFZ40HX3NcSsRcsqDcioSpBm7uNG/oRIFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681472; c=relaxed/simple;
	bh=PhjkiNrziSGCQZAvgqKtNa2bNCbCNdE75stmFSNdD6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyerMF4E+R7cNOyn4N+4z77S9XjMC6tSo/ngqTGlH+wWIHGDrmYzXbKagoFfhXjgfcFccCinyNTv3xWiscbl14wPdOCEDaSxJy/YQ9jvJKw3dCsjqWQQfoA/ScE8vpLOApevLPmIUKvX5Kcb5Q5oz2IYw53b+GGgTa7ccfhaOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHhMVulV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbCKWHxE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlQSH2552892
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6VZKEn9mknAk1r90YKOpNGy35ExdR8YFK78o+x3tCs=; b=UHhMVulVkgHJA+O9
	X6ac5szrW0Z4VNTvJDBJMnDs3jnixW5/qa05NeeBzC1DKxQqeSZ4x7tEPRFM7v8X
	FShBg/vud9ND4ewHLDWYd/mVaX2zh4uIAoSWzdRDwGeOW9Dp3FOnYHXek7hJAVaU
	5Q3L2PSf9DQ6QJo9xOFiRkGNSOsLo6YHER8fzKLf+HtSIrEAUyi8G5M3JSGvOJsN
	Q+azj3WtF2DHS0PpXutHWeG3NtwqJUxMwLWqt8JjJInCh++Qrnq2X8QvF54uHbtO
	7o+wcI6COwygvveJDjbv8RpDAil9plcXuhdVsyPQbDkToUg/Dj7GO3nsLANc03Ww
	1x4Pww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2g0pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:57:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e892f776d0so289258581cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761681469; x=1762286269; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6VZKEn9mknAk1r90YKOpNGy35ExdR8YFK78o+x3tCs=;
        b=SbCKWHxEOXmZnXrq9gZqkpa/g53GhleUdOsKRirxu3KWk7jQj3kmt+2bH1wpTg6mOH
         HRwpNI5XF2d3jV0Xvd15jisygnNyc/nn//upZK3SXnDDv+IlF7yrinWk2szd4xhPZcjD
         txAAnOEoMrJYhp8y82XXVhEkvL3b4AxaOwk30LLCva/Cw2xtQxldjim2+qLkq1mjJWUJ
         CD6lfhfqcJfGZBBFgdLuTRN9K4uEbe4qq+BurYtgkZ4t3GQGAwBL7pszqiB1fO1qH1Rz
         bZzIlf2UeVLodZ5sTvfBsrW982vcoqlnEPyA9F3HnO/Jina+sPEVvjPryhJ/a2XVNLiF
         Kljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681469; x=1762286269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6VZKEn9mknAk1r90YKOpNGy35ExdR8YFK78o+x3tCs=;
        b=ihvMkbobBKyyHW37QTDk6Mp63etzIvnt+q0uzIMeKP3VHavEPetCoxpSOy8zJtuMLN
         b6VamNd9nZldoamc9c+AyL/L9rA+opP64QXVYYm8wLKEyaDpFbkrVHO+u6AOHqYvcvql
         gxJRWQk00DFyZFQPS5ObDkneTjk7laA+0fhYfz3j3BOejDx6/KXIlgIjXk+ruOR1w0qS
         3n990V5HzhMzI6etnhkn3MyQfs9Hfo1fRtCnFp+tG/s3bJIDivTw0bgyyglcBYAwy5sR
         cphj1pDrRsROZ9+XCTBFjpGyWZj11RijWzCzr1ypMKMhj+SLH4XWVF9pDSBbgSOOAeic
         9Rgw==
X-Forwarded-Encrypted: i=1; AJvYcCWcth1fe5GQyiynGxnQ3IdGfTIu4lXgQeaMqAUq38bzWOWzdIAV2LZIknSz5uMlHo00r92fN9697wmWUuks@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTkB0CEM0fGAvyrhEbYXBjv4f7aq+eor92a9Y380RV/i7CIwI
	hDA0n5ial9qjyCRrFfOo0pN8LKIXtk6963qoP7yD1k5bjDEPSVLv6lkhHoxGAhGQsu7Q264pTEJ
	TmGadIPdB3unBIuTHfMZSIND+pfWLTEPyxWl5esdfV6IMrVRaSX1+ftSsrN2AHfAN+DV6
X-Gm-Gg: ASbGnctH4DtQ60ypQ3de2chylBaPneiOt1Q3f+kQJvk5IJ8yFBhy7Bo5eIa4HoFeSI8
	npoeI3xYJ3LqJIYPIrZWyzOSs+RytaJt2T1uahcj+/Hky50rmTsuFKNFys0a08phODCFYyuQLPx
	JzgnKJTN263a5swI+VP4ebXuz+d3CQMIyflwwFBebmcoV/P98n6y7Pob2g6/L/olno9fyx4RGys
	teFkShygUaWpDd45U1uMVQeuiLS/14kSCZ43oIcD1REBsKTxRbg43q6jJL7TfFE71ve3huOl0S6
	NuDZ8Fmz/UOZMmkLdZqv89PkTP9AidyKT2hl91AMKruZe6MwoQan8FAxc8Asi6RZCm6mZOJg1yI
	18xQpeJfoJijDJLhlY9RBtyhtvZ/wVGCqpPWZMQTeY7NuLl6S3TYlGw/Mw+2RQIaVGypp0SoV+P
	wU5dcqaRnzvVHw
X-Received: by 2002:a05:622a:514d:b0:4e8:aad2:391d with SMTP id d75a77b69052e-4ed15c4748fmr6727431cf.75.1761681469460;
        Tue, 28 Oct 2025 12:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnWHRjVfSuZFrm84Q00tQxrmEsW1azjVpDihZ8mio3/6wz4xCAvAGLduksdpAN6IyL1yO2mQ==
X-Received: by 2002:a05:622a:514d:b0:4e8:aad2:391d with SMTP id d75a77b69052e-4ed15c4748fmr6726941cf.75.1761681469012;
        Tue, 28 Oct 2025 12:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59306b82de0sm2421121e87.0.2025.10.28.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 12:57:47 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:57:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <2rvypo4rvvjrtnjow37vfqifbkr7gfra5n6rnrshubtk4nxt2w@uan44zq44iem>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <20251027152647.GA915648-robh@kernel.org>
 <207641b8-c272-46d5-a459-eb720a4b94a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <207641b8-c272-46d5-a459-eb720a4b94a6@oss.qualcomm.com>
X-Proofpoint-GUID: Wd7wzXNBq-FhRuzF9QWRzedQklGhTzMX
X-Proofpoint-ORIG-GUID: Wd7wzXNBq-FhRuzF9QWRzedQklGhTzMX
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901203e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zlLbQ5bJCEovvze19KoA:9 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX96x8h3UZr0Cv
 fC9bbxM6CLlY8IrdyCrTXZzuy3/lub+4FjMAepfc2YDDw6pLBO8eo5gvxneqLaMKKgrRjiPAn2M
 vFMTH+mALQtZpoqHcNe5CEDtfQVRWA8+n4zRFZJl4KhUJzT0aQ7H6wJdszGkhq0p7rbIFRphe5J
 bO2X6Tm1ICAvL2WsOeWRmS05yCzGxcTvynECDbAk6p+69RJebYu/kRU5MnqpHNiH32mlDBBpQfS
 l3o9hEddXv9yePiWuMjiSau85N4G1KiZ54e3yl7bC4bZUVOJT8aLlg7IJYl/nOUnNyr7eL7J6hW
 ww/fvyz4DaVDtBQEkAtipJuE5MnJ4jvxaXmr/c+jSkKr7hqhZR5e3dsRJepHLKHHGC4okPWVAZ8
 pfV0d1OFEhqVbnesplqaR4nsfUE4XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168

On Tue, Oct 28, 2025 at 01:06:52PM +0800, Xiangxu Yin wrote:
> 
> On 10/27/2025 11:26 PM, Rob Herring wrote:
> > On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin wrote:
> >> SM6150 uses the same DisplayPort controller as SM8150, which is already
> >> compatible with SM8350. Add the SM6150-specific compatible string and
> >> update the binding example accordingly.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> >> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> >> @@ -51,6 +51,16 @@ patternProperties:
> >>        compatible:
> >>          const: qcom,sm6150-dpu
> >>  
> >> +  "^displayport-controller@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +    properties:
> >> +      compatible:
> >> +        items:
> >> +          - const: qcom,sm6150-dp
> >> +          - const: qcom,sm8150-dp
> >> +          - const: qcom,sm8350-dp
> > The actual schema will check the order. Here, just:
> >
> > compatible:
> >   contains:
> >     const: qcom,sm6150-dp
> 
> 
> My initial plan was to use only `qcom,sm6150-dp` with `contains` as suggested.
> 
> But when I tried that, CHECK_DTBS schema check failed:
> ‘displayport-controller@ae90000:compatible: ['qcom,sm6150-dp', 'qcom,sm8150-dp', 'qcom,sm8350-dp'] is too long
> from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm6150-mdss.yaml’‘
> 
> So, I have added all.

Please use properties: compatible: contains: 

> 
> 
> >
> >> +
> >>    "^dsi@[0-9a-f]+$":
> >>      type: object
> >>      additionalProperties: true
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry


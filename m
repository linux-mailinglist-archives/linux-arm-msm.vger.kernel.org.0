Return-Path: <linux-arm-msm+bounces-52832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C173A7599F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 12:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 494DC188DA0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 10:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8326E1BD9E3;
	Sun, 30 Mar 2025 10:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fict1UxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAE2AEED
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743331012; cv=none; b=czJhBx5PwlxzIZvlWXflFMH2O5lHCQMxBr0xnm1ra6Pc+ifvTmmc5E8sJWOmQoAOCnIPptPP9p0BOoVocgUWaGqJo7amE0SZuBd0PF5BKhml4gWEzOqM8tIZ+Slm8MgA16ZI7mz5h2tD0WH9DiHeyLgAbI0f5m15f0+natsdre4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743331012; c=relaxed/simple;
	bh=mlUFJe3hR1t0B6j0kchQ89qEo+mNhs51rs467Dn3d+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnpiTBlbzqnQrEKupoNkj7rtNg8un8frqxbK6t93sY9oCjr/HOZbey9ALBaESTge6SY0qz3lzmoy1sRQBPq+MZVp+03H9/MjjupslJ//eFyj8xwdq9O0WIfJTKL4omtTyqqHg3/6ZrkCynDDKdY16lSgCOBhTR5rSHLqYJ3haqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fict1UxL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U8vlFL002203
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVH5lVnR08zuySJUeq+uoGrf
	ogdD6s0iW5s7dVDfwco=; b=fict1UxLW9xXrMeULzi7aTNRGiMCuVAdVu2AI9Wn
	CUxu4l7FL4W0EFMDbbXhPn6J5urF2TJrWPg9ZXdEMOv1j4FffzrXTFn2hcrRGSRD
	nvNnqa6qPxPf8I/BDwILE1Ndg9CgfpMbLv04a6Sfb8fDUAvbMcEbEN7vL3nLhtpj
	ENCOEW2H5pvxflIvhNgZvNDJnC0hD77ObAC2z4o9y+L0SXoHcVDm4/Aa/YOQVhKz
	k/TYfFO4Mb7BGxCMgYhNAIPoAC/NWcIfqaPZ8SC/Xbacvte86MwEbUHlbILZwqUk
	H2B5pQqDd5jd19wdd9ylTxiUzNh6GdmT5YjIEJAkyF10og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1a3x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:36:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so587944085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743331003; x=1743935803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVH5lVnR08zuySJUeq+uoGrfogdD6s0iW5s7dVDfwco=;
        b=EEBi5XwtParNvzYAM12VZ4g5yDqED8KiT35z0vXxTHmUD+sdhSj0q4UYvCT9zjCQYe
         2/K0BLL5pQeYx5BNRVkAKfzJd9yZhDzmZTp9A2aKlTSYsXyEXHiuhQaCWIa88JLCzTOr
         a7tE6NH5zytofg3V6Wj4kKZTDgvc5wnlCPgm/uCgVYR26dhzY2xgIcIkPd8cH7NmPXKf
         GtxhkjPi8VUG7am4Fd6I8fCSKho9IucEEiic2UzEsMl5US2U20MN+BBIohE5yWhNJUxX
         Uk4OcWnCDBJWMJlmmIT0AmiXkUAFuKnqi1nEPM2rzJ2oXomtD5KsvIYM1DrDJmoow7wD
         F3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL3Fnv/nwJEyJlZMQBtMGzCeld/q8j/lM7yCLICwM8MLAyW/5hfvK6bWEb9oFCpREFZfAtXHHHez1/zl/M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1qZjReZFBL5XcUC1RHayY+5RmPTZUUm5/D3F7VIVRrGBR2XQ7
	3WFU/ux+JPeBzkIZHIrEhG6x+RFxk/UK0FHexSLARRHNxSQetiz5BfEOzLSLUy3WeQNtfbVinib
	bOMBqAGr3UV+CUBFanJVJSfLmOGm8gK4x8thYUqUcDdFfg34wgPQw/0g3ceB8DENt
X-Gm-Gg: ASbGncvdDdwqoG9xBoTTwUiYfX5xlXmfD4rrS9Ffh9bbTlGKPYsy1NyjoeYE1oR8Zr5
	G2Xw7jAcO7EF+sdQxHS4deuty0Ov0KndTl0Y6CJpgrbgK2xA9qyP4g+RJPjE1jTznZB5qC86rrk
	NhRu6NAOtwEpJH4hElr5Rkfs9vPLAffbUrjq5fOnA6/TR6fNOH0VGhHak2Dksb3yMvOYtMGihY+
	yR0ZO/9DiGwser3j16wqlQjXFNE7gycM1jE7ZSrS6yXwUdndxhdTIlT8zVgqmGi1AvoDSNcagu3
	IhXRkGnVf8ktUFQAJ7cIjqBfTdaj4qC+nyDEKLWUC3oBUX1mhWcinbueogRXYxAJFRiIfGmQyd8
	ddeY=
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c6908950bcmr823934785a.57.1743331003113;
        Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtS6gPnV+Pz3tdsrxXFX0gc/+BT66q02s4zf4BNLAjJe/IVitafLnQPXX0a4yMcsExGqSNg==
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c6908950bcmr823930385a.57.1743331002525;
        Sun, 30 Mar 2025 03:36:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959150csm848746e87.187.2025.03.30.03.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:36:40 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:36:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mki4de5adulxmmpi756bi5frnsa5yx2ng2vh22q7sz6ijsc5kw@oyvb5xuu547c>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e91ebc cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=UXIAUNObAAAA:8 a=J_IFRixHdDkWMPCtAZcA:9 a=CjuIK1q_8ugA:10 a=bFq2RbqkfqsA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: lL7HVmc2zP_NJODPqhhe9o9ZngPYSdMo
X-Proofpoint-ORIG-GUID: lL7HVmc2zP_NJODPqhhe9o9ZngPYSdMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=824 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300072

On Fri, Mar 28, 2025 at 03:28:20PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2025 13:10, Ayushi Makhija wrote:
> 
> ...
> 
> > 
> >> +
> >> +			anx_bridge_1: anx7625@58 {
> > 
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > In this I have changed the node name as anx_bridge1 : anx7625@58.
> 
> Except that it is difficult to understand what is what, let's recap.
> 
> Original code was:
> 	anx_bridge_1: anx7625@58 {
> 
> You said you changed it to:
> 
> 	anx_bridge1 : anx7625@58.
> 
> and now I give my offer: I offer to buy a beer (or tee/coffee/juice) to
> anyone who will spot the difference(s) between these two node names,
> IOW, tell me what changed here.

Ayushi: mediatek DT are a bad example here. Please use bridge@58 as node
name.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry


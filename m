Return-Path: <linux-arm-msm+bounces-81244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98635C4DAC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35083189147F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A16358D0E;
	Tue, 11 Nov 2025 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ld0DXzZa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFNhgKKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86505358D13
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864047; cv=none; b=XbS0OSMZ4r7y6JfEhHOdTyalEul9ByMyS4Jk5HbEy8ophjwrwDfXNX3Kq6tSJZezAz+3gDvcI4LrXe4gLQseUcXNCSn8NgQGI6jP0Pwo9k6seoSep4yglyPgPH8BSeDwzsYuTHkhBo3PcdcgIn4rMtH1m0sYJlM1nSCCe8uyIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864047; c=relaxed/simple;
	bh=9VPdrRXuIiNKZGp5Pxv40MBiLERQtMECtEUEhoRYdWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWBFmenHqot2i+yCpdBGEHtId5/eyuNF+miL4D2Y6RIAQsRO25FhkuQ0bsk+OnsS0PuogbLJDTJSRRlsbhbARbivdouDXlNkdMjjAFlOlWQGMSKZuEVq7aqkG+AC5efA0C/j4nhWFy3ckJ5bCQ6BcU91NOZifS/c1ItdIHnwvaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ld0DXzZa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFNhgKKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGYSM1937368
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pbbrsg49P2hYmXm7dQ5eWDSM
	EBm36DXZS4l1a3OLYOE=; b=Ld0DXzZarx87x9JI2y8/ul/5gkJi8yJh/Z55cq6p
	4xtqa0zi81A3mxRcAzsccv269OjllNaHt5kBQQEJvDOIqgqjTauVG35qaoJIgf3g
	psL0WT1EPGDJafvFMGpXcQTwLp96ePUl0IN90LNGP8se7xfwXL48YxY8x0AtqS8a
	9Istrm52AUczg19MDs2vOL07nSpcPZfLuswESwKTqJCCNe0uKnhgVJFAo+QPkdu9
	NCoyEFxVK00YOB/2ML5qw0x8XtrrQQf+U+RH8t+ZnfcbSm0Gl8TN1SOgzO7T0U5g
	TJOa5APySl5w8hG+eGXRVG0+5+ji0qfvfLNYSEmHnFmsVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abwtj9cd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:27:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edd678b2a3so2595101cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762864041; x=1763468841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbbrsg49P2hYmXm7dQ5eWDSMEBm36DXZS4l1a3OLYOE=;
        b=cFNhgKKNhtLvsA30GrXls655vYepZ4TdijQb2zb85x1XFLhnUiqdvj52HnRk3l5kG/
         NJqnEsBgbX3wNZSqXuY1ZxncHbXoZqbe74UMQm/t106h7f4xibGaklPZ9Ax/Nj7mLNgB
         z8QsR2tqLVSEtoZ/oWIUywG/XCeO570l798sFwTazoXEagBk2xuPfhPdmPuRHpI0Jc9h
         6DW0Fz/Nl8LIscE4A+hu+cR8hw6pa9PadTpXcuIQG6z7wArf90WOEM261st+qZvBngG7
         hMZZJvQksUCKokX9cGBCjlPkwT5jH/9mR29vWspiwBv+bMeFi29kLMTmt/28tc0+EeDK
         yebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762864041; x=1763468841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbbrsg49P2hYmXm7dQ5eWDSMEBm36DXZS4l1a3OLYOE=;
        b=aBiSCSzwSz5OOKlJixBjScmMivJke9ihp3ji83RGRrJEecEGXyjDZtumIE/e7vhvUN
         GI/k2j9ssdLYBl8vthhZl/0RJHZBOUpCZfb1xm12qJm802tCkUuGniiPyOB/cLt9G90c
         tUd8Mbv5RhfwMef2KzF3GSRCsCwtTZspvd8nnKcrn6fBlT1ktPG9y4OeVIk9RYTvYTdd
         9SwoMzV6A1qb8wEP/5mOsVF9nUuGMoq3iJNtLiMMWohhT0LZquN6nsPnpYZaDlrbYNbN
         hGFilsCjzJzsqphuciq9z3aWuimA0yP3OYnMG21EFqlFOBxqj7uQdRYfi5u3sL3BLFM7
         4cQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF3aawq5s6hL9iIt9e12tgFjQkSac0KRb4e2ocvKe1hzgF/GajbUFCCbrlquALogbFQ5kwGrfqL8ezZhCk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz120FH7c/vrIdrr33lfhJJBKtwwEsgo2+qGeh+ol/kyseMGk9G
	V0eluFtMWxAHKTlI2Cr6SnhtjRT2zj7P5YG7/4LkQmexkLH+m4MxI4i9n6z5lj5p5YicVzw9CG1
	HB81S2yj5G7ILrxkClTNuXfuVMuPEwVSzu86Y6iz2pF7pjh8Ic2d88WkhkoQxwM+Nyy2T
X-Gm-Gg: ASbGncuEGAGEChvUr3zjgl11JUFZmkfkauppIDeLBoycVoKpla8HiBzGZEubYfJy+sy
	PlhEVKn5s5Ek8WS8FhR6bRrJ6+ikXubt0aGr6OjPFj3gP6dpAcB4eDHUcPEvoc8LMmX45QyyEBt
	W3Zq199rywYUCIiyoWW3WVyRN9OdoELjxzVe8PxN/CXk7GSzqZOQn8xyij2wkwH5cl2cV4yIlj7
	pk2MGN8pViZOWt54SNv/10UlfOMHeHNmVlEGOgO5YEdRnyTO+jG3ABSKW8PBmvLLEjtjaDwKyyr
	gd4zCQEq2ZlPH3Bfsj78BvhhPb2YjzMdO3ur/K8oOTphIm+wbBmEtAZl9q+uYufwdgt30ZDC1F5
	PWx81Awnfpm/D7498sqF5acQauaAxHlNyOGvPpEh8qZU2KLxCipX/7xAZvczLMfBSr12T0yg3FM
	2b2Zb7v9/yMbMf
X-Received: by 2002:ac8:5751:0:b0:4ec:eea3:41fa with SMTP id d75a77b69052e-4eda4fe0032mr122499231cf.77.1762864041400;
        Tue, 11 Nov 2025 04:27:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0G04Stzhf8pvrcPOEA7hZPvaHFQrTVkryE5kOpt4Q5+i+ssVi1BunvdZnSlbfnyCsgzQ5bw==
X-Received: by 2002:ac8:5751:0:b0:4ec:eea3:41fa with SMTP id d75a77b69052e-4eda4fe0032mr122498701cf.77.1762864040830;
        Tue, 11 Nov 2025 04:27:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a5a2042sm4884994e87.112.2025.11.11.04.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:27:20 -0800 (PST)
Date: Tue, 11 Nov 2025 14:27:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, mm.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm2290: add uart2 node
Message-ID: <6mr3k3vxgcxpddh4zmheeon77mru6r7hd7udtup2cqmvvziywx@xapbmrtblpti>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
 <20251106153119.266840-5-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106153119.266840-5-r.mereu@arduino.cc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5OSBTYWx0ZWRfX19hd61SGh2s9
 NBHUl8IgWaw+h9f6OtRwP4qyazeG7rLzQOjCqfgslZ/Nku5h3oex1bpBOzPQ7cbvnWiU2+fnhjt
 Xyk+zp/vF1Qv/hL4FwcL6cavYQPMWGc+Lgfjsrzk64mbi+9CiKVkAWHJ0WF84hbRhZCdRMS775h
 pgLYG6vVtEHJuuPS6SNsrFS1J16sVwPKA27SECIHAIw3sTSy/LfOKn+wnbOjbpsIA9bTFxEKTYh
 Hu3C3jYVLTJbf1zE/oZevSCfHJTeXyQ4v0O+kNNhTADo+CgQ1O/Z/20NI4xOm93HDrffriQcibz
 Fp4fAd06TOyLvaTEFFdPKuPsHtW7OJLUUl176cCP1vht1fsxGz1NogY3D1S9R1FTvYL+obcjnyl
 rcPdjkqjj7MHZbAQ2Q8lRYpamtglqg==
X-Proofpoint-GUID: MhipOndVVgx6NxXndp7cRQmx9-S6XsyY
X-Proofpoint-ORIG-GUID: MhipOndVVgx6NxXndp7cRQmx9-S6XsyY
X-Authority-Analysis: v=2.4 cv=UI3Q3Sfy c=1 sm=1 tr=0 ts=69132baa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D7qGd7DG7pF3fn8uCYwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110099

On Thu, Nov 06, 2025 at 04:31:18PM +0100, Riccardo Mereu wrote:
> uart2 is used in Arduino UnoQ as an interface between microprocessor and
> microcontroller.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-62889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB14AEC3EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 03:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021F94A15BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 01:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEA21D7989;
	Sat, 28 Jun 2025 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BixOOQ14"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6841C860F
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075739; cv=none; b=qtpLEOg+w4fyqlhtXKo5sD8F6qzDbLiu5atNTPUn3TlqGmdie50uOUztSy3h/EeODpGLHXEAURlVXWS8jNkFDCoRtJYe8R0QzfLcyLUoiT4VKY9Ek2XJu4U1vd5EiSU+81FHGTTtVDtL5eVbjDJnwZMxCEgcSEbBvXjWvTePsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075739; c=relaxed/simple;
	bh=Yj4HqbTO+hsJVkoO5tBN3KU0UwRywL0zRbgyWn3HDWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqWDDgWNw1rsAySFsfBDV9D2jE8uZ/P/Yd1nqaz66QZOUoDB7m4Uu9f5N6An8rBW8djjPPSSFaMSUgLGntK2tFnObZNAnODQTgUhrhL2K/orR1g/zREbE0agvuErwKYRSr9hQOvEIhtKg2hWcKj26+bP3EMnEeage0dInhBIdvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BixOOQ14; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DGCi007881
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=It1FpRXOceRECWa3Bwdhslvh
	PP0irZBQMnIJ9MHFFPo=; b=BixOOQ14Zw1BRrBwZSFhHjchS17b3drzrnaKuJh+
	jL+74BS+dkHcuuZ4i7GvJ0oIGav0dCPs4gqEE9tlYHuKCn/gCEO05GqGdUFpMM05
	OyELt0kTpE4DUa2FKGpaX2UxD7OnLKT8RbkPpXEA4zFfdjxmjiuGbK0ETQwbQLKU
	JYUBbXJCSU9DRUgoFaxxZnEB/eMk0F1TvlX7PGyW2+bKMfJz5vsgRzzFt+5RMh7z
	KdlezfBon0JeFO31AR55GFDm0y6FAr/ai4d1JI67WQ4k2Jzgv1ihxmpNgIZDOseL
	6gbHTebLZ4067njGpjd69rM0iu+WvhHlnHWNGbft0jIZsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgrafg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 01:55:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399070cecso71240485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 18:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075736; x=1751680536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It1FpRXOceRECWa3BwdhslvhPP0irZBQMnIJ9MHFFPo=;
        b=N73/tMu0f2XJ7ONJCiNMsalgk9tOc9VrvY/x1EgaY3+b3jrRlUTPXAy3WTYHMsAX+L
         R5vqF03eNSL2oQUtufaqyUNq1lbuTsr1vw3CbC9CKmDsGa1NdyRC6rPcQDSDK/y43evq
         yelE0Zlmg8+5F3He6nLThF5srT+ngndFpYK4m0t1w7wZcq+qSUPXE0w5q4w5xgClacfl
         cuoTbjK2fR2RBxpQq22ejHV02TFRxiTKm+s8HUKS21iCf4gfU/A6xJ17OTEhwAVAGxFW
         TcMdzCQL82rxJYRdHkktH1sIc4304FmLncM3iMLmF6LBXBbUXD7EirztlV5qEBPWuTEt
         H/oA==
X-Forwarded-Encrypted: i=1; AJvYcCUf91WjN7GeTZ0OI4igRThpkulyUifTeKOxYfzUyUxkpreDCz9cvC+jrp/lZOeFaGUD64EGn+Bu8tfSSUwP@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLJO1zqzI3deD2hdl1dvLcwpSrkV4wgKvabvTURVJYmfMAkPc
	grUMchU9Lolfw40L7v6GduaURepItg4WtfD06GfJXuawjkP48zh4fUYTgcLIb2IxYwhmjjcql3Z
	VVsYHgHDEQVOyXQ0cLb/KOO3yA9WdC644xL/76oenRXKjGffC1iAzoKFrbchYxmW+3Vam
X-Gm-Gg: ASbGncvJutoQN1LBoDxheupz6BOJmkIG/RJGmQC8l+o6GkgC4uMMQ3+SG0Vm0APmO15
	cZDVCJVtTOI0nkIW3w8yN7IZ8Kk/V47eX0x+LfxmwHbuJ/i+DjrQxrTYtLMau7ypLslu10ynpC2
	dbZPmBw//tWKa4195jLC2VUjab41bL4E2sFte6a960T/cfP/2rCFN0x0xo9bcoJ97k7Ht3/OLb8
	uPDE/Dc0duENG6ReS2fwKvDuivc+fwIMkpnhkLbGPcSAJnclzcqSGX8uViFgBmO+8X15Aw/Mf8d
	Jwxex+yRFlf/bd30pdzsiRbK8cEE171mqdwvAs6GCdhr6zpKcR7bYAtTWEF+mMFsFY/lkV66KiW
	Hy4HSRdkoGAUtnpSEP7rdjAOjflgl8QZXnh0=
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr871097785a.43.1751075735696;
        Fri, 27 Jun 2025 18:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtab+OtC4EBlk9U3wu7wzT8L0Rv1HTjySotQtNdoIMLlCUeXq6oWJfdAb/GbiKRGr/Dg4hNQ==
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr871095685a.43.1751075735347;
        Fri, 27 Jun 2025 18:55:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f007f7sm6835311fa.94.2025.06.27.18.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:55:33 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:55:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: qcs615: Drop IPA interconnects
Message-ID: <b2fpasn6ki63yxgtjuxpalpmdlqjaym4fjmzw5mupeifmxzrnk@bdfdnxfaqj5g>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SCbgCFhzq__XwED3lo8GcumZScpP3gsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX8/6J+W7Ss3nZ
 GKBJiMlf3ZtiJurRqyq09b2eIRR74Yc+sWiH9NJXvdYX5ukxjkVSj6851DiQ8tAWNWRGPsMHubm
 5s935hcu4paFyn0MnFcprHb7HPnJyQbr7gf0cAzsOGqyI94MBDyTVRBbNet0akIT7Dbu8H62dR7
 tPz6x1Z/zDfkOHSHTGJ1Iy1jl4YLegFPsLptOV9FAn+r2AQqQPGOh/xiF6uuyYRp5xDlW8IzH0H
 Cp318cZT4dK1JzNVSSJBdP8w17mZZBmuiMFghbROl9OtSb4IwHbD2LOaWL3Z1VPm/8Hk/f7UoIY
 QFQTzq3zS8ob6TwDXFnLC3PrRBiFluLXpThBaxeAdhGc9yoDTvsSyASa74TYxNmUAo76oWkWeWn
 zLY536AqS2b56HWms9GsEbT8ST6KaCzk0w/g4AVXExVH/BV6//9hav8OF9eNboRgpWAeDpan
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685f4b98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=phXncWpSF8SbJm8Som4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SCbgCFhzq__XwED3lo8GcumZScpP3gsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=730 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:55PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In the same spirit as e.g. Commit 6314184be391 ("arm64: dts: qcom:
> sc8180x: Drop ipa-virt interconnect") drop the resources that should
> be taken care of through the clk-rpmh driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


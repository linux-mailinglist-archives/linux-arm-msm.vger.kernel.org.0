Return-Path: <linux-arm-msm+bounces-87301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53986CF0038
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 14:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04BDC3012DEF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 13:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8CC29993A;
	Sat,  3 Jan 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPtoOfie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giKo9bWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358341E89C
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767447740; cv=none; b=oTraMXobo2o76ebAjJ8RSRGm6SUEgUhOx0ZC5cLAJmVGoZG/Ai4pBXWY+u1gYn32/hqvc6H5/7gJpDbhl6joitTkeh3bw+r1d2LUkkgS621c7z5kGWGFe56SGmMwVVq88v3UW8+w4Vi4/4YsVizKrJYo7S+3V50U3WA9wfQh6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767447740; c=relaxed/simple;
	bh=bFeyXDpn7sI13hj1UQMegxwyXA4BVNRZfrb2CjhenQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYAqwIcKwmdZhp0cItSJ/VGToH/ky/xTq8wOSUJc1OZO1cWQ2wozi51CIoklTXp/hNFg1bE+es28/vabyRJUOCBhJQOILUWnj9MNOfvzLrHZsqGTlldktZ6cBJsmrVuZOtRfRbQQYheMeph4L34kL3PzqWeVhh9GoV9ZRf5zAcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPtoOfie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giKo9bWK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 603CUcP42973011
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RknnBF6iltN8X5ctZkQUvZCW
	3lKMVu0v7JV4Tc11MUQ=; b=iPtoOfie1bzgo2etJwcMI33qd3MaPsf3BD/Xzdi3
	KqvK0QXyOET5uhAra8IN4kZRFwlalcsP3Ew6t6A/AzRFKh6OlVdX5vN9kFVRvipQ
	FMMy9sXyjIKyKWXt+bWPC1WmlYJ9gZYLd0bqkKGB62F+E64PH2MhrT4W7/knoCdU
	N2S21vwM44S6XP5q/zU5VnDRIELCZ1eyOPtRLOZ3oXasnM/zUP4GEdiT33qNf4qg
	N8gEa35izIe1Zzu0X7ahUM7q/gMl5frSW/G8uzibsFKG/iuCXlScq/H8s8P05Ciu
	fssdPFSlwrESY88JK95tbDI46jftksVgaCnelwNEw79txw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4berfn8u13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 13:42:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d7ac8339so502350881cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767447737; x=1768052537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RknnBF6iltN8X5ctZkQUvZCW3lKMVu0v7JV4Tc11MUQ=;
        b=giKo9bWKnsXBYAm7rZFPYfR1042AqVmVOPh3tcpOnr4ozKUWh2QeHw1uZYZTqtswhm
         QkBvurqq2Pr5iptnGLrYJ4WaABF71MPX8eZZcuz155XuEDzQ3NAwy0TMUDylbKuYciT/
         LVzbsGijXO3PzCjrz1/hhQfN2r7R9lHCWCyHkFGtSxRQNlCtxbcWbqBXsgEBpjQGx0cJ
         tqUR8M1Y8NTHAUjNJraIDQ31UFzZGYi5JMuBPNYoPqBJwPqDTTHzyx9Acrjm2aNcEy2/
         UXBtWh/S70DFPuwPpfhLrkXD9YwB6o8jM4TS+4a616TC/sy0LLwUAjovBqhvUterXZC5
         CBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767447737; x=1768052537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RknnBF6iltN8X5ctZkQUvZCW3lKMVu0v7JV4Tc11MUQ=;
        b=s4zIG8SxGa1zepk8WHlU7pqI+QRM6izxy1fMzrZamFNF4VqQexO1WuZs2gziCDkr3q
         xokU9cjBMUgu5sVW2RK+VVcLnIYAnvnIfWI49P6HH1EsuhJBWwyA+ZffwB/qwwIF/ToE
         d0W6OiEyNUCF3+hA+CP6ucHqPwQTRRoys/Mw8YQ/VSGg2OevLL/2VkBrVbqsjRRPLQFT
         kd0ixjmkjw0a+OrCnNz3MwJvFwjxdan0R35ySlRtXSPirQZbyyom0xcDTNwOpeq59BfY
         WJC3MrWP2WEneqBb0D6/J+k7xDk3rS4zpzfuFTCT6iVVLII6aH0Be+4zDrAVEtS272HQ
         hnqg==
X-Forwarded-Encrypted: i=1; AJvYcCX4vsOo1aAUNbwA7rlkvrzfPj3Op8REEVhi7Q+sp9MqhZGuOs1o2dPZJ7xbeDgpOhHkHVEcTi1SxEnVfYfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQrPVmvqgwxrQcr0zHAvfPdL0khIlJzNbR5M30eSmZqEd/txB
	Ye12I/M0LvES0ddfF8JM4Q0dyfqt9KQRoVHTvlAsKGcYfA211lyqk/KGNDJRtu0muE7goOa9ID5
	8fPzrS/w9RAWTD2yIyl0il/XcIkQwVAenysaYlv6v/D29tkZebCa7zxqS3RvZmwkKZfDC
X-Gm-Gg: AY/fxX7xMcsrWJou17TRTmIo431yhxHpQ085k9mEN3l954tossc3EkeD085+co0MA+n
	HRgY/24KZHVJRZVEQAK1L8LRxc56bRaOclerksDv4HPA00bEduz2H3QGr1AC9eGswwB+K2CVg9i
	Glt3XYtF0DzVJyWr/1OH2RZ8oYf+5RpejZX7RlYM4qLPZ9pMO1qZk7wZQINY+Rp4A+jDt8uudri
	h0R4EZHaa/tnsHcHHsm9qeIet8bK4MvsHugriNMHreWYHf7RgqsTaDN0sgvvOQdDvTCQHtAdtRv
	ya0CWwGfenXyhQh7DHpIDw+lFFsStr3yVFounOfjeoq6MtPgWXkaIoqyQV3MIDlnGcON2c+9/y1
	O3aMzrjtA2Y/KrdRmUs/wIweZ8QRzIgw/tw27d5tHO+q2kzgZvgphifUFhiY7yrXV9SUWJ6VlEa
	Xh5x9eY4l4oAIgSalUXHZBEQQ=
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4f4abd6fd05mr666283381cf.43.1767447737473;
        Sat, 03 Jan 2026 05:42:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDlt7ad4aiooknmq+zB6SC15sSlDjU87miC0SXLIAcaQzxXQ8IK9WD0Kr5sJ7eNw/2osj2ww==
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4f4abd6fd05mr666283101cf.43.1767447736968;
        Sat, 03 Jan 2026 05:42:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122539ae3sm111806061fa.21.2026.01.03.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 05:42:16 -0800 (PST)
Date: Sat, 3 Jan 2026 15:42:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol
 mux clocks
Message-ID: <bbj2tax7qb5pj4ujl33t5xc6ylogf275lj4hr52ftu6lqfglww@s6dourggzexm>
References: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
 <20260103-ufs_symbol_clk-v2-2-51828cc76236@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103-ufs_symbol_clk-v2-2-51828cc76236@oss.qualcomm.com>
X-Proofpoint-GUID: z3ZSzc-9HwXcUlbZh_J6qsOw5SZ4Eyg3
X-Proofpoint-ORIG-GUID: z3ZSzc-9HwXcUlbZh_J6qsOw5SZ4Eyg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfX4cBjLcxxHaAI
 BiRHqK7lEdbOC4fApYbDBFZZW2rwanwhB/04d0jZURvxHrkGbdvm9dWFpUm6a7gYwsIOTq1Ff3o
 mlo0gr4XP8lT3J0PFthX40yEiKBhAnjax9oXVrcmRQvFnpxPuaICfVOJPkpOWBf7LydZhHYzyeO
 pNi9wguwIRzqnwthgLhG3ZKh+YudWFI1LN00mKG/+g8XrNsgai+rEsiJ/kWQQ+j9rrMA6gOOz5E
 B9APfnNDVPHHo+0/miP9+slXAHhVtHfqcPa0Sw3qZuM4UiciotRgF6it/I7zMpjy2t1L3wjIFGN
 sLSVotnuMHVVQSTxV/xPuka6tiJQCrpdDo/HHpsl3dm/NffW9/iOLgKArILzCTTe4h9brvhvQrY
 CjXgApJpxVwsIzDagi7jIJB3uhuGYJC2DljnUH8nZjW8GAZ6zZ78JqK8GST5p+u7PYVnm0GP2iZ
 BE7Hbtxk5w0W/9jfl+A==
X-Authority-Analysis: v=2.4 cv=GNkF0+NK c=1 sm=1 tr=0 ts=69591cba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Tt4ZZnawlGJF5pWS1soA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124

On Sat, Jan 03, 2026 at 11:27:06AM +0530, Taniya Das wrote:
> The UFS symbol RX/TX mux clocks were not defined previously.
> Add these mux clocks so that clock rate propagation reaches
> the muxes correctly.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 72 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


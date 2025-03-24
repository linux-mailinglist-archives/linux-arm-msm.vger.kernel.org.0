Return-Path: <linux-arm-msm+bounces-52307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E2A6D8BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 11:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE523B3A2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 10:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06E825DD05;
	Mon, 24 Mar 2025 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMUjG97C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360F25DD02
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813823; cv=none; b=lm778G/+upUTuEZBjNX7NHH00/L65910/ncMg9C/732JVf5NBPvfPEdli5Xttu759qjYeiyjf/iWlbscQY2HoC/dKrfJJpoHo5JucjIF5J9xgfQWz0OGU34nwceQTMhVJso7m5/mPT34w9nmCnzO+EJue9siFVLnIwi+vHjUZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813823; c=relaxed/simple;
	bh=w6aPWy+Qhwe/Y2L6UoLVJWUQwbIVm3ZGC63aKmxOKVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ/1eiUSgrk0kyC7B/rgljvhQV2FajM2Q/qr///clxSEUKNmCoVNU//TRZyojqOHIfPLR5GWVsZzdIwajkAnGf9LpMYCrpm2WMbWi7/r0Uuph/3YxG9ivxs7XRFrjzUCiROTc2b9N38FTwf3f+Srjxv/NVR4q4hLuEXGqa4Znbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMUjG97C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PNde019600
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e4iq5ZmzgG7lLxopw43AFxoI
	iRiSXqSMGZij+vqFUSc=; b=WMUjG97CfkjZxoEaKgZvO/dE/9TejQ/XF/zAx5wS
	JOYy1QykJ5hriIcNX9mP4zYoYtCrTRvYJjOnGoGJl1ttAYm/OKdsZtPLXNLAseAR
	WPiSXc1ix9qHCn4IRAPPDxWMq51e7BtjneVfwW9tT3EhCMzH5J5IFnVj2IVdLvzJ
	M/HZL/A5UDX4bohIg9npfRnYdoAY/sDkioV0MkJvHisdxkgU93YcqSL7VR2AF3SK
	M2LdZmYxJiFhDdma840K99rgWtMLUoFh1OpOaaawpdmx1h2yY3TwVRCAptni0qn9
	E/gfYMvbR3BGnoREMkVuHvE2RCmCKmvrkJYcrX6cDQx09w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm5uv7hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 10:57:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54a6b0c70so398234185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 03:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813820; x=1743418620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4iq5ZmzgG7lLxopw43AFxoIiRiSXqSMGZij+vqFUSc=;
        b=Nu/yu549pwS0d+F2/XWqoU7K/XWVTWTsriSX8ZcjfNYcAH1aHCtc1+5k0U6qoBFpTr
         APMhbICqP5Y1eAoA9HTBsdb3tmYSbeOlU63U6T3yEQTwHqHGru6765qKjcd2vvc1E2bf
         qn4n4dq9S+dtjLkGa4Nu59nCFL/8VNmpEiWrjYYCxcts5ddxL0V9k1zB1y/ryIFmZJ4s
         hd9+qmxg8O+ilaoAjayoPHcQDrO1he8DrirYRhLafhh+nqss6OCnm/NxZIGLE7Wz7Q3G
         bDCFbqqKEXSWzoASpyovazyFkhdTQ7bfuWGAetfpzULS6Wct6ZDhddI8+sejjuagUFxI
         +Wbw==
X-Forwarded-Encrypted: i=1; AJvYcCXas4numQPeIAeGSS+9WNWbmRHDvqGpvpBwKVqmGA8MfTgIXm6ZzvDTDVYAKYZ8nBaZm2q8an3pE05WVE5W@vger.kernel.org
X-Gm-Message-State: AOJu0YwQb4FH1rcAq3Or/WrJipPzA4/zQiPiBZPnlZCv7RLGQpYTP8og
	/yD3rKkFerkpAPBeufRGZFKlRacRlzauCgk0NBsm4BJfndYSVeLX/XQ8hu78eHOsyImZiq00m38
	+3xsKKVoe0k1jcqj/L+0K5SPmSktwaprqutmce7XFtBBEwdnOS1jZHVAmWLmdY2yr
X-Gm-Gg: ASbGncuJWXRfFKeWL5LBsr1mHAqCz9MBPyJrX5WDcFbk7RUlMlQhdYZjBaL9tQo4R8q
	v8SKgqFGdYelIOo0xG7TEEuz5NglD3A0plaVdoKXT+EZrT3PwJA0kBMxjN487lwcOKs6WHdUkNa
	jAKTu12qJ+Ge5mEmdv/Lxg4jdhBCkbbs+c4BUDVLqzOpz+e3xoUxh9PZ6I8iu/YJAw3M2ksqzfD
	nPzjDL5DH8gpqsI/y3Of3pPdkMPQ3Rbr6FlQ2RP1b8DMBoBGCJa9rJp9zTiI8MWKfGCz6JaEbF/
	u6MfTEe+lSBhUyDRUScTLpQrJ9F5H9Xc7bs/pDbfq7rGET18+9Ke0+V5KGAdZ/STiKYTKa4wl/v
	YYcM=
X-Received: by 2002:a05:620a:2946:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c5ba134078mr1404878185a.12.1742813819881;
        Mon, 24 Mar 2025 03:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT85bm2iUMTANL530hIieoil1fUEuIlPX9t3T5XtetsmXWHkoxzeE/XwgtI5CCHjlOMTf57Q==
X-Received: by 2002:a05:620a:2946:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c5ba134078mr1404875485a.12.1742813819419;
        Mon, 24 Mar 2025 03:56:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e0baesm13193461fa.38.2025.03.24.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:56:58 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:56:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm6350: Align reg properties
 with latest style
Message-ID: <yrxpfsh26ymo74olbgglrgb7d35nj6owkzndfnrbmjorb7tg3k@maccic4kvlwn>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
X-Proofpoint-ORIG-GUID: yJWaG3I1_6GAt0Tny48q5ah4xfpMTlda
X-Proofpoint-GUID: yJWaG3I1_6GAt0Tny48q5ah4xfpMTlda
X-Authority-Analysis: v=2.4 cv=AJKH5mlP c=1 sm=1 tr=0 ts=67e13a7d cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YQ0UDAJD0Z16suNoM6kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=691 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240078

On Mon, Mar 24, 2025 at 09:41:01AM +0100, Luca Weiss wrote:
> While in the past the 'reg' properties were often written using decimal
> '0' for #address-cells = <2> & #size-cells = <2>, nowadays the style is
> to use hexadecimal '0x0' instead.
> 
> Align this dtsi file to the new style to make it consistent, and don't
> use mixed 0x0 and 0 anymore.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 204 +++++++++++++++++------------------
>  1 file changed, 102 insertions(+), 102 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-85612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F23CC9E14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05904303A915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 00:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F402F212D7C;
	Thu, 18 Dec 2025 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBEJu02i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCisjjEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1F01FF1AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766017377; cv=none; b=p+RD7hLTTYpSNJcrceUiUxV8aAVH3xG8e7sEIoqWDgDzgGamTW+k16trYy/xlMAq3EsVX8QR/WalH9i5r7ClCyknh9oV28tRBqvRN+ChC2ViHuvV5z/V9RgLXAvlbPSwgw/GAULn6Y2njuXsq8L0TCsGWP/ET+RbBulgpd92p/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766017377; c=relaxed/simple;
	bh=WyYas91ZPtqU18C21BL8052JdUqheOyAIrNSH6WA2SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtyLxU8EHhmJnDCMQvDBxy3gV386a1ZGW7boTbAB1PEnOeNBVPi54/xuoOb8PkTyK01ROu0DZdRx/8O/c/c6SKeuag+SzB+qZw6Zw42pB9nAZCsgM0oxeHen4j5j/Y/ppK1bNTyG9JZDGj2bXa4GUSGzRCb2BjR+IVqz2OzpAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBEJu02i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCisjjEm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJBXeP3888808
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xxVoEXVo9FXoz5Esin4V2C9o
	FGjnPeUwyLB+5DUMaQU=; b=pBEJu02iQZU71zdGbGgnmkvlA8b/ttspr0xfm0o0
	kkB8jRXUU/qnUoLM1++c2XVrQYADcoNzbaf4lH5CZDyvASne+LFmuVMvaZIZYp0G
	fpEUZS18LlZe0jzn9KO2CYZWScps4bbopcGqmLEdGsosZ8Mrqm5f5AjmOyqpMesj
	iVMSTAqxrWR4hk35e3pU37+GyNSGBZHPLfvWJitgU33gFU5vlkUObamUxTmZqixa
	HrEIbxUWE3Mp7wJMTGK01ZvLPrg3n/AiwDu5xcXriDFpXaCMdNRBsK5L4MHCNk2D
	926A4cP2x8sFPXpcyYlREjJc0a1ruDG3gaAhbZugEncgLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n333hw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:22:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cc5b548so23676556d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766017374; x=1766622174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxVoEXVo9FXoz5Esin4V2C9oFGjnPeUwyLB+5DUMaQU=;
        b=iCisjjEmJUL/LxEZzX2x6aff5X6xqNIySN/Vr5WlQ56YYH/K7bD0eF63hkVlvm0xSM
         kwTfnDB8jNRxqB0JjNig/yc79FFEy4ti/0G3PEsS2SFcNdzLODhIE24Ugv6TRSPnJAhI
         WXLNnYp99z2wUEmUyC52rpLXT1/d2mZpSsmMI1MDNb1F5rR9wWGzJfYDdFyJ9CxLlhj3
         yNpKYw307KRvYce1cNZCMIKLMRBgVIYPe8GBy8SVZBYj984Q2RY2RcJ4A0wATpaN/SIO
         oLKsng8DWFOPUeumkJoCA5nzw7E2kL70z575lf4IfrCXFL842mWgKUfaDfdR/sp8XRRh
         StnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766017374; x=1766622174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxVoEXVo9FXoz5Esin4V2C9oFGjnPeUwyLB+5DUMaQU=;
        b=LFwSpD8GzuBtj8zgXbw/vOgFDl7eqWO7IS0vmwrv1hV6QMDlb5122KOMdlad9aXJUh
         Kysl52GoEvtmCIkkynM/mL/1Xs8SqRw0qkMh2EoRowO7xokgX5Nwp5BlxUz0a2F6Xeim
         KaBEJ1yZg1Wx2eZS/RIITegatbote34bXmRWUH7eS+FV2qJDGhPlGyt0S+XuamtTYSDo
         pQXGrio0/b6jeY/vpZPJy2UllWpZpAnixlq5XYHY6k5HA0tbJzmFM4cAk9LcRjBH1gD+
         zbLiG/EkpwCMwbBlfa4lx18sv5KQbv+NMuqyvlwapqn4lV71zp93CicV9NGjBvHG7j71
         y+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX+mCSxmi0SgZH0ZN4OHanAWF8VlfXHpGzL1NiBCYKUw1cBAPtcbkFb7717lNJJwuL2V1ljlM6QPoEgR60s@vger.kernel.org
X-Gm-Message-State: AOJu0YzuUY3NJpSXESFMCpDRIKH6ptjxaN9IVcVF6rKt4tZeXn/FcUem
	mMaG2hgu0d/pRFVjwxR/Sky9zZl6yYIFwBGR+9k3Wt0llWwViqHdwwKM4bXaBc00dUJTm0xM4N7
	ucyH/HMHMZQwqD7M9VdH4djl4gWynkQeKSfLlDUQ8+YvfoYo92R5ymAgXXV3VmGLQRVLT
X-Gm-Gg: AY/fxX74xsQETgDGmdEbEJos7jZXBJe8z6Bhl9MPcGX0ja55QystCn0P20uCno+EOEP
	Ow1GuwziYmLISlLUq4V2iO5+h+qEIJiD/taDpPH/0xfJJkYfqPq9agJdZGqlRmJJ+ZZxrJZ9ZHT
	HYuwOCpUzYpNmFYvgqYHIXOBYKzccjpS9BtRFGKwNrh0o3c4iEOmRqve6FFifDp+Et1OEWzmuy8
	9qRK8QNHEb6waqVo6ukw6UiDuIrW//txyfgP9Io/JTgzDr2Vkq6TumNIUj/pNxkRN2b1fW8gHYV
	cQb9sM8VoLCOcr8cPGX1Cd066vtKUgfNFIqf4jEJLs7tesN6weTKSd+fCYYz+e8YZ6V2sAnQou/
	nUzaakaWAMC5FxuSKS30K4zaGz/8vFFgrYwBBDm2QER+Lj8jpdS2atr/MVPFQPEALXq14ghP1rW
	aABWWhxjrclWP3imhze+HcxQo=
X-Received: by 2002:a05:6214:5c0a:b0:880:51f0:5ba0 with SMTP id 6a1803df08f44-88c5271ad9fmr19079396d6.26.1766017374498;
        Wed, 17 Dec 2025 16:22:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJsttBfnDwtWjGCSe1ifWfSarqRPKfZ8FfLrvYcBczbWxgQkXN1hSIEzGQbHRWi2N2DBCAbw==
X-Received: by 2002:a05:6214:5c0a:b0:880:51f0:5ba0 with SMTP id 6a1803df08f44-88c5271ad9fmr19079126d6.26.1766017374050;
        Wed, 17 Dec 2025 16:22:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132cb5d5sm349573e87.18.2025.12.17.16.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:22:53 -0800 (PST)
Date: Thu, 18 Dec 2025 02:22:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB headset
 and Type-C altmode
Message-ID: <viqe4rn6bd3pil3jybhdr7ledz2ftymkvnmiqymhicxwtuy4c2@xhjyfle3q4z7>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
 <20251216-sm8750-display-dts-v3-3-3889ace2ff0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-sm8750-display-dts-v3-3-3889ace2ff0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwMSBTYWx0ZWRfX4jqdKQlrbQ9K
 8+FuS9GuTrV3ZrpqBhJ2CvvgyWgliVrpLbyjkrVSO1LIst8yQgFJ9cVhi+5vmnYJv5SOh6TuJNX
 GaXpMflsIn64M2Ha1wCT2Mb3qnYyTPXPCivrysu/oflhAGKR+A6GjBHDAjP74JnwtVwii2VxUfp
 q/gEJNmTyld5HacAHNePck8pHG13LtuKiGejc3f5X9v1tD++GFGnzEITZ2HaCMtqWhEhyS2PuHG
 N1QbziesQEsCpVQTou5G4AgeKsiL3+ulm0Cf/6QImxQos9EhiR2UsfhP0MAgeeQvmtjB5f/LR1z
 b5q3xQha+6fNtm/DBu2zAB2P7mTtfBmtp6EJ3VVnG5LNb0+UYU7WgCFqaFCxxf3iZSV/B6zYODa
 0NhzJljIYmPasgVi0qCZoR8hrUwwyA==
X-Proofpoint-GUID: vilHF6syTU_HsOKmj8deFDiXIBzUfEgu
X-Proofpoint-ORIG-GUID: vilHF6syTU_HsOKmj8deFDiXIBzUfEgu
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6943495f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Rm511Lm4PB0MII4DX8MA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180001

On Tue, Dec 16, 2025 at 05:47:33PM +0100, Krzysztof Kozlowski wrote:
> MTP8750 does not have audio jack connected and relies on USB mux
> (WCD9395).  Add necessary nodes for proper audio headset support along
> with USB Type-C altmode and orientation.

Nit: accessory mode, not altmode.

> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 51 +++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-70134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E1B2F576
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04603B60614
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEC13054EA;
	Thu, 21 Aug 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1pcpAk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FAB2EF649
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772633; cv=none; b=q4EJ+mJHOx4bgnjmPTNWnVlhCETAsSLd1159mNqvvRMoG53XPFNohL5cAyM2vDml4VlSl+pO0j+wW5qjVtKrW9veNCxtNpzr4P8gms0qTZe8fOx7w9rKRYUKszTK//okh6L2VCB7lRdEJPgP1SdcjAvOG3QrTnGaj0Kp+BCNTPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772633; c=relaxed/simple;
	bh=3A6M0mjid7CMv3T/gzr6PbDZciNbA5GGzLT3i2GHg6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWhrsGtEVACOyeZhanyvIVVjAtmIQOj11EpwktbwnpoV0PniCP+JfqUPay2UdbBSafa3iPYirjgpEaGtfEZANiKQpQOUR/M8GPQm2wMjC30d04ekzxl5smE59n+fy4b1wtkAIL3zLCQOkdMMGmFhMPwxPHLSqXZl3aqN7CvOOcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1pcpAk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b78u007005
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IjYBFLC3rhWAS79Puqp89OqI
	o8iXMrnfMumh6vVeal4=; b=j1pcpAk14aDD5FXuN6xNIXAdB+Kk4kbul3yJK/Rt
	ZQvelm3btu1rstKmLdUT+pHQSNll9LutMTLrJP72fEvVoALrXOwzcr7a3IfaOa6I
	LUYnjgVtflGDZfje39jT6tYwfav+Q7ryHd7sjT7/KKSt9ng5AZ1/lqZW7kYsTxN2
	2urR/C8IYjWKtQN6NoQDP6b7I1yMzFWgnO57VZ+fY+QMC7FsEcvdlVbC6jPtqTFx
	QXz384KV2jrh6Qd8fU45+rdGmLRgwbZEpD0mXFrBuL52Np+A47aPWqxjoEXX5XfA
	JsechO5Vij3cYGIg0+/bewoZe8TeisRFV9gF/kT6F+KFMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529549n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:37:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0faa8d615so53250401cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772630; x=1756377430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjYBFLC3rhWAS79Puqp89OqIo8iXMrnfMumh6vVeal4=;
        b=UC59q0Thk07eMVlUOoT+ZFVAkxjy8eXXiZBvHUHj7JhAcOGisTRCkGXYmlSboHvR2F
         vDsp9x511kGmQ38+6E5E4jrjyO8LnW12w9Rna9gmlAwngrvvEjmmwsx/HenduIJL6kSS
         ycLOBa6nyBxD1trUeHopO1aX3gZ0Z1qgBci6Z+8I4t+Iu642puwZizThAF/xqQJ9SenC
         pxwdpUnrCuE7pm0XrvXVId/+4+NNUgsy6qzaf3EWPfQwOPm+SGQC1fF7ZFkhihSMuryz
         7GIMRNb70hT36rHi8o8VBI6exwBOz45pJWjHbcfX+E3oIouXRCFS/ifg7EbKVcCYKOxf
         H8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSAo1M0RFa3WMZ8uYn662WTF+x/nPJjDNl2Wx5ldojSqelNv0C/XhLzHTWnNFFITL6N7c9ftlMqA6uCv3o@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6j0j2EmvqFMqaRGnaVkD/ni13azlUYaDaFWST5jfjba01YJH
	DV3TeZN2xxC34TmqMYsW86TraaNQJ5o26WcFvB8BzRJRXeiNnEbeKXX7WpxXDi+dkvy2iHXGFVx
	D6lAiA2LsjRhtMig52AtijXjsYc1l0skPnllC4nwMxDTQhDuton6X9sBG0ag8l01Vq6sE
X-Gm-Gg: ASbGncuNCFOvN2ie1KH+Ks7VMWNZT1xqGJ5cisGInNRc/u8q0HIHWyRgiwBbLE4nNDd
	zb29oNOK6gWbxJJ5v8LyMi5o3XM+L3gXaZRnSsO+KWNOXZ4Haq9sYsp1l2fMeqli+nqtm9aSXak
	ssUnZo0hcQwbo/TYV8GIlmzuBbDksquPKChz9jF5iRiWjKmAv9sgx4PqZuttwflSYJZ7VTN5t77
	RaQR8aVeLa8R9kqZGO1H1f+qnFYHRIo9tGH1W+NFlEkpAe1WASir9oVGET8chpjVhHO/9d8M+B7
	HSTLRGDJHph1KcKiQV/nuHZTz/sREZraWhuFF9d89NkAlx0XiLnFOHzlhwLii8z1+uX1SsDnc33
	L30zewOSeIqOsu8A+Yy98STg1KzL8hADV+QAsurqquOCneNIRq5gI
X-Received: by 2002:a05:622a:4247:b0:4b2:8ac5:2590 with SMTP id d75a77b69052e-4b2a04313b1mr18043341cf.35.1755772629859;
        Thu, 21 Aug 2025 03:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbbSb4CFmrzy1hyw0AdQ/ZOf9Jk5dx/46GPLRHV672EzsRWtz67iHEj1Hbr1BZW+3F7Q0VBw==
X-Received: by 2002:a05:622a:4247:b0:4b2:8ac5:2590 with SMTP id d75a77b69052e-4b2a04313b1mr18043041cf.35.1755772629344;
        Thu, 21 Aug 2025 03:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc9f5sm3074582e87.75.2025.08.21.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:37:08 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Add speaker Soundwire port
 mapping
Message-ID: <wbjvk52opr574rlmsd7whmtfcrubsbcufsthqpmxdejbcjhtv5@mbz4hj6ronwl>
References: <20250820141233.216713-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820141233.216713-2-krzysztof.kozlowski@linaro.org>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a6f6d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=E_llh0YH3YGsFUW4RUgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: A9pmHAHpj6jMfsEV4KUpSvP8OYjDmG6z
X-Proofpoint-GUID: A9pmHAHpj6jMfsEV4KUpSvP8OYjDmG6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6i2ez/KD1YIN
 6x3rGlJDaKZ+53n/9mu3tDc68FPOrCNHY9OF+12rLhM5kCSsZVTadh+ABM/rhBpcd/lG56HgZTR
 HSrQBw3beZ+rjdWfEF0OEkOczP2+7WlQz6/n3TsCcBCEnceIr84o9Kw8YPJYKBcMLY4awDByXEE
 KxCSXq7il3NO7/cBeEPWBd5zm6rz/JSd6ndGD4dwe0SwH6HNwaxcblvSnTSP0wU+WAZmiybrGeR
 fsdzFT0Fl+a7oyKJkv4NqIpko8eapUHiP2dzAUcSJ+4oevrtePqFAdinKNebG9thNESRJgAqWHm
 OXUtb41DltRL3KUYq4Jcwfpzke29bdqQEFec5Ps/mMIyj08aHFVHYtnbbS5AxyJWSubBnR50Khy
 GXyuw4t6BYvRPiL1HfB4euC/yH2ebQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 04:12:34PM +0200, Krzysztof Kozlowski wrote:
> Add appropriate mappings of Soundwire ports of WSA883x speaker
> to correctly map the Speaker ports to the WSA macro ports.

Would it make sense to define constants for these values?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 75cfbb510be5..946ba53fe63a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -938,6 +938,13 @@ left_spkr: speaker@0,1 {
>  		sound-name-prefix = "SpkrLeft";
>  		#thermal-sensor-cells = <0>;
>  		vdd-supply = <&vreg_l15b_1p8>;
> +		/*
> +		 * WSA8835 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
> +		 * WSA8835 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
> +		 * WSA8835 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
> +		 * WSA8835 Port 4 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
> +		 */
> +		qcom,port-mapping = <1 2 3 10>;
>  	};
>  
>  	/* WSA883x, right/back speaker */
> @@ -951,6 +958,13 @@ right_spkr: speaker@0,2 {
>  		sound-name-prefix = "SpkrRight";
>  		#thermal-sensor-cells = <0>;
>  		vdd-supply = <&vreg_l15b_1p8>;
> +		/*
> +		 * WSA8835 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
> +		 * WSA8835 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
> +		 * WSA8835 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
> +		 * WSA8835 Port 4 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
> +		 */
> +		qcom,port-mapping = <4 5 6 11>;
>  	};
>  };
>  
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry


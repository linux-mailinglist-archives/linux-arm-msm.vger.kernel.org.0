Return-Path: <linux-arm-msm+bounces-84515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4FCA94E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD8330FB13B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701FC258CD0;
	Fri,  5 Dec 2025 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HyrcEeh2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXZnGc8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE14B2581
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764968088; cv=none; b=CzWPvpIHtedOlEjbC3SnYyIOOIX5OSd3WHDtOeVRpvGirEHzqINxSmFrk/uY35M3Fc+Pu9UIQEeD56NihwY/E7FLB2GluTKrlT/7ixhcaAaJhoo+bfpkr+gPBl/NwbTpx9jDDv8i6JMGrWR/ee8icS/LZxlibn0rHd3Esw7KmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764968088; c=relaxed/simple;
	bh=vWrcmrGHN2InD/GxtwtNYZOhDP2iNAhu3gWZK6OFzmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6XmaMtdsSS6Pvibsf4bOojAEEKy2mzzXpE1Puc19oC/aY12eK2BhZNQsyqShK6M3jlSYFanuu5pqDoPqIxRtAEwYrun7CKOIQczCMu/dNdjatuZD/h+xBUkgnOA3CbSwd//VzgW7VerSkU9tzZWm0usJZPJymsgQ+roqQi0aZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyrcEeh2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXZnGc8R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBHbt520536
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GtFPosF2LgiE2WjxvqOOGkRy
	YJUYOXnYWCtT9Q8AA0k=; b=HyrcEeh2fn/ST9g1pNlY/hYo11L1eO++CR0/+5ZB
	otctzrL8Zxp+lAZMsT60n9fuKoqO5Sl+T5w5wVKda7svL+TgaJyDwx+/bKYK0IW6
	EeuxZI0yohjTQ/c9s9L6s8owJaAd+FUW/ZuNt0rxD8/QxFvV8d7TBJRt5tuq2ob/
	x2g20EKV7EtWw7+QP2G8vNQqIR7StMjbPK2zXq6RQWVMNigI9NSW8HmaK2mGq+Uz
	5L/cMOF5ShxctyxukcbA+mJzN2gx5RWCUw3n7kNWtxiAB3XU8wwwYsuoJJmofCdg
	sdp+trN2r0VV6RRhsurq39Potdu/fDQJK5XM9TYjy/ziTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auys7h8x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:54:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so819144385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764968085; x=1765572885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtFPosF2LgiE2WjxvqOOGkRyYJUYOXnYWCtT9Q8AA0k=;
        b=hXZnGc8R7/ggq6XaghGmQyJ5m6ru0xPJ+jBhnVVUVVl/82nxRaGi17ljztv83rfMek
         4a4tYKQjo+sFfKbkJzEn5VBs78ky7iruZDgg2+sXgS/j1XXAg5BrjT3HXnqG6pkhoKzw
         APxWc54LOuUWxESEMUv3QunCiJk3BReSA70f/PLRhaAYQCgS+zALyfERlpTqwYErYklU
         KcDxC5SZiEP4dQoV9clI5QslvWvaWWMsGS/8Lt9K2ZCFdRVFbzm/ONPgSMD65ftSXMMV
         92BClKlt1vOq5OG/4dNjpcQYs/AMqFEam6LD+B9t+5fOQ1+HT6kL9fTDVvOEqZrmSvkv
         V4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764968085; x=1765572885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtFPosF2LgiE2WjxvqOOGkRyYJUYOXnYWCtT9Q8AA0k=;
        b=CGU/NjnL6gXYiaJi3iRPEqexTCRIb2N17tTPBtJAZBEguhQVFsOOAVMhR0HHVoIXvk
         gpUadSHEi12C/LUw9qUhHdWRjcsJLWAGxmwtlH+xUczKbi/v1Uc/YOh0QSAn+h038HFA
         kkpj9VK6yH9lcSuMcHS5Fu3PqCKSMtvslx6pMTndp6jKJTyler+mRovKtA2dWsOOuPAT
         M20OP6yuDvMHpYcuoi86dzHEQO9tn9h1GtGZn1DGctKrK947lfG9/MHEow/xc3gWWjx3
         H8RNbJqSKw6iiVD0KJgfVE2jsei+TD6sfPPYBpJli9MRHF27xAE4IExRcd7rT3RIqG4Q
         O0Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVXtd69hWJviCZN/O113VqUX9UW2lkrDzJcwPXgBmBJd+H2hM9N74mqgwY3Ng43H/W/mx2L00Ixzj8kJdz2@vger.kernel.org
X-Gm-Message-State: AOJu0YwXizweru4uP26cBvSoDOV1b6UAMrHfBzKlbn8R4wJLeO1mo9DC
	/rHUX5l6fcaty56Xhx96+c9ByxXH283/W+HK4Ucbbj4ulhrkvWr4uPYGRuNiBPNAUHUpcNb4Pc5
	x8WDcCQWVt3IqvjieDF/MLYhNv4gKhpcubLt7eq4SQWWuCPlGs1RaT4TizeEwy/pxMwm/
X-Gm-Gg: ASbGncvihkJ7IcP9ZDM9bUS6izo6ahm3SizsWkFTn4vnXw7WM+99L7nC6eug7ua+/x6
	ZgR62XHKMnJsieEpQj2XPuBUokHM8xKmbIrATznpdPUKD9pg3QAC6+pXtNwPHThvY9UO5mxfCDD
	/NnXlELPlnRNn6G+j//rr1kY4U1LXXB2ho+0Mlj3PmOivUBwnWg3aTC+vp84S86aISYDBZdpQIu
	RWbuGezRFGQQpN1VfL6HeyQ7dxJNH4Q11FFQUbiI6myLEFK9upkeCEAPHDyPGRXhEVLW/WtvAIQ
	/J2TQ18S9sndic+cAehzrSk16Y8oork4z/p48qxCTjtCKvRo06c3sHRVoZ+RfGHd5Z508C5nx94
	tnEL/RmLtaS32NIr8tD0yd+e6pfN90pnG3vT8DqDAQymGcmFOksjhRl6PJA5CNebvQBOSHBL8Tk
	44tjFPAIyFdgcObvGgnE0cG4U=
X-Received: by 2002:a05:620a:294d:b0:8b1:426d:2b87 with SMTP id af79cd13be357-8b6a2503493mr64559485a.21.1764968084750;
        Fri, 05 Dec 2025 12:54:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAybpfmIdKabPoU0b3dhUbqBBQq3XsZxjf+SdNpObrlWklaDL5pyA+vTb0we9EyoSRApMq/w==
X-Received: by 2002:a05:620a:294d:b0:8b1:426d:2b87 with SMTP id af79cd13be357-8b6a2503493mr64540185a.21.1764968081599;
        Fri, 05 Dec 2025 12:54:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2c2sm1826782e87.63.2025.12.05.12.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:54:40 -0800 (PST)
Date: Fri, 5 Dec 2025 22:54:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <ombtqnvej7vxot7fzhtbgt7doqky4b4wwtockyvorpfi2hl4zz@wslecjpuhmmj>
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NiBTYWx0ZWRfX9+LDaz9eZVIL
 xOKlNhZTu4xL+FfZ2HQ4/wOq9iRCz7kQjz/0xTcUbve9/7EISv0ILFPHRFUNanCOpVmESGFfsdP
 NLLdJ6RNF/e4mFantmd5EsD7y3wFLTpFXbXEM1IyOBHH/0qc9UTuyIwEqaxJjCXA5VZMwkWJzvY
 gT02ezuxJehhEnDQRyv8rV2z98m8t6oMgimiGRX6Kf0ISMaybJOIRl4XBpo1KGkAjqGbOoUBpGF
 T1rxBnY8z+mK3J5sh1i4sdQ81t4qTfSNxNuyPBwYidmGtUcZpM6EvD3gys6udiWoeG/9AnsY9eo
 NrwGgiM/e+nCC6MXYkXtIyB6uYAI4cwipqYH31jM0aogngyj4OvqWts1GrnYzYBDmHD/9qybZPD
 xSMXoA15G4UzorHKBljm64Vrf52sug==
X-Proofpoint-ORIG-GUID: RLSxw4VJULknddyFllQe9srXG1waXsbg
X-Proofpoint-GUID: RLSxw4VJULknddyFllQe9srXG1waXsbg
X-Authority-Analysis: v=2.4 cv=GtVPO01C c=1 sm=1 tr=0 ts=69334695 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8Kug02PE9PhwNHeq3GEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050156

On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V3:
>  1) Add actlr setting for missing sc8180x & sm6115.

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 

-- 
With best wishes
Dmitry


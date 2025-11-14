Return-Path: <linux-arm-msm+bounces-81841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4FC5CCE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED2613BE6C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8B6314A86;
	Fri, 14 Nov 2025 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ4rZnxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WiOm+HAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC75313293
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118868; cv=none; b=qlRPV3XS5skH+J+Fwv2dro0JfPpH0+lhMxXsscjZtTQTJdvRX8MWgNCfw5Xfk6tQZfg9Ne6wBqs6okbLV4VuD0nz1P4gkm3bZy2+/HvCNowa0HYQXUpIMlz4s0TMn7R1F/Fx4dTJo279dP4y3QMf3rmCy3zYCEY4Kl6+GdLivo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118868; c=relaxed/simple;
	bh=lMZAu4EfkE1QZEu3ZbMDCaBZwR8iyiKIoT1jAACs0fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrIHzHcDDtkCnqtTyrEOwjieCj9Aood1gkRSM/N2ge8fRGpwFH4hbTuFz2xsUsoaFO4Bkr6/zq5iJzmpnhUThEKENvIOdoDXvfpACs8o8mDihXZZNcvnbQkgM49NQIklwmnRBWmQV979LFcAaONtzHjV5w7W9oYD8G055MJ9VMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ4rZnxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WiOm+HAz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8JDIG1486313
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T6isZVp+zu4IutUVGdnvmSaP
	P8z5aL+K9a3xcihCZ1U=; b=jZ4rZnxi+enK6AXAYRiGI75ldNaXv/txEZJt92kC
	byMegNlawXjJpL/ReehwuyzC/i+nO02UlngHZfMn6YSFiqZt9hoqONpWaR5AUdrI
	YdG7CW3kTPgchpnutZId2bZ0p6U0BS0U1tO0P3xPdMMUpZwr6Y4GVt2C2K3Sm8Zs
	GvWe431+yjn7FfVH4MnggPj5NZzQ754/H+DW9GJFuGXEjNQ2bB5ZKJeED0nUR1s8
	1Wgcatlqs7L/K9aksDRR9Hqu7xFHK8r6ybXU7+3VsFK/4uVGjQDISE2GvK8+gZ2k
	JH5o060QIPagBnKVw+EY6S7T8cIfqT71jBqZ+fb9093C4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9chy79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:14:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed82af96faso54830881cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118864; x=1763723664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6isZVp+zu4IutUVGdnvmSaPP8z5aL+K9a3xcihCZ1U=;
        b=WiOm+HAzjbbuQyKnP1IKlwcU55V69hVNveG86TXj8FDkCd+IKR8N6o8zd2JI2nYea3
         VVzv19yZHqGDf5nCFmkYywZuz0vy5l4SyloVPnA5QFKKyeMgec10id93VHWIsShY4mg8
         KeBFTKU8Oibci5A1+Lg9o5dAcyiSgbBonLN5SgPnAiNWw4q+OjJYr0UNoqONd3nYjgVF
         QPv33QKGQFt5NTegmlXFqVhyjzeGdv3Y2d2bmPdq6EZJIib3bJHPkAmf2gXzezS3JOpZ
         Nin8hB8xQelixzNnX3Y3GTmoz1WwADOTLi9/65nh065l8hvDGbiwQZGYBBO0vdiqVH66
         pcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118864; x=1763723664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6isZVp+zu4IutUVGdnvmSaPP8z5aL+K9a3xcihCZ1U=;
        b=FjDW9DrShy74BIeZO4ZmGifYXnWiu6wR9gR56DAZ1aIAqrx9RKuaPvJw4rkNp/FyTr
         UnwRl23eqWlVWCRGCeL4izlGZxWtirRNldnguJwYFWNkFxgjPoL0VEaoOKsOXY70F/k4
         tQKVgGkumhyildYBd6yD/BFCYFy2ccVJUThhDkOWES2Ll+5JyRzvshshmimJsCI5L14Z
         i27J5NT96jHdrGiVQp9y4ynCLdx1D4Vz5foTG9CX6aJESE2DW12qQyMh7UYfSMcbay49
         qQ6uLiAdPlFJIrrMnEfFsUnG3k+pFGCB/FW8zTuKwR525jYQvlWzX+IXjcuRtoUCZJIf
         Y5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKjmaZvjNpJYMrIxLiEBpyRbABqxDu6zv+4GQZYKkgrKV9Yutnum7Hpv3APdnL3u9cmw6oA86BpgObBnt/@vger.kernel.org
X-Gm-Message-State: AOJu0YwPiP/4Y1pUSngq1GyAOZI8LJclOpT5Sg+i2g/FtJlY4Fhg6zBC
	ymYyJ53zdrCgRKoorvuE85aZ3EhMgXj3T9TlKDh5A839Ev+gw4vXThNflyrsKfG2oA4pEuzm+sC
	Y4ru9hnegfDIb31qgETHLRCDnRCJiT29O8r0XcitZouaNs/kIQdDHDCoBzYVdcKCsBMRT
X-Gm-Gg: ASbGncv4WLs83AGj5GzkrBnE4WRJbuZsVJWuuorIIW4kX8vWH7M5L4OJXz1fUCixw2X
	+Mg/W+wyPDbVarxAPR2SwvF0RZBDj2SUv9qzkHR95KWTcry8OaIkGmbb9gDEQ3C+iNwMDvLKnJS
	AiiAb6FpcwTy7qAZBk9olUA6OajnIPwVPYbXgErEv67/OGzN1HPWOedCJUAz5Ia0iMSHAxVtq3X
	gwfBnc+0YK0hDyNiVIIhCrRadSD8pqz+Oo4lQG9DrbiRaGOZftmUqS0tebOOw9iGxV2FRJwuFPS
	h07aT/haDmCJGj63PNJ8INoKFg4HXfS7P370b8s50PmAbYJFXgcARRTmriOlY2bNxAzZkHXQtBa
	COMADlTlD5aYmkOUQzA7gOmFuNre7Bc3fdhTYr7GGzSA77K0GpCbPkrUEzq8J0kwl5izpNXm/if
	1ceu1/RUqcK+0r
X-Received: by 2002:a05:622a:120c:b0:4ed:da3a:c0e1 with SMTP id d75a77b69052e-4edf20f208emr36474181cf.45.1763118864456;
        Fri, 14 Nov 2025 03:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpwa1+LMOM1Z+Qqw+9VK5gv3gyPJ+o3q7x49+Xii587CAe40pTnUxc2Y3uGl06+vUednf/Cg==
X-Received: by 2002:a05:622a:120c:b0:4ed:da3a:c0e1 with SMTP id d75a77b69052e-4edf20f208emr36473871cf.45.1763118864012;
        Fri, 14 Nov 2025 03:14:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080bfsm8955641fa.11.2025.11.14.03.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:14:23 -0800 (PST)
Date: Fri, 14 Nov 2025 13:14:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdx75: Add missing
 usb-role-switch property
Message-ID: <5w7kb7ndmgcrdvctyjortlervo75ycr77mui5qwkbekna7f63f@bem7jgmghq4z>
References: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
 <20251114061553.512441-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114061553.512441-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: aUdzui9Oq7C0-utm61uLzWcpqwUt0tdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4OSBTYWx0ZWRfX5Dbrv/qzZtD/
 VDU5PMXeCyoa0PkI+MmsW1ENrmwB9RWSdQwTjwMwz0iUN898HnOevwWEpvWZCyJ5yuXhj47/8aA
 4SEasC9Mzs7w3RPVzqQ1EPZ0VfNFwM5whBRkWKu/IxuV7HGbUNDEU6fihIEIeSRm6UQvsxXcSb3
 Wrb5+8lF2dBJaVg8zB4PsaZu06guZOtEbqn5AbGZlDsZ239oVu6VWrpkczolth27AxrjN1K+z0b
 BbKBrExq1cZ4F6Vxs73Hb6AEwFdrDF11ncsEAktzFCQtQObKBOaSHsBhzyxEBvk2llNxDahoRBn
 +EsBhc1EqnZ5footmw1onJNAIhl3KYZJgmr+jwHLuBRfH/Mf6kYbZsUR3fE9GvGrV0/veVV2O5E
 R7SX9EpoXds4X9zRPeUZ5+rMVYKpqQ==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69170f11 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=H8TXr9_Z5R3xwymZkAUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aUdzui9Oq7C0-utm61uLzWcpqwUt0tdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140089

On Fri, Nov 14, 2025 at 11:45:53AM +0530, Krishna Kurapati wrote:
> Add missing usb-role-switch property to usb controller node.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> index e586b55c155b..6e7695146ff8 100644
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> @@ -1074,6 +1074,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			interconnect-names = "usb-ddr",
>  					     "apps-usb";
>  
> +			usb-role-switch;
>  			status = "disabled";

Empty string before status, please.

>  
>  			ports {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


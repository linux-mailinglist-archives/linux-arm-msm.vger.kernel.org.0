Return-Path: <linux-arm-msm+bounces-64563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A258EB01BE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594E83A6EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8615B24676F;
	Fri, 11 Jul 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqHus9t1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6219AD8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236721; cv=none; b=gsVS500MIq/lL13Yj3i+92MCOyzNvhGwhOt5+gYOs7D5GZbTuIUggCb+GGF58FTsErBVuOyejHHSgJcYTu5yV40ZG/QC96rIAW7eLymTCuK3Wk5AAs0VVh/Lg2GPxdmgntfqi4BEk9hZUyvVOo+3oj49CqW8IcAQHLKxzVTIkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236721; c=relaxed/simple;
	bh=V1h3cDpy+r/wNnCbLeT1mLASfEa703zOU/9HCncVaTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hw8x972p+ZsMv54huFYPFDh+ZcK4o9hjGZ4Hm9AcBG5tVNTHRxWK8mti/HbDsAGxFEBhJRGsnXZk9GtLjdFJaxGsscM8jEfu6uqLzK8JR5WKg6ttkr0dgOTgifv2xcCFhp4GiXihVZsa0vlSY/A7LdrbwwSyfDPl3WSOITIGI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqHus9t1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB1LDs005677
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DM9HFrXHjB2Y0nHkZCChoaoVsWbGVK8S31Yx5JDAcL0=; b=OqHus9t1BNoh1JQC
	UykkRkj6P/irulXYfzB0iCA4Pzi3sJWek+yLEVC8G349Xv+1sV8T8vDj5+pD6YZD
	d2hbS3FrkQaHuGHLSA+TSMyh2bKGHNsPz8pDcCkYCTHre0zQfL1EUYMA2LKMsreH
	257BZMmV0kGLsLxusPLTn97e7CCLpscRNchOEEyDhpn0lxtPGvCb1d4p0qI94mKh
	qmNpZsp+0NtpYjqQmIBwcZQGUYg9diGOklK1egCRl3ew2pNAlAEkpVqprAd3+mL1
	IIfYnBlLxXKGUP20EqAZUJ2go8vbdMk2Hcyx9640ptVeU25EjoPiig+nTgkqXPBa
	P9K9eg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1c586u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:25:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a804126ed6so8482221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236718; x=1752841518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DM9HFrXHjB2Y0nHkZCChoaoVsWbGVK8S31Yx5JDAcL0=;
        b=lPThGK1Xg/AMRxk/diFv8T/gRnP6hoMP9KB+wWhAeMX0fHzVF8yTICT9AUlrPCmGgd
         1UKeZip+VfwIYu9+o6d9Tv7zljemUcds6N2yPEnbkGQd+teKSE4zDw8u2YPGgmNBm3nR
         7ybgD/ZagK8Y7isktFSd/V5FvRzeRnfkcZ4lr54BGErWn7Drt23mmVqci4KiN4ilTvM2
         ME0IOVr+AeDfTLyts2MePj9jwA7DWSvf9uuMrlTg4Tbr5LNmX8XQDxiO8JDvTYg28BxP
         XIpvbMPqrBr8bTL2/ZR/klfjwhq+2iQ/BPuQF2uj6SZIf7xo+nrPSd9Nku+7bRP5CDqx
         YcFw==
X-Forwarded-Encrypted: i=1; AJvYcCUA7UukY87qFFxK9Fs45GYE1weOR3exkvzLEC2kt6h0OshQvDUyBGAqk8oTWyg3a7IGw+T7+KK5s978EvXL@vger.kernel.org
X-Gm-Message-State: AOJu0YwiBqjHlazsav8Ce8hRhiqQLfXvQ2W2JQTHEWdvCY+kuP8wN0UA
	t2jKK4sDwM318bSbke6WGcYhR87INM5ad4H8tcR8GJ/FG+Nqynrnx7vDPlpQ+UkphulDWiHb64G
	UbTmOwRK8AWlZzTALNEMCBgwgjPHaDgxRWsPdCtEnTCjy0m+6sHdq8O1+DnMF3jhy76sx
X-Gm-Gg: ASbGncsfQL36GeQUr+T1mXtIogiRttSMp3AzvgwfA8X3M9ZR4FfqAfZXuZdzpasUfhT
	ip1lXEtAJSSwVOYe3U6Ie++Abij9UW9nMwLO4d9fdtpNSndy1szSfa4ICJ5cOSyTh7c20P7osz0
	CZMShNMIl9N6i6tOozm6/GyQQyuCdybJxILP8q5Fq+dgDsC8O1ToZn5+Nwxt++RrSKLztx8rixC
	DirWWGHzb5hc0MpsinFNeBVXeqa5VqLWchECOU4+7D2cvBY5AKKyrjhOZicsUYGXUchOv4tbQMo
	8aC+XezQ+M1iY7c+7N313R+pRIc6t8kVJmoD8j3c81lG7qyfTNIWxJSuYwXCe/hz2gkeNEPO2F+
	0caI2clcoyxzjDsBWaU6M
X-Received: by 2002:a05:622a:1792:b0:472:2122:5a37 with SMTP id d75a77b69052e-4ab3d90198bmr4064291cf.4.1752236717811;
        Fri, 11 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfhvU3rHw/NzO8YHdZ0hdb/sCFcAXessFNNON/0+WsLESI732TDgE+n0h0m2FRFMjpRaLCgA==
X-Received: by 2002:a05:622a:1792:b0:472:2122:5a37 with SMTP id d75a77b69052e-4ab3d90198bmr4064051cf.4.1752236717269;
        Fri, 11 Jul 2025 05:25:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e92176sm287578766b.22.2025.07.11.05.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:25:16 -0700 (PDT)
Message-ID: <214c3d98-d0ee-4806-8c0e-81c1766dd1f0@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/72] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor
 node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ytiZFw1L6o4f_FEz2doD7wnTGKOrMyXL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfX3nx/3CFT8FQe
 LJIZuzHUUtApAI4lb4F9iQouLnIiPHqo/FVo1r6gZ7Pws2uhVlvA+y09cDxevFRQr1MCQaF32gj
 WQsqDYOtkvY50Z09QZDJKfn38pEBZ9LE35RM7PNjHOhlpDoAW/DG8H1WJEeFhWMy5SUtSNo/elt
 Cx9I7tGwL4KXw36qCsfKAGlo7RKVH3LEDQlubsNU+YrA/gEQ89h7w1bGVi/hVbKs/OoZRiPjppz
 9Ws+x+7vx8WIpwjX3hEdlf29c+V+70MMwdR8QD0dZD8I66dZEJ7oYDm0it7p28meUgPlwNP2/Bi
 7gmB+2Iv5KYV4zfBpYyfLtu/iLjgNVTCm5bTZzJQN7QUBJ0GG+gHB71/lE1GZojr2ag8WfnSKwZ
 JzDDyV93O7QjiqePs60tdC/E3ow+X9TDIs36RNKd5X+nflQZS7QsbJwFNMt+i4eE4DNG9nxL
X-Proofpoint-GUID: ytiZFw1L6o4f_FEz2doD7wnTGKOrMyXL
X-Authority-Analysis: v=2.4 cv=N9MpF39B c=1 sm=1 tr=0 ts=687102ae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=iR7-6Y_Ul2svg9zsNUoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110087

On 7/10/25 7:47 PM, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> index 51f1a4883ab8..dbe1911d8e47 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> @@ -44,7 +44,8 @@ camera@10 {
>  
>  		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>  		clock-names = "xvclk";
> -		clock-frequency = <19200000>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clock-rates = <19200000>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

(although your patches still seem to leave clk_set_rate in
ov8856.c anyway?)

Konrad


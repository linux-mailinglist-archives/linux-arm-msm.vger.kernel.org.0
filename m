Return-Path: <linux-arm-msm+bounces-53697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7CAA82F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 194693BB014
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 18:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BF3278159;
	Wed,  9 Apr 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+HdTpgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C7278147
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224086; cv=none; b=RGguyLOqyNRE3Z5f/z5NHzsbWjLpYc8cJ7G2Z4uounE1FusKupJro3nygoD7Pg0Ldw2/meo+zw7abCJRzoFMAO/bnp6lE66Zk+mevsxwuwSWYxs9nmTwrJyLi8pya5XzMjrwYLwks+7F94beMeWvI3t1//N+mkj6784KjCV6/Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224086; c=relaxed/simple;
	bh=A76G8XO3zeb5iD/DYgQmAiHYDX+OwlRFq71ay9w4RiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFDRNFZF2Q3U7lEO8RE+LmxnLPVKcjRyqgeCWzhbZAPc5FKvpmBlbHaGXS5J0HLsA1wXsOJUvLgNwEiK2LjAZe8PSjgffB9+eKVlMtGQansQEvCeihr9L0L2NZwD/Y5haNZ256rEdun8a8GQ3agpwSyMMhHH2fYJHnGtduqf2M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+HdTpgL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HEsTO022898
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 18:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GV+cfJ7GNGGjHR/3RZM3RCjysFsTfWhGkXK6dcXL924=; b=J+HdTpgLzJR9RJc6
	mCenU2yWAm7L89LiUW0y/J660IyjKd6LaoehduFSW1fNLXzxcHv3Mc5UPRRCWSJY
	NGKvLYnnFLWrkYBdEOrc7vAhgaoqNq4PAn6TL0bIxbXAqPwALoEE/zbRj8zLrtOU
	lW0NMH43rtqCgjJwV5E254VWskBrw6JwPuaFTLTOJs0jQlTVhJighlNrn+ZApnig
	3rRqGWciKj1Gw4wRXsdFWtWfQprGAuF6LsYPiuoUjxQI9LSZjLTfK14z86b/YEQk
	ga1AvdB23XAixhazqHS6xbpVTwisv6fCpaqZYv/fXrJbCtVuuoeR71ZjfXFyxSmQ
	NOiDug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd04gvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 18:41:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5560e0893so66685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 11:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224082; x=1744828882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GV+cfJ7GNGGjHR/3RZM3RCjysFsTfWhGkXK6dcXL924=;
        b=dBcgNeHwIssloivUXyG+3IZHU0ZUuKE5zhLN7vGBFncnVEWp9ESMSeM6ze4A9VScLy
         Q0lf+W7OUgOolILGpJxETyTKmq6QqkJTrKI6GNt2BioleEQJunQJ8JmP1nDOlQHrhA7i
         eA4WLGB9ZhSd2XL3Mm1sqN7Bb7/lJWU6bIQbGSUpZE/RdcUd2IcCZoR6D1kBgbXUYQA4
         RHUhUASDF2RoIlhCFQ/gw4sH0rLUXP3vK2ZsBtzzLj+kJeyhrBkIjV1iYyG09NRtQicU
         Fg3ZHtshH5GsiUSidTBPQKLdXYwO46wfy5elEpJ6Ld132SmneBlUfj2fuqbGZAuS2gRJ
         mfCw==
X-Gm-Message-State: AOJu0YwRFYuv23l/NLK+Mvbi9+3DZLnsn3jahUfVpxe/+JijDobkimum
	XsKZgeC2E8oe4poI1l5aabvXSCmat3pGIkzKclX/2Zluw7O+qGWZ7JOC26lR6Eyv7hb8YBLxIhf
	YbZW7f/MwN9bQAMz6rhFq2DRgrcQhD5X2nVljlcRiE7jziqmzeALC7X+qqaZUKbfJ
X-Gm-Gg: ASbGncsfSYLCWYsJbpcOYkgHcbgOatNfvx6nUVgIh2y6dZkKDu3KTrk2g4qIMH45iDW
	M4lBEOksDtiW3qh7HdpGZBieHmihxC9KYYnUv5SjTACON4OaPxUATUJcnTRajU+Ea25KDMeoGW6
	oOe3y6bWQZNsIGrFwhvYZyayp9gtbPSecgwEaPabGXX3Gyf8y+gWLwK/55ZNml8AuOIRQRrsYum
	CHyztAsmKG0PBpXCwwHFUKFD0HT9il+bW7i20LTiM/MxKqZNOj3OZVGDaN0v9qcRryNDlaKpNvh
	gaMlSrnmMf3i6H0pIZCkW5BLWyHDGKPFEvFQbFlEJquD6Ma7iaEwFXi25l1gU7db1A==
X-Received: by 2002:a05:620a:280e:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c79cb2956emr240299985a.0.1744224082383;
        Wed, 09 Apr 2025 11:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfdsHLhjTbUmUhDsUafcwjWCN06cz8NCJ2SisE7fVfjCUv/0AdQTlhlx5gH2u/I84DmW937Q==
X-Received: by 2002:a05:620a:280e:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c79cb2956emr240298885a.0.1744224082014;
        Wed, 09 Apr 2025 11:41:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc2dcsm135479366b.132.2025.04.09.11.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:41:21 -0700 (PDT)
Message-ID: <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cXafsHmH4LIGFg5fsqbcqtsJbbZYFZkq
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f6bf53 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cXafsHmH4LIGFg5fsqbcqtsJbbZYFZkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=789 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090123

On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality. Corresponding DTS and driver
> changes will be added incrementally.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
> +			reg = <0 0x08600000 0 0x1000>;
> +			ranges = <0 0 0x08600000 0x1000>;

It looks like this should be a little longer

Konrad


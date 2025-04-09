Return-Path: <linux-arm-msm+bounces-53702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13FA83093
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 21:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96D893BB44C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 19:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207691C5F18;
	Wed,  9 Apr 2025 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ik/xfEBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936218CC15
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227073; cv=none; b=B6EjU6oohZvbMxNZxQVmD/vySk228CWVvfyz/mYCqssZbe1ylreIk+yV97AmSqeg1nm6QaYAsL9i/0neweO3N58P/le4bOXSKIUFEr+RkLUdumwQsiXR6legv/BSQvhfZq/tt3rpkuPxsO7pSEu3BrIoK35RB+FArIX42wG0FEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227073; c=relaxed/simple;
	bh=3h2o48w0QjOK4ZeGT9FMMoj4ho63MyVRsU5z0hBWp/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVLznFrTWhS7+vrmgDdv44L7D8emoz+nsW4JC22umQwmDAdK4HBf+2Cd/ZCivJr735+dNi6O8E7G4/L0Df9aMrX7uzEqvEPykKqE29OsX7yU1AsasEgU7vlfSk1rU+TX8XgH8N5s5ikbXzCVlGER/LZ9zo4t9Xnp+7Ja4mV4kiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik/xfEBw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIr6n015739
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 19:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10ynH9XRCJ86PYB1I7aS6LqVmbsLmtnJe9E3XkJ/SOw=; b=Ik/xfEBw6FirLzxm
	2ll0LrlaShaPzjzPACGOnomHswT9nQ593DQ8CddiJMhrUecvhHHwRRNflKyD9Wd8
	Iyr2umpXrFSbN6OH0UdouTlisTA/UaGzN99rr33ZpTfeMhQi8hjhncShba2tObFK
	ZT3dHj3JTO6XGboJqlMVAPg+slroAl4JQChb7UuzyQuTOlyM35HJZTDf/Y/q+YHY
	cAwY62S760IWTdoXFQyOCGbdGSq7R9d3IVOrWwbJGipFfEnQi6Grwp+Q3xWCm3hn
	sCNSe/C+cy8Gz6e37FG1kFQETYJu6llxsqUstosIO8RFQ+uggd8EtDivb1cq8iLK
	dGoHTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2vh68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 19:31:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c555d4ad75so1223285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 12:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744227069; x=1744831869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10ynH9XRCJ86PYB1I7aS6LqVmbsLmtnJe9E3XkJ/SOw=;
        b=UDGdm7uSu/dfEmPKjZlibK0A3sRwj8PWVkWzW1cJOzHShQIe0nQOymjRemWWdwrTdB
         pOL+P7eDQTnTWp01pGGwohWjhccgbsZahN9SsWX6s0KTt67YN+6pqb6KtDyv6PJjJmot
         UXA4YLi07SjTJ6zTRoNAZX2k19yZUAI2v+FjspPHRLe9Wb+1PCJCLMwO711x7SJq5GIl
         I+nlT1QRU8m/3hJUrha1gmFHr6Uw7+34zAttw9mZKB1DiB0157AGNBmYP/8Cj/SrcjNT
         TEs7WoCkNUJ20gYdyvgj8KhS+umLPeQfXaIMbRi6HIB2fv2O8xR0xZat3ApxnGJWkaNX
         UDPw==
X-Gm-Message-State: AOJu0YxwTOKXNKhB91dWwl+iPOJhRU3XfGF8u3/b6dz6F38nbq0W9CzE
	QynR3MGt4iV8gPE77aEjJv0530/nFLzC6kpMqv8zbtWcz28CSl3ajwLRyGZtYG+0QscXBWp8Qq3
	2hAp/LUxv+7hag2AFUwP9tG6g5f2IwqrK3rhSmRq2eLeq6fZ/13TCrKYo3AdXwYMn
X-Gm-Gg: ASbGnctUpRLwT42D12UwPKTUUonPcu6FH/ezTrPrkjzp6Dv3RpEVjNg+wv3900K9Ck+
	nIINz0NYzPCsP4VrEWF7Z22u3he87VcxWN5YGFT9l6ExoVpiTa/h3YgqR/EHluHfP/Q1H+N7zP0
	rOoHugSKTIeWQsdZN1BgxR9jDqFX4kLl4z9LMfPakapFmayQFmQrwaU1E/37Jw/1vkYW5mHJ7BB
	CEvHTa/OdCTirLsG5iNaWifWITDO8reAqIrb/39cGgO87teHJl/wmD93LIXXCiUXm4xdDbf1dHS
	sv6vtKjfT9dNpRk6cawyegLzhVkxNdYfOKgUd3ThAnTIE70RvvMEDqpEdi/9SV4LWQ==
X-Received: by 2002:a05:620a:430e:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7c79cbec03dmr237798185a.8.1744227069290;
        Wed, 09 Apr 2025 12:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGdZkJ3uyM1k6il1QQ4tZzm6Kb6iei6rLgcgi9hbyDE+GWGGvqjoDJjonneM8n5/WqFQGtLg==
X-Received: by 2002:a05:620a:430e:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7c79cbec03dmr237796685a.8.1744227068851;
        Wed, 09 Apr 2025 12:31:08 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bea588sm142930566b.67.2025.04.09.12.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:31:08 -0700 (PDT)
Message-ID: <2124b898-2676-4002-8688-d3e19e55e368@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 21:31:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Stone Zhang <quic_stonez@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
References: <20250325075331.1662306-1-quic_stonez@quicinc.com>
 <20250325075331.1662306-3-quic_stonez@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250325075331.1662306-3-quic_stonez@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZarRkc-Hju-abn6Hj1JhGycpZrJydwX8
X-Proofpoint-GUID: ZarRkc-Hju-abn6Hj1JhGycpZrJydwX8
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f6cafe cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DgEYNLXXC2yaUqHi_YcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090130

On 3/25/25 8:53 AM, Stone Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---

[...]


> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_state>;

property-n
property-names

please

>  };
> @@ -406,6 +507,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		output-low;
> +		bias-pull-up;

Please flip the bias and output property order to keep it consistent

Konrad


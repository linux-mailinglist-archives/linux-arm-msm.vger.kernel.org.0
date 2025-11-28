Return-Path: <linux-arm-msm+bounces-83747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4EC91C3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BFD73AC5F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B8230E82C;
	Fri, 28 Nov 2025 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIm+vgss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZW9EQZKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5130DEAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328432; cv=none; b=P3mkn6i6cfiofrJllrxea22aUD0eWctfx4FY668R3SuEX+3BC753iGQrQ0QxAHkjakK/oncbG484rGGctIjIoJrRMRpL9z8S5REiNbhRzJd5EZvxifd9R+MQr5Ik0qi1sBHOkIzBcqIGsVkBMeWoj21Yp0x1Wc6th576HYGXFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328432; c=relaxed/simple;
	bh=PNOIvAH/nIvu37rKCxJMFHQp6pdkSPDqM+g7vkFyYkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/s4SqOS+AmZifPW1S5cP3Wp9KC2pWX06G+azQnYNkDWH+7lp1GUjto6h0QEPJ15tI/WFjGmelvdOsqC1kOLxgStW2KDEmoF5dxLPrsT7Ki3DgGkUy9xifxCPHnAQjuku7rTBIDwcqMe7N5La8BTc71Pyj+YJ4ThIgKVQOlOffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIm+vgss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZW9EQZKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8ONs63967486
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHvthnTGvIoZn2skSE+tLO04FjFG7xHzT8T8vghfPcQ=; b=NIm+vgssOeewW/NR
	PTJ+yi0Uir7+fE/ONBj080S6nR5ZoWWvB3qjMppUlOd6f2x5qYnkoNChJxpF5ja1
	HSAfk4nHHLTGlUcY+PbANSsH4xv4k7J64rLNpK3TWQ3h6i9QhQn7Lm7rcdunJkQr
	g70VH0hA1a8/5aWk5h54uj/vueHqUaPgr0/Prcq0t3saREvekdXDbUViCkjqiEWZ
	XhYq/azZQqSPgblMv9pF3wJHRnNofkt9UCxRI6jXERk/2UcGEXYORhaBTAABZ5No
	2yHrVLviALJv5FNpaFVUL8q0L3f1N/oFof7FY6euaNynl2+sHRGS3cvZgE3tFleo
	cfZXCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5kb1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:13:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so49441385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328426; x=1764933226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHvthnTGvIoZn2skSE+tLO04FjFG7xHzT8T8vghfPcQ=;
        b=ZW9EQZKvv16TyvLdVYDuVbpBwj0LNLh78hWSnT8Wq5CBw7kyjJdLOIKsIMGMw67LOn
         4vFLTuacRG4m65NOD+XGf5vnt9VfUUZNQ+ua+5mYFAQ73bbKOQv0L0HdcumHIZB0qfGA
         c94jHJ5ZC06IXp7wTCihXD2HQyvVJW031QVh3X1IC2eE/8dGLoaob+12Imq7Ck4IhoJc
         /x9qqxlyMWxlEcFu72/XhKECIwpp3fTUI7ajBGHJy9zj4eypuu8O69J7lWXeuX10P9lx
         0fGCH0KbtFnZwyW8jE7TwZxqc0mVuQFahlvg1/8Y3F4C0LGVcFoOhmnrH8YCdpU/DqzS
         DyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328426; x=1764933226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHvthnTGvIoZn2skSE+tLO04FjFG7xHzT8T8vghfPcQ=;
        b=GMh1Yk1ZfAm9N8xHL1UTbC5DfpiDG9Yo/3HBkaAH7xiwBppCDfhkt3ZsUbIz3kqsZ0
         XRcgpUgT3VmudZFVnSBF26arwIe2/9I/cqlApPjPGoM5aab1U97ioPdzrHxklT7OXJFR
         SyMlXiaiq/ClQ9bYWMFaguoDCJPFuNLDrS+J+KubAb2rFg+W+N/r3wFsT8Tnwpd3+nUQ
         OXHCVKADG1qCVBF9fF6DaaaCUVuJaTj6ew8jwKtGYbUp5i+GlHeHR1kwumOp8d6wuA07
         f5x6u421XBbGc2XnsWPusWcgudB+H3UvGra+pqQ61+jAw7bLtUeYRJSxZaTBPKYLgbvf
         FS3g==
X-Gm-Message-State: AOJu0Yz84RNJHJ0q5KWE4zyWkapT00n5C7QojgkaTejBYSteDvt46HmV
	/pdJH1gAie8Q122NhLC486eY09CI27SxMLfVtlgwAJP+eYpVBd8YSE/4DxO/n8JEYEqPxoOluLO
	+C4R+g3yVHSB96JhanmKi2+1afS/LKBK5gHxnt4Ff/ZWzolcvDpnxNQYdRvrFuiOkPE7O
X-Gm-Gg: ASbGncu2OvIriP8CDsEMjC0tEF4I/OI+M+IZg06D4ZILyvnvJ7PWngisu1d9jlk0lAm
	n+jsqZy1L+VEqxZRUudMjLhk9ClUgkFYKf9M8h3ttu0ljIEgzb58YZObgU002zMu+D6ZP1B+tVL
	hYsW2FIcOr+/32lTUk7639lSqCIYBWS0zhorwLxw1Is0Z/J++exT7fUJX9biuY2P+G3THjGaYdm
	HkddwIF7uirmzFzsnyn5iMbO5AGyNLO6ZmEC1bY5kGsK8ag3H3l0I9CWTWcS8a4CClGTZjetLs0
	sqEInCEjEnlTPKUvFK4V5DXUv1ScOhrxUgP5aXs40jjWuIT8A/B0pOBYuQVAw6O9BeOtqdExEVe
	eDrzsDWDxu6kgiTyF5cPNV8bD+W4eCmukoGItEfKdQ+0dcK0bKgbEjPztg3IlGoEMvdM=
X-Received: by 2002:ac8:5dd0:0:b0:4ee:1f0c:c1aa with SMTP id d75a77b69052e-4ee5b74c2b0mr261631421cf.7.1764328425783;
        Fri, 28 Nov 2025 03:13:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/nC+eNvFIHiFHeI7cM9UEjICNrOYXC4eUs6buDAfMAWxvV4zcNSlfXw4LjIh81lXsmnbnoA==
X-Received: by 2002:ac8:5dd0:0:b0:4ee:1f0c:c1aa with SMTP id d75a77b69052e-4ee5b74c2b0mr261631061cf.7.1764328425374;
        Fri, 28 Nov 2025 03:13:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035d4csm3927982a12.21.2025.11.28.03.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:13:44 -0800 (PST)
Message-ID: <dca3bd12-1267-42a5-abeb-14cc42970134@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:13:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-3-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-3-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DadN6rMeXuL72AnvDyMyGrkGNEWTq-13
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=692983ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=PAAiZjNMvmahcd2zdhMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX75Rr/chCWkoi
 WWU32wxB2nVNKKWKMHS26Xj1gpJD4+qiolemMZOV7bZdI8OeCDr96r0BY8Z027/YabaxghalfaC
 lLZ8G19vUgkyobqykZgwhczP5iAsCni6oGVkEPxkr8iFinofZ8znkmyHW9cfb/N6ioqjvfhx28T
 WRgZasBKOXln+XkY0rljhF+uJAleqU5bO93q1Diu8qlxkqxOZYoBQoijqEhQ+xHcCkwHckzpH5C
 ITuUl8ye5J8v+XkQsl4DTN0Hrp5ASaM1eOa8mGIBa/d5Tj0yCgNifUbgmViaNSVM85aQZq9CIAC
 XHxCF6vmf8Dh54oLpXgeeT1dcDGkt7F9v4oLuIhx5qlGIGMOpfmiWf4XKvb1HXlCCJtYJIFH5s7
 OslC5oS3Z3BUu0myMS+bzFdwJOAsBg==
X-Proofpoint-GUID: DadN6rMeXuL72AnvDyMyGrkGNEWTq-13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/25/25 9:12 AM, Paul Sajna wrote:
> From: Christopher Brown <crispybrown@gmail.com>
> 
> Values based on lineageos kernel
> 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi
> 
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index e530a08f5e27..fa048937e396 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -37,6 +37,14 @@ key-thinq {
>  			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <3000000>;
> +		voltage-min-design-microvolt = <3200000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -63,6 +71,12 @@ &mss_pil {
>  	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
>  };
>  
> +&pmi8998_charger {
> +	status = "okay";
> +
> +	monitored-battery = <&battery>;

status should go last

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


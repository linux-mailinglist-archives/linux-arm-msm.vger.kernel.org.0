Return-Path: <linux-arm-msm+bounces-85504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A786CC7A52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE2230821EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ACA341AC0;
	Wed, 17 Dec 2025 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msdFwJtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqB7d9Jd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BB340A6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974831; cv=none; b=Hthk8R2gld9gi+nzgDpYdk+frEHaY3WpRZgPB+5jKVuMcHuKFBrORo+0GI/45pQEZc4iCeew7E4FBkSKxYTCFlbwq47ZYV42YlQvNAIBBa3ulnRa/VF7f2VnKlgjLbz2uwlIwn0Wqt6jD2YXuBFW9kgIlFU7rSQ9AJvMUCL9Gtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974831; c=relaxed/simple;
	bh=W5LbVrER/4MQ3huq1FPB87Z8nndxc7Q6T5WHeYstCRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3bW+xsAjfVmVD3kzkdw6f17V3lw3CQirYeur7SEp1aDxLlm4s+qi8RLewACK0WOT48pHMXpY2C3L/uGl76PBgF7UK08OoaAq09H/V88tNFXVCKx4B5VLaweVjWg54kTiivTEi+1i0W0u0OipA0Ir89Sj8gLYVho32InKNckUis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msdFwJtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqB7d9Jd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKoTA3203886
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+eepty2GEbZjWCqfIdDh4E9+TNhmUtMFi7Lb5wrJJ4=; b=msdFwJtK2eEI5rLU
	p/QN+Xwj09j/PXwoK95TMGnDl9lMf57eQd16DufsoHjyJ2nNSKbQchrfF57uefkS
	QaedLkJgc9VlBz2hnRT+YsF1VDthh6X1U15MmTrljs5Sk8q1uyK3Ki4jKHZYlJ5j
	ykx5fbXUjZdCSGVbW8y6qmPNRzNBhELVPiXpXwq4gohFGbg+DlLGq2BUzJYXv9Cb
	RX1TVPAl6p2xABROotk/gruVbajHQ5E2V75VCJgzfC+DGomZxSoPMLexOyoUlDCo
	athvM24WKYnBfYUpcRRQw2dCdj91LSUJG4JSxJhqVR8eZT4dQb+RbHTSoG5E+dGd
	Lpk2/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39j0ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:33:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b196719e0fso131354685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765974828; x=1766579628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+eepty2GEbZjWCqfIdDh4E9+TNhmUtMFi7Lb5wrJJ4=;
        b=gqB7d9JdVz4Og0nx2Yeyd+wmy+Ia6+SumLiWANXMNWobCjuoVNHNorSQhEYB6mMYpT
         RieHCYmv6Cge32u1VIgseZWZ19hhM4ZLh49NFky35kArPOJDgzJPAiRbGtD1YF6OI3Iy
         H1qJrXT4c80K62UZQ0Odof56xKq8emgiYScLcVb7DpYrkKg3J/xmxNyDIeFpMDZu20fe
         PkuWAU7dGM9zftWqJe6qOhnM06L/OfUSfBg/Yst6VU7F8EGDmmVys29Jai3GUkQ8EDP1
         WMrEtzlnxJxTJ2LbaklZfvUt1lb1opd3cJknnljhTYSNYrnRKZwd2mTYIK/pccYnZrSc
         RaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765974828; x=1766579628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+eepty2GEbZjWCqfIdDh4E9+TNhmUtMFi7Lb5wrJJ4=;
        b=h8Yip6sJBQsuYR1xUoIoY3ay44yyrWzKZywIh1REnaWsSJH1l2ilsQ5IMSxiDJzA0N
         q+zDuclOQcWgDMnCstnYpG1C34YePuDmdvWuGlhGkyo0/ObOXtat0CAZvR74pKQODEOZ
         NgbfucStXFDQOzwMgpn7e8lIRKc+1EjHDJF97Rx5lm9rjfGNUU9Pt5G4VgOFUCjpc/+m
         74psBLjaSnG5jTkp7Tjs6YAReeFWD9BN2asmt0izQfLSp1O0X/ENoUJGvuYnB36seEgc
         RQ1jL0RAkLMg5r8IOJJQvE4J9sLX4kORian7vZ9wBm2aMh8ycrUkKXpHoy5lEZ0TjHpZ
         ZNzw==
X-Forwarded-Encrypted: i=1; AJvYcCVDB8OxNWHzh9cjQDWOax5KAk023xexvk3T7FMDqGX0bLE008XyxzsaukD0brhmQIZfIA04Ja/EjrOYKd7f@vger.kernel.org
X-Gm-Message-State: AOJu0YwisPV7ctBczrbZNBbnq4hIIv6AJ15wZV3ohGQyjczco2W9/It8
	R0a9DLFKRC5nm+bwcfciZm7WBhitZT5agZiVvVH8MhQyrh7ElP92/2MSUpaW6P/AbJ/AGhh3ACB
	/eNrj7mTpJJWOk++oqIyTdXxYVG8ugBQYZwh7ooqZzhi+BcxyVB56LskH6h5zkQh9FZ/DG7wIGU
	zK
X-Gm-Gg: AY/fxX4xoysxUb0eJ+3VS8l5xw3wtjRoXdx5B2yOrxdOzoTNh+P1dW6txgt+GdnxAxV
	n7+rJ7kresOiXGBwkOgZnUnITRIFABGStuxoDuTsE67ojjyjndqMYsdBnluGxN3iTCqi5X7EUAB
	UUufZPt2QZwvehlUq+Xrv7FzE2D/yVmjoXQvjNd6twGc+wjQmYIWRhCgpIBG2vLJNCae7JW96t8
	XppNPkhtPILatwGeOAxs7743FDQhI+xEI4+vXqqfJBr4gBtmRx4lNm2T9SFCmOVn4Fj8+wFZ71j
	GLma9eiL8HbOWHTINeZ/yZVPZqOoBcCNu0eFqbtuDZ3KNhMX03UbcFQKCu49pnso9OVXee5geDS
	lWCDwoJtAGBNdbdtZsbZ3Y3B/2wtQ1WyUYH+dKT38jdGmhFHnCiw1dtv7Ov0wESgxlg==
X-Received: by 2002:a05:620a:468f:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8bb3a0b7e5amr1829640485a.3.1765974828074;
        Wed, 17 Dec 2025 04:33:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjZW8Wo0hAT5bXm597qkRAL1OB44PWghWfzFgRWiINyyUR7rC/ty7W9BM+oQO1rvQ2OHrkGQ==
X-Received: by 2002:a05:620a:468f:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8bb3a0b7e5amr1829636885a.3.1765974827587;
        Wed, 17 Dec 2025 04:33:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4ea67esm2365765a12.7.2025.12.17.04.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:33:47 -0800 (PST)
Message-ID: <2d4953c6-184d-423b-80e9-871c6e00da35@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:33:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio
 playback over DisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251217120051.98198-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217120051.98198-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NyBTYWx0ZWRfXzOkN5YzPNI0N
 lNMQb4tLUYK4i4h2fn0fVfBXcnbb1ny8BCWokuRPegGV49n751jX9db72ZOsLsZcdY49JO/3WXH
 4KkMUQ6C1Sma3OdcMrsf+75icdIg70nrd1mELQzxjn1ybAFJbgMtMAS+po5TXrC+AvWZaubE0oo
 T74PhLK0rzQnpoIQYjF90ivRrr76oq1KWwJuFQ3aOrGuTklI7vDHL0IS8c7laev0WBMSKWSW8ZO
 WMFYaLgnKPMupMsedfAaOyKdeKMcuYx/RecYtBMxnuoLNvuezF+oJJrk1Bx2YAlXBQXfaKC6EJs
 EcIWbUkJahCeEfckzwvOVclQrKN9vbjhptKjnJQiw2RU97Rv+Bk3ZvS0D5pSCq99R+Zbp63/byJ
 dGdMAUnT9llOCzB/pklGotOY7VLeYw==
X-Proofpoint-ORIG-GUID: iT3RJHSx6ZUIQNSw21a_N9LBBl_ndmNA
X-Proofpoint-GUID: iT3RJHSx6ZUIQNSw21a_N9LBBl_ndmNA
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=6942a32c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=PIn3yDVZNjJHwrb619wA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170097

On 12/17/25 1:00 PM, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

(something's inserting a \n before --- in your latest patches but I
don't know if this is a problem)

[...]

> +		displayport-2-dai-link {
> +			link-name = "DisplayPort2 Playback";
> +
> +			codec {
> +				sound-dai = <&mdss_dp2>;

How does this work out with fw_devlink?

Konrad


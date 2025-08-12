Return-Path: <linux-arm-msm+bounces-68645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDAB21DB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FAF11625D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E941A9F9A;
	Tue, 12 Aug 2025 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhrQzbW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CF26A0EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978130; cv=none; b=OzhlHLFmpLeQtB8kZWOtc5mETV13rcFcvm6a20/i2wAjNejuK8mKqGPvfD9e0qpsUWBiJKUzftudg3EGdVy0mOPRu9VXtZFOeJs4Sclpv0nYKYGX18XCaK6/CFl0DV+ImmnAVwyhI1GJc9SBGgJveTF4J2oBOj89+/gVaQppi4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978130; c=relaxed/simple;
	bh=jVgCYfXMSjJ/9fZtfupDTMepf8WIhFofQBAD5wXcV8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9vF6DITg+8qX240GgNgLmLVddpoD00z1MBo2IgasYj2eD7Jr86MXidr1HqFDgC/4h0iRk85967ggtaZHyXGHZyrVT7ouqpUj8IpkTypG2l8MHpFhZw0BX53ms/RQkGpjvA/iJcuRRtF1gXM8VU+zVHAqm+eFKR4A7SItwIv1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhrQzbW/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Y4dG021817
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XI4zA0XPEeDju8LmiA5iAEsb1GjF7x2tJZG8gRPEHcw=; b=FhrQzbW/vDlM2Zam
	Aqq0M+z7LFXJEmSTWYT1ASIuluq9c7fLPwnTy1t4UJX1tW4jKcr6HQpo1wnrTscE
	yZG0t6M4qhQWvZxDXzV4HYqnyKnlbIqZyrbq3oycD29I4myfBbHAK/yZjLDqLyVP
	6JSfbbT8ZZwqw4MqMfcFnhRvFoq7/29rZH6fckzUnzL2D840tlge4T66xiU+HV4p
	CIed+G5to8rHqRsMDn392U5s0Phk3Yk7hsHpnGYUP6gvSFeQ4vHIva4niKR2m6CW
	p7UB6D2ycgRGXSIy2LO/3DplyYSVwbrvcB/8OdA18++tdZjddYuR6uB5Fv2qea0a
	zpNraQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g6xag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32129c65bf8so5774859a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978127; x=1755582927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XI4zA0XPEeDju8LmiA5iAEsb1GjF7x2tJZG8gRPEHcw=;
        b=lVNEX1suwNNOqVMwo5l9NVeakTbnecxTLoq3qNqyfFbvZkZlAfFHGQLrglsSFr08JK
         lbO1S4j4GPIkKmwg//CnRPW1990T/L2PbyWWeblAlQKsXABIib/jXg4VoHwr2FcWLTzo
         Mmw2cDYOI4kceCW70lyMoZGllJCZSsKtI8fpKI2vdGKD5BoXNlxCERcQPQOP13tT6kob
         /Jc/NbG040Ik6rB+jQ6CyqJbX+UihFfJu7y6qrZfGuFxB40FmCT7rDhQqZ3+6qq1uBSD
         rfmqBzlzd+ospKbRv+K9X1IgFdiiQ3fy8Got8tyh74z+A5J2bZdRhpij9CU+yPBdDyjY
         s9vw==
X-Forwarded-Encrypted: i=1; AJvYcCXqDfezAZkkBaAyxH15iS+HN2g7UA+sUjXlUhNdlUQ8rlV/3glhMuQZK3IouBfakgDRaz5Vhz9yWuDTAh3+@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnIMj9DhzR8AZ71MwqijuDA6Vm6EsRbaoSE35i9mgmy0ueTfG
	iMCyDrd2QzxXiDNMru1mY78yyNWh6V9X2Q3MtwJAlok5YW5uBOq+/SQ9ishRaBCtp0usLsQR53P
	WBlCdlDsS9wXSaZB9bqeVk2RN9dzDjmgoqkE0QhBg1tvu9xA+KMGicK0lXMx93dvndDZ5
X-Gm-Gg: ASbGncvz1ARN4/US7N4tBR65GRnSt+tIEh6ObxeL8onM4gFPj7wQ1sGKYD/BhAgRt4L
	0tx42hvhclmndqOlQcgXi/IYSCe2PrySzVm0X9ZNVORXj8q/CiEbub275JgRNikY4n5CRkPtzKt
	o+mChCp7GJrULkBJHlz/PP/RuiH4rEDqtAMwNAXf1loI/tME+yuX+LP3thNi6g0aveku64r2p9u
	aSLCcoCschoEoJL5m+DEIfjKJs6faMTAAxm+a8R0oGzi4PIAfr6JchTuKczvfxO1xRzs9H0BNm2
	CH+GSgWFcaQgj6mhhAk0B8uRoxuH8YcJXPWRL/MxnJtJHuShs61h0wB9L8lKh3SEx9WOhN4=
X-Received: by 2002:a17:903:2283:b0:240:9a45:26e6 with SMTP id d9443c01a7336-242fc230f18mr30549685ad.10.1754978127361;
        Mon, 11 Aug 2025 22:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/YPzCOCkFvG1QEpOcPR/+AeqBulYJ1CpcEiZvOMQ6dowlNrMRbKyFgKjMlGH5EpOo+tkUlg==
X-Received: by 2002:a17:903:2283:b0:240:9a45:26e6 with SMTP id d9443c01a7336-242fc230f18mr30549445ad.10.1754978126934;
        Mon, 11 Aug 2025 22:55:26 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f15092sm290447335ad.66.2025.08.11.22.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:55:26 -0700 (PDT)
Message-ID: <d1cce1f2-df38-49ea-ab62-a1397be4e599@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:25:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] dt-bindings: misc: qcom,fastrpc: Add GDSP label
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-2-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-2-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689ad750 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3zBhIfn5MegWJkNBbEwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX+s+5ruLL2cg4
 k0wAXL219CAKeeSN7DZlUiliRIQN8SnGpyKS7/cUuiBc2/va8/e5XpSYX/qGDkRVD1mOIm4lkoG
 C2Su51lAQyyM8VQLd4JBcJZT8EP/Egrks4qIZlxfZ1E4TdnmofsT65IZ8AfXOzPTLg8rG3siF37
 A7BXgk/kabLaMAGbVwoaU5VtQFCG+bc82dlWbINqG2rmL5nE8p7j2SK+M3ti39EuiQx+I2parOi
 e7v0Vlt7ze1jB1fHk0uY6eNltOlnPV66axk5U3iaUl3pPVfD3IcWnoHiU2WsGs4bqEmfL2q7e4f
 1fQTyid2aOZvuK4FSXuR/oWt28ew9DHRumiDPFafrmxxum/KguCAx5m9pRToRPfj5YR2KjdkI9D
 ELgb5Aqi
X-Proofpoint-GUID: 4_9nuL30k2toVD1WbUoZUNcuoMmnCNYp
X-Proofpoint-ORIG-GUID: 4_9nuL30k2toVD1WbUoZUNcuoMmnCNYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 7/16/2025 6:58 PM, Ling Xu wrote:
> There are some products which support GDSP remoteprocs. GDSP is General
> Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
> and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
> fastrpc domains.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 0840a3d92513..3f6199fc9ae6 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -27,6 +27,8 @@ properties:
>        - sdsp
>        - cdsp
>        - cdsp1
> +      - gdsp0
> +      - gdsp1
>  

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

>    memory-region:
>      maxItems: 1



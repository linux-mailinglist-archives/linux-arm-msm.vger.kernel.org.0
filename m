Return-Path: <linux-arm-msm+bounces-41801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713919EF425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B507290CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4A3225411;
	Thu, 12 Dec 2024 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNomjwdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55550223E92
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023053; cv=none; b=Td62/rUfici0b2VZHJRBvjsihEj8NdzBphRFOlCy+szyIvoHgXYLPmDxftq0v9tXkjc4OzvSnZZqH7SJRTALN9h0LioK1Q5gXxKdc6i6xDdmMoxthkPqa8x02gSDWf1hDTZvsxw9g/asQsCmIzNRE9o+7vXqdXeypEJpoLFd2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023053; c=relaxed/simple;
	bh=rBjwzO53CbAB9t5GEYSOjc+7gazVend8nDzOa2WOHHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APQEpu94JiGwJj6GfGjEoX5z8GcW++VrkuyhHcycBOsgppilfOgE9BMD8K2k6GWJDUQ0JS9p2qfvIu8NrhuBmjxQo81vzzJrKwpy8/IUzCm3xVPPwcTc0VJIHMUm+IWRzyd2xI/yvlxN4wgB2RlgKbwExfSw3gRnj7WdTlNpR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNomjwdY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC83qPp027780
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNew4i/yxHEuenMoncvUi+FNwXBhAQ4xpLpoY8gs/d0=; b=CNomjwdYP/mLl0vy
	SxQHxGb2CceC7C1jcS9jfXNg08Sk1xrxhj4KqbjntBJ97uxztDiJnPkoXL2Dk0Gz
	CUjSAz02PXqbEcaHiHdSxir4BWu96neFQhYkiB9F+Z++INm8VgYUt1O49Jz7GTYL
	AhXbhOBudN2rLZrCPE6oxkZjIJ26eQVYxXxabqeSbQLT+D98Gp3eEStO3xM4NXF0
	ULT6WRCm2Z5AXm/A0DtD3XpY9b9ujOSZJjXE1O9mlrAsc2EVahBSCf3ILniX2u8t
	2oL4oDt3MFLrQ5mGBG6CZgHBhBg2iNR1YxMkSr6tKp5ijJ6i/IQlP3IO5CHhnYXf
	cJumEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40kptc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:04:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8f8762a69so1785086d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 09:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023050; x=1734627850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNew4i/yxHEuenMoncvUi+FNwXBhAQ4xpLpoY8gs/d0=;
        b=fl0JExv01NoBsDYsyCOtgIbK5yyYReYL+zL5wC0PdcwdKD1BAwG+NE6vYMQQEui0ae
         FDSZgwOmyWHLloh42+7GCepmGsD02+GGV+H27O282/cCFMZPfzlQ5Hqq4dqbxGmkokWO
         rWZsAtl1mRyU5vK8lOr9Z6Ela/KmyRzhEgJ2V589loaZq07kb25NSEiazJwfKmuDxviS
         +6PgE+t9Hra7Sc71JoelsMTKLouzfQKfSOWILWJ0NobClT3zOAocUHpZb+9ht+h3uBJj
         YQE87IJyAFjwf7Da2Qj/BW/8z/nER2uI0ZRBhmhBqNggzvEqIOWj1ducgz/ZzMrke+ki
         4kdA==
X-Forwarded-Encrypted: i=1; AJvYcCVSKIw9CoiG/lsSkeaLoD1JpC/u/REHhy7dfHvhaCBKher0sNPjAZq/Oc0wtsV+xt41yzkzg/FBxHQYKzOK@vger.kernel.org
X-Gm-Message-State: AOJu0YweWDMhFIC7tlCeL+BVE1G9vtIUtuAN4W9JbQGyG6ForN7WlG85
	AYTlJ31rq/FhvYs7r8jPeq2faWxdYtyBXaLJ0t3FDnkEkgXaI1yngU6UlmmKtoVJBgpH9Pd4IIy
	t1IDqi1zLk2aK/Yw+3c58A6qRJwNidPuVj2F6NTaq1kgnI0mVc/hKD/4VxgyZBLs+
X-Gm-Gg: ASbGnct/y/FlRIX5oewrSBvNSXSBlu6jTWXcE5lp8NJ8GInsSxBhApznvTLFl/l10mK
	i55yNmLzssryX7GXXPDdQ5xHNWezsNJGaXXhCkg2IlB23UkTMK0EEJPTJgx4q2W8gwLEp8zoFzL
	1dUVG0Z8OwBRjKbBt4iLKcKwloFY2lhq/Q3Y91M0i5oiR90lpWBUI1rMkYk1ZKrjBOoEVSEBw1w
	EHz6XfOKM9piQz/kTJt/4LARvp+iB8A04C0x3mzTwhvselshhwK9BeYY1zkfPl2XFgZ4d8nUqR0
	Hm5gaOCAdOo0w0/Cj5x79kxpJzakG6xCdaCbUg==
X-Received: by 2002:ac8:5748:0:b0:466:88ba:2026 with SMTP id d75a77b69052e-467a16def05mr6097051cf.14.1734023049826;
        Thu, 12 Dec 2024 09:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8vgfWWK+oQ5exWPFkUHGzlUOH1BmQ8/OxS0NIBoRvTTZC3B/uHCd1ekuzkScTL2816D1C4Q==
X-Received: by 2002:ac8:5748:0:b0:466:88ba:2026 with SMTP id d75a77b69052e-467a16def05mr6096841cf.14.1734023049283;
        Thu, 12 Dec 2024 09:04:09 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6810027c6sm662648366b.104.2024.12.12.09.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:04:08 -0800 (PST)
Message-ID: <d41df236-48b1-40fb-a19b-5d7024884186@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cFfKeu2ElADdJ7I7IcFGBgqwnwNpr4l3
X-Proofpoint-ORIG-GUID: cFfKeu2ElADdJ7I7IcFGBgqwnwNpr4l3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120122

On 10.12.2024 9:23 AM, Yuanfang Zhang wrote:
> Add coresight components: Funnel, ETE and ETF for SM8650.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in v2:
> - Update compatible for funnel and etf.
> - remove unnecessary property: reg-names and arm,primecell-periphid.
> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 165 +++++++++++++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 25e47505adcb790d09f1d2726386438487255824..76620d478e872a2b725693dc32364e2a183572b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5654,6 +5654,171 @@ compute-cb@12 {
>  				};
>  			};
>  		};
> +
> +		ete0 {
> +			compatible = "arm,embedded-trace-extension";
> +
> +			cpu = <&cpu0>;
> +			qcom,skip-power-up;
> +
> +			out-ports {
> +				port {
> +					ete0_out_funnel_ete: endpoint {
> +						remote-endpoint = <&funnel_ete_in_ete0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel_ete {

Node names must not contain underscores, use '-' instead

Also, nodes without a reg property/unit address don't belong under /soc

Konrad


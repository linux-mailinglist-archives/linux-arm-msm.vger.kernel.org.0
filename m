Return-Path: <linux-arm-msm+bounces-71871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51CB421EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25C41887E3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD36C308F11;
	Wed,  3 Sep 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsmQHOXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C527301477
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906651; cv=none; b=jC03eUW+0OhmD1CuFwOM+dIcVA0AgpPCyRif5FRcGG+GCX//wx8PsjpG9HDkxe67iG1Uq0zjAYGv+LjDG6ey31Dfc7RH1iFhznsw5ouV8zQBMwnwQsGhlWQAqqLV3FqbnwI6gGfLQ/tPestJ1zHuf0U1PXO6L0kTIl5CUtcxlTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906651; c=relaxed/simple;
	bh=tacXb3I7sD82JjGMbS8Dqgx1hL17l0hk8fOJ6PMQcq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjwyKbHbjWEbR+djp11kr6Yn1qe1SDA6mh5Wr2kMgjJ+1CjYPRME9AROCdTK2FKJwIUdIJW5S0LgvUluZJ0B1Aadm1l6UovY15AfCJPN4cj7gUuQqx1tyPX2HWFNR2cHEmzE2UYQqZh1xvZIjPCM6+aS/5MRBP6UMLSnqV5J9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsmQHOXI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEutu022405
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 13:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6WxjVs+4qB1wpptnxje/lLl2BWE/gnMjf/dmXAtLn4=; b=LsmQHOXIM/ofd/2i
	Gk9P9qYur8B8+LvatykrcBUBrN7ecmvdxnI4IekSsM26hRqjzhy0Q4lcw0+tH2XD
	D0PU7/PjIpqbMxMLzKkpC765oMelSfI3HaSgloqXsqrIyKinaOLLokmJdTPcMf5a
	Mfi3nl5T1UWSQQeyjQ+wTjpwGnIEYFwcg0YqaCkrNjGZseUL9enRcIWi1FubdYzY
	WY7iS4wDK+vvi9vkP4fmqzngE8oZDbgSc6mlCDJNA0ee4UAyr/Ju+GF01dZ0jd6Z
	Sl6Q5jJxYrn6RWgNABOffNV1vPKQA3BtkXIUt9Z6N5mWZjCBQeQwpTsNk+qIGdXx
	VlKBnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkr00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 13:37:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b48f648249so3065461cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906648; x=1757511448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6WxjVs+4qB1wpptnxje/lLl2BWE/gnMjf/dmXAtLn4=;
        b=c9LRSSWV+HnqyYQG/iAQpxUiVb+OkdNPI7rTQ8DE7Kwjk+zhzD9Uz8S5G9dgjFFwS2
         aStBSAEg48ESQsBf2lRDoxUvI2H2XRWW25o1bwUZ5VwMPc6U9r+RlJlTsntKuc/5LLi+
         waBRMWUaJQWTDXEDi+HKx42vQ9G9E4OBbAE1D6qPgG9B49HlIp+8rzjoMrODsdLYz9RQ
         6l/hYyMhRlvpR1ToeSWlY+aDDh1Cj1j5iE9H2QJYBaXRmw4/LSvLsnd9HxvTRoMRYXuf
         wSvuTE5orQ4MtSV4sfsEchD5eoMDoWfGOunYXvRQSiQJkQhhZKRk0Hx5IlAVQWivnQCP
         foug==
X-Forwarded-Encrypted: i=1; AJvYcCXTseP9slp4uWywfGdWZm2y8fHHk7H8Q7KyzeKfEbaQuqsnWEfeALAm7YiqdA1YCNjXiPX4eoHki9AuXpo7@vger.kernel.org
X-Gm-Message-State: AOJu0YzBb4zNmeIM8EDzHccIxngOfVqPzIwb47pI0DDvrgqe+DNkjyyR
	VnUC5MLtANTr/S1I2VM8OHclUeowWur5ZG4XBDSJhNBSyNggEjuzbB7mg3rBP7c7TwNf9rYfcL3
	GduGRwmbMPKLxZOLitftPOzZljjYATWuJYX4tZgdjwRreDEQRiYn6j9WStSvTunMFDEnb
X-Gm-Gg: ASbGncuY3z2nIzPODdrBTO9WT63yFNoksdJUh4F1PMPEH4Svm1WmWj45USNjUrHrtg/
	gnOqPsBvwdPirw1vy4b5/v2alMa9F3xsVtR0Nv64ZfdXQ3V3r9ka1xF9AhBzGsP/q/gquuekkVK
	038acvCWAteNykhn557OniIH9PAPZguDHQXvIdoRZiaoftisAz/A/FApDeR41roFYb2rziOYLow
	icv/rk3sEx5yGQwx7tDy2VmkbuIE2RPS4Qx2rPZTugIt3OagVfCd5Oh5nOCistCI/9HxzO6a9XZ
	5yUCSWsD6ZZksTX7bx1nFVj0lAPEeE+j+E+Okm9Ukc0gb8fB3RqsLtpk0o9YvM9r17ZzoZKQqdV
	/PnV6wOZE3xQL3GGonHD1YA==
X-Received: by 2002:a05:622a:5f0c:b0:4b4:9655:9343 with SMTP id d75a77b69052e-4b49655aba8mr8680451cf.3.1756906648231;
        Wed, 03 Sep 2025 06:37:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9aESjDi7u3ikl+t7p2SljGJv1hsVA1MO3GfCrupQw910Ny+G82IIly/jBPP+7T98Yksz3kw==
X-Received: by 2002:a05:622a:5f0c:b0:4b4:9655:9343 with SMTP id d75a77b69052e-4b49655aba8mr8680251cf.3.1756906647585;
        Wed, 03 Sep 2025 06:37:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0431832a98sm699384166b.80.2025.09.03.06.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:37:27 -0700 (PDT)
Message-ID: <11155d6c-cc11-4c5b-839b-2456e88fbb7f@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:37:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
 <20250903-phy-qcom-edp-add-missing-refclk-v2-1-d88c1b0cdc1b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-phy-qcom-edp-add-missing-refclk-v2-1-d88c1b0cdc1b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX1EPP4d9WthEo
 lxIV9GMlJqskae/gGHAPe7/O5VGRlmDoibQquxcxTpdh1HAaUehFWKhOGe2zcFCPTpWgK78jSLK
 1Ea4clgMcqDPqnP4di3PRFj+ZTWzeKtT4Tlkd3X1+wDEOQ8pxW4FEWcSs/U6y1qHiwiiNR8t3bp
 T+j/av5ZXyT24iV+OtdIzWBcsqP4LUrXMZdyYAlHO5ICHka1b7hCUWL0f/KXpmGpOCV9I+g3ORS
 w3bs3OIrCzkmK9I5/Iurri691R4wDKqqKpphb9rRcMBK1JCGA5XVf886tiP0pihU0vFrojvtes/
 9VyLZwVdtlxRwOH+cr/Up+vnKyfG/8rYB4Myh8GUAYzZfUUpEw6335BTVy1YwpleGIxiIT+8XCu
 hlidirXZ
X-Proofpoint-ORIG-GUID: wSrmchSKtXWVaEhAZBlRcoyOdqVr10RJ
X-Proofpoint-GUID: wSrmchSKtXWVaEhAZBlRcoyOdqVr10RJ
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b84499 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=D1QSBg5h22RYVcxFYwcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/3/25 2:37 PM, Abel Vesa wrote:
> On X Elite platform, the eDP PHY uses one more clock called
> refclk. Add it to the schema.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index eb97181cbb9579893b4ee26a39c3559ad87b2fba..a8ba0aa9ff9d83f317bd897a7d564f7e13f6a1e2 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -37,12 +37,15 @@ properties:
>        - description: PLL register block
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aux
>        - const: cfg_ahb
> +      - const: refclk

"ref"?

Konrad


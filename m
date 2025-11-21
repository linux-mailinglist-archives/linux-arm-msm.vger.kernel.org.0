Return-Path: <linux-arm-msm+bounces-82781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75093C77EA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 021C54E9549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 08:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2032DEA71;
	Fri, 21 Nov 2025 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KD9bAmfj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRrW42jz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6425219E8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713594; cv=none; b=rYsKUKe0ToEQ+yZ12RsBs7WEA9x4h2VHQkCvZn5/2ztQorS+xie/Qv+sxeHxf4NfaFPzyheVfhG1b9/nR+AbtMUj/rXj+HKt3AzsKXJe8DmuWQ5KkJmOJhzKADxIkc0EVxmTDsgKtkyjqaCmbZisKGU4r6wgMUnNG1twnzZv+RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713594; c=relaxed/simple;
	bh=dwZ/HBx5N/4Tsdj3qtzdhXxY5baXzcYF7+7VZ/HQx8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJTpfNuwR+pzvHgxPJiL+NEJ1estv3wdA7T67UrmQ1YU1UW/tRDeagb8FNZyS8DuezV6RZotPOdlX6sUMTyv1UKTD4EXbb6+aXJv1tx+5QPywJq2DunZ2J+2MCmqKf7VwiH6GfLdGI7x48PBMRwgeV2zjZJbusUfEa3eKs+jJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KD9bAmfj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRrW42jz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL3iAN52746815
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=; b=KD9bAmfjVeSQMNhz
	aKM2odgIQjyQsIsAj9obGtypuV/E0VdiLaiXvcX1z7A/5plLM0IS0Fso5q1eUGQX
	SQZOq2EwTbFRXO0j6kqWdiMSl5m6GlKslrd3PT8QtmgGzDM1Xm9nj367Bl364bmi
	tvGuMBHuGpJLNNnffaqyXr43TrkKdLu+cFmwxlS/syJ00Tq6xp44ZnDMw10jDsxq
	OnceEVs3voR3Uzs0WxiaxgvgFVYHXFRAyAJAwF9TGq34LuPD43Guz4/pdIAfVNKn
	7FHZwy7x6JXtqYZMCLLoCefWM9jDSPWHykOVnHnRv2Lni9TDSTWBLqsqdbxm/URP
	+ZNGwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh0r3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:26:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34176460924so1544403a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 00:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763713591; x=1764318391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=;
        b=SRrW42jzeV2nBYw/qb7bPpqnrS/fp/du5k3fi5dC2/er7pQT+COYLt6g3HDnFuWE7u
         rAVu7ahbcmoQALXlqYTbnQh6Nn7XgjQWLZMmRQiqYMcGbbMUX/7kX7VAoDokfa83MswN
         dhhaAnNBeRXO9acCnFcgSKOWXrr+05nGoZJ0Ld1p8nX9cyHhqNKXhEzvn/RiI74nENl2
         pOE3KO4BaPuxynSVyJm0kgFE+hkYZwQ5KglzushyavUpeEkzTfAJ6M+7NVhDeJf5bdx/
         2axrdpHPAt/+AzlJiWEIAH5sBOGc7i6JclPTHGvXgY1IFYvjQHO/5YmJ9k8xRri9d/OC
         2fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713591; x=1764318391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=;
        b=mndGrPam7AXg59jVKWC7IWdoMIhcHagzkORdCV8173cbSQ/EJAh7OwBmPiiG3Ir3/I
         clVOOznG4WjU/HwbuCj2/01VblfqmRxC/uUGEdHMaY28IJofxGc2JuMUrbVhabyRo8Cq
         5b2/85FSkpQ207Xqu5G9MGCe4+nO35ZbJ+kLyic/20wR6UXitg7CLBoBXZyJoBuANlbx
         cR842ANTNdodP97zwOR4v2hsN06XFFC20bq/4wBNjGwiwbXnUsEt1hvhs+zu/GB9ihDU
         oLhF3TK5IZvsyAgXzdJpdjbdnWW1TCB5iFxZ/AIqEOU4ofj8+JIYHmBuCjLngE3R627v
         kiiQ==
X-Gm-Message-State: AOJu0YwcxuAQ5u7TqSSSYRNaYZD9qzpDvbL4oFIBb70h2QSizMVznvXN
	mKeW1GzuSkU2Zx5mynFrG1dy6Ky4cQxClXyHfzr2YdTsRxcckUyRnSckf3jSLomeOwmCyWV1LSC
	PQ13zml12okhz1/X4FDUqYNErUeEt46fjwgCH12T57KaoMsryB/gglDV23c9OS/RtvcbT
X-Gm-Gg: ASbGncshYaJwXcaeoeY9UuLXEKVeXrF+AUAVtCEJEcmcoPSJO4W9JTG8ZO1DFjJhYUH
	MQOtrRW+f/FUwQ8ejwzg2k3LqUxBI1IQ6XyMwVo4axhnmZJ1jWHgkvK+drQ1+hnV3fQfZ9evsPH
	QeHQP2fQuK3fT+fOvMyNOHMPcR1hx2d+xZfRtRvELOROLwSSJdVNyJDyww3tBDSEokMUFQOWkev
	Wk2737quBjzwdP12Yqaii0DiPlvBAEn6yXDVsJsU/r3lxYiL7IJ4SWzPrCx+qsJT++X5OJlvaxR
	A7RWQZAXtPcuTKI2RRJTjH4aFDJhTwO+XJhomyg+Y58wkVrBB37k84w8u9D27bhdmrp6YO8qRvE
	jKmI8XoIINVo/3TnJ8obBlg/FXXRO46QS7j2f2UunLiCwnmAdq2S6dTmsjNT5qlt7534NsobeC8
	4=
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr1632117a91.36.1763713590488;
        Fri, 21 Nov 2025 00:26:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuBevw2FKEQYH+fjg0nmPWQ/BlIg2gNnWEfuCXeEFv6Sbqr8G7K9lkWtJ/3LY7h7/iY/0Zkg==
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr1632092a91.36.1763713589931;
        Fri, 21 Nov 2025 00:26:29 -0800 (PST)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693c35bsm4878413a91.14.2025.11.21.00.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:26:29 -0800 (PST)
Message-ID: <024539e5-1fcf-4ad8-8d7d-af87fd02a1b7@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:26:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2NCBTYWx0ZWRfX/llBZDnIAjAc
 vGxE/cS38TyG5yP5W3Tv24TS+daqFGwjGOhn3TRzLP97OaQxf4JzjER9dPPGj18XWrRSg1ybyH/
 7zUf0ryvyvFhOupr3K1hog1OV7J9fsAXJhBEynso0Ct6/SjMUmfLyncPC/mx3UXXahfD3LMWPv7
 VLABqwG8ETjJ+fAXK5yfC61prT7NcWPeLVkv+tkl68owpe9G/zW3FcvzNp1vvX4NKmuztGAaKPW
 2Dk6FqZ68HIEGbiq/xiJIxWHqipoCeJr1HdVcdyiJGD39JWMH0tyHlIwuipHf+7V2PTgyUK/iqI
 ntt0W2GH7eFp7RCSKjBkUI+x358ww8QiV7ToInvJ2px4XW+I80ZzKu1Lh93xSHmRPuVtOT0pfhs
 PpyTnlDtN4jAITKBTx4WhUOnClcpJg==
X-Proofpoint-GUID: A9NrE6sg2XVrT7jmGhgKbWgzR67A8wog
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=69202237 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=51A4gIhVuH9znBGuUk4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: A9NrE6sg2XVrT7jmGhgKbWgzR67A8wog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210064



On 11/3/2025 3:06 PM, Jie Gan wrote:
> The CTCU device for monaco shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for monaco to utilize the compitable of the
> SA8775p.

Hi Maintainers,

Greeting for the Friday!

Do we have a chance to apply this patch for 6.19?

Thanks for checking!

Jie

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>   
>     reg:
>       maxItems: 1
> 



Return-Path: <linux-arm-msm+bounces-86249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237ACD6AC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C144B3024E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 16:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306AB3093D3;
	Mon, 22 Dec 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6u4ZwTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWfUQewl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235B330B18
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421373; cv=none; b=WlEu98K+p3El52QMbTaqXvKBocf9kVBDx2yZch8RaLujTKRb7sUG1pNxRVCBk1yVYJ7Dra/k+9QX/LCVcWrmfFKnjc+CcJ08nEu5OxvYcZwTLWRGalluvx2tLMp9qQd8gDv05L2gWTJ/Z6MbRwCM3jSZAyrf39p5ie1OAodO0jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421373; c=relaxed/simple;
	bh=xsGdQ2XAEufFnmzMMLv3hLxABOefWcNCb772Vo6VRAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IprBGjkCcs+mxHhOD2EEmJpsSLFHU+oYrGm9rDkMQRVPay4z2sGM5tef2rfkC3xmPPYiVQbm+CdK1SRDXiilKQikbKxduXUBNX3+UmkDSIFMPH9o2IkF7ddiW2gHOGRDw8QF7ZdqevSVWHQpab+frvyvtA2FNRRucFzy/OT5JcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6u4ZwTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWfUQewl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEBv5A1389021
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 16:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXvx82XWqFm6ITv1sw8wOZgISiDMz2WX+oxaxHkhTJg=; b=k6u4ZwTFheCvfG4L
	eTXZtWDCPRdgf/LiHWR/fRzgmX45mMv6oX/1uuvg2n19D45eMkmntlt0BHj+IVmh
	vccwe9DPdXJVBPefbxRod0bKaHnG2nXa1wp2qoJcySd4C5JX4UN+rG0F4xbhkt9/
	gtmmeRD6v5BtKNyjp+eEdBwssisVkQLD9jP4fCYoNMBdu69Syrde4D/JSUmj7pG4
	t1M/xtMgizzS06Earw41zHFb7i9yrOFJlLvgAYO9ai2GHfRVsop5sLTe7UsxuFPo
	SbMljhmSOIEwPOc8QWJeE7J15DUjJx+VDHvz8iCzQdUZvM5QdI0k9xht3NZOawz9
	6yOGBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6jcwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 16:36:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso4070579a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766421370; x=1767026170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXvx82XWqFm6ITv1sw8wOZgISiDMz2WX+oxaxHkhTJg=;
        b=LWfUQewlVgXJJTrTi6/viLdjy7PtFNkEAMBfHCsGtbxBgFUbOaQ4ycZjQIxiRbtmKc
         MAOMNKPrfpZHGPjJx7PwlwUuePV5r4nbk23j6nTh1G3vGTrBUar7ecexqJ0yvneUEfq0
         +zwnq8GKxLcjP6X3UZOGm0ZSPazLsdlELn84nMRGhYpzY+htAGGDjFQe1RrQ8PVZj4dd
         thcTpDuzOIOvhSwMizqa89EvEfZ64Ov/IRnSawMr5R6J78z2I3ybSTmb4fnbJIxt5y5A
         CyeFCDanRedqiJKb9XDfVK2N8GIUtS6nDFE58rSbO334DZlFvD4Gtg+rwCbwkFpz+v8o
         4IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421370; x=1767026170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXvx82XWqFm6ITv1sw8wOZgISiDMz2WX+oxaxHkhTJg=;
        b=ivBvbuOPsDog0xwDMWGx2815JgW3eBnEHJsdWqVIYT6mb6ky5zysJbsP/NQ9wQV3nV
         mlznBH0jiz6+U3yGQtCeSLl5h8P2OLJDI4UbNA5j4TvdU8Shz8z41but2Anrfktl0fIr
         6bkWVsWjCDdCUwWKQ4o90uyUafG61sFnvVGwooQqgheygnMkJpLP0zmfnSxVcnwPfyJf
         bBBqRvPDbP+Ct135G0qSXG1ujyoeUKYda4e0DfuW0Y2vMmiqd4I/oR8378nLjHRyuCQS
         UCqTYlOVn/rEGghrfAe6jw9ljADgD9DdDeHBUu1Un0ody3FftjBBJbkXFJ9ZyXHGLCkO
         WVIA==
X-Forwarded-Encrypted: i=1; AJvYcCX1soPu1dFSPf+iz2VL8vIyUD8HkoY4ubcVTJYtENp95unPwucL+vebN771gWp/DzY0pJSnioF1i6h7ZRKU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm3kdzFKo5xj+VXpxYFjh7DE9KuZbcV3G6HmIyQtOsx7zB12wF
	qmKlXiXIiH6g6qXDiAA7lkh8bysTcWRqdlOoaZpD1mWDlYNvxhdjGZHFhRr0WnaJ2gTGSO8poHa
	1vsgqFnbIl6jam4fxIPQqdlL85GHQl5BMDuxqnZLoKal3mKEwt15gUrV1nECh9mEjKNLJ
X-Gm-Gg: AY/fxX44E/VhHZsqJ6iDJUv3kLhROuw2sc8XhNN65E9ECLm+d2LfelUH6aMdPe+y2to
	z17wdmrIGZjYkLKV0MmdbekWOfdDfPx8cFMTxol1nrg2hWpp5zspSvmwJgmJt+GCJlRgPuLaREd
	JA8qQb6dXs16HTZoRey3q0Pd7u8Z2nQfdgLrIqi6fQvMsDieDKOVlXK58fb+J/uiXg051X62rTe
	2wPwJvhtDi4KyxOf2N66hnEN3LwCFlJz6P7e0zeRqN2ho0svpuwU5lywBOLz7a7IZeVtrFb3AV/
	4QDLogucqlO/CU4O/ozzsyF7TOMUCmMjqz/sJqonJJLh3ZZrbuxCaCSy/APMQM1CiyNeB1+77yH
	Aswe3xf9rc0TnUUyApM601Was0GWVuwarUTfm
X-Received: by 2002:a17:90b:4c4a:b0:343:3898:e7c9 with SMTP id 98e67ed59e1d1-34e71d6901cmr13686849a91.2.1766421369957;
        Mon, 22 Dec 2025 08:36:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLpoCnuvbYB6BpdXP+5xmL2PI0Y+WCaNF/uzlKrlfel2GF8nuYzETmHXde3YZjosxkcvRINw==
X-Received: by 2002:a17:90b:4c4a:b0:343:3898:e7c9 with SMTP id 98e67ed59e1d1-34e71d6901cmr13686820a91.2.1766421369341;
        Mon, 22 Dec 2025 08:36:09 -0800 (PST)
Received: from [192.168.1.5] ([27.57.93.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9219f180sm10513551a91.2.2025.12.22.08.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 08:36:08 -0800 (PST)
Message-ID: <2c864c13-9fdc-4925-84c4-7b80bec581fb@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 22:06:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interconnect: qcom,sa8775p-rpmh: Fix
 incorrectly added reg and clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251129094612.16838-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <20251129094612.16838-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8pV9wg2OSZSyBmUkfO0vOi5lnLsSJY9Y
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=6949737a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=luqpl2TCSyK2LuNNAmtdDg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IFhBrfRlIRHtlFGW3SwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1MiBTYWx0ZWRfXwts4rKRODgH0
 p4kiRonS4o7CI5njOnw7IZXJVa0RZbi9HDZVRBp1uNRPWy227wywcSzt7nFWaIyTwHEkBnwzr3f
 RcT9niGERnZI+j23jViqCt2aNEQeNQjYTfU3NhuFrd9pNns34SgIc/DNigHWAkoo1SdhX1SilWi
 6VhfldirIfpP+m1KyrYldOXip1gMsb4rviLo5p+Dgr0vq2ybgLW5x0OiAVZt6neKuq2opRsRI+B
 H3ZqVrRf9+71aMGANhalhSrLKkCZHGkxBQZv+Pl0DnGm/axQLK0ZkWINHZBTqIDIsRd4ki7GIX4
 ZqckZE3g1al7VRBXCr9eC4vRn/e/REUCVT+ifMPvAXW3CwNT3Adm1il5jvFMlKFIAVYSTj9XUg+
 V3mC3RZa6VAgqGtaTdyn3gKIlSP6X8MWG3I7hhfsoY6lqI2W9Df6vYXfY+HGLTl7rIKfO1EEcck
 z38O6CQ8NNmeRzfKD2A==
X-Proofpoint-GUID: 8pV9wg2OSZSyBmUkfO0vOi5lnLsSJY9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220152



On 11/29/2025 3:16 PM, Krzysztof Kozlowski wrote:
> Commit 8a55fbe4c94d ("dt-bindings: interconnect: add reg and clocks
> properties to enable QoS on sa8775p") claims that all interconnects have
> clocks and MMIO address space, but that is just not true.  Only few
> have.  Bindings should restrict properties and should not allow
> specifying non-existing hardware description, so fix missing constraints
> for 'reg' and 'clocks'.
> 
> Fixes: 8a55fbe4c94d ("dt-bindings: interconnect: add reg and clocks properties to enable QoS on sa8775p")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../interconnect/qcom,sa8775p-rpmh.yaml       | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
> index 71428d2cce18..3dbe83e2de3d 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
> @@ -74,6 +74,37 @@ allOf:
>              - description: aggre UFS CARD AXI clock
>              - description: RPMH CC IPA clock
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-config-noc
> +              - qcom,sa8775p-dc-noc
> +              - qcom,sa8775p-gem-noc
> +              - qcom,sa8775p-gpdsp-anoc
> +              - qcom,sa8775p-lpass-ag-noc
> +              - qcom,sa8775p-mmss-noc
> +              - qcom,sa8775p-nspa-noc
> +              - qcom,sa8775p-nspb-noc
> +              - qcom,sa8775p-pcie-anoc
> +              - qcom,sa8775p-system-noc
> +    then:
> +      properties:
> +        clocks: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-clk-virt
> +              - qcom,sa8775p-mc-virt
> +    then:
> +      properties:
> +        reg: false
> +        clocks: false
> +
>  unevaluatedProperties: false
>  
>  examples:

Hi Krzysztof,
Thanks for fixing this, looks good to me.
Though I did not face any issue with dt_binding_check, agreed, the
earlier change was too permissive. Disallowing reg/clocks for the NOCs
without MMIO/clocks and the virtual providers is the right approach.

As you noted, the previous schema effectively allowed describing
non-existent resources, and this change ensures such issues are caught
early by dt_binding_check.

Thanks,
Odelu




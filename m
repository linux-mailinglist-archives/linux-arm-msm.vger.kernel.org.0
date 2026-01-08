Return-Path: <linux-arm-msm+bounces-87990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10680D012A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 06:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8241D3001620
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 05:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7CC32A3EB;
	Thu,  8 Jan 2026 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiYiitX3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1QtG2u1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2B325728
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 05:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767851268; cv=none; b=YBLBJTpIJmNkUA/q5xN/pAZC625wMmvadNyGhHl/UDlfKj0WypTj3No4WaDEgn/HFyKx5OisOUvq8KPjsJ6lq5VRWFBU696XPmstSdt+Jo053yagfdFGx1KvfDxd57BJja4Vp+4BS5spzT7Q8cre8aGkehcLUrDVEPiZuWuX+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767851268; c=relaxed/simple;
	bh=66UoQQjvLHf4mnfG1QkMQ2nxqCNmF7Q71Sb3Zmix9XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFrkLRLuw6fs9B7FGd7nq46nJuofpswdb1QonAeV6fAWIx392sg5dBXXtCZvqEmFzbdFGEceJTThVElDTeD1omNzyA7dq70IzrHM6SSl9FucoUIaFAO6VqNKpVIwaW1cmI+jXcR7eAGir9Y85b+YUwSg4G6GqPcysbJZ+MBene8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiYiitX3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1QtG2u1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607JSSls3152254
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 05:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tr/VYrjq3LCAfgjIsWUzlI2IhSAf6Tz90GECDBfSwY8=; b=kiYiitX347PRbexW
	LP3LObGWGubSxRYnrrtK3PDh+4Xp9oZ6JiivnRaFlWiZT6YQmrDMtlGeWaAATF0U
	5/Cs+ZClMMqz2dSEdYT5vxsFJKQWNzVE6S4kOscxJJfaDp3Tzz5gJZEfR2LOJ1rN
	dDT0JJUa6CfV/LMnLQUpdERwTe5g7/hWwDG0vcWA3Y/5NrbTfRFB960beVqwFaPP
	QR8rjsqXTkfLnUYEAFbzVD6HDTLPsJukiVy8QaBi3WOGKolQOUTp/5JgdltrpE0r
	0BCmVLmv5r5ogU6+L4UehwqWvjRooa+bCg8PGdX0NvlK3xzceh64bkURpJZxVLqh
	9TQ7Vg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjau4wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:47:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0c495fc7aso32805385ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 21:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767851266; x=1768456066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr/VYrjq3LCAfgjIsWUzlI2IhSAf6Tz90GECDBfSwY8=;
        b=J1QtG2u1GdQ7ebdCUYbmBi1bKNIXsgCpwKymc2nH3k9BGtNQ1aFvCymJTuC88MOWQn
         Jk4hfp4QtcY7BMUVnOFECrZbkSEd04yttvhhzlz+4RIqfugfacmLhO6zQsx2qOZFYbr7
         AFsc98JUCQip9aun8RsyFsHB+dn5dWBImtsKICBgt/ER9iVjWfO4RzQn1oWEk520rfNt
         cd7mHfaMZqJILmP9bMYjeqE5rLCaao4/uwafz64Cd78GBJ6aog7hwZAjH5pt+tXW/yMT
         858bJga2jJKT3sVqsgnLc6SI14WlP1zKBSbK07oOIeiAcD/ZzD8mWidXT3ajIMcsdYkb
         bKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767851266; x=1768456066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr/VYrjq3LCAfgjIsWUzlI2IhSAf6Tz90GECDBfSwY8=;
        b=surEoct8HE6ZZSaY7HNZpu5w6otHjafFn2rjLD+SPzgcJUvzFPwsayopG84h4YBFGT
         jBkBSK4JVCizYlQQSaYj+hk84UIMbIDxvz/nCcSwRmq746Bspxrr8oAXwOuIVAQYFDKi
         f9jzKoTXMEdjc46KMzuY45yK7w9qs3hBhexh+il9WmgwigrbzQF3OGO4TtiNyMXur5Vk
         zViO+oZjwhyd8wOahLBTMb+JURT5jyqSOLZ+B1Rw7HJnGWihXhbGf9imGCYu4P5RJcb1
         oZZ0nnletjuwtJb7d9SL4QlNbiZorot1RfcFmKbAhKAaQJblYBbOUy/CTk6IwztQiXWU
         vJlQ==
X-Gm-Message-State: AOJu0Yzb3NeY8s/nPdop4nfeIQ8zsvIqDLufbKeWGf4uB7ysZCIzfv6R
	6BI5GyiqveHo/4NnU+5NwsfQM31XSo8KRqMCQ9nwLtfn7Q8Rd0HixVXljSefC/ESJ6eXEUFWkAb
	OlSoNlG+JUsQsbkkxQaC2+x1ccg/xKQqjCV4bWnaSuMDKf0TmNKHqZ2DAt6G1TrsuQvEb
X-Gm-Gg: AY/fxX48HoOpx/EAyFaqdL03342hcXOCz7gdrS+uZqNU8kllv0NBx2n+Spv3t2yHF0F
	kSCqBYRTsNnZkXZkDGTV6hyG+GYnN0XzPHVbHyZegTlqOWRkMPeI1D15Zdhq5C+PWAtbk5IH690
	VAkomCXCEjqM/qXaaLoqHK6VnpgpWPjIWdjW+1PvAPcgH49t8FVQzFGbxSUsdGVwDjknTApSQWv
	SlpXnmTeWyi8Ko3HN7etqGQNGJeNNd4YPWCmGL1RhhCHelCTb8QPaH26uPs8/pBMqARjrRO1Bl0
	+ZaCfndZUQvyrwJ+qUsV6aE0kPQrzhW18WF3vesRTdluxeC8uo4aN/+dgu2WFH57+mkOffXeP4L
	rX+QdNNZII6rLAClX+tk+B/lXHaX5G8F0ygxyzbmcVSCplnIx7d9FfOgcoItGCMumK6aui/Lmxr
	zYMxXy
X-Received: by 2002:a17:902:f54e:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a3ee4370acmr47863595ad.1.1767851265590;
        Wed, 07 Jan 2026 21:47:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqtJp/dLS1vcdNRX9OcFgrl/+8DU40tksPBNVm7s8C/HiKzOWVUbRhLftVpzKQbfX0fM7V9g==
X-Received: by 2002:a17:902:f54e:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a3ee4370acmr47863275ad.1.1767851265083;
        Wed, 07 Jan 2026 21:47:45 -0800 (PST)
Received: from [10.133.33.187] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a303sm65912425ad.5.2026.01.07.21.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 21:47:44 -0800 (PST)
Message-ID: <d3757e4f-ac9f-40e8-94f1-a8ed68a6d2c1@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:47:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
 <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695f4502 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ggdtOhnRc_DFG83H6sgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EmYbIoEaeh5AODq-jI6zZ3GO5LfYw2Ez
X-Proofpoint-GUID: EmYbIoEaeh5AODq-jI6zZ3GO5LfYw2Ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzNCBTYWx0ZWRfX/4/YhpMZzWS5
 iWTd/Lj21L94JQ8KwAfjL8WS/ghWnBzg9fZCNhIJnzvnq9NaQABj230JdNtt4aslrhIpI6SRfqb
 3LfssK6g45o0YduzFXkWs4k1dbJlbGvTRybSGnqTc5BDWvvWdXMM+rU95AapukAT2iQHz8efXLq
 1c00CsFWTXPGIYqxOEPOjzdwAj/6vy1YM9cWmfOXCxJ6+5nNDk6hWUEfI1OXX6vvg5q50hhUOo/
 e4As5NvTOcB/vqNplBB0onLTn5YMAbCyohQxozICIcscN8DpAs2vaKEo/2+D7nEHs0wl60pSTpJ
 SakEnEqZDc2OXbPhnDcKt6r3yxFrHsKqNyQU1t3zcVfZ60RYloa3Ye9FTHo8Io9AzPEbdAuwicF
 I9MukWwlmmNS6hkQu8g1liUWJox3Bil9Guwii8fdWZ4q3OmRQiojML9sxFFTlvtwEOGUAIvRiTj
 a961/Lg0oy4Qn4pkoOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080034



On 1/8/2026 1:24 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
> fallback to indicate the compatibility of the M31 eUSB2 PHY on the
> Kaanapali with that on the SM8750.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> index 409803874c97..cd6b84213a7c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-m31-eusb2-phy
> +              - qcom,kaanapali-m31-eusb2-phy
>            - const: qcom,sm8750-m31-eusb2-phy
>        - const: qcom,sm8750-m31-eusb2-phy
>  

I think the reviewed-by tag should be reserved as this is patch rebase.

Thanks,
Jingyi


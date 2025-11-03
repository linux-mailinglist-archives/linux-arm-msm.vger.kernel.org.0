Return-Path: <linux-arm-msm+bounces-80113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB24C2C066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E9A1887525
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134661D5ACE;
	Mon,  3 Nov 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7+7r+M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWBkm1gL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8369C1F4634
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762175761; cv=none; b=UP9eIIVRaPW1VvOd1/pd6bH9KXfLaar+VwCwVrhDbkEQ1QITg8VvgAc3+pKs6+mGZXbd91ghLL5TmnEvrW7sWuEbDKEDp//KcdO2p/Ki3Cj1oe8V6ssAkcVSObiKLF5OLYVPM3NXm7pQLThCoxu2ZzQsI1RgO3SBU3OHePwaQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762175761; c=relaxed/simple;
	bh=oMgbXwa9FIWvjLs4oqx7nkUSvxUr38rp5LQT8Jf1s2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q28La2qDX5uBpDWYEHDU5vQqB0A8WNgic0Zd9unryVVI+shHZ1Rfj+L2qPGLn2AZlgHkiJWL3WuFsTtGalrEo4Ko045RONvJfvGKoVSyxk3qZHexWXKDcz14hPQOOvYUrzShRZlppTHtlbovMW2sEQdmOwgIhTfSk62krnMQjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7+7r+M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWBkm1gL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3CDA4r2247230
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 13:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJi2SKffdqwBQAyEENUG+x2LtEGehybWi06tfIUxK4g=; b=m7+7r+M6tnDiKlvg
	MUI9DM/edF2ZFc5oWyAWh/EVypHl9eimGxIts0vTxd42Q61tLXBdSVDQPmn+NGBQ
	KXli8a5pX1dGUpjmIZZHHlpUPjaAN4nYbEJVlT8/oZmtkhdxoLAe4SQih7IRpQ8c
	IakAE8jhklLxe6e8Xh0mQPWh1MY42H0yK3/DeQnBDM125SXafWTVTeVQgWbwd8jZ
	JzyIg7yYYU8o1myeMB+JI5pwvSR/ZD2/uctQfRNzO3FQOZIZB/7q8PtyHLI4V0xB
	J7E72TXLmTFYvnwkPcfkOod3RUghU5U5OofEEwjWumJjRuKeuhcvnqAHSLrpmWnp
	hCk9cg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6q0yh7ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 13:15:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eced2a52ceso16501811cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762175758; x=1762780558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJi2SKffdqwBQAyEENUG+x2LtEGehybWi06tfIUxK4g=;
        b=QWBkm1gLZPLF0AJ1VFDxtxWPoSkozlA4NBIEOefqNrunRtB6OIBhUYp+sGqT4M08QA
         d/6RY/MMkZ6WjATeOJgLcm3gWVCUC6vMEj5ec+i5XtfT6d9+yP+ZDpyelJjFZ7AXc+ht
         WpbRln3tTC03y1dsw04exVXrK28sdb7frdNz/aFO2jiqrmNB3rsPgJ3jAE8HLpSvSgwb
         h13Oqit3nOP64WPUKv05vO43ebWy+8atc8OEl+y3S5C89T/mKRFwRECdXAhsUWYTL+mH
         EGZ0GqvfFPeeE0QfwTMEsRUSEZOfPfcRLfxs8/mxK6u4mpp7JKkY5C/5hGSXT/vGcXxn
         mv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762175758; x=1762780558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJi2SKffdqwBQAyEENUG+x2LtEGehybWi06tfIUxK4g=;
        b=IaywzDviKG9xXJvIHNGYgrJ/4zZJKQVuRnl6opgXb9296l++zWYjnDatyRpfib/OjE
         MJhFXKmKDKcVIRB7X6YCnsEn9vOtfoVEnyp3JZVabotp7I8F6XCzubjr5yeCxhMVnVkD
         doGSOC2q3eyGL+j7LNLS/BP0K3uqiJXwX5fPMfaJ1gaOT+xYFmMgRJVcKgIl1zwD7HYz
         fG5ktcw/bGgn1aCOF45LA+Y43T8suCmi3grjxbwPweYTQl201EmZrw6PfwqngEJFgpjg
         RZ9jVB+kL4mn1oEipv6S3xQj8DL2I0dJODhvpzbO26cf//N8dh7wh5QXcAY2FmAOAcr6
         uXMw==
X-Gm-Message-State: AOJu0YwMwwWBN7tojFw3VT2uh1S4s7N95PGi4ey2JhxC7JjshfGvPMRD
	yRo7jJ1i8pXhwBAx9r7weODgn9kfwIsIUeugM16fYaPUixAHI3ehmQgu2k4fPd4KXFEymz/MBJa
	Glley2OYfHgDXWhOJRzJ5yTlwwg/qqrAFbpK+ueEu6Bd30LJMo4FR6YYHIybj72YD0f20
X-Gm-Gg: ASbGncsxQ3jmIN414LyOoyHaIvnbX91dze7DP92L31GZbSJM8EgQU9IktX1cj8NvdnK
	D5jVtbxF9ScO+q3pRtqE7DRIB+27mGH2ipZ0qHNmnJiuLkM9zNx+twk9weFkkqx5JqvtxEj06HC
	IiomXtgtDy58mdDi2lCgriiArYLjdIAl6TG3iSSB5anDlRkrjb6aeDmvSKboxCZP9BYfhMbc2DJ
	998AXg8DBw+acSBQ4qXka+c3RGB+4tH7N9VwLM/CkctThxwSewVkjddq1Q7usiOeFuaezGx3u0D
	hOn9aOj0BLAtSYXBZ1pTqxVjy3SJRCrn3Qi1geZP9ygtcIOZphS5gRFNF0KfLkrcV5E1blL94Jk
	Vc9dx8FjUEp1nEUTPaFqCM1WS7X+l8fiQvKDPmpb3yoBTC/y20nGWiDd4
X-Received: by 2002:a05:622a:588:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4ed30f3cc9dmr109744741cf.7.1762175757600;
        Mon, 03 Nov 2025 05:15:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGh7/QV0gEshhpbMietL7LQeiu9j1PQXIccgtNnpkzyuw4Wy1i4QV7GqTXvaLVMylBd9ovww==
X-Received: by 2002:a05:622a:588:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4ed30f3cc9dmr109744381cf.7.1762175757012;
        Mon, 03 Nov 2025 05:15:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70abbb6106sm534193866b.67.2025.11.03.05.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 05:15:56 -0800 (PST)
Message-ID: <114cb239-d0b8-4db3-8972-77ec3a24825b@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 14:15:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251103-add-coresight-nodes-for-sc7280-v1-1-13d503123c07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251103-add-coresight-nodes-for-sc7280-v1-1-13d503123c07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NYbrFmD4 c=1 sm=1 tr=0 ts=6908ab0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vf5OUP8M7W2h9ZXQaioA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 0yu7uyQzRPwBCSXCok2asZboT_xZ1cmh
X-Proofpoint-ORIG-GUID: 0yu7uyQzRPwBCSXCok2asZboT_xZ1cmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMCBTYWx0ZWRfX2Xgc1nd43FHC
 GWoILy6HFPEOUkheDo8okrRIu+gGIEj2AOoVX6FG7ElPN2nPnQ3oQ+WxgAln5On1M1flCAzJpZg
 TCOU3za/R/6RmPAt9Db222VFpPBiu8+4Sp4qGwR+xZvSPjLJu+46FJdkEBvcghoONsly/QSNYWe
 dr3nUbLIhSqXxUjkXGCpLOYICzTXThRIbFLgR9T9a3OE76w+/bA2gZUkn7eWoxvc4v2FiCs5jYa
 J21JQKHTMEhqBp3WpsfW141yzTvRMovkei5rfZ/+hI6Y5OenW14ims8hHDtjzuGLsEQ+xI9Mn8n
 Ur6I5t8Tx9yCAcdB/0eE+01ZGzkgzCbQmNWS8CY2NSUkB/g5ZGg+xo/KGjmO/goE74gCHxS4tDx
 4u8n6V98yG9XLdAEstUo+uML/4hR6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030120

On 11/3/25 9:35 AM, Jie Gan wrote:
> Add TPDM, TPDA, CTI and funnel coresight devices for AOSS and QDSS
> blocks.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 290 +++++++++++++++++++++++++++++++++++
>  1 file changed, 290 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 3ef61af2ed8a..09aba1645408 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3338,6 +3338,85 @@ stm_out: endpoint {
>  			};
>  		};
>  
> +		tpda@6004000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x06004000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1c {
> +					reg = <28>;

Please use hex in 'reg' (just like you did in the unit address above)

> +					qdss_tpda_in28: endpoint {

and leave a \n between the last property and the following subnodes

[...]


> +		cti@6010000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x06010000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";

I see 15 more CTI instances following this one at a 0x1000 stride,
followed by a TPIU at 0x06040000.

Actually a whole lot more debugging hardware. This patchset looks
tailored for debugging AOSS< as you briefly mentioned in the commit
message.

Would it be beneficial or useful to (perhaps in a separate series)
extend the support for those?

FWIW the various register bases and field sizes correspond to what I
can see in the docs, I can't speak for the port numbers. Please just
fix up the style issues I mentioned above.

Konrad


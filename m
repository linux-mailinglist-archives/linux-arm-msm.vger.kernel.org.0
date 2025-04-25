Return-Path: <linux-arm-msm+bounces-55603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1087A9C4C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311225A41B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DA9235345;
	Fri, 25 Apr 2025 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHCveC6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EBA21A436
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575803; cv=none; b=l5vSD+PUY2LPiL5spZ4EzTlQHYejriutnd2qNnFG4vSOCORDNxty/fw+1iNEulpO44TV6zD0Qj9l2qA5hNYXYqMPINUZDsutAvFqLl/+HO+9cB1zbmJqUf0vRVdfoNGp8u+Veswdpj93J71z7xxz4ruZOV2Cqd7vaw1/bpoS+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575803; c=relaxed/simple;
	bh=uUOdHxP9f3UpVWyzRUcJfI4yiFWoE1nmlIi1dsKkdwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuEMrg6/e9z6F6dphdg1hMzO0yRZ14YCvbYtkKNxfRiBuZrvsVljFs7dZMk4dNC/ccz9su5L0/nvs+nojN08mGTV180rTzMeT7zZrJqlAtzmpSpOZrz6IYcfE9RJcE8qRPQi8KfT1RfcYTbJNTwhYC2D7YGBA2Uu/oXlOiAHM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHCveC6t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TYw2016671
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcR4USsPcIz2SiiDINJ9gwMKUZS84QFhsK3lu2vuxlI=; b=aHCveC6topOtbt/G
	YBAQf5YiMkBmQyKOPASC1HT/Av0IGvmWSGX+WtzR28AKa9JffPh2xfE2bgznn6Iy
	wx5UtTTYpEQdNIKGOgsBRazC47Ch/3Rm+xWgYxuCPF4nJqJjzVWD4eW4/eX0qjcD
	jhhPYLYCQVucAo4Qj/sC7vEfgJiRYTbybafgFDLtF9bak/qWpTMfFPN3YyU56K0N
	2rM4zqZffKm2YcQBocb9dw6Re03sxUAmERCJk+UyJOejzfUfmT38qw3UIFXZQkL7
	TLJzwhksHA1j4sECE0QZDLeyxrpAQYsDd6EC93MjQtM/bIqivQohfaO0qIs+ZoSG
	QI/2Jg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gkn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:10:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47b1b282797so3057521cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 03:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575799; x=1746180599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcR4USsPcIz2SiiDINJ9gwMKUZS84QFhsK3lu2vuxlI=;
        b=fPXmC9/VLPdSRNVZ2Ua6l8pIFuL1updPbwqbeuTloMryGPEqslvkGDKse5Gm2XKBUV
         CxkYl3tVRtLEY3Rfxy5XbbsNXEuWmPDZfIMxPHIg8dknjxVep17Djjp77xw7P5ZokmTV
         bgjWYqJW3idewWWikzMthjlzQohHUv12W7NTLAOsrziPYMvKW8lGeBSaKJOpBNh8IwOS
         U3fUoAjO37bvFTIY/MEhZKMiZ+72/Vuzd5pF+uPXGkXdI6vzQbSyi88UlJ0X+wFt2bfK
         dNxVkvHIhUvqtQOJLVD44TMrrtJSU9zYY1EOufLcIi01GFoHxLujeWA03qYWy42FRi1b
         aczg==
X-Forwarded-Encrypted: i=1; AJvYcCXUY36gyOBOOOtews+XXJ4eSnv/NnKi05OR619V7HcOA87nrOsUm9SjDPnpFHniplVfNAg1hdSn5b5sCj2z@vger.kernel.org
X-Gm-Message-State: AOJu0YyUU5Rfr47wzyh6AaCHDqa0vneDUD7pIWk9LO4PSRDW4fNCkILE
	gvbu0b+SnYGUFCFbrDjrpGPjDMDlbUDfIIAJwE+w38X1XhOTDQnAZCZplr8HFIf4tx6CQGOW2zp
	RJ8k4VtQXSisSbkknjgoln6gI7xXZPWQqMAUFCrbmNO6hpusTPPi/o6YvIgZWoxQh
X-Gm-Gg: ASbGncttQnQSJICyFFYn9zUEgZ6cu3DLhUiC5BiLQrve8mJUEIAAUQTOc+1uRNXarBr
	kMh0n+qUqo4iZHLiDmwqq9JDa0ZcIiRd9Uo20C8R5KIbFvfwHEYkfkYETc9j6WfEkw2ujaEbjL4
	yVmyhtJCDqWe3OKQ+mM6Q4HgnKfwbMsbhnz8VYsPQxU2DWTQaDKkVxRSfK9hEZNfdUcn2WPKY+U
	r8Hu6vcnspkDeZaRORFb3aWyQYjh87QiI6y7fRx2mGNjbJYfXVsXNKpkDQcoE/LHRML4ij9fJdM
	GtR6Z+5ptVMJM0SiaFWAEuR9ITiKDvVm38sqWlKF4l/KVyz5bPJmF81/cxHdBQD0
X-Received: by 2002:a05:622a:58b:b0:474:e664:691b with SMTP id d75a77b69052e-4801cb74fdamr10232211cf.8.1745575799398;
        Fri, 25 Apr 2025 03:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpVqFMJCg1cVOFVOb6wfjoxuCAz/gvhlpNlvEb69gxUneWgwsWMVnTYY2fOlK2r1AjnFI+ZQ==
X-Received: by 2002:a05:622a:58b:b0:474:e664:691b with SMTP id d75a77b69052e-4801cb74fdamr10231981cf.8.1745575799070;
        Fri, 25 Apr 2025 03:09:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8f3dsm108180966b.110.2025.04.25.03.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:09:58 -0700 (PDT)
Message-ID: <e8db59ab-9832-4d48-af53-8586ce828c1e@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8
 slot for X1E80100-QCP
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-4-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425092955.4099677-4-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MyBTYWx0ZWRfX2OhREWt6b6OM T0aKX5brQ2Lj9P2PM0kro5KshQpki2JBLLXutc2A9p4wEAlSJllVAJIrPJxLtjUikq34JlTy3A6 25gWlJssVtxxtRlIZOiEAgzff1w+wVZ019tkQn3IC8oU4osAX3Fe6MzktWrmLvSplZRySD/pIMp
 6p8Qr6+vX/isUvwFlnhBG+jpf+XVz7KjFk+HM7xWmPpXvwiml8Bo7pg+juSz9Maw8REhIlbak6S JxM5lQVIyMIwR7nfuMmXl7IrbiC8IhACrj9EcjFTfbPQ0D8Di+nFaoz8NX9ZqenO6Ea+kEgt9Sy r3Vw7lg+sfqKAy/b320JIhynjoIbvtvH+wkUKQTx/vVwh4dFsskmYpwStSlwmd5NO8v/Utasf8V
 GiCAVyXyKgvcEbovxcoYQZyNx2wNU33iZGhqN47qFiEG1AKBsfDgj+eSQ4x/y5FJUQZf438T
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b5f78 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VUPiE-F7cVA44BgGhqEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 13qUtqbmvramfmDujohIFJ9v3IGos99Y
X-Proofpoint-GUID: 13qUtqbmvramfmDujohIFJ9v3IGos99Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=990 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250073

On 4/25/25 11:29 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add perst, wake and clkreq sideband signals and required regulators in
> PCIe3 controller and PHY device tree node. Describe the voltage rails of
> the x8 PCI slots for PCIe3 port.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 118 ++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 470c4f826..88dfd2199 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_pcie_12v: regulator-pcie-12v {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie_x8_12v>;

Please keep the 

property-n
property-names

order

throughout the patch

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


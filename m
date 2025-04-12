Return-Path: <linux-arm-msm+bounces-54078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D9A86984
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 02:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E6EC188E7F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 00:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5F71862;
	Sat, 12 Apr 2025 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLDgyOxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222BA2D
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744416122; cv=none; b=e3VbhTsnRS88x2KHwtf5bOyVCzQ1/YcVyshT9xsfIilgHq11vy8hWxNJTMKBuTzukCnsFADXUHzEST8l+BuL0UjhlkvLIUbiVQAamofvHk2jD0xx7QIjjNavO9ZMjgkwwEc2Ubm7RXRyD3amWQyuOlToymAw+ctLtDyQF0Ua8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744416122; c=relaxed/simple;
	bh=rd1AJdhV7/Ur2BWv3yCleLXzp7+iOroG7wXSw3KkLq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njqb3CcKb1W9BcRSmzyuui5ry+nPhpEXewWZdhmszmdIddsITNSUmzOluMaHgnmx4OIRlk3VRYHtxVvvaMstzUyGgkPrQNOSoman04PVgE7qKQUygLw9eY0662PxW8VvPoQacfWkbWdEgWWTI6YHP7kgAZeOpeJnJ5aHo3czA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLDgyOxk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFFmD9008241
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 00:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ugy8iP5VEi052uxx31ODrIS2gIFDMfijamYy3hRyAg=; b=KLDgyOxkhpOxNmGs
	UfHW9eGkJFf0YiX6WQO85qJtGGWW665RmT6OO+BkgibZVZ1uZRRTl2JXCkTo43bj
	MxmVqgqWkVMeZuHk5nkLWI4BGKtqVy2I/FDVzAZGLyoZummPUqyC7t+n4Z1IAMue
	s1x/HjG80qynrvxQpV/xk2pYS/xIni/dW15Vl2BvB9Wywkcoa452VQ0ysBY0HJ6y
	lSn3akZYXlKOwUC8xLvJXXJYDOVohC9pgPTxQL+qp3ik90qQ7lPH2BRFzhMstBuy
	B8+7+CZ+wAN9mbGLKL8d3AEwlnnWOtbCAkBjT7BDxL63dtCqcxvl6tG+tYkuO5Oc
	ZR1i0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd0c1j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 00:01:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so54933685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 17:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744416118; x=1745020918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ugy8iP5VEi052uxx31ODrIS2gIFDMfijamYy3hRyAg=;
        b=j3+LfaLlbI+upEIfnPAnnnGkEWc2ySRUUhoOG4NmduUNIsWlwp3yNqzgnacx9kystT
         okOLRRAZ0xHLHiHDuBFUPEDeuYq/wwNjB9MQTelKdFYhzdsMrY0OGvXX9ceMn2K68FF8
         4yrMW39r9d9RfdOxuYa4TzYLNywt1ZcLEjta8GqdZsoKWk9XpUkiEvg/6BN3KHf/yl2j
         oo3fUxD28hFY8lwmcUx1a+XgwaC33sEcTK9bwdtFFs1S+3DnIbn95zqYNT/BhuvQfNfl
         TqBcuRvDIn1jAkQ3raQaf4ERkSbei84YO+5YIic76ipmomtCpfEF2LG26y7NTFu7xOw0
         B5Mw==
X-Gm-Message-State: AOJu0YyqlHCcfyC0rbueJ9hKaq66qEQXUo+vovswOlFSp0Xw/NDxLOYY
	jlYUwQ7N+JWR2+dMC/Fw59m/kxEg/A0IXypfR3bIf/lHKrgPA2lT7nm+Lanuuoa1u1fMbiIDJOJ
	tI9pRYVu9R6ZFUUoGhfJgJ3adHgJpfTMlvmB2Phw0Ak9yBuOgRtTeW1BMe0U7AZx6
X-Gm-Gg: ASbGnctIaDO9rOBq9xGWZWkMShWa01BAuhG+IaWlRqs3xi8T2SSIO+f7XWKgbX+j07K
	ws0VOU8dMHa0B/Isdd6FZAsLlxVOWyk5HTrfNfEU0cpZBtz3C472hApdpBuF6esSZ1R8A73+3XK
	IvgQ+s4fjgAUc2dCqqI19/A8HgSRAbX+ATqAaUhbv3ZUPskv3qPfz0WIik+kCrc9MNl9kfMgmdb
	Dj2XzeGcI5h/cQaB+L50Ks+xL7G4S9bWc7Qb8yFUNcxPZr3MyZehTJXWwdS03YnyMwr1O+hm9c/
	C1MtiTiKId0b4zu8e9HI6ET5+C9HPPt4f8nQyW8yzFW1prmpLPOwZ+GzRlh0aX4+vA==
X-Received: by 2002:a05:620a:430c:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7c7af12697emr246263085a.9.1744416118406;
        Fri, 11 Apr 2025 17:01:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ1mMpJHH4b8C8m5swdNvznZRTvMXw/RD0bWNjiHoi2ylhg4o1veW/1BRleH+rNHcCHjE8fA==
X-Received: by 2002:a05:620a:430c:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7c7af12697emr246261185a.9.1744416117874;
        Fri, 11 Apr 2025 17:01:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm1560677a12.35.2025.04.11.17.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 17:01:57 -0700 (PDT)
Message-ID: <dc535643-235d-46e9-b241-7d7b0e75e6ac@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 02:01:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jwjPNs0hAAkiKl-MAbeKv--wuv5xdLfV
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f9ad77 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=COk6AnOGAAAA:8 a=JpUTTvQeKOGwk5RR6f4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jwjPNs0hAAkiKl-MAbeKv--wuv5xdLfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=758 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110158

On 2/6/25 2:43 PM, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..fe88244771583de9fed7b7e88c69a14872d4ffc8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -3199,6 +3199,81 @@ apps_smmu: iommu@15000000 {
>  				     <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		pcie_smmu: iommu@15200000 {
> +			compatible = "qcom,qcs8300-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x15200000 0x0 0x80000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +			dma-coherent;
> +
> +			interrupts = <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,

This IRQ is not routed

> +				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,

We want 922 here instead and this is the only global interrupt we care about
(set #global-interrupts to 1)

> +				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,

This is a PMU irq which is apparently left unsupported on DT systems..

https://lore.kernel.org/all/b51de3ac-5dbe-a1f1-1897-febb52f3cb34@arm.com/

please remove

> +				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,

+929> +				     <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>,

-950> +				     <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 957 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 958 IRQ_TYPE_LEVEL_HIGH>,

+959

> +				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,

-885

> +				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 888 IRQ_TYPE_LEVEL_HIGH>,

+889

> +				     <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,

-820
+821

> +				     <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>,

-822
+823

> +				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,

-823
+824

> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,

-840

> +				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,

+850

> +				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,

-802

> +				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>,

+815

> +				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,

-836

> +				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,

+840

> +				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,

-854

> +				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,

+857

> +				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,

-790

> +				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,

+797

> +				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,

-79

> +				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
> +		};

Konrad


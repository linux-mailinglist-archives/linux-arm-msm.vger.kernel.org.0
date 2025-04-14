Return-Path: <linux-arm-msm+bounces-54171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D833EA879B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F39967A290F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 08:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B530258CF2;
	Mon, 14 Apr 2025 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nM4MVO0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEF1F3B8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617873; cv=none; b=Ws7LE7i+ilUuH6OLAXxjEALJjz/ac1f6pfkvCw/V/XsZys/PX+C34YqM2P3g6Se4HKdhtWLxAgyYAzpnBwJEdJvMo0fCrDmT6cjEZ3+rHuL+aTrVuln0zGdMizGLoQ6yott30k9GdjpeQBx6ITqd9BiUFd4QOBsNxE0P0oglgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617873; c=relaxed/simple;
	bh=u5+zJ8xQq2E+c5EIBgefhUD1z6xhKKWp9LXxgnrgFx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/0M1JuMh0jPs8j4fkx/H5ewC8kxpHTFw8nxuEN4NVwoYbac9tHU0tXk9METjCNpGxYzrOVDnatx41RJr91BfUwh4bgcpQtFTYipM5pxy+8TfxH5vpW6Q4VpKfNck8emGWqHlPeETz2B0Z/XJoJxvuGyXaMTn7P3zNutwEJxOLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nM4MVO0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DMP2UJ025523
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 08:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=motKW5Lb6mQyTh0z/VsDrh9t
	PeNWHlCOYtShOT2XwtM=; b=nM4MVO0bE8SBq0z15kjjmKu6d8ldV0BDBDQmwgAT
	H6Z5OahIIpzOv7U1xvXGeg9cRQpnahOg8IuIfrdfXXXOZwJ0+KS8RZ8atxCuUpSI
	LV5nq9kPT/kgwAJflDjHqlJT05lHD8wcie2qlAXn/khjWWm37e/IIhBuMiAGeGJD
	MkN2BnDftf55j86oex+flsp1qHEEcxFhNPTJl4MpNhanckUlIqsvXgIQ6tPn6aLq
	XKRL3jjTy7bF+Dd1iNF2ughLLGIJaWvq3p8alF788jadkz/+LpDSyyT4ZmkyO33J
	DHz3ecdKFJUoQ5TJ3HiPDYNNwyOS7zq5uo1xEDvADyWmHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcundg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 08:04:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so767453485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 01:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617869; x=1745222669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=motKW5Lb6mQyTh0z/VsDrh9tPeNWHlCOYtShOT2XwtM=;
        b=JjxpXlJx8IE3xq1JlCfcEnU+BPY5Ayj3xA5VItTkgaHW0tRXgvn9PnD7Y7BnZGKL27
         IueicM3+6h3USc9oocavpktLOlDOAIKPAvBOUARM8QbkKgn4Ni2rLnHE7cknqBr+Xs+P
         vpv+WZ90C/ppORxS9zuHVU22LEBjVY2PPyn+CL0YpHuHulkCRXnKTNkODbnOt/+euLgx
         jDi4eUdY8MHMShVlo7G572tgf2m44x97pBcD8ZGOanJEsfxqu5FR+u8ayBhJ9XyS9yug
         46l1LxstV5+X2X+eVnYlfAfEQSsQgNjHH39jBpFjTNJ2p8wE+bHDR+B0N08YufW6Uu5z
         xm7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQq1aJ8fMeNLyKg7aXGRxPO7SXBRsY7Xyli86phavFab2+xDHqQR9ZAx/0xuMEAzMtKe1iYIglb8W2QLnw@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqiIPY8xm7T7kOcCFgaqhYzELlO2m9uB5zYHwrWMGL7HnVZyz
	lA4mj5z56fMowhQ331RRVMbi4wkOHNUEB16jxLA6boBINaqWKC/blpOFs63FugQfIC3cdsEQo+O
	xmqT47IHh24Q4Odwqwo2CN2PEI+GR0DkZ7Qlr3KIDSieCAVqeIsFn03XQn0e2H/T9
X-Gm-Gg: ASbGncvNiFojqUx45t30mxdCcYfdnK4RVQ0gFpZtTl9MGb4DXRqhbTFVpBOeUUM0XEn
	B8mZ5Q4VTb+5L8bnhtBhfkMvpT4DumqRzbUuAq8COFgI4Y9nc71KzFSGbFT11bp1KHXUHKDOq1+
	iELDBOD+sJpSdWyysQ74j/CZV8dIUCNQfO2VfZFfHHUerIPHeQl1mx8LJALcqu2XA7iSl7nbPKV
	NRtfnLjfj90GcI4UOptpEFJadPhh9UI/OEMax3A93d5tNTB6L56BB9Rlb5pveR53Ei7McP2FGeg
	l0i/CHcV3bliq4LFW1QAwlfN8DOB513p1TsmHiW2Lb+1Uuh/io6PIAj2/3B11WjmH9Fa61icOoc
	=
X-Received: by 2002:a05:620a:28c6:b0:7c7:a55d:bd0 with SMTP id af79cd13be357-7c7af0c0ea9mr1883520385a.5.1744617869247;
        Mon, 14 Apr 2025 01:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWWHm3DOZ1Q8AF22op7ePgxy0MOLfDLF+pEm6YiivbRillDGj+xV6eV96SSkSZfVCdD+uIVQ==
X-Received: by 2002:a05:620a:28c6:b0:7c7:a55d:bd0 with SMTP id af79cd13be357-7c7af0c0ea9mr1883516185a.5.1744617868730;
        Mon, 14 Apr 2025 01:04:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cc096sm16699131fa.29.2025.04.14.01.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:04:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:04:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: qcom: Move phy, wake & reset
 gpio's to root port
Message-ID: <ody5tbmdcmxxzovubac4aeiuxvrjjmwujqmo6uz7kczktefcxz@b6i5bkwpvmzl>
References: <20250414-perst-v2-0-89247746d755@oss.qualcomm.com>
 <20250414-perst-v2-1-89247746d755@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-perst-v2-1-89247746d755@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fcc18e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xMVSDGMRPTrRGbC6XWUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rRF5QNcrFU30nhVIRGBqjHg1SdEGWy_h
X-Proofpoint-ORIG-GUID: rRF5QNcrFU30nhVIRGBqjHg1SdEGWy_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140057

On Mon, Apr 14, 2025 at 11:09:12AM +0530, Krishna Chaitanya Chundru wrote:
> Move the phy, phy-names, wake-gpio's to the pcie root port node instead of
> the bridge node, as agreed upon in multiple places one instance is[1].
> 
> Update the qcom,pcie-common.yaml to include the phy, phy-names, and
> wake-gpios properties in the root port node. There is already reset-gpio
> defined for PERST# in pci-bus-common.yaml, start using that property
> instead of perst-gpio.
> 
> For backward compatibility, do not remove any existing properties in the
> bridge node.
> 
> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie-common.yaml      | 18 ++++++++++++++++++
>  .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml      | 17 +++++++++++++----
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> index 0480c58f7d998adbac4c6de20cdaec945b3bab21..16e9acba1559b457da8a8a9dda4a22b226808f86 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> @@ -85,6 +85,24 @@ properties:
>    opp-table:
>      type: object
>  
> +patternProperties:
> +  "^pcie@":
> +    type: object
> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      phys:
> +        maxItems: 1
> +
> +      wake-gpios:
> +        description: GPIO controlled connection to WAKE# signal
> +        maxItems: 1
> +
> +    unevaluatedProperties: false

Please mark old properties as deprecated.

> +
>  required:
>    - reg
>    - reg-names
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
> index 76cb9fbfd476fb0412217c68bd8db44a51c7d236..beb092f53019c31861460570cd2142506e05d8ef 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
> @@ -162,9 +162,6 @@ examples:
>              iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>                          <0x100 &apps_smmu 0x1c81 0x1>;
>  
> -            phys = <&pcie1_phy>;
> -            phy-names = "pciephy";
> -
>              pinctrl-names = "default";
>              pinctrl-0 = <&pcie1_clkreq_n>;
>  
> @@ -173,7 +170,19 @@ examples:
>              resets = <&gcc GCC_PCIE_1_BCR>;
>              reset-names = "pci";
>  
> -            perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>              vddpe-3v3-supply = <&pp3300_ssd>;
> +            pcie1_port0: pcie@0 {
> +              device_type = "pci";

The rest of the file uses 4 spaces to indent the next level. Any reason
for breaking this custom?

> +              reg = <0x0 0x0 0x0 0x0 0x0>;
> +              bus-range = <0x01 0xff>;
> +
> +              #address-cells = <3>;
> +              #size-cells = <2>;
> +              ranges;
> +              phys = <&pcie1_phy>;
> +
> +              reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +            };
> +

Drop extra empty liines

>          };
>      };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


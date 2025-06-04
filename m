Return-Path: <linux-arm-msm+bounces-60256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B952FACE3D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 19:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3B21896523
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 17:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC8C1DE3AC;
	Wed,  4 Jun 2025 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GruciZtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B91BC3F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058949; cv=none; b=KTv3MhbLlDQiGjF77FTMVJyD3/Ecr/nZJC2Us04O0mVDpIm0ZnxQs99nlHoWc0PiqypEcCHg7JxO2MXUKoFFp+6cYdL22/N/H4lO7nCdxSssOawKz/EUTklH0nk36XFdGjHmx4YLS7d+vbU2//7ZBCBdqRwxDpA2p4a5xLtlAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058949; c=relaxed/simple;
	bh=dpxRtcosDSTfIRom80YFmbFdkntRSBKKUBI9ZUOL0JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cX2/TIpVsrWWgu1lxHwyE8qo1ll9NeWdszws6NGLH9oemHrInrHaqeXjyfScE5eCjbAVMEblQEBw7Rfc211GSmr7T+LmzZIQEbQkPHhLTnaUfRFbMIQJQxYS5QJhlTnX0PbFwMYP4VbphrwbQbzd6VX2VZpyWA4gcjSZGdZw9VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GruciZtv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554H3j6q013476
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 17:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lYFzLmcgSL8jz/bslCcGB9/eezZpP/4JDxDoimk1+uo=; b=GruciZtv6AHQ8imE
	UUp3H3G7YZYkJfi043qAA4GqC2HCseyHuWfHEcTTUtM8xuUmwahO0BqwNrPxOT/5
	7FTUWNTN5dcradUo8uh3WoxDILOWcvyQ3MkqNFkDYNvzNf5DaxPJqdGzRJzeKADy
	KpkTjN11CYXr0iOH99ffSUU1niivL1sVBAzrBPyf7gFUUIcf9H3omfrzp535nJWn
	TlI7uijsqnQ4jo0t+699ULiKncAXsmmh57wMHOUhxYSgUyur1W9QiXXAgoJkcJBM
	OO8L1YRET4XnOreWXD6lAFKJ9Ru52QAPs/jndN9iGbZtuV2Iejmb07pCCHs2nU6R
	S9PmGA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8npvmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 17:42:27 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3da6fe2a552so2029415ab.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 10:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058945; x=1749663745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYFzLmcgSL8jz/bslCcGB9/eezZpP/4JDxDoimk1+uo=;
        b=i12Srr8U7lGnfbaexg2RcpBzzxN/aRRmB2BBAR2gNhfLN2yyQ8L5VULHoM6JIrAKTF
         XH8NZupksdMw5cu7DRVu/ZLAjjHvREhc+5x9mo1fVXFBhn+LryOJV/CE45R8ErTNdCMh
         uYHCJ5BkFqOOYhjppe0cvEAYIFeVb34Y/SUs+GtDHTzOoFkT8ortPt7xj7joYSfikAPj
         zsrS5MSLMxyojRzOjyyVXlpewxhyXHrTrj8ecPY/JDjbASsLnSbIzTm/hEpktL3/0GTn
         Zewy9UiNau/1xtePSDRrjeviD2PUNTCMhR9rwRtUTBswk9TMFvAGr/yb+nDsMiiGSQEw
         F9Jw==
X-Gm-Message-State: AOJu0Yx/AYNAOoiEGlpQvKhUDGxx23JMtI0rTOu0DamhgwISBbKcUno5
	jtoCYE2KIIpx3WKr7r3LJeWmwXEiwkh5YYiCrid6JxP0MypGQCIAewNKauDsL0ak+Yv/0hMHaQG
	RxiE6l4X9hZiQqcnVWYNBau4G8M+fb5KJ+LBdh96mxvbpkoNvSs3LdNY7V5huUy/fJ5mZvSzo57
	Tn
X-Gm-Gg: ASbGncvYMzU7JkMgomy1aPrerbZUtVrzgNjfox0e3MLf43xjCK77mr2wlT/XB8nAJig
	Vfg1LMTjPKw644bd/GdAhGro9CTCCbkAHie7yZmfFFUyJ+41bBywMcee6HWcHGp1OkbM+rwjsSL
	HXBLTtZskkgjM/DmHYBexdYym+STzhP1+PbCfUcX0jiwozeiECCESR9wxwN8OY1Ojm1P7bztMw/
	H9fCLQfQ96zVTJmCwF5pdQqOazoB9OE9TzXeCE1bxNbBjubD8BLBjTqxbDOl1gmyIdg2CTOV3Z0
	uiB9EEEYLJ6vNzzO23TVZtLeGES2HOiVYpaV5ZImsx+f1tIObF8PKQI=
X-Received: by 2002:a05:6e02:1b0b:b0:3dc:875e:ed8c with SMTP id e9e14a558f8ab-3ddbedfe0f9mr53103695ab.22.1749058945536;
        Wed, 04 Jun 2025 10:42:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCHyZ4xXAVPCUM2tAS2VGFRxO6rT03ktGF3F1YWr5XpQMT0IvmrYdg4zr7jNop57H3p28lQQ==
X-Received: by 2002:a17:903:2305:b0:235:cb94:1399 with SMTP id d9443c01a7336-235e10184b7mr43431495ad.6.1749058934256;
        Wed, 04 Jun 2025 10:42:14 -0700 (PDT)
Received: from [10.73.113.218] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d19bfesm106622675ad.253.2025.06.04.10.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 10:42:13 -0700 (PDT)
Message-ID: <7024d638-cf6d-454e-99e1-1eef51461cac@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 10:42:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM
 compliant PCIe root complex
To: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
        manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_nkela@quicinc.com, quic_shazhuss@quicinc.com,
        quic_msarkar@quicinc.com, quic_nitegupt@quicinc.com
References: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
 <20250522001425.1506240-4-mayank.rana@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20250522001425.1506240-4-mayank.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u1o0_fvEY3ymFPfja_noowIodfP9Nd4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzNyBTYWx0ZWRfXypUklHbWA8mQ
 0Z256pA8oQI0Pbg4ZIA39SSL1ACvJ6fUla/8UiwYSqM2Z1QxjNjWnaVa2Q8dyZnlSVqJaOGX4Kr
 ijUnvB44+k43xOTkKTo7SwNW5QVz1lMwFnAazrZV05s/RIHVdOiR3Wb2w1h5Jy+NwbAN653Nnu+
 4J/gB4Cv/UR+rQNsCPJwfZmZd08uTl1FSlGSj78Hn0hAOo1Em/y6k7DZAgSTAycNk56ifFADpz6
 7zUuWRnuKcTv1OedfAuvxdIuE3l4Xpm0QCrVA4q/jJ8x1R8sb4dxkdvjArUML38fpOAI6w0LVO8
 RJUJMy0YJ9EBaFPGRSGzRkyM888ldmeSPh0s9rAMnEKci1W4weTn2i29eThq56yDb349dom83hD
 o8K/N8YCiSh/Zw+MSmydpr1A4BkfGAZY3ov+0xqgmIuAenbrMnPVNnDeVz+o7JxQFG3UC7Iq
X-Proofpoint-ORIG-GUID: u1o0_fvEY3ymFPfja_noowIodfP9Nd4g
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=68408583 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=x9MGDe5N4ij58YJjnH8A:9 a=QEXdDO2ut3YA:10
 a=mHQ74H5e8mo-RpSg_uaF:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040137

Hi Krzysztof

Please help with reviewing updated patchset.

Regards,
Mayank

On 5/21/2025 5:14 PM, Mayank Rana wrote:
> Document the required configuration to enable the PCIe root complex on
> SA8255p, which is managed by firmware using power-domain based handling
> and configured as ECAM compliant.
> 
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> ---
>   .../bindings/pci/qcom,pcie-sa8255p.yaml       | 122 ++++++++++++++++++
>   1 file changed, 122 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml
> new file mode 100644
> index 000000000000..88c8f012708c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/qcom,pcie-sa8255p.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8255p based firmware managed and ECAM compliant PCIe Root Complex
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description:
> +  Qualcomm SA8255p SoC PCIe root complex controller is based on the Synopsys
> +  DesignWare PCIe IP which is managed by firmware, and configured in ECAM mode.
> +
> +properties:
> +  compatible:
> +    const: qcom,pcie-sa8255p
> +
> +  reg:
> +    description:
> +      The Configuration Space base address and size, as accessed from the parent
> +      bus. The base address corresponds to the first bus in the "bus-range"
> +      property. If no "bus-range" is specified, this will be bus 0 (the
> +      default).
> +    maxItems: 1
> +
> +  ranges:
> +    description:
> +      As described in IEEE Std 1275-1994, but must provide at least a
> +      definition of non-prefetchable memory. One or both of prefetchable Memory
> +      may also be provided.
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupts:
> +    minItems: 8
> +    maxItems: 8
> +
> +  interrupt-names:
> +    items:
> +      - const: msi0
> +      - const: msi1
> +      - const: msi2
> +      - const: msi3
> +      - const: msi4
> +      - const: msi5
> +      - const: msi6
> +      - const: msi7
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +  iommu-map: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - power-domains
> +  - interrupts
> +  - interrupt-names
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pci@1c00000 {
> +           compatible = "qcom,pcie-sa8255p";
> +           reg = <0x4 0x00000000 0 0x10000000>;
> +           device_type = "pci";
> +           #address-cells = <3>;
> +           #size-cells = <2>;
> +           ranges = <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>,
> +                    <0x43000000 0x4 0x10100000 0x4 0x10100000 0x0 0x40000000>;
> +           bus-range = <0x00 0xff>;
> +           dma-coherent;
> +           linux,pci-domain = <0>;
> +           power-domains = <&scmi5_pd 0>;
> +           iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> +                       <0x100 &pcie_smmu 0x0001 0x1>;
> +           interrupt-parent = <&intc>;
> +           interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> +           interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +                                  "msi4", "msi5", "msi6", "msi7";
> +
> +           #interrupt-cells = <1>;
> +           interrupt-map-mask = <0 0 0 0x7>;
> +           interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +                           <0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
> +                           <0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +                           <0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
> +
> +           pcie@0 {
> +                   device_type = "pci";
> +                   reg = <0x0 0x0 0x0 0x0 0x0>;
> +                   bus-range = <0x01 0xff>;
> +
> +                   #address-cells = <3>;
> +                   #size-cells = <2>;
> +                   ranges;
> +            };
> +        };
> +    };



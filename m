Return-Path: <linux-arm-msm+bounces-84470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9701CA8040
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B03C23331751
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A432330308;
	Fri,  5 Dec 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnC9gLEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MudkPAM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331192EC081
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939544; cv=none; b=AcXCuFk69U+7GHbtyYesGlA/uKDgPhHog9YB1UKFs0ab9nP/26pxpWoPsXvGubGegXCxwatYOoO4M4chGUUjFMA+2iAz285vIHmDSn3LGhUGjMFEQ/4HgeueUnTDJfKpslrus+i+m9ASuLoQoRf2jhPxD3udRzI/jd6zZp6QoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939544; c=relaxed/simple;
	bh=3nhPu7uGGAKvjMDa6wZEceEP4NWaf5SOIzC+ISjssto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeK6APJ5X7fu/Iov6GCghXjqI2e8IrOpKFSZ7k1/Oao6zKusFNcsEhkfGveAMEW1f09R4SB1o/5YQTIhD2EiDJ9aHNU5M1Tv8gmKT+THjod7TEg0+a8Y6k8u9YNI8o0kLaBEs1zPnaUnv3/n2bbr+NRMUKLVtSJmRi7BQSmCbP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnC9gLEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MudkPAM8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AOaI1067787
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 12:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr0bffDeE2XKS7jveHkF95o8NukW1ng51i85fFXfXtY=; b=mnC9gLEwEBFJrwti
	SDlp5lPdk4XIoclOwT6bQqPsLchAJQwMffB5mdnFiUYU3I2ISrhynwILl7iuYWiZ
	fPm99PYZaVMgqn+oVk7mdN2geMf4PAwYr57bHsNSWKoLumGBU5oTQwnO5wMA1tG5
	2W01Ot2OfK1qFPmzaKJN55M2831PAdYsgFwIeMcT42uUPswVNf7cFFydeC9hPFba
	8zfwrhT9rSLEfuXPEPjPIueqL2HZsCxLOwWh2nZhrP+u8G7HteBzB+ONYEHk256d
	F4hZYrOh3BSwvkdD4isnjGAA6If2zNl6+YUNir1QGKXkmp/1it+eCBOfxZ/NCjq7
	Q4uk0g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm4gcm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:58:59 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45396d397e0so81700b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764939538; x=1765544338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr0bffDeE2XKS7jveHkF95o8NukW1ng51i85fFXfXtY=;
        b=MudkPAM8qDtkavYPFiyF/560CGwwEq5FNsM4uHtCH72+ZPe1kBggBpuZep9dKfx/an
         JlAcg5iSAHg9woyzkL3+tolZ8i2UuRv8MAlrJe4TFg8EtzrhvWGoe2qOi8+SEoslDtIr
         EmcAHz8XYtPiZ8dU/8+EmVALLlM5aPnpkaAYM/T7qCjlcGh67RwkV+smfLNWel+IaGsw
         8x73Os6voww/hHJ6i4ZS7OLV2/ayacUS7RE5LJsa4gL1w56AzpH3ETJhwWfudMqaAtjr
         UohzhNCHwxs5WtM9jgsI2xbKLY86nk5mj+Wyfl2pVgWQayS6DeqL0juA4lboNzwOVbMZ
         wxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764939538; x=1765544338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wr0bffDeE2XKS7jveHkF95o8NukW1ng51i85fFXfXtY=;
        b=wuks98KHao1LlwhmRo5zHJ7ENknlKxim3oCq9CQRKWgjRMq6Y1aHjABoP+QRhGEhh5
         Iq+cSZw8olSwgeNmUD2W1DQnzO5aNwrpIXLReBPlqXJG91+Ey4q/CYI5UX7vpV6tMxGv
         e5XypweIOLA62L2lt7J/F1yBZH6/HlMIvM4UQj5k21VX0wCMJT6JxiPOIxfK029PlpD/
         LXmH91ZQA+q8IldPhHBsq4QZcenLNLVB5QMSSvd2LCA4GIkJUfJymEWxliTAZt4sP02c
         engv1T1QKXOn8KUe53McBLxhcNcmHDs2RVyq2jL7WIHE+yK6SEPpfyEjJLS/3qDn5eTX
         ydwA==
X-Forwarded-Encrypted: i=1; AJvYcCXOJAp4Qf1NahcX7se+dN6umJ989x4Y7+f4uueZ7yr/OYIlNdKBQDY700d2zLL1bb1Tpj76LiDYdVDqKZXc@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5Iy/H+v9wafSdKpyFA7b3/x2Faoc0EIsT8RX1We0Zv/r/5fg
	yn+noJJBjFFaex0/1dnJ9XCx0lEqOj9wAfYKLV7TgXhnNUjFXfF+NgZ903M4sxVetbNdlVmjxMS
	oZhCuMxmv2PPGnKj52VoSIwSUfPEpPJPh9CLVo7kK3LzVxhvWZdqWWQpn8b5D7w+urOJYdRxH9T
	3quAfpZfwoWqSlKpgijva2IDwaAEOGBj6Q6va1g+YE88imOWs3acgTrQ==
X-Gm-Gg: ASbGnct29ioc6Bd3JD5eWqZCSQmlfIjm3emuDXyHXQLkrAePB8Kd0GduI4Gkm40ADQ7
	QS5lDs3socpuSvfrW4zpJ2ExO3npCZoMkvouYyagjwRGONETYLLlPIupUKyysGODPMosBuOBscM
	IAdfFKyA2XhPAhg3p9n9fNl/XEWkRJ/T7AGvFY4MCmupV+7V7aLzlPtZqMDmWatpTVl5zP
X-Received: by 2002:a05:6808:1509:b0:441:cf96:934f with SMTP id 5614622812f47-4536e56bd71mr4967746b6e.47.1764939538550;
        Fri, 05 Dec 2025 04:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFobXPGDIAhxNEOvgOxaoua4CnGH+RHwN6g+zzfSEptfxMbnlM28+uGrHvQR3k+s8mHzqp7iBEBxHuR53atTFM=
X-Received: by 2002:a05:6808:1509:b0:441:cf96:934f with SMTP id
 5614622812f47-4536e56bd71mr4967727b6e.47.1764939538159; Fri, 05 Dec 2025
 04:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
 <20251203-firmware_managed_ep-v1-1-295977600fa5@oss.qualcomm.com> <20251205-majestic-guillemot-of-criticism-80c18b@quoll>
In-Reply-To: <20251205-majestic-guillemot-of-criticism-80c18b@quoll>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 18:28:47 +0530
X-Gm-Features: AWmQ_bl-6LGnAWWBpQGplyvtMYtPJabWL3Qzt4TbuX3TbwJUmWa_VxNUCnCChDw
Message-ID: <CAMyL0qO2FPBe7N6Q=hW-ymeiGDhABsU+VCj25jzcoQRhBoWbDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: qcom,pcie-ep-sa8255p: Document
 firmware managed PCIe endpoint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T92BjvKQ c=1 sm=1 tr=0 ts=6932d713 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y2liBin7rq7SVpFgswsA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: I-_b5OAstGuxjbl-pSAJ6fZN9McXS_mt
X-Proofpoint-ORIG-GUID: I-_b5OAstGuxjbl-pSAJ6fZN9McXS_mt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MiBTYWx0ZWRfXydJw06m/7oLH
 Lte27g/ylBIlfg5YWlF23fSYFuhLn6E/7zDiFP4p8r3grlySjB3/nPlwCHBj1D7SuscnBesF4JA
 /j4sDDhH7O9QFuNudIIiM7aydTIqEQQSQoSPTpJm8wvSZCe2f5ml2juTwVf0ejY+hIYHINTmFip
 wDPOQm7LeRN+swMoAAg5O6bFetOAdL4lZfRP3opfr5TnTSZOmmM27wu3kv1aivpLnm/xo6PGkGO
 FFe33cwEyr3tuYlecmAqHafjba1ZlxKekj2RthYk0ICyrJnI2snoToQlL716rTIq/Tep01tUZB+
 3ACTaWTXIZa2JHuRE+Ngh1Dv58dPn61ZRatyx1P466oxFRiQpFejZXAlftsu/yJJkDSs4fsDPah
 S3eC7oOFMBA6Py+woH//xHqeAD9u/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050092

On Fri, Dec 5, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Dec 03, 2025 at 06:56:47PM +0530, Mrinmay Sarkar wrote:
> > Document the required configuration to enable the PCIe Endpoint control=
ler
> > on SA8255p which is managed by firmware using power-domain based handli=
ng.
> >
> > Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> > ---
> >  .../bindings/pci/qcom,pcie-ep-sa8255p.yaml         | 114 +++++++++++++=
++++++++
>
> Filename must match the compatible. In your case, the filename is
> correct but you wanted old format for the compatible (so compatible
> should be rewritten to match filename).

Thanks Krzysztof for the review.
I will fix the compatible string to match the filename (`qcom,pcie-ep-sa825=
5p`).

>
> >  1 file changed, 114 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p=
.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..970f65d46c8e2fa4c44665c=
b7a346dea1dc9e06a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml
> > @@ -0,0 +1,114 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/qcom,pcie-ep-sa8255p.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm firmware managed PCIe Endpoint Controller
> > +
> > +description:
> > +  Qualcomm SA8255p SoC PCIe endpoint controller is based on the Synops=
ys
> > +  DesignWare PCIe IP which is managed by firmware.
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <mani@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sa8255p-pcie-ep
> > +
> > +  reg:
> > +    minItems: 6
>
> Why is this flexible?

The reason for `minItems: 6` is that the DMA register space can be
skipped if DMA is not used.

>
> > +    items:
> > +      - description: Qualcomm-specific PARF configuration registers
> > +      - description: DesignWare PCIe registers
> > +      - description: External local bus interface registers
> > +      - description: Address Translation Unit (ATU) registers
> > +      - description: Memory region used to map remote RC address space
> > +      - description: BAR memory region
> > +      - description: DMA register space
> > +
> > +  reg-names:
> > +    minItems: 6
> > +    items:
> > +      - const: parf
> > +      - const: dbi
> > +      - const: elbi
> > +      - const: atu
> > +      - const: addr_space
> > +      - const: mmio
> > +      - const: dma
> > +
> > +  interrupts:
> > +    minItems: 2
>
> And this/

Similarly, DMA interrupt can be skipped if DMA is not used.

>
> > +    items:
> > +      - description: PCIe Global interrupt
> > +      - description: PCIe Doorbell interrupt
> > +      - description: DMA interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 2
> > +    items:
> > +      - const: global
> > +      - const: doorbell
> > +      - const: dma
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: GPIO used as PERST# input signal
> > +    maxItems: 1
> > +
> > +  wake-gpios:
> > +    description: GPIO used as WAKE# output signal
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  dma-coherent: true
> > +
> > +  num-lanes:
> > +    default: 2
>
> Isn't this deducible from the compatible? Do you have have different
> PCIe controllers with different lanes?

SA8255p has 2 pcie controllers(pcie0 and pcie1).
pcie0 supports 2 lanes, and pcie1 supports 4 lanes.

-Mrinmay
>
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - reset-gpios
> > +  - power-domains
> > +
> > +additionalProperties: false
>
> Best regards,
> Krzysztof
>


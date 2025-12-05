Return-Path: <linux-arm-msm+bounces-84486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608FCA7D46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05EED3038F50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD96316903;
	Fri,  5 Dec 2025 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpm84jhi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WriCZaT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD4320A34
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942523; cv=none; b=ra3JQD4d2d6Omf3ld40fvkUU3g/bdbXcgmxTyAtdBrH9AfGwC4IbAdQUHQb7XUgU6mN5Qi4Z3IXdXY+EEIee4RM6RPWGSFzju855df9Bsa6ltanzbu4j7+3+vfFlx9DVJcsxItcCOHTcswA6MXt7py03685zuJBi6M3rYfRkj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942523; c=relaxed/simple;
	bh=TdsDIHramvOAs0qqLjdcDkHodXMcXYV/oLEbuXapvUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjjsinydAc+y5uOYelipQVjXL9VUWgoILEwBH3wAdnU+VRkqgB6zyP9y4Agq7ZtP/C8qFcNUmPqlKoFaHxl43yYIRWschUDJA1bUKXjOTatTuNJy8Qjy3Kui+jNjfo7GMtwdDvzUUHHXDQmfYWUo1XD6sOwaRldYWxc4UHWhzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpm84jhi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WriCZaT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B590HB22297542
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiMsicvrr8diIe0M5OoR4hIKRYKTzc0ne3OgurpEA+s=; b=hpm84jhiFntJXaz7
	BLEAz6UGYECRlZ4zNUKK4DGFFkjP/dktRO7c70NGICezQKYGeIKIzlGvp0Cvs6nY
	+y4hJFxuS5Tg1Q1Zt9iMGan2s4wnZY18mtTrnaTvhrdUYY600SomQweHCeHHb0YM
	rsnKrkXQmeiunh6nS+71CE3RLkZc8mA8nghlq22CD6HIyoGFVQAPf8Trhcj8JAUw
	20Ds5VX63TrnT0OTpk4oAdUQVS0A31Bx734Y13q4mTIlz4eT7cm0SzO8yMsB3urG
	1CH69Hcx+cNttN0++ACRDsrJkxXeGBLh0pgMpuOO60SeLG71o/hxeDbgwtPYdi05
	egCI+A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknfa5qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:48:36 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4511a6fde00so1128175b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764942516; x=1765547316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiMsicvrr8diIe0M5OoR4hIKRYKTzc0ne3OgurpEA+s=;
        b=WriCZaT4boBA6pa2RatEykyFnJYpokz03yFyO4yRigKmmcdpyn5YlWMm6bmKoQRJ+f
         a8sJwNL5JTY3l55rn/pGE/C4DD5Eq7zjURpdLmjTyOKfrcqBqU3mIprgmORWeYixc2aE
         BYJjSy3OxLxv/5wv1n5qtzHC9pscaD6n6tS1atJRU0vw5Qd5xC7FY93QF3KllgcySURP
         JZaJe5ErWqiQmkZjStDdY0D+ELe8s5U7wdeC5o7jzrIobANg78ru2nJdSmBmGE4W2cGC
         VVakKcmbddCBwF/L23sNyTVKLVKeGI4eSNyz2crJGGQZ1clDeFWKC6rAZX9p2FK+av55
         AE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764942516; x=1765547316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IiMsicvrr8diIe0M5OoR4hIKRYKTzc0ne3OgurpEA+s=;
        b=Wy5ET10PZcElLkGczQsMQ8m/cdSmyjekXmJM8bYPxKRzJQJ4PkuKB7mfZK7VDjTyFs
         abIVvq+y6ons3GlJcR5LNVK+TLtorpQPziRJTrQOgV0qZRZY1faTadqu5GRadZr7zog0
         4f3xHtVLI8ZKG8JAqOhrSbFzkGQ1hhtvYNwWQmIhERi88vAg7DVdgoBh3GTVGrozyNoI
         1bmYpcYmXaeC0TWLFvzvjGFGNJG7h5TTYBjIFATBAOWnLHQyFoJsigdCC6kTSWXcIYzH
         T1VdJYwxc/A2CIdb42zqEMQu+Lo3nlNtzNnV9zRvEUpIUHwAVF3BTULwqcxqkpbxDLQg
         1MXg==
X-Forwarded-Encrypted: i=1; AJvYcCVKbcdHAH5jT5t618frICKNAzEOENME3DOtQHmT9GZLFtZtp7ceKsg9QazOYuwW1DzgWBbtQjOhUtDWDqPq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8z/WsOln39sn56sIfdPXS5z235JnZ+fL64vFd3aU2BAc/Y7LM
	pmN2uXvtQ2wnGB4qZe+jxWO4uPuB5aGE+M+JR4N92wqni9Wi9/oK0wjjPRAkcz7nFAkVs51Xcnc
	FjThpXwLObwxAC2PZhkq+BqB09tpAhe0XVLnjIk9x0WYUaokhNR6caiU0pu5xPWAXAPpVSc5KGF
	8kkLvZJMwQ+V96Oy6c1OpNAvePV6Chs9oAr9Di74Rn6WM=
X-Gm-Gg: ASbGncuU+IHHapOhrb3Yy6zpp7SJVl9PMwN7tIahMs1M3Oq3+8Uq0t9YxOPYdp797gM
	Dy80NHR2wN83s4AYh7ONIxmfPsJTapoCRlarvTK1JPeHT3B6tsir08KPSuwUlxxjWUHXxM1hzAW
	uBbjlC/IBE+MLdNB3o3mL/UY1jpk+loTHP/k2SM8dCyNXpO1X0nFb9hJQEz0gz3xWIITY3
X-Received: by 2002:a05:6808:3010:b0:450:b249:71bb with SMTP id 5614622812f47-45378f06f2fmr3805982b6e.19.1764942515862;
        Fri, 05 Dec 2025 05:48:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG766SJ1fSjtRDbZOh8Wb8u90yiVoRAIMUkghojiquxEfkbj3EbLyJWgVfhUp4VNaCcs+C8cydwXQQVzNsrpn4=
X-Received: by 2002:a05:6808:3010:b0:450:b249:71bb with SMTP id
 5614622812f47-45378f06f2fmr3805957b6e.19.1764942515528; Fri, 05 Dec 2025
 05:48:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
 <20251203-firmware_managed_ep-v1-1-295977600fa5@oss.qualcomm.com>
 <20251205-majestic-guillemot-of-criticism-80c18b@quoll> <CAMyL0qO2FPBe7N6Q=hW-ymeiGDhABsU+VCj25jzcoQRhBoWbDA@mail.gmail.com>
 <8bb852ac-1736-49db-be94-f6be9e500f74@kernel.org>
In-Reply-To: <8bb852ac-1736-49db-be94-f6be9e500f74@kernel.org>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:18:23 +0530
X-Gm-Features: AWmQ_bmuQdHWQvQj--3LmjNlkO7QoUm0_1jFk5YFWGBEAMX-x2uCNHN3HRIdyeU
Message-ID: <CAMyL0qMyRzpum2xeQ6rFGE+KR7jnEfQfyOQHb+5766tkOcBDrA@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OCBTYWx0ZWRfX3SuoNhJadHen
 5W6vbuIg6DyzwjaQU4SD+UYPmxBzBX0YX6r8QqWDliOYtTF9NAJ4wPwViLKqx+4NPAZ0rEIopQB
 +e1BS5Psw3ybePTS8VCcRIFvohOXb7Z/ru0dFJDE+/rd4XczZxXxWBrT/etrsjox4TIRFIJjv9Q
 Z8CX2bujWJT5wO204lBruhKRh1V3Ac1R4awWX6IdgInu6NnG22maA47eqhMPVZKYTHZ7ARU72+0
 1uA5mTgzC61N9cuJJWDbZDwZ3omB9xvgj5Vx0Z0FeJXFnY2gox6rDZIXDZ6siLvIzDBwVCzk82d
 ydS4Sd7nDNO1EUY85JbIbwqJUE8a2PeEiU4ovrPQ4uWKhOEFyp/7Aa9F5OkHf90B77hsY14/DAZ
 FPkG2x4CUej30a9yD4/M1X1rh/GGMg==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=6932e2b4 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=GzXPYxtLnhddMOALZxQA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: t01Uo5X3DQceO-Hwdzi_v3VEZ-BaWLvg
X-Proofpoint-ORIG-GUID: t01Uo5X3DQceO-Hwdzi_v3VEZ-BaWLvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050098

On Fri, Dec 5, 2025 at 6:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/12/2025 13:58, Mrinmay Sarkar wrote:
> >>>  1 file changed, 114 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa825=
5p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..970f65d46c8e2fa4c4466=
5cb7a346dea1dc9e06a
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml
> >>> @@ -0,0 +1,114 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/pci/qcom,pcie-ep-sa8255p.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Qualcomm firmware managed PCIe Endpoint Controller
> >>> +
> >>> +description:
> >>> +  Qualcomm SA8255p SoC PCIe endpoint controller is based on the Syno=
psys
> >>> +  DesignWare PCIe IP which is managed by firmware.
> >>> +
> >>> +maintainers:
> >>> +  - Manivannan Sadhasivam <mani@kernel.org>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: qcom,sa8255p-pcie-ep
> >>> +
> >>> +  reg:
> >>> +    minItems: 6
> >>
> >> Why is this flexible?
> >
> > The reason for `minItems: 6` is that the DMA register space can be
> > skipped if DMA is not used.
>
> But the hardware has this anyway, so this must be here. You do not write
> bindings depending how drivers use them in your use case.
>
> Either drop minItems (fixed size of array) or provide rationale in terms
> of hardware in commit msg.
>
> ...

Thanks Krzysztof for the feedback.

 As per your suggestion, I will drop the `minItems` property for
`reg`, `reg-names`, `interrupts`, and `interrupt-names` since the
hardware always exposes all regions and interrupt lines.

I will use a fixed-size array with `items` only.

-Mrinmay
>
>
> >>> +
> >>> +  dma-coherent: true
> >>> +
> >>> +  num-lanes:
> >>> +    default: 2
> >>
> >> Isn't this deducible from the compatible? Do you have have different
> >> PCIe controllers with different lanes?
> >
> > SA8255p has 2 pcie controllers(pcie0 and pcie1).
> > pcie0 supports 2 lanes, and pcie1 supports 4 lanes.
>
> That's ok, thanks.
>
>
> Best regards,
> Krzysztof


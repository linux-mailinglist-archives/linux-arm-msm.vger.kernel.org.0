Return-Path: <linux-arm-msm+bounces-80889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E643C4469B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 21:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A6A3ADE9C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 20:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1417E259C94;
	Sun,  9 Nov 2025 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpyhZE9E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8L3bxWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57477253B58
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762719247; cv=none; b=Bq3DBX3CTXrnCl+8lawSyjcN+XE7EQgwPkUm51fXrmNKFfC3/lcN3KHp3PVDWfweCCU7ewfVQ6x3LfDbjG+VZgdAw4LVwlBYeNhz9vat3STlUWI3dEnhkb2PHKStmrahAkK8teaMSvuwX7c04FWitXsXVng6y36BH+c0R6lIsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762719247; c=relaxed/simple;
	bh=3YDD6QYRVYHOe62goM64un6Zx1SgceIyEXlt1CxPalI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3m3bbDiqDQzHb4L+ag0z8TMpeLtkeS6xcSuXQQ3skWORITDBmwjE4jOTa5dKOeKleq3uyqc4eNQi9j6cnQ4A3ReTr4nV98SK3RtM7WB3NqCeSXr7KTkqAAIrdfVLPbgE8A5dzooBFiN+4WHx/cDVMHe1wOOWa3mB68X+5Xuogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpyhZE9E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8L3bxWV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96cV493893112
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 20:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQrHVmgQKbHvQ2sU0ktxIzUv
	0KL8iYk/4UNwwRP5jlY=; b=ZpyhZE9EcbwNTTzMN8K/RahsI71LhHMorHpW7jG0
	YFR+cF9PoEDuJ3Hj4fSAcaqrFWgg4J9J5KiFNY5OdLhBK0zutWFRHWMZgCaDNrTc
	li9UmJWRKiDo8fkWhCVZDcGHAJ4RHjDfBAY7zW22TNY2s6zWl6oeacyZFzRcz64m
	1bMFWlVeKmxv8oNPHVghFUpI9rZOHkDgQk64lqYCa6074jYOT/4/uC/A0I4Me/Wu
	v+hWymxAVobRm+AJYWEWZu2x2Xy4nd/HGDEcrXD3xTRJ0J6bixkBMHfb3dgkJyGR
	1K1VRHRMHLkxnvTHdq12zBNq7dell6PUjOD4QeH/7RyQ0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw6jkvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 20:14:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89f4a502cso70256731cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 12:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762719243; x=1763324043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQrHVmgQKbHvQ2sU0ktxIzUv0KL8iYk/4UNwwRP5jlY=;
        b=H8L3bxWVrUX6V3jWwt5OKm9vwI9KjjHyrsOXw9vlfeuTUllThD65opOngnbfmfk/k7
         4mTNHRUHWJu8Gcp1QAEuskyTMWRbf0g+RIoZ0NiBbulcNb6v5yBH/bvbBboEgh6fJ49J
         y+SFaQYSIJjW/b3Yaw25ZlUXbEloy2NZMJJcvCtzK+S+6jZwzGzLD78Hw0KrI5hadJX+
         1B+EuVGxcT4ri/hxtT9uIM4Vpm2wNaZulhJfAkXMJWr5M7I9raUjL3e+iKNVtDQqjgzl
         WIgeOC/wdOBdGvs/F/xn0yaoHefg4n4rh/ZQV5sg3l9fCk82ce9ToCHrEyezqeo4Scyv
         Ab6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762719243; x=1763324043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQrHVmgQKbHvQ2sU0ktxIzUv0KL8iYk/4UNwwRP5jlY=;
        b=Zui2oV/SG577e8fVNTCcpCTAWR53OtevZQGN0+YMEYs8Qm/TqkBMJh4NMnH8M31xLy
         BeHX+eRFL5fsR3RcV05XKYOVEWmof5vlIkRYZY8KYBW3kj55API8nx91dfAAyImBkR5y
         ihY9a5YMu0OjHo0NuWLMLGdbr6Bk+DPilmSqn2v04xaJ0610CJSR+hbDQlSuIZXYhZRg
         JPX/Q3XJ4IobzpCCe7716j5cpmjxVTppR2b55gjjC49NbDhdM2hkIzPkWj5q9gjKIk3N
         YN9b5P5/ITPnJWfz+DL/Tz7SuUr4qjlX21bj2s8ftyBL/SZZLQfT7mJOHFmKqq0JGU/A
         Nc5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdENKMJXzN8hxe6RiocCH6nAtvX+JtxAVUmXvJ+5B9Tsjjb9nalxdSMVjSngWmRQph3qBDTlyk90ypCQm0@vger.kernel.org
X-Gm-Message-State: AOJu0YxvINUpSmuyHyRM1DcNNCjcUCE9BL11jXNTTW23aMKsRnGXxEPb
	nQ/NRafT01ploAKIWgcNwCEvjR1j4uyoMigrRA5UBDjhaUeED1jLgK0Lk5XQaeZY8hL8nlAb4R7
	dYmqt7VkoVnaX0cKJcenQIiG+Heqxh4P4kLs5UGB2FBLtZQFBrNVn1sEORzu7/8azmzF9+JHT2D
	Pv
X-Gm-Gg: ASbGncup3ezDHJUJoVvJdDIWqnK21+3hCKVlqNXhz1fkco58KyJaHC3xDOiuhN/1jcT
	vEUDFFubE8Ku7riCUFmDLtlggs3JFmxXnONGFfQCLWZ48RrR2iLpYX0Z718JtRoPi+lqMsT8jYC
	jbm2o9GuaTFWQ0a+ZTWVt1oBDfWGKD6Zcmv8qKjp3CupUHg48olLs7UFiWD1CHilx+IPAiGgD8K
	01BimlyH6nWSYKnbnqFWYhmpD3kxpNzldQU99S84VMAcWybWaG9ajQRKylU84bCYlyITcllXAsK
	oHcHxJvjrSGJjwDZzO3gQVcJYj3JCL4zqfePbbk8uLi9kQh8UP27wLHrbTj/zlRmSIg/ihBTusB
	JfS22gCc5TcEo/RR9/N6Bv5OXNmfpt3C3mYWLuoEHUrXeqsJ917dIyOaLYGMu6kOyVT25TZJSuQ
	NruIlSyPMr3Up1
X-Received: by 2002:a05:622a:11c8:b0:4ed:6989:85ff with SMTP id d75a77b69052e-4eda4e8c089mr74729091cf.3.1762719242770;
        Sun, 09 Nov 2025 12:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIvKnzhoEtORiw56O3jY2DU4HPr1sokGpTQfcUEGwkVd9PZNUkRGso0cDRdafjoSJK2fpfuw==
X-Received: by 2002:a05:622a:11c8:b0:4ed:6989:85ff with SMTP id d75a77b69052e-4eda4e8c089mr74728871cf.3.1762719242355;
        Sun, 09 Nov 2025 12:14:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a1b28d0sm3360679e87.77.2025.11.09.12.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 12:14:01 -0800 (PST)
Date: Sun, 9 Nov 2025 22:13:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add PCIe M.2 Mechanical
 Key M connector
Message-ID: <5kedk7c6kc2e5j4kqeyik6i7ju54sdn6etjhpwl2vt4nq6c6ug@2yld4hpvbuzg>
References: <20251108-pci-m2-v2-0-e8bc4d7bf42d@oss.qualcomm.com>
 <20251108-pci-m2-v2-1-e8bc4d7bf42d@oss.qualcomm.com>
 <gmwg46c3za5z2ev34mms44gpq3sq7sb4jaozbdn5cejwbejbpo@wwr2j7dkjov4>
 <qrgaulegz2tb7yzklyl7rpkgbf6ysx44bxtyn6n3tcyq4an4e5@bzngutkvfno3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qrgaulegz2tb7yzklyl7rpkgbf6ysx44bxtyn6n3tcyq4an4e5@bzngutkvfno3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDE4MCBTYWx0ZWRfX1JLjede0neIm
 kCBeWZKCcuiqFl7HuR/hguxUHJMAF3ZPYqt0O4Y3WwPVRmtgStg/RyEbQ/1QO660Ff51tMMSau/
 BudV0B0sNrXKfPPu9PFgQJLsENPY8DStpwhtVoMAiLLYRuqbI+mcRJl1I/c3nat9n8X4x7+TJSm
 3I55G62GjMT/9YktwjBgVlf8BGqgajpCIyctb3761Sed0Zu0vZU4AN9f939ASkKPf0iDS1hBY+Q
 js0o1/+CPoxD2R8y+sXPHNmpsHhUGwGkIbFWjzNjUBqsqlt1rqbyrt/ueTVWo/SEKe1ZaJ+jQ4z
 UdqX/BmvDBamiUNurTQsP5ofg5Tw8gYEvfOMzv+k4g7uwHCPyk9jxpYRZ1EY3JunAOEuW4lIPas
 DpjLErssZQwIPrjg+YOfzr5rDN/68w==
X-Proofpoint-ORIG-GUID: 0PSBZ5pHg6M0uTWdRoqkkKyZg7OCHEeT
X-Authority-Analysis: v=2.4 cv=cpmWUl4i c=1 sm=1 tr=0 ts=6910f60c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vecdOpQ8aSexLyLbR9sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 0PSBZ5pHg6M0uTWdRoqkkKyZg7OCHEeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_08,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090180

On Sun, Nov 09, 2025 at 09:48:02PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Nov 08, 2025 at 08:10:54PM +0200, Dmitry Baryshkov wrote:
> > On Sat, Nov 08, 2025 at 08:53:19AM +0530, Manivannan Sadhasivam wrote:
> > > Add the devicetree binding for PCIe M.2 Mechanical Key M connector defined
> > > in the PCI Express M.2 Specification, r4.0, sec 5.3. This connector
> > > provides interfaces like PCIe and SATA to attach the Solid State Drives
> > > (SSDs) to the host machine along with additional interfaces like USB, and
> > > SMB for debugging and supplementary features. At any point of time, the
> > > connector can only support either PCIe or SATA as the primary host
> > > interface.
> > > 
> > > The connector provides a primary power supply of 3.3v, along with an
> > > optional 1.8v VIO supply for the Adapter I/O buffer circuitry operating at
> > > 1.8v sideband signaling.
> > > 
> > > The connector also supplies optional signals in the form of GPIOs for fine
> > > grained power management.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > ---
> > >  .../bindings/connector/pcie-m2-m-connector.yaml    | 122 +++++++++++++++++++++
> > >  1 file changed, 122 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..be0a3b43e8fd2a2a3b76cad4808ddde79dceaa21
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
> > > @@ -0,0 +1,122 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/connector/pcie-m2-m-connector.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: PCIe M.2 Mechanical Key M Connector
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > +
> > > +description:
> > > +  A PCIe M.2 M connector node represents a physical PCIe M.2 Mechanical Key M
> > > +  connector. The Mechanical Key M connectors are used to connect SSDs to the
> > > +  host system over PCIe/SATA interfaces. These connectors also offer optional
> > > +  interfaces like USB, SMB.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: pcie-m2-m-connector
> > 
> > Is a generic compatible enough here? Compare this to the USB connectors,
> > which, in case of an independent USB-B connector controlled/ing GPIOs,
> > gets additional gpio-usb-b-connector?
> > 
> 
> I can't comment on it as I've not seen such usecases as of now. But I do think
> that this generic compatible should satisfy most of the design requirements. If
> necessity arises, a custom compatible could be introduced with this generic one
> as a fallback.

Ack

> 
> > > +
> > > +  vpcie3v3-supply:
> > > +    description: A phandle to the regulator for 3.3v supply.
> > > +
> > > +  vio1v8-supply:
> > > +    description: A phandle to the regulator for VIO 1.8v supply.
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description: OF graph bindings modeling the interfaces exposed on the
> > > +      connector. Since a single connector can have multiple interfaces, every
> > > +      interface has an assigned OF graph port number as described below.
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: PCIe/SATA interface
> > 
> > Should it be defined as having two endpoints: one for PCIe, one for
> > SATA?
> > 
> 
> I'm not sure. From the dtschema of the connector node:
> 
> "If a single port is connected to more than one remote device, an 'endpoint'
> child node must be provided for each link"
> 
> Here, a single port is atmost connected to only one endpoint and that endpoint
> could PCIe/SATA. So IMO, defining two endpoint nodes doesn't fit here.

I think this needs to be better defined. E.g. there should be either one
endpoint going to the shared SATA / PCIe MUX, which should then be
controlled somehow, in a platform-specific way (how?) or there should be
two endpoints defined, e.g. @0 for SATA and @1 for PCIe (should we
prevent powering up M.2 if PEDET points out the unsupported function?).
(Note: these questions might be the definitive point for the bare
m2-m-connector vs gpio-m2-m-connector: the former one defines just the
M.2 signals, letting e.g. UEFI or PCIe controller to react to them, the
latter one defines how to control MUXes, the behaviour wrt PEDET, etc.,
performing all those actions in OS driver).

Likewise, for USB you specify just the port, but is it just USB 2.0 or
USB 3.0 port? In the latter case we should have two endpoints defined,
one for DP/DM and another one for SS singnals.

-- 
With best wishes
Dmitry


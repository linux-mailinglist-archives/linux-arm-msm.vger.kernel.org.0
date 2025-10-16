Return-Path: <linux-arm-msm+bounces-77523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776DBE1E62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0FBA19A76D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC6A2E36FB;
	Thu, 16 Oct 2025 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcehCPxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5011A23B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599437; cv=none; b=ihFNsNIJ2WztPsFYUG+v2Aga5v1rAoZYEA93lF6mBQYISoah59bSp+f6rqhmfrbya6YrMg2hdP1cELyW75cKIiT0LAo3xF6S87EiTelmJ87AoJzXOEPaAP0bnotbKAKRYU/MqApaXUddTzGQ1jK4j1zsk4cRq6hxolvrzgZHLhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599437; c=relaxed/simple;
	bh=u/pvDB6NNeRtZsdN9ugitJ4p2VYbjeZ0yG4iEuphbPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdFDFcLurDSK9l278nosWSFKJcZw05c21y85wwd/lDgJz5L/HdQu5iLogRN6yDHAdxTMbxqpAhQ5DuEMsN9ciaCzdwidtbkTSFAXTssdb1TkTIuhvzo5BTsfYW/b8AICoo+vdntd4fo4sAZhUxI8PNJ7KsTdI/f3U/1Ghie5Mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcehCPxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FK5JJF010182
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HNGoDb+vaeJYhaVScXJVKuKu
	/Vv4DWy6iQO7I53RXv0=; b=lcehCPxdI3Y3P4qM+yY4UhPyGsxAao5Pp/qdcZiG
	OsMZzCfojghPy6kLmWAQuHukdmPKI5dtOZlrv9CZmxrYxZw3ADW99vJTtiqw7uce
	1W44E0QRpEFdP8Xt7Ni1hOZTPYs+S9bKymX1SOX8a53k2jHcTGXeFn1dCi9FprYG
	5PQ+D5Vpx+HOi4rGzhpdM8oY8w7+dIcLYDyv1McaTcRTL8QuOthKT0qUn2BD7onW
	r2z4no7LHMbWIvn6qzyAiEJjYnv6jEHkWsXoxwOoXwPdhlRP8AXRe5Dmy2mx6dKM
	FhCpW+uv2KioBWzyoLNYccyX7+jb30gQRDNOIx3WR+3p0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c78te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:23:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so336286a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599435; x=1761204235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNGoDb+vaeJYhaVScXJVKuKu/Vv4DWy6iQO7I53RXv0=;
        b=IsS5JOIEMUFv8YVu6BnUrfZ8KiXu4NPzGhBSy75OKGCcIDTR8XrC7WVSoJpHQHdXS7
         QAl/Q1fCbEdrk8FpY7xTXsn8Bd8nyP/cRM1NG9s0tm+dxPx38H1IUa242CGKOEjOgaAu
         5bz5goOZPR4Q5cO5p8SdZjNbLZskmjq5Wlp+RsJOx3hlYyG+McR7kuw5DEAaT4OgY3JA
         6d4s4aY54X8yP7p/ewxVcRyTHl8ksA+KFnV1btGN5uB7S4dlaYDzn1gq4RQSMI/7F6yQ
         UCJyj9fmG4y2ZH/6IIG1Uh0mm272duM61hUzMRB5M0hGdSNaK+ZMCi1ztfSd8/+Gk9or
         ptNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJPUbRMmX4sWh2PKvgJRPx1bKuZVO1YCHhz9bx1UiGd5yci3sxJZI7bEb4e3cJ3msiA/MlFGidrbzCzQo9@vger.kernel.org
X-Gm-Message-State: AOJu0YynnIA5q3cotLDPJjIf1jErUhl7GWM4PG55s6FsY7OGTwHBI5FX
	5AbyhLFP/rpV5FtdvRHsxclYUozFe2xNmUBvucE79kysEaFi43X8PCDNc825lT9lJ8Rlg9/v2Be
	gHwGnq/+nVGLZWH5wn4/RvkCYG5joU2TDdamVfVq/TDqu2iGn5wgFDeifKUOI//vp+c4d
X-Gm-Gg: ASbGncsnEWuHgB3NJhJzLmPW0b6gulrqvYDtJxd1ugx/2K7BBYeLvoTvQw1/etTjhUw
	mawSuPB5eDtO0B3K4KHc83JmqYClM1nuxaMtVBCrutn2fYu5j/plIVvscZBRANBaPyhiDKMfBB6
	FzPnriowvY9pXJlZ1jB2NMBvr6MfXPQ5KzYWdBJa620R/iX7CBkwa4ZE4IT6TpyWpdqEsJOeU9P
	Y+/NMNMwHhKxDnjBz4JzTqlstpvni9XAWLXfKvW3bbIO5UsnOYAxZfr3OASCxMpeIn7cJ30TLG7
	YiZqrR6B/P5i5PxkgrSii0biwZBLiXKdYFrWL9k3wdMHuRmuivBy72PWzbajxNQJs1u4k6Onmrq
	3I54v522AuwL/9MyZzyrs+O5Y5nDoRWP5VTnVfVHdiLcU+g==
X-Received: by 2002:a05:6a20:9147:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-3348d0b695bmr6237497637.8.1760599434709;
        Thu, 16 Oct 2025 00:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwrFPYz5L+0gDGKdDM3zwqmU9HSI97jDmKx2e+L9OE61zcHAbhnCy3ioFU+PCD6S5glLBXkw==
X-Received: by 2002:a05:6a20:9147:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-3348d0b695bmr6237464637.8.1760599434258;
        Thu, 16 Oct 2025 00:23:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm21248313b3a.30.2025.10.16.00.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:23:53 -0700 (PDT)
Date: Thu, 16 Oct 2025 00:23:51 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Message-ID: <aPCdhz+kr/Hghol/@hu-qianyu-lv.qualcomm.com>
References: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
 <20250903-glymur_pcie5-v4-2-c187c2d9d3bd@oss.qualcomm.com>
 <w2r4yh2mgdjytteawyyh6h3kyxy36bnbfbfw4wir7jju7grldx@rypy6qjjy3a3>
 <7dadc4bb-43a1-4d53-bd6a-68ff76f06555@kernel.org>
 <aO797ZyWIrm0jx2y@hu-qianyu-lv.qualcomm.com>
 <w4kphey3icpiln2sd5ucmxgo7yp72twwtnloi5z7a3r3a63fri@fbebffeibb7p>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w4kphey3icpiln2sd5ucmxgo7yp72twwtnloi5z7a3r3a63fri@fbebffeibb7p>
X-Proofpoint-GUID: lCYJwz5iQBt6AIHmuX0IK4ZfKWToR_Vy
X-Proofpoint-ORIG-GUID: lCYJwz5iQBt6AIHmuX0IK4ZfKWToR_Vy
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f09d8b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=AS9496Lnv1pbona6PS0A:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0Ipliqj/huqK
 eS/EmoFtKCLQQuAqOxexH2Yg1zE0lAeF4gZuOgbulca7tV5MO1H/Tr3Ju7ATi156StI+tPTME+b
 AbMyPnfz4N0i3HlmlEXhfc6KVQoff6w0Ru0WUja2/YpjEfEnTMSOd51Z3F8e6XeOyyveK/6LsUC
 7UpLYFVtI0bajqw+TNAiyttgKfLYqIoIJXAVynUn9SDDrtonQ8PD+iUmDMUZsjUrneCABdNmRlX
 FGSWRp8fVaa6yxJfztOxVMCAH6kgb0I4SVNQwJpRPlYTi325lKMh+Dhbo9c8SI6U0pQzTiU63xh
 nEZvZ0kOKqSVHFg5reEoVKm8oWFSAbn6dnr+LrAX6/N0JL73+ZFQ2ggM7KhQS4TfNqdLOKEoqU8
 /oBBxAz0w9qwT1PO0EDXXOfJ1IMBgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Wed, Oct 15, 2025 at 09:58:31AM +0300, Abel Vesa wrote:
> On 25-10-14 18:50:37, Qiang Yu wrote:
> > On Sun, Oct 12, 2025 at 05:01:45AM +0200, Krzysztof Kozlowski wrote:
> > > On 11/10/2025 14:15, Abel Vesa wrote:
> > > >>  
> > > >>  properties:
> > > >>    compatible:
> > > >> -    const: qcom,pcie-x1e80100
> > > >> +    oneOf:
> > > >> +      - const: qcom,pcie-x1e80100
> > > >> +      - items:
> > > >> +          - enum:
> > > >> +              - qcom,glymur-pcie
> > > >> +          - const: qcom,pcie-x1e80100
> > > >>  
> > > > 
> > > > The cnoc_sf_axi clock is not found on Glymur, at least according to this:
> > > > 
> > > > https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com/
> > > > 
> > > > And dtbs_check reports the following:
> > > > 
> > > > arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b40000 (qcom,glymur-pcie): clock-names: ['aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'noc_aggr'] is too short
> > > >         from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
> > > > 
> > > > One more thing:
> > > > 
> > > > arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b40000 (qcom,glymur-pcie): max-link-speed: 5 is not one of [1, 2, 3, 4]
> > > >         from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
> > > > 
> > > 
> > > So that's another Glymur patch which wasn't ever tested?
> > 
> > I tested all of these patch and also did dtb checks. That's how I found
> > cnoc_sf_axi clock is not required. There was a discussion about whether we
> > need to limit max speed to 16 GT and I limited it. I may forget to do dtb
> > checks again after changing it to 32 GT. Let me push another patch to fix
> > this.
> 
> Still, you need to add glymur specific clocks entry then, to fix the schema
> w.r.t cnoc_sf_axi not being needed.
>

I think the clock-names too short (cnoc_sf_axi not needed) issue has been
fixed by below change.
https://lore.kernel.org/all/20250919142325.1090059-1-pankaj.patil@oss.qualcomm.com/

About the max-link-speed issue, we will remove max-link-speed = <5> in dts
as max-link-speed is used to limit speed but I'm not limiting it.

- Qiang Yu
> 
> Best regards,
> Abel


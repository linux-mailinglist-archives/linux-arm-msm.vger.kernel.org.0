Return-Path: <linux-arm-msm+bounces-34695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345269A1A59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 08:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E870D288783
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 06:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FBE1791EB;
	Thu, 17 Oct 2024 06:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vfudumw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3217580;
	Thu, 17 Oct 2024 06:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729144875; cv=none; b=m8uDE6HhFlqh1bOD0VaRc2LGNZsI7o1h1APBY02bNVQImSA2TZbfULO9cc9P1BM89y/jckdfgWT73qL1GD8F7rhtPH7jwaMNe8Eq3WW70rUhrSDqf0R6y2PbOY/AN2H+Lo0VAmsLqYoJXTwpdbeziP6WGvIjgrZBcJA1N78VnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729144875; c=relaxed/simple;
	bh=Go4R4kNnkFQqRMwHqKfSeRO9WDM6o7fjEUWrhrCLcOo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNFqPMGmpUUAwvNnth3Md+8/dX17gnUZJLMjavLPHPbK9ioPY8TTvgK6r8EF5EPGjmtapV3WAQGX1JKndvU1XVRBDfna/gy/dbjj8HK/193fetBoSTkpI7AVTpkeTEUwLW3uAJPqSn/jR7IBHg/lle0HWKlSSwJTlJgGKER8ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vfudumw1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGVHnW031506;
	Thu, 17 Oct 2024 06:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I2dJHSILrtgjFG6PlUEjpzHR
	lJvtIybWLmLkKd+eYOU=; b=Vfudumw1OKzQml2AwCjQ6nnsvmsQ4+nSMTJITN8b
	GHb7Q3t1Gt7z+V3y55l3SHDIWWziu007YNA/AvGoKwAygFx5gMaFmDL1UYdiObcB
	/9hErl5oK37iXEp+cYXyKZLho+ouiaOm8eUn3nRibrSioLg1baGz5VJgGHMoNywi
	T7M9P+r62v5akgAaWyskuBTTNW/A4VHX/f3M1lgLYyVxC3qRtREwuR/KmS8W7Pc0
	ePUtGR37KUs6ZbIE6m3FaQ9qHmle2rP7cm6279K8Xy9APgi2/8oFty0UmN9LfjrB
	xKwp7IMYXB36p7BuIjzZV8ZNAWeFvhl/ef1SH7G3zEhMrQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq3hf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 06:00:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H60tL1032240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 06:00:55 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 23:00:49 -0700
Date: Thu, 17 Oct 2024 11:30:45 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon
	<nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <20241017060045.q2cz3o77aejq4g5m@hu-akhilpo-hyd.qualcomm.com>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-2-1e5e91aa95b6@quicinc.com>
 <he6cfrofgmdw2se4mcok25c54sboovevmlli42xh6ttnqiogat@ja6el35jyd65>
 <20241015191314.pbz5v5u65gbpjheg@hu-akhilpo-hyd.qualcomm.com>
 <294bf353-4aff-4d89-a5d7-5d2d19b089c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <294bf353-4aff-4d89-a5d7-5d2d19b089c1@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OQCJ3d2kKtMLuWMuKguzHp4nbwFHygGB
X-Proofpoint-GUID: OQCJ3d2kKtMLuWMuKguzHp4nbwFHygGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170039

On Wed, Oct 16, 2024 at 09:53:58AM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2024 21:13, Akhil P Oommen wrote:
> > On Mon, Oct 14, 2024 at 09:39:01AM +0200, Krzysztof Kozlowski wrote:
> >> On Sat, Oct 12, 2024 at 01:59:29AM +0530, Akhil P Oommen wrote:
> >>> Add a new schema which extends opp-v2 to support a new vendor specific
> >>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> >>> property called "qcom,opp-acd-level" carries a u32 value recommended
> >>> for each opp needs to be shared to GMU during runtime.
> >>>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 84 ++++++++++++++++++++++
> >>>  1 file changed, 84 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>> new file mode 100644
> >>> index 000000000000..9fb828e9da86
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>> @@ -0,0 +1,84 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Qualcomm Adreno compatible OPP supply
> >>> +
> >>> +description:
> >>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> >>> +  ACD related information tailored for the specific chipset. This binding
> >>> +  provides the information needed to describe such a hardware value.
> >>> +
> >>> +maintainers:
> >>> +  - Rob Clark <robdclark@gmail.com>
> >>> +
> >>> +allOf:
> >>> +  - $ref: opp-v2-base.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: operating-points-v2-adreno
> >>> +
> >>> +patternProperties:
> >>> +  '^opp-?[0-9]+$':
> >>> +    type: object
> >>> +    additionalProperties: false
> >>> +
> >>> +    properties:
> >>> +      opp-hz: true
> >>> +
> >>> +      opp-level: true
> >>> +
> >>> +      opp-peak-kBps: true
> >>> +
> >>> +      opp-supported-hw: true
> >>> +
> >>> +      qcom,opp-acd-level:
> >>> +        description: |
> >>> +          A positive value representing the acd level associated with this
> >>
> >> What is acd?
> > 
> > Adaptive Clock Distribution, a fancy name for clock throttling during voltage
> > droop. I will update the description to capture this.
> > 
> >>
> >>> +          OPP node. This value is shared to GMU during GPU wake up. It may
> >>
> >> What is GMU?
> > 
> > A co-processor which does power management for Adreno GPU.
> 
> Everything, except obvious GPU, should be explained. GMU is not really
> that obvious:
> https://en.wikipedia.org/wiki/GMU

Will do.

> 
> > 
> >>
> >>> +          not be present for some OPPs and GMU will disable ACD while
> >>
> >> acd or ACD?
> > 
> > should be uppercase everywhere in description.
> > 
> >>
> >>> +          transitioning to that OPP.
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +
> >>> +    required:
> >>> +      - opp-hz
> >>> +      - opp-level
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +
> >>
> >> Drop blank line
> >>
> >>> +    #include <dt-bindings/power/qcom-rpmpd.h>
> >>> +
> >>> +    gpu_opp_table: opp-table {
> >>> +        compatible = "operating-points-v2-adreno";
> >>> +
> >>> +        opp-550000000 {
> >>> +                opp-hz = /bits/ 64 <550000000>;
> >>> +                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> >>> +                opp-peak-kBps = <6074219>;
> >>> +                qcom,opp-acd-level = <0xc0285ffd>;
> >>> +        };
> >>> +
> >>> +        opp-390000000 {
> >>> +                opp-hz = /bits/ 64 <390000000>;
> >>> +                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> >>> +                opp-peak-kBps = <3000000>;
> >>> +                qcom,opp-acd-level = <0xc0285ffd>;
> >>
> >> That's the same value used everywhere. What's the point? Just encode it
> >> in the driver.
> > 
> > I will update this to keep a different value. In a real implmentation,
> > these values may vary between OPPs. For eg:, please check the DT patch
> > in this series:
> > 
> > https://patchwork.freedesktop.org/patch/619413/
> 
> OK. I still have concerns that it is just some magic hex value. Which
> looks exactly how downstream code. No explanation, no meaning: neither
> in property description nor in actual value (at least I could not spot it).
> 
> And why this is hex? Unit of "level" is either some logical meaning,
> like "high" or "low", or some unit, e.g. Hertz or kBps. None of them are
> hex values in real world.

This value (which is identified after characterization) encodes a voltage
threshold for the ACD hardware and few other knobs required for each OPP.
The intepretation of the bitfields changes between SoCs.

Another point is that ACD is a requirement for higher GPU frequencies to
meet the hw spec. So OPP dt node is the natural place to keep this info,
which also helps to share this data between different OS.

-Akhil

> 
> Best regards,
> Krzysztof
> 


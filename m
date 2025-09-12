Return-Path: <linux-arm-msm+bounces-73333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC9B54D6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76F9A17B0EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FA23101C2;
	Fri, 12 Sep 2025 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERMbbQEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B44530E82B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679162; cv=none; b=FRt1vx/JV1mSiNeaibkUYnVAbhzSCsZ53/QqrPW09jeent02plFEJn/+imo7PMHsZAsbywochrKOtbKIDwugyNidrGSBxoFi5ijoE7D/F1+OXFTyQ8sGSE//IyzspkeIiGFltBkAkIkeEWjqYAxcES0kFY8pR3xM0kR2ZYVwTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679162; c=relaxed/simple;
	bh=oWGivKsHxkmHI/ov59Bz/LsMaz2L1v6ycuboHhiWC0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUnd9EDe9T3CH0gtzdwwccVeEIceBNTjOaGknY5E9SEA6rk8mQDeMGlUFp8I/h8r4oveNtRjStObum/ZHp1DbnjcSsgGI46C3OFW8pGe2l1lTTk4v8CrZOwrpSOGKJgb8V3UIAEoUSJwsHCgrr/CFSimJdOKa3UrzaURXPbB/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERMbbQEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDpa017418
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zI8guBb3Lo60ZeYXEP0MXbu6
	oVCoqd2RpOjF36niL0E=; b=ERMbbQEIEeC7btydKuXkpC0mwnfj1F7Ywp2yIK+Y
	p0xIR881VWrMk5qiPUA4VMMUlXNe+85sKGEbX1sj5wohtBp22e7uwOdcHhxTdtyW
	SiOQ29t8n5XmP4/USzu4AdHykf/SEYvTF0y7bUmPU6mNpyyXzVBdYjRp23J2UE6D
	ywGwqEn//5Qsuc1E7NNAgVAfX9hxAAHJN91zR/QDcTm3rNroYNm55fipI1483YfN
	27wBLYz5yW8IffYX3cEhIGWswS0VkRX7VDo0Zk0pdmMNMlUtkssLUhEZdPMyEzd5
	nbxEvwCX/tOJD6UMCM+71b06AjOgcpTfuVVQkzUfIovT3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8unhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:12:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70fa9206690so53983546d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679159; x=1758283959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI8guBb3Lo60ZeYXEP0MXbu6oVCoqd2RpOjF36niL0E=;
        b=L3LNE6zbwCSA4y9FM4OeXqqWtjysyEVV561IBYkG4zxIh5RJsijR85lSHpxYoNv7H1
         twFt0eVeNVTHQyIOFEA//Fq8pH5bbzUG9+xduwmRG4/WA2myxAkOtcVMZ5z2YfnTjIll
         vctnZQvzL7p05U2ixS6C+ZbrlnjZcgU7kXL7UqTB2VVTb0T9Bpey5zOKdstm+aVT7H27
         vC4gudIPPJnRBx0UGRH7rmYhXG9bh1Yw99lGljZMJRvc2L+Funhn5DfqcvLKaEUX1KbB
         c17JfQvfZVUd6Ee2tvzIOosEiyxFx+wjn7Y9QxXS2Gio2WKWS5D8lqMVb2n03Y9yL7Fa
         xW7w==
X-Forwarded-Encrypted: i=1; AJvYcCXn3k/bL82OPVVf9KmzY+vBcaODqNSZ8L80eYeD/HLegqWWznpjhtnc8WCS54jr5g/PKlz5S0TlLqzzixxA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5LzH9dhB4HcNAViOSVnLn/CL5qInGNe7xD2PlmV2xopsDRFG
	zucgaQWHjUrBXYoolitTvwjQtAUoZ+hyjhpZit2+Yi3U0AY1dRAKSAUbYIe+kpItnfBtMIVM5OD
	UPJqCg49j6W/AXaT/5sznwMqV0RSEdU0FtLLLvYTrP9gaR4enFLAJ0CS/ZZyeQXx8T1zV
X-Gm-Gg: ASbGncsNWcoQ8gnvdieSfalO+64+I7UVotvNDtQ6o0Tqn/pg0N4vK73XIRXTAgdaT7I
	58PHlFYAVzsgimDy4GOuD4rhJIJ6vLISkDqjJyRbb7sChtOjyR9Vx4m/u78JcZM3rl0Pc4ZcoLD
	Mhe0wDaks7BWNa4lA2MRUZ1/atUPXD/NbGSrAauWZ8gdKwFiQnveKB1oO1zq1rq+YOPEyQU6jXt
	yy0PoS3zBXEabR/jJxo+3i6SGyg6YnuxUPQAV9WIY/trZJq9V3TxsJpORl/gww0XNEA45LiO9Sm
	Io/VXM9mPfSCZwSQjOdDzInIfwupFtNYmbqcShR90OM2/LzVZbaEzQ5HOVHxJYrAv49KjaPX4KB
	vxuHAeKGGFLWknP1n+V4oMm/8tZGIa1JGn0RN4w9GVnYXmS//Mh7g
X-Received: by 2002:a05:6214:e44:b0:72a:6d80:89 with SMTP id 6a1803df08f44-7621f5326bcmr84955516d6.14.1757679158458;
        Fri, 12 Sep 2025 05:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETqAAx9aPZRKQ9jf+u+KmM6Kvfm0l4R77YKoWyoC00QsU84Zpj1UOrIYuydwW4MVV7TmB7Pg==
X-Received: by 2002:a05:6214:e44:b0:72a:6d80:89 with SMTP id 6a1803df08f44-7621f5326bcmr84954736d6.14.1757679157622;
        Fri, 12 Sep 2025 05:12:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a925dsm7684111fa.46.2025.09.12.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:12:36 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:12:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Message-ID: <rioswugtt3v6f6qa2w5qcmnqjzuxkm372sgovdy7cj3g2jfxru@tg2bdy5hxjhr>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
 <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
 <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
 <da984d8f-85ae-44cf-8de4-208bfc9e292d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da984d8f-85ae-44cf-8de4-208bfc9e292d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX5OtP/qd982zT
 8unkRQDBgSWnGWi0n5qpWKj3csFGb+4vQlxGOWihhZL8SHlapi09G6jwT8vBFuH3n6aQOTyXqvn
 OkXEV6Jly3GbY3rVcjU5nV5jWH0ZXlInBUTylui9aTo/dkrxYWpI2o+/leB9IgNioekDWRIuq92
 9yy1T9GgHnEn5ZD0X9fnXkMHliCcGiG4rIVrpfGZsw2vu0YTwLJhs3Ei3dKGDzZ1R2imUgK2OoG
 U855MHajdKAHHtBFM2fEU0Sut19uUVIaKXUtYcjSa5Tu7AGXsmKq5e6snUo5L9BWV28whH2M3+b
 Ymq1o9Jdp4KRClaP/VsI3z7MzLLWRb+nM6X0CyezlWBz7QXxHChu6tDJt2BZkmSBdRsuFH2h5+Z
 20CsCkhn
X-Proofpoint-ORIG-GUID: t35GpLS8c6lZgXDQKXdxN0eUtd87Ld0I
X-Proofpoint-GUID: t35GpLS8c6lZgXDQKXdxN0eUtd87Ld0I
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c40e38 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=r0EWWIcaWpoI38bJcbMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Tue, Sep 09, 2025 at 01:21:19PM +0200, Konrad Dybcio wrote:
> On 9/9/25 1:16 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 09, 2025 at 09:14:49AM +0200, Neil Armstrong wrote:
> >> On 08/09/2025 23:14, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
> >>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> >>>> of a combo glue to route either lanes to the 4 shared physical lanes.
> >>>>
> >>>> The routing of the lanes can be:
> >>>> - 2 DP + 2 USB3
> >>>> - 4 DP
> >>>> - 2 USB3
> >>>>
> >>>> The layout of the lanes was designed to be mapped and swapped
> >>>> related to the USB-C Power Delivery negociation, so it supports
> >>>> a finite set of mappings inherited by the USB-C Altmode layouts.
> >>>>
> >>>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> >>>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
> >>>> an USB-C connector and no PD events.
> >>>>
> >>>> Document the data-lanes on numbered port@0 out endpoints,
> >>>> allowing us to document the lanes mapping to DisplayPort
> >>>> and/or USB3 connectors/peripherals.
> >>>>
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> ---
> >>>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
> >>>>   1 file changed, 58 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> >>>> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
> >>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> >>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> >>>> @@ -81,10 +81,67 @@ properties:
> >>>>     ports:
> >>>>       $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>>       properties:
> >>>>         port@0:
> >>>> -        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>>           description: Output endpoint of the PHY
> >>>> +        unevaluatedProperties: false
> >>>> +
> >>>> +        properties:
> >>>> +          endpoint:
> >>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> >>>> +            unevaluatedProperties: false
> >>>> +
> >>>> +          endpoint@0:
> >>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> >>>> +            description: Display Port Output lanes of the PHY when used with static mapping
> >>>> +            unevaluatedProperties: false
> >>>> +
> >>>> +            properties:
> >>>> +              data-lanes:
> >>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>> +                minItems: 2
> >>>
> >>> Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?
> >>
> >> So the PHY already supports 1-lane, but the QMP Combo only supports
> >> mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
> >> int both in & out endpoint and still should work fine.
> >>
> >> Do you think this should be done now ?
> > 
> > Do we support it in the PHY hardware?
> 
> I don't think the PHY cares if it's 1 or 2 lanes

After taking a lookg at the HPG and the driver sources, it does. So, I'd
say, please describe 1-lane mode (which most likely can be enabled only
on selected set of lanes).

-- 
With best wishes
Dmitry


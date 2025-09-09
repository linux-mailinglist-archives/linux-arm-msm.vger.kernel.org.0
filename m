Return-Path: <linux-arm-msm+bounces-72737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7CB4AB76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 588481C661B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A068320CC3;
	Tue,  9 Sep 2025 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xl2FMTZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245D321F41
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416573; cv=none; b=P2O30rpN7cFBrMuDYYDeosfOHwhZnI2/WJZOvlAELto51pq30IOYZu2qhgqLuPmB0O4uX58APN9pq/SFfdUlC30iKK5FEp0tJhHlVSPXc5dUehWxRSJMwwQN5E+vFxDZz6oyyQ91jC6TpjaqSdYpISGrsQXgMr7g6XH7vevaphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416573; c=relaxed/simple;
	bh=47QxSfwF18TUccVBLQZOVylN093Xt6+9xaWLwQDIE9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXnGyBJvUHg6BMx0xLq9Ml2lX6svhls1wMADL/rsszlugEMrOm7lOiBHQ6UpfmCWJ7DNOLVUXn+v25x0kItrdQ6NvNUGcc7bmrDh3C7VMFVRBtsZb3IMvxh3H6kc4QI1dwVT35cRMhstkG97tq8gil5r3VrKeUYDwn7QFEigEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xl2FMTZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQsD020085
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 11:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vyy6UuL4wRzAkGNDFXbY0fdg
	2ceTtxqY7qR0Dof66IU=; b=Xl2FMTZjfPIoZoUT3ZV/L/GYQV5HRjk1ixzGkyUw
	ht/7vZwdNMLyCBbZ/9d6Ab3y8qlh8+GCYdFItSiipkxwJvSA81nuy+4eRDEuVwRy
	iVV8Tcp360raq7haaloVG5zzFn2FbaOHcOEiVmIjn1S1hnvYCr3+2HTiZpEaBVlr
	DddqT4nl6otzuLXOf7U0wV8p3B9oQv0WVBz+BmYrB1nk58rE7u4sbh3fs8WH/XyZ
	sUbZ5GBbLZv++YAEgvPaz3hOSSV7iBRzI2vqXt46KUcIGGsM76/3qVa94iO3XLJM
	M62IjwR92msjwIEac9CRgdU0730+RhGmFwKg76DPMj6+aQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc24164-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 11:16:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7224cb09e84so119897396d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 04:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416569; x=1758021369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyy6UuL4wRzAkGNDFXbY0fdg2ceTtxqY7qR0Dof66IU=;
        b=W6Rrw57WwxfKrbE2XLywkS7u96UQovUHnu8V44gWVYuJcXsoqLvDRKsEpU1GezKtAl
         tOaFGs8OCSFhqdkgCaUeBY/KtW40KQHYxlTK1UzR/faFmwictcdz6YcYYyyrZRKayoeV
         zY/wAv/2bmQF9xF76SR77Sk+rCKHZb9jJPMuMhMlVJXNYV5tdTJ+K0NWiM/HbqIFzBAB
         7pbzzZZ+cmZ6Ff/0xRBec6ejDu0GwY7TaJWHFjNXVM3bXdZ4sM08YbHxeqe/YX1nwcka
         d9YvJq9y97DRWyZ3x37UtQiyGXLg3aulYiYDmtaG0hFOuaGvjIUIZQhJRMUNCT8U25hu
         B/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX4lbYDXSbStIS6WYqoOluygAzqW4jeFp25gOS7Zsfi/zw4COMXLhV3HYYAYZQiLTHznDn8s5wYHz+XyclI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9Zqxt7MU+HmLhOPTuRCl0aX7d8W/rBzKLDlDWAOEA9kCRSxf
	Be0He0jsKD0xxgeyN5AYggzQhn4nX9A4sf82Mfpqq/vd2vyqgPaON8tiGlzZZlnRYeo44XF7K/P
	Sy6xL18oArgT5N4uPvwJ48kbELS4t3eYYxhOgER5CyoRksx5TUhhzRzynNSVWS289UmwO
X-Gm-Gg: ASbGncv3A8YJVdFMPmreGD1l0zlaqHL+KqezYrssx3mwSfKButxfKdWwJJtEy66Xqpq
	uBATlag0pj8rmREMB4jrgcsNfvZdIzxcfiI8pHv1AJ3OBjxFezGodz0gm7HmC+Hzk95Jk7WggEB
	114uMpUOgRmGQEzVed45Z9gmffmy87Zy0fOGszBq1JyytnTvJKA93cLefkXhfIB9wdeQpREDHzu
	cGAv68MYjKQY7IsHg0tL7zKavbB1wZVRpXHkpVCUpje9LB97NO6XnSeZBSWx5ibs9Rt/682XnEZ
	iWVkAPGfAPumUTg1HNPYY9wNVbFvdCXBZc2jVML7pkxIyptR/RYHZX7T9eJ1bulN8H8nXlNdvwF
	Xu822uVpoks2XomuyRuqUzNEmd7RXWYE+/NHTQF0LemVrnEWD53Z/
X-Received: by 2002:a05:6214:489:b0:72a:87e6:f8d9 with SMTP id 6a1803df08f44-72bbef339e8mr151682476d6.8.1757416569491;
        Tue, 09 Sep 2025 04:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY1tTjvV8h2NSrNoZ1Pf5XTkOvg9H6zYxJVAlIs8vECDwJ1Ls71vAHDYTRO2mKRmYsJzgvZQ==
X-Received: by 2002:a05:6214:489:b0:72a:87e6:f8d9 with SMTP id 6a1803df08f44-72bbef339e8mr151682146d6.8.1757416569008;
        Tue, 09 Sep 2025 04:16:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d482sm442455e87.75.2025.09.09.04.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:16:08 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:16:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
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
Message-ID: <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
 <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c00c7a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=Ywig2pavXv6aIl8GUcoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZdXR6bjx3GMqRRlGjdIef1Uu2LI49hGV
X-Proofpoint-GUID: ZdXR6bjx3GMqRRlGjdIef1Uu2LI49hGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX5EgaYljcqdKM
 xxYN1AXZlO8Ra0Z2KafnXFDjta+Jqtrcpel4L1R4kNv3wc5QECKjRkLnYfONtwKBXAdVo2vdxAi
 8DwdK1hgNshSODa0NyhbTvOufS7NQIpep9q6i97OCJeRjkiuUUtdUnfZGgANYXXRE/f1/+RUf8R
 mZi5Cb8Y5etotNpyW4IGkJLAbHpRag84wOP02//yuELtJ+27gtJsh7VtWRxdeehwH2DrWYjNuX/
 UB6Ku5Tf2SDP5TmfrJK2A94YRkryycVhNExH+BQdQ8p/e0Osc+oKQ2u1hd8MzWqm1RQkAAu+UmW
 hg9VroW/OflfX/AIuw4zpP/Sc7J8lXniD3Qgfeve9mK5+g+NAwJ33iQ7T8mxDnwCeGZxgDD8iGZ
 1UZph35o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Tue, Sep 09, 2025 at 09:14:49AM +0200, Neil Armstrong wrote:
> On 08/09/2025 23:14, Dmitry Baryshkov wrote:
> > On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
> > > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > > of a combo glue to route either lanes to the 4 shared physical lanes.
> > > 
> > > The routing of the lanes can be:
> > > - 2 DP + 2 USB3
> > > - 4 DP
> > > - 2 USB3
> > > 
> > > The layout of the lanes was designed to be mapped and swapped
> > > related to the USB-C Power Delivery negociation, so it supports
> > > a finite set of mappings inherited by the USB-C Altmode layouts.
> > > 
> > > Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> > > connector, DP->HDMI bridge, USB3 A Connector, etc... without
> > > an USB-C connector and no PD events.
> > > 
> > > Document the data-lanes on numbered port@0 out endpoints,
> > > allowing us to document the lanes mapping to DisplayPort
> > > and/or USB3 connectors/peripherals.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
> > >   1 file changed, 58 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > @@ -81,10 +81,67 @@ properties:
> > >     ports:
> > >       $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > >       properties:
> > >         port@0:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > >           description: Output endpoint of the PHY
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            unevaluatedProperties: false
> > > +
> > > +          endpoint@0:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            description: Display Port Output lanes of the PHY when used with static mapping
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +                minItems: 2
> > 
> > Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?
> 
> So the PHY already supports 1-lane, but the QMP Combo only supports
> mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
> int both in & out endpoint and still should work fine.
> 
> Do you think this should be done now ?

Do we support it in the PHY hardware?

> 
> Neil
> 
> > 
> > > +                maxItems: 4
> > > +                oneOf:
> > > +                  - items: # DisplayPort 2 lanes, normal orientation
> > > +                      - const: 0
> > > +                      - const: 1
> > > +                  - items: # DisplayPort 2 lanes, flipped orientation
> > > +                      - const: 3
> > > +                      - const: 2
> > > +                  - items: # DisplayPort 4 lanes, normal orientation
> > > +                      - const: 0
> > > +                      - const: 1
> > > +                      - const: 2
> > > +                      - const: 3
> > > +                  - items: # DisplayPort 4 lanes, flipped orientation
> > > +                      - const: 3
> > > +                      - const: 2
> > > +                      - const: 1
> > > +                      - const: 0
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +          endpoint@1:
> > > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +            description: USB Output lanes of the PHY when used with static mapping
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +                minItems: 2
> > > +                oneOf:
> > > +                  - items: # USB3, normal orientation
> > > +                      - const: 1
> > > +                      - const: 0
> > > +                  - items: # USB3, flipped orientation
> > > +                      - const: 2
> > > +                      - const: 3
> > > +
> > > +            required:
> > > +              - data-lanes
> > >         port@1:
> > >           $ref: /schemas/graph.yaml#/properties/port
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry


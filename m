Return-Path: <linux-arm-msm+bounces-71532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC076B3FAFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 817CD483BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369772777EA;
	Tue,  2 Sep 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMAnIhXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887D2773EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806368; cv=none; b=RA8kT0vR6Jp7msjLiDCIWNFTgGsexi5YAwYahuvOXvpJj3LvZQESs93AOnqCHTDudaWnLher+NlNSs9xV+8PrVI51XyZ3QrKcoRe977T9Z7WIvbLTe/hBkVFZ3Qp05XttffXtA01WIZn4qMno+zhPRA2d8TrViIiNq5YxP6qAs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806368; c=relaxed/simple;
	bh=9vZm+CpE5/TzBi01gAUyiY0mPJeQCDJqZEKw0Bh6/Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBD+QHzKh7QWKhBpuG6JoBZbXEM2uKuHz/qG6tN2ZxVJsAgBfXP3eI3HCUE29HrFmVsMgVuD62lF1rYlDrfk9vuouRRXyo3SeBO8K8NXsXVE6QWIeFaseEbaOMfk2Y75KUJWnTjzFfkR/EzID71x9ANPSdDngoCaFICCWGbIR9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMAnIhXa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RlXQ012426
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kuvcx9dK+4uPO7PcKf2xDvCA
	/wZvMuQBYtW1BRkUMHs=; b=bMAnIhXaL4tjXQoR242+kYg3wyyhu8xAaePglGcF
	rX5tb9HzfAvjws3tmxb8bkdJ2TKxWrbU9xEj43O1eD+HVJjlOMgxj24sZL0ifFU+
	JGPGBe0mkYm8Dsj+TkVgO7vcdqsX9MNKNYXdo3D5wMX1M9l2zdQIjVY4C0q88Xx7
	lMzcCHo8Rmiz/CvGGDJPKCz2s5zlaiBsqoF3uoaaYnV8ss3UkYTgR7tyzqTA00mX
	ub09LEkAnNUF4EsRb9ap87MR16rrRCcYmp8AcAGcvOoqT1mfVTvQl8WwUX5AgobT
	OiQwK0kRTpVrWwJ+HjHHv/LHOz+Celi5n2TutAWVr1VMyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0effqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:46:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32fe42b83so32230921cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806364; x=1757411164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuvcx9dK+4uPO7PcKf2xDvCA/wZvMuQBYtW1BRkUMHs=;
        b=q2z2lwUZbxxnB9phg4aY5sAOWuRjr/tsz5FdyHGfgnf/Dhk9p4zw4wmy/zDqDcjL5w
         qLB01JEpggkuAjHHuYzG/SdYwTG7BGSdBHwGpkh+r9Rw8PvLFW5boeDzD18hFdpvcdDY
         89F9eA5XUN3e3sqRXE0Ol506yIXOfnDZgpCWs2NAdzGNQqhH2bhO9+lm8OiyC9ryZ7Xw
         ZKxzXnmlLN1L77xa17NIs03aHE6uEExaS/2svBcEJyvX7f+ntUk6hfpClpIPdowNRV/e
         ZFsnQNjb0xcm6J6FMBG5H3PX6hmJkPMaDe9olaPY9QZQWkuyylYvToxj6Ij96diR+zN+
         bkRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJyGRIcnk2dAI8rJpW78Pn2T2nDM3c8sHFZIcON6Nb+ugVDcYgnAQyPeM1L95Q/qtWPN9fgFiEbbdnG1I@vger.kernel.org
X-Gm-Message-State: AOJu0YwXzp5FiJ6/WLMV2eOZAjAHZg83rh7xGLBSO1kTAhJtO12JGHt2
	W7wtha3Gx5CJGFsFfMKiWoYuV/dtteBQAV3bb7GdeN/3RnbuiHDf6ywYUX40BFoOFMF5fOGGjEb
	I7s6Z20Z/Aw9UH69mmw+ZcfdUnltKnQiLK2o4RZCL9dqb65mRwnw0VP4OBQli1jSoXVj4
X-Gm-Gg: ASbGncsO1iYRuUcYZ7ukh46WIrPixPdfYvKYiptd0C/H54PEIIr86dMfXAwBOzxaQZa
	LJCOSbx0Fh2f2jtBmpq7RiJfHm4qiv3bGAqe8LP/sueu+9qVIpN6uV6MdvCZmDpo4iPRecef87N
	8818/KkF7PznYGCSuLUHknNqFtkOLc3girs1Zy8vi/7eax277MyxVMgkLl+DPAsIZ0Vm0M1uD+l
	d5wzyegVBHOAd9XwgWx5fiZng2BTSd6p8ohhafPD0oorsHeSdxStVynl8JuzdjWPsCgmm0miIvU
	uninIuakyoDq0g8CfGmzQyPQq3Yy4O+KhddPSyMkpdIKE7HVRR/PEPLhjwZQshS6DQeQR2CgAqN
	IYNOhbkJoOuZpoyuuhkop3niBkq+8wU06hM3blmAfXJ5tNZb/J0KD
X-Received: by 2002:a05:622a:1898:b0:4af:af49:977f with SMTP id d75a77b69052e-4b31d843106mr110963151cf.30.1756806364148;
        Tue, 02 Sep 2025 02:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6+NH9LnUGOobc8Z3ipkGt2tyqr1PSej/+J4YRMh0RhCCuZpIUdsEIhFAtonApsNUh/JxvIw==
X-Received: by 2002:a05:622a:1898:b0:4af:af49:977f with SMTP id d75a77b69052e-4b31d843106mr110962671cf.30.1756806363442;
        Tue, 02 Sep 2025 02:46:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c91d37sm3581281fa.19.2025.09.02.02.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:46:02 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:46:00 +0300
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
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
Message-ID: <tl4fskw6yq6rniwwqkrvnulfpgym3jswlt5bmulgquogv7xkct@6bl4boesilsw>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
 <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
X-Proofpoint-GUID: gp2DKaRA8L2cpg5mirCpvB9_i8tuIt5c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXyiDpicPfCBs+
 is8Cy/cy059W0/iVW+S97zRX8wXwCiTujweFEdovipowE40I339VYzyGPTWarUtddL3U5igdtZf
 SanDzeN8UFnIEx6UjszgGeG4oVbEnfKdFl7VpYuDPvbQbw33CE/0vkZxSZNedONEGlQHhfKUwZz
 zQXd52oaO8t6rgrqLHvEeIJQJdz2S3hXQ7Y+gjwnoFa8WbzRdntWAXqcSis/Lvh4TudVzbnZE6v
 0hQBlCX1bj861NxrIjmLHoRlXRErTpStaF6qPJ5L4quTY4oBRds1AaAmAEjjpZMHrsrcUDhce9f
 eGHnSaPQ8xIfxEvY/ZiK1qygDIvlr+Lvjs/uuCz1IeSnS74DrzG6eg9fa7MT/RlHTbPcY0oMWNP
 mEHE8Trl
X-Proofpoint-ORIG-GUID: gp2DKaRA8L2cpg5mirCpvB9_i8tuIt5c
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6bcdd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=SY17gm6z-Ks54HuadOoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Tue, Sep 02, 2025 at 11:35:25AM +0200, Neil Armstrong wrote:
> On 02/09/2025 11:30, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 11:00:30AM +0200, Neil Armstrong wrote:
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
> > > Nevertheless those QMP Comby PHY can be statically used to
> > > drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
> > > etc... without an USB-C connector and no PD events.
> > > 
> > > Add a property that documents the static lanes mapping to
> > > each underlying PHY to allow supporting boards directly
> > > connecting USB3 and DisplayPort lanes to the QMP Combo
> > > lanes.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
> > >   1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > @@ -76,6 +76,35 @@ properties:
> > >     mode-switch: true
> > >     orientation-switch: true
> > > +  qcom,static-lanes-mapping:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 4
> > > +    items:
> > > +      enum:
> > > +        - 0 # Unconnected (PHY_NONE)
> > > +        - 4 # USB3 (PHY_TYPE_USB3)
> > > +        - 6 # DisplayPort (PHY_TYPE_DP)
> > > +    description:
> > > +      Describes the static mapping of the Combo PHY lanes, when not used
> > > +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
> > > +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
> > > +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
> > > +      be connected to the DP PHY.
> > 
> > It feels like this significantly duplicates existing data-lanes
> > definitions. Can we use that property to express the same semantics?
> 
> Well yes it has the same semantics, but not really the same meaning. data-lanes is designed
> to describes the lanes layout/ordering, not the type/mapping.
> 
> Here, we do not describe the ordering, i.e which source lane is connected to which endpoint splot,
> but which lane is supposed to connect to which internal PHY.
> 
> Anyway, I'm open to suggestions.

phy@abcdef {
	ports {
		port@1 {
			endpoint {
				remote-endpoint = <&&usb_1_dwc3_ss>;
				data-lanes = <2 3>;
			};
		};

		port@2 {
			endpoint {
				remote-endpoint = <&mdss_dp0_out>;
				data-lanes = <1>;
			};
		};
	};
};

phy@cafecafe {
	ports {
		port@1 {
			endpoint {
				remote-endpoint = <&&usb_1_dwc3_ss>;
				status = "disabled";
			};
		};

		port@2 {
			endpoint {
				remote-endpoint = <&mdss_dp0_out>;
				data-lanes = <2 3 0 1>;
			};
		};
	};
};


> 
> Neil
> 
> > 
> > 
> > > +      The numbers corresponds to the PHY Type the lanes are connected to.
> > > +      The possible combinations are
> > > +        <0 0 0 0> when none are connected
> > > +        <4 4 0 6> USB3 and DP single lane
> > > +        <4 4 6 6> USB3 and DP
> > > +        <6 6 4 4> DP and USB3
> > > +        <6 0 4 4> DP and USB3 single lane
> > > +        <4 4 0 0> USB3 Only
> > > +        <0 0 4 4> USB3 Only
> > > +        <6 0 0 0> DP single lane
> > > +        <0 0 0 6> DP single lane
> > > +        <6 6 0 0> DP 2 lanes
> > > +        <0 0 6 6> DP 2 lanes
> > > +        <6 6 6 6> DP 4 lanes
> > > +
> > >     ports:
> > >       $ref: /schemas/graph.yaml#/properties/ports
> > >       properties:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry


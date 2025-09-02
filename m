Return-Path: <linux-arm-msm+bounces-71591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF6B40027
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1A3188D5F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4969E283FF1;
	Tue,  2 Sep 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSjYulLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E21ACECE
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815745; cv=none; b=jWAc8//nR+PyetL5tLzaJcb4B6ZIGR1PAzGt8EcnwtHisNPl1aGIsKTeaY0tVzHwP+f6LoEmSJPD8Yx989CNjlxmzGmYEY44XBhbzNrDrISlJpH0HpKE0NFl4IMI1TG1D+kDZ03Tob7fJXr2wuu07j5AYvqOG99Q8IR3L1hDfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815745; c=relaxed/simple;
	bh=wKPeNHXB4Gyqjn6nXMBzaGI4olxo6+KqmKqexEoBZVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVM9F+Wrj6zebDqf2v7ubMHn5Zs2ZYM3PZ3q1xSHmEBvjZuQr0PjMi4ZrbuxBGBVEHa0RSOeqabG1NcGzx+4wpd/hwAvqX2jWzVeXbCXWEjnJ65rvEESdvn0skMJfdHYhxi4tEJsdpdr1uHYsdpLZD3xxkcwB5pJgC7t5tnqiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSjYulLk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AOgeI030313
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5aSO0KmmpUqooUb/3qdW5ye
	cSIIeoQPBPrLpY1Yuvs=; b=ZSjYulLkag+B83fDDBVTT267Lz9GorndmZBiFv0N
	gDtnywdeeKkHLXJHlh2+gnhOPGUT2XHexI0qw4UJTpL8TyzqsCGFUpBLm1NpVXxJ
	qCZ/FyluGGVdm9UxminxiX3xbRCj7Nppao7XTK4ZfcxwZ3GrTmuqA5ZhAGg98JrU
	dY3xOd4evkbtQTofGyOE62AMsEs1Jsll6OmD3dIT3mlIIXVjWXwvrMVSWeZylAkp
	AXvT2Z2Z8JtE5XgYnLRt7vDqmDO0UC3jwve8cdB5Y2UEe6IM9zFrv9wr1And7U8G
	Jrwl8StMb6x77eQNcJ7CZIUGIolOI5YxuQIW70tpP97gtw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3jp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:22:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b327a79a30so64819691cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815741; x=1757420541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5aSO0KmmpUqooUb/3qdW5yecSIIeoQPBPrLpY1Yuvs=;
        b=DllHZDUUnTO5igOvCI00d6DXk1U2+d6H2m3vaC8Se6h8f4sN2s0RdG5N/lETMgIxPN
         gFHHW6eNu9rBnZcm7uUboK17d+8CaF4tWvAqqmmUc46IKqB4P9T1i9yPDHbqx+5+zG6Y
         L/SOgcw/dQVdL71Ai96sWcA7lu7f1XPGe/rPxz0ZGPBIX8lBRYdpxUQZ1QMACyzf4ncQ
         ikvigUSJ1ebCUPl6kZ6vtyXS6Mourhq5jVnb+8kenjAQe480WJ9sAa2jpOtAGDRMycwJ
         eviYZS3UanByFFhtHXgYBbsMP2nMQIsBImQRwgWANLZxV0SJ2cklAHbPvd5xJM1jdrKi
         ij5w==
X-Forwarded-Encrypted: i=1; AJvYcCXhvFeO4b/Utsx7D+NwVx99mDKuzu5H4nGK3Rs1GciRSrf+bbQDgqKrXmJlrBEHD0zflrt3vMNBAREPYt4I@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDuXXENfyLkd1Jt4hWNV6QUGoGD9pm7j/QtwFV9GRKB+ZjX8E
	XV4lMmLTxh+ktY9Xi4i028b8xcNTJZZP057SFuLcKjZa7MIk53nXCqkaxAe40w82ArMTRtnZKZV
	TTRuNsyf1bnIev9Xuukzb9DK879kOAjV5J2Tj5my2fpKiAOXGzgGsSTLSpas7eZ+ahLVD
X-Gm-Gg: ASbGncvXT8d43Kz6mNKGu7qirimoEI73LyJKkeLM/3USIgiS4Yrd7p4QP9hWwc+ns95
	HDR1s1Tj5wRvaJ7uifWuGRdLeArAPpfTrgVNbz9MFSbYUWpPjWxH+42+lPRFyPSlnKkh2Dd3xMF
	ieJd0ELhkNWZJ1CmpjX9ZK4DwaSK71zZSA8WNUj2UoDKfLuIggjWy23a+4oDY5/h2RPFZio4M4X
	vtS8doGVUicyJloZIMdLcCHnIY+PygL7PK0wMHnXSx7LLvlmZFzo/AcbZPCULWaw1D2PnNpyLgt
	6D1ziA2fYR5obNGpkPHlYOxO9n/HhefEMZUzpmSu35OMaS8UaXqp2XKhW3H3n+lIEsrZnMG7TOn
	SsLRRfaFu/nfZe6/WaiVsKyERaSSFiRR4R1zdWmxt3EnezwN0v7gD
X-Received: by 2002:ac8:5905:0:b0:4ae:cc75:4703 with SMTP id d75a77b69052e-4b31dcbab88mr120080361cf.58.1756815741286;
        Tue, 02 Sep 2025 05:22:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEujDNuyvL4g7dEIP1Zof253r1rsB9bYFgUlrVvoDVc0jN2XKrDOZk12w7hWmQbuIucQUVHTA==
X-Received: by 2002:ac8:5905:0:b0:4ae:cc75:4703 with SMTP id d75a77b69052e-4b31dcbab88mr120079791cf.58.1756815740501;
        Tue, 02 Sep 2025 05:22:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560826d7f2asm667117e87.43.2025.09.02.05.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:22:19 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:22:17 +0300
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
Message-ID: <oel3t35pxegxaowcfjbrzrxvuw47p7pzcinz7kf2uj2ivcderv@efbttlqpwcc7>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
 <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
 <tl4fskw6yq6rniwwqkrvnulfpgym3jswlt5bmulgquogv7xkct@6bl4boesilsw>
 <14f334fc-35de-4f21-8eb1-f6b41ac24704@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14f334fc-35de-4f21-8eb1-f6b41ac24704@linaro.org>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6e17e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=HJy97g7PLlcXBZGHDcIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: T4yr6Npc83fF6osd603yD50r0CFogGNC
X-Proofpoint-ORIG-GUID: T4yr6Npc83fF6osd603yD50r0CFogGNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX6HpWiIGqRMSP
 94v9EujnDGGYQBegpmPwKiNz3Yz1wwHbAkcQOOATxtKSXZfrdx0EaeAMVAhiY/EEwXBG/ZqiOHU
 hRVdroBaNraITXC6KScg1AFBO2V0EYekg4CGg6cUvfV4axweTil+ryNFWARQe1Q5Ii95dvefAir
 In4A1U4ChQQDCUI9FH0oM+W2mBKaLmy1eUXW76zqW+8JD3bra3lH+F7oPjZAXZ0bd5AxTokHOVq
 +WPv7YuZC4p+BNoJUDgEddAOyY0kk6vyXdDWy2srsFdXc9tTMtwVNewmogd28pRn1jUtOVwrRAe
 InSW1vg9TDp8USeqpqBFQ2LLy7TUtRoILf2U4J0AbCsXEo+8QXvTKz1ZcdX3uZuJ8zes/EGYC90
 zjRbxLZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Tue, Sep 02, 2025 at 12:05:45PM +0200, Neil Armstrong wrote:
> On 02/09/2025 11:46, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 11:35:25AM +0200, Neil Armstrong wrote:
> > > On 02/09/2025 11:30, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 02, 2025 at 11:00:30AM +0200, Neil Armstrong wrote:
> > > > > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > > > > of a combo glue to route either lanes to the 4 shared physical lanes.
> > > > > 
> > > > > The routing of the lanes can be:
> > > > > - 2 DP + 2 USB3
> > > > > - 4 DP
> > > > > - 2 USB3
> > > > > 
> > > > > The layout of the lanes was designed to be mapped and swapped
> > > > > related to the USB-C Power Delivery negociation, so it supports
> > > > > a finite set of mappings inherited by the USB-C Altmode layouts.
> > > > > 
> > > > > Nevertheless those QMP Comby PHY can be statically used to
> > > > > drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
> > > > > etc... without an USB-C connector and no PD events.
> > > > > 
> > > > > Add a property that documents the static lanes mapping to
> > > > > each underlying PHY to allow supporting boards directly
> > > > > connecting USB3 and DisplayPort lanes to the QMP Combo
> > > > > lanes.
> > > > > 
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > ---
> > > > >    .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
> > > > >    1 file changed, 29 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > > > index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
> > > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > > > > @@ -76,6 +76,35 @@ properties:
> > > > >      mode-switch: true
> > > > >      orientation-switch: true
> > > > > +  qcom,static-lanes-mapping:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +    minItems: 4
> > > > > +    items:
> > > > > +      enum:
> > > > > +        - 0 # Unconnected (PHY_NONE)
> > > > > +        - 4 # USB3 (PHY_TYPE_USB3)
> > > > > +        - 6 # DisplayPort (PHY_TYPE_DP)
> > > > > +    description:
> > > > > +      Describes the static mapping of the Combo PHY lanes, when not used
> > > > > +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
> > > > > +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
> > > > > +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
> > > > > +      be connected to the DP PHY.
> > > > 
> > > > It feels like this significantly duplicates existing data-lanes
> > > > definitions. Can we use that property to express the same semantics?
> > > 
> > > Well yes it has the same semantics, but not really the same meaning. data-lanes is designed
> > > to describes the lanes layout/ordering, not the type/mapping.
> > > 
> > > Here, we do not describe the ordering, i.e which source lane is connected to which endpoint splot,
> > > but which lane is supposed to connect to which internal PHY.
> > > 
> > > Anyway, I'm open to suggestions.
> > 
> > phy@abcdef {
> > 	ports {
> > 		port@1 {
> > 			endpoint {
> > 				remote-endpoint = <&&usb_1_dwc3_ss>;
> > 				data-lanes = <2 3>;
> > 			};
> > 		};
> > 
> > 		port@2 {
> > 			endpoint {
> > 				remote-endpoint = <&mdss_dp0_out>;
> > 				data-lanes = <1>;
> > 			};
> > 		};
> > 	};
> > };
> > 
> > phy@cafecafe {
> > 	ports {
> > 		port@1 {
> > 			endpoint {
> > 				remote-endpoint = <&&usb_1_dwc3_ss>;
> > 				status = "disabled";
> > 			};
> > 		};
> > 
> > 		port@2 {
> > 			endpoint {
> > 				remote-endpoint = <&mdss_dp0_out>;
> > 				data-lanes = <2 3 0 1>;
> > 			};
> > 		};
> > 	};
> > };
> 
> This is wrong, those are the internal connections to the controllers,
> those are fixed. I'm speaking about the external lanes, but there's only
> a single port.
> 
> So, following your suggestion, we should use the Output port 0, but as it's
> only a single port it would need to have 2 endpoints, one for USB3 and one for
> DP.
> 
> For example:
> 
> \{
> 	dp-connector {
> 		compatible = "dp-connector";
> 		type = "a";
> 
> 		port {
> 			dp_con: endpoint {
> 				remote-endpoint = <&usb_1_ss2_qmpphy_dp_out>;
> 			};
> 		};
> 	};
> 
> 	usb-a-connector {
> 		compatible = "usb-a-connector";
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
>                      		usb_con_hs: endpoint {
>                         		remote-endpoint = <&usb_1_ss2_dwc3_hs>;
>                      		};
>                  	};
> 
>                  	port@1 {
>                      		reg = <1>;
>                     		usb_con_ss: endpoint {
>                          		remote-endpoint = <&usb_1_ss2_qmpphy_usb3_out>;
>                      		};
>                  	};
> 		};
> 	};
> 
> };
> 
> &usb_1_ss2_dwc3_hs {
> 	remote-endpoint = <&usb_1_ss2_dwc3_hs>;
> };
> 
> &usb_1_ss2_qmpphy {
> 	/delete-property/ mode-switch;
> 	/delete-property/ orientation-switch;
> 
> 	ports {
> 		
> 		port@0{
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			/delete-node/ endpoint;
> 
> 			usb_1_ss2_qmpphy_usb3_out: endpoint@0 {
> 				reg = <0>;
> 				
> 				remote-endpoint = <&usb_con_ss>;
> 
> 				data-lanes = <1 2 0 0>;
> 			};
> 
> 			usb_1_ss2_qmpphy_dp_out: endpoint@1 {
> 				reg = <1>;
> 				
> 				remote-endpoint = <&dp_con>;
> 
> 				data-lanes = <0 0 1 2>;
> 			};
> 		};
> 	};
> };
> 
> So the driver logic would need to look at the port0/endpoint0 and port0/endpoint1
> data-lanes to figure out the mode.
> 
> Is this what you were thinking ?

No, I was really thinking about the data-lanes in the PHY parts, so I
was incorrect there (which is incrrect as you've pointed out).

The endpoints approach looks interesting though.

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-71625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC0B405F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ACEB18957F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C66A280317;
	Tue,  2 Sep 2025 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8+Qiaxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CABA42
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821426; cv=none; b=SPa/Cp/SLaXPqAiFhuYuR2ezY4KpCO6Q3Q/eG3/VBoQXYkGwWOwjE5QrbXb5z/yDfWRA0PIaozx4pv/Mq5cako318QwqH9y/+OzSBA2hBTHrINrNpOvRZz8qVl/DAnJKx0haQikBRck516YiihxMsuKj/NnplC7dYAE1w27jrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821426; c=relaxed/simple;
	bh=i8gMl+5Zo8IBQQU13R4ufjXD/5DH8zsbKiwINcSlPGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSGf1yExLCnghJ0PSK/iMpNP4Iha+gZ+N5NZ5tXZZx4yCdaiTlR8LR10CblL36iJk9ryGkndByNNkEix+KN5sTLP9cZIa5wdt3IHgLBP//vFDZZi9FItUf4a7nOoYRGBi0PUJI9QRF3qF3UOhmAwIt8TgOV4HbHvqTvTAdewUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8+Qiaxn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AiKpk015191
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 13:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BPHD8lUIkal642+fuDhhX575
	g4A9kkT8Ilr18hcq5sQ=; b=W8+Qiaxn+1t+yYH6+Z+XlX2PzqOv3z9jmTv5hgNb
	LoMe8Q1U/da9TXa1e8e9DD/k13A2g2170YLLkwNc6OCwlzBd2ICyATMm7liJs75l
	4o7+UxZnMzYMMlnZAeGV5FfxST8HjQGbpU76fNBD59wn8K55RseYcw7WMZ9zxoms
	J6R9zsN4d2ewehMupht/sLaCDMizvlYDAI09T3SClJRjc6hBmIm2+Cr/Png932sr
	eC1u02DO/EdxOV3hn4xl/JsCQXuLFmqiIVthu6gCECKxo3Oam0CnnPBNvwlyunoU
	PR/k8QnCfCvnlSPoaTgXGDOQooZwIkItvdBakAF/GNFYpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0015b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 13:57:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3476fbe7eso16298021cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 06:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821422; x=1757426222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPHD8lUIkal642+fuDhhX575g4A9kkT8Ilr18hcq5sQ=;
        b=buguy5LkzkSwA4OWGQLzAkCxAXUqhWuUebXUX6d0Lgxxdnmm6qrPP1KBPxadfiwS9b
         yjEJmGnuHeDliwg6jJ5e6ZeZQYwfAxXSjS0ZxNu4koqPvurWyVvcP5upAkBbv+t6wmVR
         YwbveULS6D7i4cj/ecZnZInyTRCgB438FR+L70HwE6YZlnVmsYMnVqssdHCnoKscBzvw
         sJTmofsciC+XAiRyvVlBYCs+nBY1N0blUeiShE6DowpZzP2XRtcasWuNR0p7V3SFAdrC
         A6QxkrbPzCkcDHLx7vvoAZet1l8Gr27RgnARSznUi9sQFT5pjB3NgNaCLc2iGCklWQBg
         5U7w==
X-Forwarded-Encrypted: i=1; AJvYcCVPgheUkjVxVmBD+XX/nbRqSMX6nIB3V8DgVtNk+A5pmqRuQvRPoj/MGrWw5ABy3OcdPPYFoD8TFoWrG+Ru@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5y7pa7awH/JkVArngindjA534iHZtq0BwjKvpoXHxG4PZOFAY
	Ke62skJRJzXzLbKwAre6UsWTNFngUiVVD+8YKsmbItA7MrXylBp5BJO36Bq1xThtxEMOTfbb/+S
	VOxIPIGNv5R4swfkSgE3ny0pIr0ueLdr2USOdY3zHSHcrZmXCBxGxrNW2LTlb7kbN7YoP
X-Gm-Gg: ASbGncs5PZYhvUuEBsEpEz8NgEj8PzniqIZkwtgSveERB7ul54lzyL/cbprUXx+v8uC
	8DAn8tjQ/ekqFB9zXWRewm29Qa9rexEeenVZidImAP1ms/9NJ7SrekLtJ3YJE1Q8zbJF+mjDoE1
	0tHNY6aVtmNovIsCGG2d2W63aofqo8hDbli2BFiUhgzunxZj77sGJ5maxe2m2xHXhvwhbHgHq7Z
	rLyQLWDcrJZUMRdeYq7cwMmR94CDt1jty1P1HQ8PhGn78BAdzbkJeONY4q6i1SlPyv1WWfQ9rrt
	6Dq02ou8KO7rFaW9wmdGbdXHw6LMyc+SvZqBK/OBju10JlKZtBtjgeJTJZSKMnqCqXJ9st8MjUL
	rLZUi2sqqUa5ZuZeVDKtT8df10vRsXvRnOI1eHpby4tEN9AO9UlBA
X-Received: by 2002:a05:622a:1988:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4b31d80c426mr108587031cf.3.1756821422413;
        Tue, 02 Sep 2025 06:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpi+TOsmeZPp1TyNmYwpP7dN2aNcjDoev+g6God6GUdqt7HarlIFe5mWfReJxqsxVJ5cHpMA==
X-Received: by 2002:a05:622a:1988:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4b31d80c426mr108586461cf.3.1756821421621;
        Tue, 02 Sep 2025 06:57:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827906cbsm721574e87.95.2025.09.02.06.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:56:59 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:56:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <7sd3rvvwnte7dub6vuywi6np7rig547ugfpu626ruufx7psrds@igqdchhianju>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
 <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
 <yutyrfb73wbxlweoq3mc6ezyqr56snzmznw3k6mcbc56fpfayg@3h5jwymlo3ol>
 <0c2a4877-d63b-4650-b7d4-a06a2730c73c@oss.qualcomm.com>
 <zoogyjua4l6e2bgsvxx7w26n6v2hwnp2pvkizzzsds3c6cgaag@2bvqdl2z5ds6>
 <4913e937-3892-42ac-8145-cc9c2364242c@oss.qualcomm.com>
 <snery6acisgvxtofsrbbqtpoirh5ffyha64lz4zekg3kvwrsyv@tfyydedc7ddm>
 <ae4ef090-7edc-49f8-a964-090bb94ff097@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae4ef090-7edc-49f8-a964-090bb94ff097@oss.qualcomm.com>
X-Proofpoint-GUID: VUlWaIG0iT3PfrBJsmMnmS5vSD2J7nqK
X-Proofpoint-ORIG-GUID: VUlWaIG0iT3PfrBJsmMnmS5vSD2J7nqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX4sxqGxiHi3ms
 6+RvKuwBqyJzuspUYmqYP40AIHcYaORApIogU5cRGkL6KYHz47L/Y4fSavvGOLOpmatYYTRM6jv
 Jaa6rVKliCWBciwqIL1W8TrbtftKxKnepBZmUC7LnK7fZeJ+QYvZKfwXIvv3jkMNeHEdoZH4lHo
 kaPO2tzLgrAstvukwySAIm+LDkIuOGlHyhTHs3YX/dpzGVacYqMQ0+x1QDSBHPK4OZU1iQznrPV
 H6EKxVipUSsG8zSxZE8Cb20nAN/uML9rJafz8l6qNXZs8tM472rsszQNPVOwn4ucNporjQdwYe8
 8jfQo7Mx+n0q+4uWtI5eqVqSBjwWW/ml6zf9zKoTJHKWQcQYVhidi5n9lx8uiKCeEg324IWKhr5
 2w7/ebSd
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6f7af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PxzxOCqAw92IUcKJUaMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Mon, Sep 01, 2025 at 11:23:28AM +0800, Fange Zhang wrote:
> 
> 
> On 8/28/2025 7:02 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 28, 2025 at 01:12:14PM +0800, Fange Zhang wrote:
> > > 
> > > 
> > > On 8/28/2025 12:41 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 28, 2025 at 10:57:41AM +0800, Fange Zhang wrote:
> > > > > 
> > > > > 
> > > > > On 8/28/2025 4:01 AM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Aug 27, 2025 at 09:08:39PM +0800, Fange Zhang wrote:
> > > > > > > From: Li Liu <li.liu@oss.qualcomm.com>
> > > > > > > 
> > > > > > > Add display MDSS and DSI configuration for QCS615 RIDE board.
> > > > > > > QCS615 has a DP port, and DP support will be added in a later patch.
> > > > > > > 
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > > Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
> > > > > > > Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
> > > > > > >     1 file changed, 150 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > > > > > index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > > > > > @@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
> > > > > > >     		};
> > > > > > >     	};
> > > > > > > +	dp-dsi0-connector {
> > > > > > > +		compatible = "dp-connector";
> > > > > > > +		label = "DSI0";
> > > > > > > +		type = "mini";
> > > > > > > +
> > > > > > > +		port {
> > > > > > > +			dp_dsi0_connector_in: endpoint {
> > > > > > > +				remote-endpoint = <&dsi2dp_bridge_out>;
> > > > > > > +			};
> > > > > > > +		};
> > > > > > > +	};
> > > > > > > +
> > > > > > > +	vreg_12p0: vreg-12p0-regulator {
> > > > > > 
> > > > > > I should be more carefull when doing reviews. I thought that it was
> > > > > > pointed out already and didn't some of the obvious things...
> > > > > > 
> > > > > > First of all, the nodes are sorted. By the name, not by the label.
> > > > > > Second, there are already regulators in this file. Why are the new nodes
> > > > > > not following the existing pattern and why are they not placed at a
> > > > > > proper place?
> > > > > 
> > > > > Initially, we referred to https://patchwork.kernel.org/project/linux-arm-msm/patch/20250604071851.1438612-3-quic_amakhija@quicinc.com/
> > > > > as a reference, but its node ordering seems a bit unconventional.
> > > > > 
> > > > > Would this revised ordering be acceptable?
> > > > > 
> > > > > ...
> > > > > + dp-dsi0-connector
> > > > > 
> > > > > vreg_conn_1p8: regulator-conn-1p8
> > > > > vreg_conn_pa: regulator-conn-pa
> > > > > regulator-usb2-vbus
> > > > 
> > > > So... Existing regulator nodes have the name of 'regulator-foo-bar'.
> > > > 
> > > > > 
> > > > > + vreg_12p0: vreg-12p0-regulator
> > > > > + vreg_1p0: vreg-1p0-regulator
> > > > > + vreg_1p8: vreg-1p8-regulator
> > > > > + vreg_3p0: vreg-3p0-regulator
> > > > > + vreg_5p0: vreg-5p0-regulator
> > > > 
> > > > While yours use 'vreg-baz-regulator'. Why? Don't blindly c&p data from
> > > > other platforms.
> > > 
> > > Got it, The revised format will be:
> > > 
> > > + vreg_12p0: regulator-vreg-12p0
> > > + vreg_1p0: regulator-vreg-1p0
> > > + vreg_1p8: regulator-vreg-1p8
> > > + vreg_3p0: regulator-vreg-3p0
> > > + vreg_5p0: regulator-vreg-5p0
> > > 
> > > Let me know if you have any further suggestions.
> > 
> > What's the name of power rail in the schematics? vreg-Np0?
> 
> I reviewed the Ride board schematics and found the following power rail
> mappings:
> 
> VREG_1P0 -> DSI0_DVDD10 / DSI0_AVDD10 -> ANX7625 AVDD10 / DVDD10
> VREG_1P8 -> DSI0_AVDD18 -> ANX7625 AVDD18
> VREG_S4A_1P8 -> DSI0_DVDD18 -> ANX7625 DVDD18
> VIDEO_OUT_VREG_3P3 -> DSI0_AVDD30 -> ANX7625 AVDD30

Then it looks like regulator-vreg-NpM is okay

> 
> would the current approach also be acceptable?
> or we need configure the power supplies strictly according to this mapping.
> Appreciate your guidance.
> 
> > 
> > 
> 

-- 
With best wishes
Dmitry

